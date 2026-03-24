#import "../../../templates/layout.typ": explainer-component, lesson-template
#import "@preview/conchord:0.4.0": new-chordgen
#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node

#show: lesson-template.with(
  module: "Guitarra",
  level: "Iniciante",
)

#let chord = new-chordgen(number-to-left: true, use-shadow-barre: false, colors: (hold: black, barre: black))

= Campo Harmônico Maior

O *campo harmônico* é o conjunto de todos os acordes que podem ser construídos a partir de uma escala, sem usar notas de fora dela. Para montá-lo, basta empilhar terças sobre cada nota da escala usando *apenas* as notas da própria escala. O resultado é um conjunto de acordes que pertencem ao mesmo tom.

== A Escala Maior e seus Graus

Na *Escala de Dó Maior* (C), as 7 notas são separadas pelas distâncias abaixo:

#v(1em)

#align(center)[
  #diagram(
    spacing: 13mm,
    node((0, 0), $"Dó"$, name: <C>, stroke: 0.5pt, shape: fletcher.shapes.rect),
    node((1, 0), $"Ré"$, name: <D>, stroke: 0.5pt, shape: fletcher.shapes.rect),
    node((2, 0), $"Mi"$, name: <E>, stroke: 0.5pt, shape: fletcher.shapes.rect),
    node((2.8, 0), $"Fá"$, name: <F>, stroke: 0.5pt, shape: fletcher.shapes.rect),
    node((3.8, 0), $"Sol"$, name: <G>, stroke: 0.5pt, shape: fletcher.shapes.rect),
    node((4.8, 0), $"Lá"$, name: <A>, stroke: 0.5pt, shape: fletcher.shapes.rect),
    node((5.8, 0), $"Si"$, name: <B>, stroke: 0.5pt, shape: fletcher.shapes.rect),
    edge(<C>, <D>, "->", label: "T"),
    edge(<D>, <E>, "->", label: "T"),
    edge(<E>, <F>, "->", label: "ST"),
    edge(<F>, <G>, "->", label: "T"),
    edge(<G>, <A>, "->", label: "T"),
    edge(<A>, <B>, "->", label: "T"),
  )
]

#v(1em)

O padrão de tons e semitons é: *T - T - ST - T - T - T - ST*. Esse é o padrão de toda Escala Maior, em qualquer tonalidade.

== Campo Harmônico em Tríades

Empilhando terças sobre cada grau usando apenas notas da escala, obtemos os seguintes acordes:

#v(0.8em)

#align(center)[
  #table(
    columns: (0.5fr, 0.5fr, 1fr, 1fr, 1fr, 1fr, 1fr),
    align: center + horizon,
    stroke: 0.5pt + luma(190),
    fill: (col, row) => {
      if row == 0 { luma(232) } else if col == 0 { luma(240) } else if row == 1 or row == 4 or row == 6 {
        rgb("#eff6ff")
      } else { white }
    },
    [*Grau*], [*Acorde*], [*T*], [*3ª*], [*5ª*], [*Notas*], [*Tipo*],
    [I], [C], [dó], [mi], [sol], [dó · mi · sol], [Maior],
    [II], [Dm], [ré], [fá], [lá], [ré · fá · lá], [Menor],
    [III], [Em], [mi], [sol], [si], [mi · sol · si], [Menor],
    [IV], [F], [fá], [lá], [dó], [fá · lá · dó], [Maior],
    [V], [G], [sol], [si], [ré], [sol · si · ré], [Maior],
    [VI], [Am], [lá], [dó], [mi], [lá · dó · mi], [Menor],
    [VII], [Bm#super[b5]], [si], [ré], [fá], [si · ré · fá], [Diminuta],
  )
]

#v(1em)

#align(center)[
  #block(
    fill: luma(248),
    stroke: 0.5pt + luma(210),
    inset: 10pt,
    radius: 5pt,
    width: 85%,
    [
      *Padrão do Campo Maior:* I Maior · II Menor · III Menor · IV Maior · V Maior · VI Menor · VII Diminuta
    ],
  )
]

== Pensando em Graus (Numerais Romanos)

É muito mais prático memorizar a progressão em numerais romanos (I, II, III...) do que apenas os nomes dos acordes (C, Dm, Em...). Como o braço do instrumento é simétrico, os "desenhos" geométricos e as distâncias entre os acordes se mantêm iguais em qualquer tom.


