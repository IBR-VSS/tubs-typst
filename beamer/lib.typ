#import "@preview/polylux:0.4.0": *

#let date_format = "[day] [month repr:long] [year]"

#let logical-slide = counter("logical-slide")

#let inactive-slide = {
  logical-slide.update(n => {n - 1})
}

// Colors
#let tubs = (
  black: rgb(0,0,0),
  red: rgb(190,30,60),
  white: rgb(255,255,255),
  yellow: rgb(255,205,0),
  orange: rgb(250,110,0),
  green: rgb(137,164,0),
  greenlight: rgb(198,238,0),
  greendark: rgb(0,113,86),
  blue: rgb(0,128,180),
  bluelight: rgb(124,205,230),
  bluedark: rgb(0,83,116),
  violet: rgb(118,0,118),
  violetlight: rgb(204,0,153),
  violetdark: rgb(118,0,84),
)

#let frame-header = toolbox.full-width-block(
  fill: tubs.black.lighten(80%),
  inset: (x: 2em, y: 0.5em),
  height: 100%,
)[
  #set text(size: 1.5em)
  #set align(bottom + left)
  #toolbox.next-heading(h => [*#h*])
]

#let frame-footer(author, title) = toolbox.full-width-block(
  height: 100%,
  stroke: (top: 0.8pt + tubs.red),
)[
  #set text(size: 0.5em)

  #let curr = toolbox.slide-number
  #let final = toolbox.last-slide-number

  #place(
    top + left,
    dy: -15pt,
  )[
      #image("fig/TUBraunschweig_RGB_beamer.pdf", width: 20%)
  ]
  #place(top + left, dy: 1em, dx: 6cm)[
    #datetime.today().display(date_format) | #author | #title | #curr - #final
  ]
  #place(horizon + right, dx: -10pt)[
    #image("fig/IBR_Logo_rgb_EN.pdf", width: 20%)
  ]
]

/*
*
* Public Functions
*
*/

#let title-slide(title, subtitle, author) = slide[
  #set align(center)
  #set page(margin: 0pt)

  #block(
    width: 100%,
    spacing: 1em,
    inset: (top: 1.2em, bottom: 0.2em, rest: 0.6em),
  )[
    #align(right)[#image("fig/IBR_Logo_rgb_EN.pdf", width: 40%)]
  ]
  #block(
    width: 95%,
    height: 75%,
    inset: 0pt,
    fill: tubs.bluedark.lighten(60%),
  )[
    #set align(left + horizon)
    #align(top + center)[
      #image("fig/titlepicture.jpg", width: 100%)
    ]

    #place(
      top + left,
      dy: -60pt,
      dx: -20pt,
    )[
      #image("fig/TUBraunschweig_RGB_beamer.pdf", width: 30%)
    ]
    #align(right)[
      #block(
        width: 95%,
        inset: (top: 10pt, rest: 0pt),
      )[
        #set align(left)
        = #title
        #subtitle

        #text(size: 0.8em)[#author, #datetime.today().display(date_format)]
      ]
    ]
    #align(center + bottom)[
      #rect(width: 100%, height: 20pt, fill: tubs.red)
    ]
  ]
  #inactive-slide
]

#let section(title) = slide[
  #set page(
    header: none,
    footer: none,
    margin: 5%,
  )
  #set text(size: 1.5em)
  #set align(horizon + center)
  #toolbox.register-section(title)
  #block(
    height: 1.5em,
    width: 100%,
    fill: tubs.black.lighten(80%)
  )[
    *#title*
  ]

  #inactive-slide
]

#let frame(title, body) = slide[
  #show heading.where(level: 1): none
  = #title
  #align(horizon)[#body]
]

#let toc = slide[
  #toolbox.all-sections((sections, curr) => {
    enum(..sections)
  })
]

#let setup(
    title: "",
    subtitle: "",
    author: "",
    body
) = {
  set page(
    paper: "presentation-4-3",
    margin: (x: 2cm, y: 3.5cm),
    header: align(top, frame-header),
    footer: align(bottom, frame-footer(author, title)),
  )
  set text(size: 24pt, font: "NexusSansPro")

  let gray = tubs.black.lighten(40%)
  set list(
    marker: (
      [#text(stroke: tubs.red, fill: tubs.red)[■]],
      [#text(stroke: gray, fill: gray)[■]],
    ),
  )

  set align(horizon)

  title-slide(title, subtitle, author)
  body
}
