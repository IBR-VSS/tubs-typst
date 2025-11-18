#import "components.typ": variable-pagebreak
#import "../metadata.typ": lang, document-type, international-title, date


#let disclaimer(
  title: "",
  international-title: "",
  author: none,
  city: "                    ",
  is-doublesided: none,
  lang: "en",
) = {
  set par(first-line-indent: 0em)
  set heading(numbering: none)
  let caption = "Eidesstattliche Erklärung"
  let signature = "(Unterschrift mit Vor- und Zuname)"
  if lang=="en" {
    caption = "Statutory Declaration"
    signature = "(signature with first- and lastname)"
  }
  

  [= #caption]

  if lang == "en" [
    I hereby declare in lieu of an oath that I have written this #document-type “#international-title” independently and that I have cited all sources and aids used in full and that the thesis has not already been submitted as an examination paper.
  ] else [
    Ich erkläre hiermit an Eides statt, dass ich die vorliegende #document-type "#document-type" selbstständig verfasst sowie alle benutzten Quellen und Hilfsmittel vollständig angegeben habe und dass die Arbeit nicht bereits als Prüfungsarbeit vorgelegen hat.
  ]

  v(1cm)

  [Braunschweig, #date]

  v(3cm)

  line(length: 10cm, stroke: 1pt)
  signature

  variable-pagebreak(is-doublesided)
}
