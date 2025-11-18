= Introduction

#lorem(30)

== Some code

#figure(
  [
```cpp
#include <stdio.h>
// The slide down-to operator
int iterationsLeft = 20;
while (iterationsLeft --\
                         \
                          \
                           \> 0)
{
  printf("%d iterations left!", iterationsLeft); 
}
```

  ],
  caption: [Showcasing the slide down-to operator]
)
<fig:slide-down>

The slide down-to operator has many advantages over the more widely adapted version of the down-to operator, everyone says so @DUMMY:1.
The inferior version has the form #box[`while (i --> 0) {/**/}`].

== Math

I *want* to show _you_ some #text("math", stroke: maroon):

$
  sum_(i=1)^infinity 1/i = lim_(i -> infinity) 2^i
$

I think math is very neat, but have I referenced you to the @fig:slide-down?