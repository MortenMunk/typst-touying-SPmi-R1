#import "@preview/touying:0.6.1": *
#import themes.metropolis: *

#import "@preview/numbly:0.1.0": numbly

#show: metropolis-theme.with(
  aspect-ratio: "16-9",
  footer: self => self.info.institution,
  config-info(
    title: [Decipherment as Regression],
    subtitle: [Solving Historical Substitution Ciphers by Learning Symbol Recurrence Relations],
    author: [Nishant Kambhatla, Logan Born, Anoop Sarkar],
    date: [May 2023],
    institution: [Findings of the Association for Computational Linguistics: EACL 2023],
  ),
)

#set heading(numbering: numbly("{1}.", default: "1.1"))

#title-slide(extra: [_Presented by Morten Munk Andersen_])

// Table of contents
#include "slides/toc.typ"
#include "slides/intro.typ"
