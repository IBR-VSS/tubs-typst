#import "@preview/polylux:0.4.0": *

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

        #text(size: 0.8em)[#author]
      ]
    ]
    #align(center + bottom)[
      #rect(width: 100%, height: 20pt, fill: tubs.red)
    ]
  ]
]

#let setup(
    title: "",
    subtitle: "",
    author: "",
    body
) = {
  set page(paper: "presentation-4-3")
  set text(size: 24pt, font: "NexusSansPro")

  title-slide(title, subtitle, author)
  body
}
