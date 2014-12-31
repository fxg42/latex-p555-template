---
title     : 'Other title'
subtitle  : 'Other subtitle'
author    : 'Other author'
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

[Lorem Ipsum]: mailto:lorem.ipsum@lorem.ipsum

Table of contents {-}
================================================================================

Examples
================================================================================

## Bullet lists

- Lorem ipsum dolor sit amet
- Lorem ipsum dolor sit amet

## Ordered lists

1. Lorem ipsum dolor sit amet
1. Lorem ipsum dolor sit amet

* * *

a) Lorem ipsum dolor sit amet
a) Lorem ipsum dolor sit amet

* * *

(A) Lorem ipsum dolor sit amet
(A) Lorem ipsum dolor sit amet

* * *

i. Lorem ipsum dolor sit amet
i. Lorem ipsum dolor sit amet

* * *

I) Lorem ipsum dolor sit amet
I) Lorem ipsum dolor sit amet

## Tables

| left aligned | right aligned | center aligned | default aligned |
| :--          | --:           | :-:            | ---             |
| row1, col1   | row1, col2    | row1, col3     | row1, col4      |
| row2, col1   | row2, col2    | row2, col3     | row2, col4      |
| row3, col1   | row3, col2    | row3, col3     | row3, col4      |

## Code

```{#lst:snippetid lang=javascript caption="Hello world!"}
var mkGreeting = function mkGreeting(greeting){
  return function greet(whom){
    return greeting + " " + whom + "!";
  };
};
console.log(mkGreeting("hello")("world"));
```

## Math {#sub:math}

- $\sum_{i=1}^{10} t_i$
- $\lim_{x \to \infty} \exp(-x) = 0$
- $\cos (2\theta) = \cos^2 \theta - \sin^2 \theta$
- $k_{n+1} = n^2 + k_n^2 - k_{n-1}$

## Formatting

- *text with emphasis*
- **bold face text**
- `fixed width text`

## Images

See figure~[ref](fig:gnuimageid), [nameref](fig:gnuimageid), at
page~[pageref](fig:gnuimageid).

![A Gnu](gnu.png "gnuimageid")

## References

- Reference to a listing: See listing~[ref](lst:snippetid)
- Reference to an image: See figure~[ref](fig:gnuimageid)
- Reference to a section with a default id: See section~[ref](ordered-lists)
- Reference to a section with a custom id: See section~[ref](sub:math)

* * *

- Page reference to a listing: See listing at page~[pageref](lst:snippetid)
- Page reference to an image: See figure at page~[pageref](fig:gnuimageid)
- Page reference to a section with a default id: See section at page~[pageref](ordered-lists)
- Page reference to a section with a custom id: See section at page~[pageref](sub:math)

* * *

- Name reference to a listing: See listing~[nameref](lst:snippetid)
- Name reference to an image: See figure~[nameref](fig:gnuimageid)
- Name reference to a section with a default id: See section~[nameref](ordered-lists)
- Name reference to a section with a custom id: See section~[nameref](sub:math)

## Quotes

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur mollis nisl
eleifend turpis aliquet, non pellentesque velit vestibulum. Curabitur interdum
quis tellus porttitor auctor. Fusce et purus ac tellus vulputate tincidunt vitae
ac diam. 

> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur mollis nisl
> eleifend turpis aliquet, non pellentesque velit vestibulum. Curabitur interdum
> quis tellus porttitor auctor. Fusce et purus ac tellus vulputate tincidunt vitae.

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur mollis nisl
eleifend turpis aliquet, non pellentesque velit vestibulum. Curabitur interdum
quis tellus porttitor auctor. Fusce et purus ac tellus vulputate tincidunt vitae
ac diam. 

