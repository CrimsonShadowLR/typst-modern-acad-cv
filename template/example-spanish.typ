// Example CV in Spanish
#import "@preview/modern-acad-cv:0.1.5": *

// loading meta data and databases
#let metadata = yaml("metadata.yaml")
#let multilingual = yaml("dbs/i18n.yaml")
#let work = yaml("dbs/work.yaml")
#let education = yaml("dbs/education.yaml")
#let grants = yaml("dbs/grants.yaml")
#let refs = yaml("dbs/refs.yaml")
#let skills = yaml("dbs/skills.yaml")

// set the language to Spanish
#let language = "es"

// defining variables
#let headerLabs = create-headers(multilingual, lang: language)

#show: modern-acad-cv.with(
  metadata,
  multilingual,
  lang: language,
  font: "Fira Sans",
  show-date: true,
)

= #headerLabs.at("work")

#cv-auto-stc(work, multilingual, lang: language)

= #headerLabs.at("education")

#cv-auto-stp(education, multilingual, lang: language)

= #headerLabs.at("grants")

#cv-auto-stp(grants, multilingual, lang: language)

= #headerLabs.at("pubs")

#cv-cols(
  "",
  for lang in multilingual.lang.keys() {
    if language == lang [
      #multilingual.lang.at(lang).pubs-note
    ]
  },
)

== #headerLabs.at("pubs-peer")
#cv-refs(refs, multilingual, tag: "peer", me: [Mustermensch, M.], lang: language)

= #headerLabs.at("others")

#cv-auto-skills(skills, multilingual, metadata, lang: language)