#explainer-component(
  align(center)[
    #text(weight: "bold", size: 11pt)[Exemplo: Progressão I - IV - V] \
    #v(0.5em)
    #grid(
      columns: 2,
      gutter: 2em,
      block[
        #text(size: 9.5pt)[*Em Dó Maior (C)*] \
        #text(size: 10pt, fill: luma(80))[C · F · G]
      ],
      block[
        #text(size: 9.5pt)[*Em Sol Maior (G)*] \
        #text(size: 10pt, fill: luma(80))[G · C · D]
      ],
    )
  ],
  [
    Se você souber que uma música segue a estrutura *I - IV - V*, você pode tocá-la em Dó, em Sol ou em qualquer outra tonalidade, bastando deslocar a mão pelo braço do instrumento e manter a mesma relação de distância entre os dedos.
  ],
  inverted: false,
)

#pagebreak()

== Campo Harmônico: As Tétrades

Acrescentando mais uma terça (a sétima) sobre cada tríade:

#v(0.8em)

#align(center)[
  #table(
    columns: (0.5fr, 0.7fr, 0.5fr, 0.5fr, 0.5fr, 0.5fr, 1.5fr, 1fr),
    align: center + horizon,
    stroke: 0.5pt + luma(190),
    fill: (col, row) => {
      if row == 0 { luma(232) } else if col == 0 { luma(240) } else if row == 1 or row == 4 or row == 6 {
        rgb("#eff6ff")
      } else { white }
    },
    [*Grau*], [*Acorde*], [*T*], [*3ª*], [*5ª*], [*7ª*], [*Notas*], [*Tipo*],
    [I], [C7M], [dó], [mi], [sol], [si], [dó · mi · sol · si], [Maior 7M],
    [II], [Dm7], [ré], [fá], [lá], [dó], [ré · fá · lá · dó], [Menor 7],
    [III], [Em7], [mi], [sol], [si], [ré], [mi · sol · si · ré], [Menor 7],
    [IV], [F7M], [fá], [lá], [dó], [mi], [fá · lá · dó · mi], [Maior 7M],
    [V], [G7], [sol], [si], [ré], [fá], [sol · si · ré · fá], [Dominante 7],
    [VI], [Am7], [lá], [dó], [mi], [sol], [lá · dó · mi · sol], [Menor 7],
    [VII], [Bø], [si], [ré], [fá], [lá], [si · ré · fá · lá], [Meio-Dim. 7],
  )
]

#v(1em)

#align(center)[
  #block(
    fill: luma(248),
    stroke: 0.5pt + luma(210),
    inset: 10pt,
    radius: 5pt,
    width: 85%,
    [
      *Padrão das Tétrades:* I 7M · II m7 · III m7 · IV 7M · V 7 · VI m7 · VII Ø
    ],
  )
]

#v(2em)

== Acordes Abertos do Campo em Dó (C)

Os acordes mais práticos para tocar o campo harmônico de Dó na guitarra:

#v(1em)

#align(center)[
  #grid(
    columns: 7,
    gutter: 0.8em,
    align: center,
    block[
      #box(chord("x,3,2,0,1,0", name: "C"))
      #v(0.2em)
      #text(size: 8pt, weight: "bold")[I — C]
    ],
    block[
      #box(chord("x,x,0,2,3,1", name: "Dm"))
      #v(0.2em)
      #text(size: 8pt, weight: "bold")[II — Dm]
    ],
    block[
      #box(chord("0,2,2,0,0,0", name: "Em"))
      #v(0.2em)
      #text(size: 8pt, weight: "bold")[III — Em]
    ],
    block[
      #box(chord("1,3,3,2,1,1", name: "F"))
      #v(0.2em)
      #text(size: 8pt, weight: "bold")[IV — F]
    ],
    block[
      #box(chord("3,2,0,0,0,3", name: "G"))
      #v(0.2em)
      #text(size: 8pt, weight: "bold")[V — G]
    ],
    block[
      #box(chord("x,0,2,2,1,0", name: "Am"))
      #v(0.2em)
      #text(size: 8pt, weight: "bold")[VI — Am]
    ],
    block[
      #box(chord("x,2,3,2,3,x", name: "BØ"))
      #v(0.2em)
      #text(size: 8pt, weight: "bold")[VII — Bø]
    ],
  )
]

#v(2em)

== Campos Harmônicos em Outras Tonalidades

O mesmo *padrão de tipos* (Maior · Menor · Menor · Maior · Maior · Menor · Dim) se repete em qualquer tonalidade. Basta substituir as notas:

#v(0.8em)

#align(center)[
  #table(
    columns: (0.6fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
    align: center + horizon,
    stroke: 0.5pt + luma(190),
    fill: (col, row) => if row == 0 { luma(232) } else if calc.even(row) { luma(248) } else { white },
    [*Tom*], [*I*], [*II*], [*III*], [*IV*], [*V*], [*VI*], [*VII*],
    [C], [C], [Dm], [Em], [F], [G], [Am], [Bø],
    [G], [G], [Am], [Bm], [C], [D], [Em], [F\#ø],
    [F], [F], [Gm], [Am], [Bb], [C], [Dm], [Eø],
  )
]
