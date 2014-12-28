\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{p555-article}[2014/07/17 p555 template adapted from scrartcl]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrartcl}}
\ProcessOptions
\LoadClass{scrartcl}

\RequirePackage{enumerate}
\RequirePackage{graphicx}
\RequirePackage[pdfborder={0 0 0}]{hyperref}
\RequirePackage{nameref}
\RequirePackage{subfig}
\RequirePackage{tabularx}

\RequirePackage{eso-pic,xcolor}
\RequirePackage{graphicx}

\renewcommand{\thefootnote}{\fnsymbol{footnote}}
\newcommand{\footlink}[1] {\footnote{\href{#1}{\texttt{#1}}}}

\RequirePackage{fontspec}
\RequirePackage{xunicode}
\RequirePackage{xltxtra}
\setmonofont[Scale=MatchLowercase]{Inconsolata-dz for Powerline}

\RequirePackage{caption}
\RequirePackage{color}
\DeclareCaptionFont{white} {
  \color{white}\sffamily
}
\DeclareCaptionFormat{listing} {
  \colorbox[cmyk]{0.43, 0.35, 0.35, 0.01} {
    \parbox{\textwidth-17pt} {
      \hspace{7pt}#1#2#3
    }
  }
}

\captionsetup[lstlisting] {
  format=listing,
  labelfont=white,
  textfont=white,
  singlelinecheck=false,
  margin=0pt,
  font={bf,footnotesize}
}

\RequirePackage{listings}

\lstdefinelanguage{groovy}
  {morekeywords={abstract,boolean,break,byte,case,catch,char,class,
      const,continue,def,default,do,double,else,extends,false,final,
      finally,float,for,goto,if,implements,import,instanceof,int,
      interface,label,long,native,new,null,package,private,protected,
      public,return,short,static,super,switch,synchronized,this,throw,
      throws,transient,true,try,void,volatile,while},
   sensitive,
   morecomment=[l]//,
   morecomment=[s]{/*}{*/},
   morestring=[b]",
   morestring=[b]',
  }[keywords,comments,strings]

\lstdefinelanguage{javascript}
  {morekeywords={typeof,new,true,false,catch,function,return,null,catch,switch,
      var,if,in,while,do,else,case,break},
   sensitive,
   morecomment=[l]//,
   morecomment=[s]{/*}{*/},
   morestring=[b]",
   morestring=[b]',
  }[keywords,comments,strings]

\definecolor{javared}{rgb}{0.6,0,0} % for strings
\definecolor{javagreen}{rgb}{0.25,0.5,0.35} % comments
\definecolor{javapurple}{rgb}{0.5,0,0.35} % keywords
\definecolor{javadocblue}{rgb}{0.25,0.35,0.75} % javadoc
 
\lstnewenvironment{snippet}[1][] {
  \lstset {
    keywordstyle=\color{javapurple}\bfseries,
    stringstyle=\color{javared},
    commentstyle=\color{javagreen},
    morecomment=[s][\color{javadocblue}]{/**}{*/},
    basicstyle=\footnotesize\ttfamily,
    showstringspaces=false,
    #1
  }
}{}

\lstnewenvironment{code}[1][] {
  \lstset {
    keywordstyle=\color{javapurple}\bfseries,
    stringstyle=\color{javared},
    commentstyle=\color{javagreen},
    morecomment=[s][\color{javadocblue}]{/**}{*/},
    basicstyle=\footnotesize\ttfamily,
    xleftmargin=17pt,
    framexleftmargin=14pt,
    framexrightmargin=-3pt,
    framexbottommargin=4pt,
    frame=b,
    numbers=left,
    stepnumber=5,
    firstnumber=1,
    numberstyle={\tiny\ttfamily},
    showstringspaces=false,
    #1
  }
}{}

\newenvironment{coalesce}
  {\noindent\begin{minipage}{\textwidth}}
  {\end{minipage}}

\newcommand{\watermark}[1]{
  \AddToShipoutPicture {
    \unitlength=1in \put(2.55,4.5) {
      \rotatebox{45} {
        \textcolor{lightgray} {
          \fontsize{64}{64}\bf #1
        }
      }
    }
  }
}

\newenvironment{versionhistory}
  {
    \noindent
    \footnotesize
    \tabularx{\textwidth}{p{1cm}Xp{3cm}p{2cm}}
    \textbf{\textsf{Version}} &
    \textbf{\textsf{Description of change}} &
    \textbf{\textsf{Author}} &
    \textbf{\textsf{Date}} \\ \hline
  }
  {
    \endtabularx
  }

\RequirePackage{sectsty}
\sectionfont{ \sectionrule{0pt}{0pt}{-5pt}{0.8pt} }

\newcommand{\nocontentsline}[3]{}
\newcommand{\notoc}[2]{\bgroup\let\addcontentsline=\nocontentsline#1{#2}\egroup}

\setcounter{tocdepth}{2}

% vim:ft=tex
