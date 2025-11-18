#import "metadata.typ": *
#import "template.typ": tu-braunschweig-thesis, titlepage, disclaimer
#show: tu-braunschweig-thesis.with(
  title: international-title,
  author: author,
  lang: lang,
  is-doublesided: is-doublesided,
)
#set page(
  numbering: "I",
)

#titlepage(
  title: international-title,
  document-type: document-type,
  supervisor: supervisor,
  second-supervisor: second-supervisor,
  advisors: advisors,
  author: author,
  city: city,
  date: date,
  organisation: organisation,
  organisation-logo: organisation-logo,
  header-logo: header-logo,
  is-doublesided: is-doublesided,
  lang: lang,
)

#counter(page).update(2)

#include "chapter/abstract.typ"

#outline(depth: 2)

#set page(numbering: "1")
#counter(page).update(1)

#include "chapter/01-introduction.typ"
//#include "chapter/02-background.typ"
//#include "chapter/03-approach.typ"
//#include "chapter/04-relatedwork.typ"

#bibliography("./bibtex.bib")

#include "chapter/98-statutory-declaration.typ"
#include "chapter/99-Appendix.typ"


#disclaimer(
  title: title,
  international-title: international-title,
  author: author,
  city: city,
  is-doublesided: is-doublesided,
  lang: lang,
)