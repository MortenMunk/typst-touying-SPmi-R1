#import "/globals.typ": *

= Results

---

== Synthetic Cipher


#grid(
  columns: 2,
  column-gutter: 1em,
  [
    *How can we measure?*
    - Symbol Error Rate (SER)
    - 0% = Perfect decipherment
    - 100% Total gibberish

    *What can we observe?*
    - Between 400 - 700 chars
    - Three key ranges
    - CausalLM outperforms the others #emoji.face.party

  ],
  [
    #align(center)[
      #image("/images/res1.png", width: 70%)
    ]
  ],
)
#pause
*Fun observation:* seq2seq does not even converge at longer ciphers #emoji.face.rofl

---

== Z408 Cipher


#grid(
  columns: 2,
  column-gutter: 1em,
  [
    *But what about real ciphers?*
    - Z408 = 408 characters
    - 54 symbols
    - From the 1960's
    - No spaces#emoji.excl
  ],
  [
    #align(center)[
      #figure(
        image("/images/408.png", width: 58%),
        caption: [https://zodiackiller.fandom.com/wiki/408-cipher],
        supplement: none,
      )
    ]
  ],
)

---

#grid(
  columns: 2,
  column-gutter: 1em,
  [

    *Hill-climbing*
    - Keep the best candidates

    *Beam search*
    - Keep N best candidates

  ],
  [
    #align(center)[
      #image("/images/res2.png", width: 90%)
    ]
  ],
)


#pause
*CausalLM #emoji.party*
- Faster (it does not search)
- Better (even with smaller beam)


---

== Historical Ciphers

*What about historical ciphers?*

*TNA_SP106/5*
- 1624, UK
- Homophonic substitution
- 171 characters
- 47 symbols to 27 letters
- Not many reccurences (3.6 avg)

*The homophonic 40-65 key model*
- They used beam size 1000
- Achieved 18% SER

#pause
*Remember:* This is a hard cipher in an out-of-domain language

---

#grid(
  columns: 2,
  column-gutter: 1em,
  [
    *BnF_fr2988_f01*
    - 1524-1549, Italy
    - Homophonic substitution
    - 2 pages long
    - 35 symbols
    - More reccurences but older language

    *The homophonic 30-45 key model*
    - Achieved 1.13% SER
  ],
  [
    #align(center)[
      #image("/images/BnF.png", width: 70%)
    ]
  ],
)


#pause
Notice how words are different in old English!

---

== Monoalphabetic Ciphers

#grid(
  columns: 2,
  column-gutter: 1em,
  [
    *CausalLM + Rec*
    - Recurrence Integer Sequence

    *CausalLM + Freq*
    - Described in another paper
    - Summary:
      - encoded with frequency rank
      - unlike REC which is left to right order

    *CausalLM Observations*
    - CausalLM
      - Weaker on short ciphers
      - Still comparable to other models!

    (Near) perfect SER on >128 ciphers!
  ],
  [
    #align(center)[
      #image("/images/comp.png", width: 90%)
    ]
  ],
)


---

== Unseen Language Ciphers

#grid(
  rows: 2,
  row-gutter: 2em,
  [
    *What if we don't know the language of the cipher?*
    - Multilingual model
    - Trained on 13 languages (Latin included)
    - No language ID's during training!
    - Frequency based encoding
      - Likely due to Zipfian consistency
  ],
  [
    #block(width: 100%)[
      #align(center)[
        #figure(
          image("/images/lingo.png", width: 50%),
          caption: "Results on the monoalphabetic Borg cipher in 17th century Latin",
          supplement: none,
        )
      ]
    ]
  ],
)

---



#grid(
  columns: 2,
  column-gutter: 5em,
  [
    *What about the main model?*

    Zero-shot on 400 chars of Borg
    - SER 45.14%
    - Not too good

    But in real life...
    - Domain expert evaluate output
    - If they correct 3 words manually:
      - SER 3.89%
      - Pretty good!
  ],
  [
    #pause *Remember:*
    \ The main model has never seen Latin before!
  ],
)

