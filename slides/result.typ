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


