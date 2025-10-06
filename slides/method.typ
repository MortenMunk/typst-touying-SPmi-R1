#import "/globals.typ": *

= Methodology

== Recurrent Integer Sequences

#grid(
  rows: 2,
  row-gutter: 2em,
  [
    #block(width: 100%)[
      #align(center)[
        #image("/images/dist.png", width: 90%)
      ]
    ]
  ],
  [
    *Monoalphabetic (1:1)*
    - Trivially solved with frequency analysis
    *Homophonic (1:>0)*
    - Harder to solve - frequencies can be hidden #emoji.face.sad
    - More symbols = More mappings
  ],
)


---


#grid(
  rows: 3,
  row-gutter: 2em,
  [
    *Capturing first/repeated symbol occurences*
    - Spaces denoted as *underscore*
    - Unseen symbols denoted as *incremental integer*
    - Recurring symbols denoted as represented *previous integer*
    - Works for ciphers with different symbol sets
  ],
  [
    #block(width: 100%)[
      #align(center)[
        #image("/images/encoding.png", width: 90%)
      ]
    ]
  ],
  [
    #pause
    *The authors consider this a novel approach*
  ],
)

---

== Generative Decipherment Model

*Remember:* Ciphertext is now a Recurrent Integer Sequence

*CausalLM*
- From left to right - can only look back
- Past words affect predicted words - (sort of like autocorrect)

*Dataset made by authors*
- 2 million unique homophonic substitution ciphers
- Including corresponding plaintexts
- Modern English

---

test
