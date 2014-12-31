---
title     : 'Document title'
subtitle  : 'Document subtitle'
author    : 'Document author'
watermark : 'DRAFT'
---

Description {-}
================================================================================

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur mollis nisl
eleifend turpis aliquet, non pellentesque velit vestibulum. Curabitur interdum
quis tellus porttitor auctor. Fusce et purus ac tellus vulputate tincidunt vitae
ac diam. Phasellus pretium felis eu lacus interdum, vehicula suscipit dolor
congue. Nam a tortor magna. Maecenas facilisis nunc sit amet sapien vestibulum,
quis ultricies magna consectetur.

History {-}
================================================================================

| Version | Description of change         | Author          | Date       |
| ------- | ----------------------------- | --------------- | ---------- |
| `0.1`   | Description of change         | [Lorem Ipsum]   | 2099-99-99 |
| `0.2`   | Description of change         | [Lorem Ipsum]   | 2099-99-99 |

[Lorem Ipsum]: mailto:lorem.ipsum@lorem.ipsum

Table of contents {-}
================================================================================

A Section
================================================================================

A Sub Section
--------------------------------------------------------------------------------

### A sub sub section

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur mollis nisl
eleifend turpis aliquet, non pellentesque velit vestibulum. Curabitur interdum
quis tellus porttitor auctor. Fusce et purus ac tellus vulputate tincidunt vitae
ac diam. Phasellus pretium felis eu lacus interdum, vehicula suscipit dolor
congue. Nam a tortor magna. Maecenas facilisis nunc sit amet sapien vestibulum,
quis ultricies magna consectetur.


#### A paragraph

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur mollis nisl
eleifend turpis aliquet, non pellentesque velit vestibulum. Curabitur interdum
quis tellus porttitor auctor. Fusce et purus ac tellus vulputate tincidunt vitae
ac diam. Phasellus pretium felis eu lacus interdum, vehicula suscipit dolor
congue. Nam a tortor magna. Maecenas facilisis nunc sit amet sapien vestibulum,
quis ultricies magna consectetur.

-   Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur mollis nisl

-   Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur mollis nisl

-   Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur mollis nisl

Another sub section
--------------------------------------------------------------------------------

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur mollis nisl
eleifend turpis aliquet, non pellentesque velit vestibulum. Curabitur interdum
quis tellus porttitor auctor. Fusce et purus ac tellus vulputate tincidunt vitae
ac diam. Phasellus pretium felis eu lacus interdum, vehicula suscipit dolor
congue. Nam a tortor magna. Maecenas facilisis nunc sit amet sapien vestibulum,
quis ultricies magna consectetur.

Another sub section
--------------------------------------------------------------------------------

### A sub sub section with code snippets

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur mollis nisl
eleifend turpis aliquet, non pellentesque velit vestibulum. Curabitur interdum
quis tellus porttitor auctor. Fusce et purus ac tellus vulputate tincidunt vitae
ac diam. Phasellus pretium felis eu lacus interdum, vehicula suscipit dolor
congue. Nam a tortor magna. Maecenas facilisis nunc sit amet sapien vestibulum,
quis ultricies magna consectetur.

```{#lst:alistingid lang=elixir caption="Some caption"}
defmodule TailFactorial do
  def of(n), do: facto_of(n, 1)

  defp facto_of(0, acc), do: acc
  defp facto_of(1, acc), do: acc
  defp facto_of(n, acc), do: facto_of(n-1, acc*n)
end
```

### An unnumbered sub sub section with formatting and references {-}

*Lorem* ipsum **dolor** sit amet, `consectetur` adipiscing elit. See listing
[ref](lst:alistingid), in section [nameref](another-sub-section), at page
[pageref](another-sub-section)

### A sub sub section with an image {#acustomsectionid}

Figure [ref](fig:gnuimageid) on page [pageref](fig:gnuimageid) shows the gnu.

![GNU Image caption](gnu.png "gnuimageid")

Appendix
================================================================================

First
--------------------------------------------------------------------------------

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur mollis nisl
eleifend turpis aliquet, non pellentesque velit vestibulum. Curabitur interdum
quis tellus porttitor auctor. Fusce et purus ac tellus vulputate tincidunt vitae
ac diam. Phasellus pretium felis eu lacus interdum, vehicula suscipit dolor
congue. Nam a tortor magna. Maecenas facilisis nunc sit amet sapien vestibulum,
quis ultricies magna consectetur.

