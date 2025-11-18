#import "components.typ": author-fullname, variable-pagebreak

#let titlepage(
  title: "",
  document-type: "",
  supervisor: "",
  second-supervisor: none,
  advisors: (),
  author: none,
  city: none,
  date: none,
  organisation: [],
  organisation-logo: none,
  header-logo: none,
  is-doublesided: none,
  lang: "en",
  sans-font: "NexusSansPro",
) = {
  set page(numbering: none)

  set par(leading: 1em, first-line-indent: 0em, justify: false)

  context {
    move(dy: 3em, line(length: 100%, stroke: rgb(180, 30, 60)))
    let outer_pos = here().position()
    place(top + left, dx: -outer_pos.x, dy: -2em, float: false, header-logo)
  }

  v(15mm)

  block(inset: 2cm)[
    #par(leading: 1em)[
      #text(font: sans-font, 2.5em, weight: 700, title)
    ]
    #v(1em)
    #text(font: sans-font, 1.8em, weight: 500, document-type)
    #v(1em)
    #text(font: sans-font, 1.4em, weight: 500, author-fullname(author))\
    #text(city + ", " + date)
  ]

  pad(
    top: 0em,
    right: 15%,
    left: 15%,
    grid(
      columns: 2,
      gutter: 1em,
      strong(if (lang == "de") [
        Betreuer:
      ] else [
        Advisors:
      ]),
      advisors.join("\n"),

      strong(if (lang == "de") [
        Themensteller:
      ] else [
        Supervisor:
      ]),
      supervisor,
      ..if (second-supervisor != none) {
      (strong(if (lang == "de") [
        Zweitgutachter:
      ] else [
        Second Supervisor:
      ]),
      second-supervisor,)
      },

      strong(if (lang == "de") [
        Matrikelnummer:
      ] else [
        Matriculation Number:
      ]),
      author.matriculation-no,
    )
  )

  align(bottom)[
    #line(length: 100%)
    #grid(
      columns: 2,
      gutter: 1.4cm,
      par(leading: 0.6em, organisation),
      box(width: 100%, height: 3.2em, [
        #align(top + right, [
          #move(dy: -0.5em, [#organisation-logo])
        ])
      ]),
    )
  ]

  variable-pagebreak(is-doublesided)
}
