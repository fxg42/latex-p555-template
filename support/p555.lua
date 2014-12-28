local inHistory = false
local inAppendix = false

local function esc(s)
  return s:gsub('[_{}$]', '\\%0'):gsub('%%', '\\%%'):gsub('"([^"]*)"', '``%1"')
end

local function parseStyle(style)
  if style == 'LowerAlpha' then
    return 'a'
  elseif style == 'UpperAlpha' then
    return 'A'
  elseif style == 'LowerRoman' then
    return 'i'
  elseif style == 'UpperRoman' then
    return 'I'
  else
    return '1'
  end
end

local function parseOrderedListItemStyle(style, delim)
  if delim == 'OneParen' then
    return '[' .. parseStyle(style) .. ')]'
  elseif delim == 'TwoParens' then
    return '[(' .. parseStyle(style) .. ')]'
  else
    return '[' .. parseStyle(style) .. '.]'
  end
end


function Doc(body, metadata, variables)
  local buffer = {}

  table.insert(buffer, '\\documentclass{p555-article}')
  if metadata['watermark'] ~= nil then
    table.insert(buffer, '\\watermark{\\textsf{' .. metadata['watermark'] .. '}}')
  end
  table.insert(buffer, '\\begin{document}')
  table.insert(buffer, '\\title{' .. metadata['title'] .. '}')
  table.insert(buffer, '\\subtitle{' .. metadata['subtitle'] .. '}')
  table.insert(buffer, '\\author{' .. metadata['author'] .. '}')
  table.insert(buffer, '\\maketitle')
  table.insert(buffer, body)
  table.insert(buffer, '\\end{document}')

  return table.concat(buffer,'\n')
end

function Blocksep()
  return '\n\n'
end

function Space()
  return ' '
end

function LineBreak()
  return '\\linebreak'
end

function Emph(s)
  return '\\textit{' .. esc(s) .. '}'
end

function Strong(s)
  return '\\textbf{' .. esc(s) .. '}'
end

function SmallCaps(s)
  return '\\textsc{' .. esc(s) .. '}'
end

function Code(s, attr)
  return '\\texttt{' .. esc(s) .. '}'
end

function Subscript(s)
  return '_{' .. s .. '}'
end

function Superscript(s)
  return '\\textsuperscript{' .. s .. '}'
end

function Cite(lst)
  return '{' .. lst .. '}'
end

function InlineMath(s)
  return '$' .. s .. '$'
end

function DisplayMath(s)
  return '$$' .. s .. '$$'
end

function Header(lev, s, attr)
  inHistory = (lev == 1 and attr.id == 'history')
  if (attr.id == 'appendix') then
    inAppendix = true
  end

  local star = (attr.class == 'unnumbered' and '*' or '')
  local label = attr.id
  local rest = star .. '{' .. s .. '}\n\\label{' .. label .. '}'
  local level = inAppendix and lev - 1 or lev

  if label == 'appendix' then
    return '\\appendix'
  elseif label == 'table-of-contents' then
    return '\\tableofcontents\\newpage'
  elseif level == 1 then
    return "\\section" .. rest
  elseif level == 2 then
    return "\\subsection" .. rest
  elseif level == 3 then
    return "\\subsubsection" .. rest
  elseif level == 4 then
    return "\\paragraph" .. rest
  else
    return s
  end
end

function BlockQuote(s)
  local buffer = {}

  table.insert(buffer, '\\begin{quote}')
  table.insert(buffer, s)
  table.insert(buffer, '\\end{quote}')

  return table.concat(buffer, '\n')
end

function HorizontalRule()
  return '\\rule'
end

function CodeBlock(s, attr)
  local buffer = {}
  local language = attr.lang ~= nil and ('language=' .. attr.lang .. ', ') or ''
  local coalesce = attr.class == nil or attr.class ~= 'overflows'

  if coalesce then
    table.insert(buffer, '\\begin{coalesce}')
  end

  if attr.caption ~= nil then
    table.insert(buffer, '\\begin{code}[' .. language .. 'label='..  attr.id .. ', caption='.. attr.caption ..']')
    table.insert(buffer, s)
    table.insert(buffer, '\\end{code}')
  else
    table.insert(buffer, '\\begin{snippet}[' .. language .. 'label='..  attr.id .. ']')
    table.insert(buffer, s)
    table.insert(buffer, '\\end{snippet}')
  end

  if coalesce then
    table.insert(buffer, '\\end{coalesce}')
  end

  return table.concat(buffer, '\n')
end

function BulletList(items)
  local buffer = {}

  table.insert(buffer, "\\begin{itemize}")
  for _, item in pairs(items) do
    table.insert(buffer, "\\item " .. item)
  end
  table.insert(buffer, "\\end{itemize}")

  return table.concat(buffer, "\n")
end

function OrderedList(items, num, style, delim)
  local buffer = {}

  table.insert(buffer, "\\begin{enumerate}".. parseOrderedListItemStyle(style, delim))
  for _, item in pairs(items) do
    table.insert(buffer, "\\item " .. item)
  end
  table.insert(buffer, "\\end{enumerate}")

  return table.concat(buffer, "\n")
end

function DefinitionList(items)
  print(items)
  return ''
end

function Table(caption, aligns, widths, headers, rows)
  local buffer = {}
  
  if inHistory then
    table.insert(buffer, '\\begin{versionhistory}')
  else
    --
  end

  for _, row in pairs(rows) do
    local rowBuffer = {}
    for _, c in pairs(row) do
      table.insert(rowBuffer, c)
    end
    table.insert(buffer, table.concat(rowBuffer, ' & ') .. '\\\\')
  end

  if inHistory then
    table.insert(buffer, '\\end{versionhistory}')
  else
    --
  end

  return table.concat(buffer, '\n')
end

function Str(s)
  return esc(s)
end

function Strikeout(s)
  return s
end

function Link(s, src, title)
  if s == 'nameref' then
    return '\\nameref{'.. src ..'}'
  elseif s == 'pageref' then
    return '\\pageref{'.. src ..'}'
  elseif s == 'ref' then
    return '\\ref{'.. src ..'}'
  else
    return '\\href{'..src..'}{'..s..'}'
  end
end

function CaptionedImage(src, label, caption)
  local buffer = {}

  table.insert(buffer, '\\begin{figure}[htb]')
  table.insert(buffer, '\\begin{center}')
  table.insert(buffer, '\\includegraphics[scale=0.5]{' .. src .. '}')
  table.insert(buffer, '\\caption{' .. caption .. '}')
  table.insert(buffer, '\\label{' .. label .. '}')
  table.insert(buffer, '\\end{center}')
  table.insert(buffer, '\\end{figure}')

  return table.concat(buffer, '\n')
end

function Note(s)
  return s
end

function Span(s, attr)
  return s
end

function Plain(s)
  return s
end

function Para(s)
  return s
end

function Div(s, attr)
  return s
end

-- The following code will produce runtime warnings when you haven't defined
-- all of the functions you need for the custom writer, so it's useful
-- to include when you're working on a writer.
local meta = {}
meta.__index =
  function(_, key)
    io.stderr:write(string.format("WARNING: Undefined function '%s'\n",key))
    return function() return "" end
  end
setmetatable(_G, meta)

