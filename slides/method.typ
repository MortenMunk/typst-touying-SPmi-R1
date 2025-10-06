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

*This makes every cipher comparable*

*Dataset made by authors*
- 2 million unique homophonic substitution ciphers
- Including their corresponding plaintexts
- Uses Modern English


---

*CausalLM*
- Reads from  left to right - can only look back
- Past words affect predicted words - (sort of like autocorrect)

$ pause [X^l,Y^l] = "FFN" compose "SelfAtn"([X^(l-1),Y^(l-1)], "Mask") $

- $X^(l-1) arrow.r "Cipher at layer previous to" l$
- $Y^(l-1) arrow.r "Text at layer previous to" l$
- $"SelfAtn" arrow.r "Captures positions related to previous symbols/letters"$
- $"Mask" arrow.r "The attention mask used by SelfAtn"$
- $"FFN" arrow.r "Result is fed to Feed-Forward Neural Network" X$

#pause *Above produces the representation at $[X^l, Y^l]$*

*Remember:* CausalLM only looks back!

---

*Loss function*

$ L^("CLM")(X,Y) = L^("SRC") + L^("TGT") = -"logP"(X) - "logP"(Y|X) $

- $L^("SRC") arrow.r "Source loss - error predicting cipher seq"$
- $L^("TGT") arrow.r "Target loss - error predicting plaintext seq"$
- $-"logP"(X) arrow.r "Probability of reproducing correct cipher symbols"$
- $-"logP"(X|Y) arrow.r "Probability of predicting plaintext given cipher"$

#pause *Low probability = high loss, and vice versa*

#pause Probability can be seen as confidence
