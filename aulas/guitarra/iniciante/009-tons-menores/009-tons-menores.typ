#import "../../../../templates/layout.typ": aula, explainer-component
#import "@preview/conchord:0.4.0": new-chordgen
#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node

#show: aula.with(
  module: "Guitarra",
  level: "Iniciante",
)

#let chord = new-chordgen(number-to-left: true, use-shadow-barre: false, colors: (hold: black, barre: black))

= Tons Menores

Até aqui estudamos a *Escala Maior* e seu campo harmônico. Agora vamos ao *modo menor natural* — o modo mais expressivo e melancólico da música ocidental, base do blues, flamenco, música clássica e boa parte do rock.

== Comparando Maior e Menor Natural

O modo menor natural é idêntico ao modo maior, mas começa do *6º grau* (o relativo menor). Em Dó Maior, o relativo menor é *Lá* — portanto, a Escala de Lá Menor Natural usa exatamente as mesmas notas que Dó Maior.

#v(1em)

#align(center)[
  #diagram(
    spacing: 13mm,
    node((0, -0.65), text(size: 9pt)[Maior], stroke: none),
    node((0, 0.65), text(size: 9pt)[Menor Nat.], stroke: none),
    node((0.9, -0.65), $"Dó"$, stroke: 0.5pt, shape: fletcher.shapes.rect),
    node((1.9, -0.65), $"Ré"$, stroke: 0.5pt, shape: fletcher.shapes.rect),
    node((2.9, -0.65), $"Mi"$, stroke: 0.5pt, shape: fletcher.shapes.rect),
    node((3.55, -0.65), $"Fá"$, stroke: 0.5pt, shape: fletcher.shapes.rect),
    node((4.55, -0.65), $"Sol"$, stroke: 0.5pt, shape: fletcher.shapes.rect),
    node((5.55, -0.65), $"Lá"$, stroke: 0.5pt, shape: fletcher.shapes.rect),
    node((6.55, -0.65), $"Si"$, stroke: 0.5pt, shape: fletcher.shapes.rect),
    node((0.9, 0.65), $"Lá"$, stroke: 0.5pt, shape: fletcher.shapes.rect),
    node((1.9, 0.65), $"Si"$, stroke: 0.5pt, shape: fletcher.shapes.rect),
    node((2.65, 0.65), $"Dó"$, stroke: 0.5pt, shape: fletcher.shapes.rect),
    node((3.65, 0.65), $"Ré"$, stroke: 0.5pt, shape: fletcher.shapes.rect),
    node((4.65, 0.65), $"Mi"$, stroke: 0.5pt, shape: fletcher.shapes.rect),
    node((5.4, 0.65), $"Fá"$, stroke: 0.5pt, shape: fletcher.shapes.rect),
    node((6.4, 0.65), $"Sol"$, stroke: 0.5pt, shape: fletcher.shapes.rect),
    edge((0.9, -0.65), (0.9, 0.65), "->", bend: 0deg, stroke: luma(170)),
  )
]

#v(0.5em)

#align(center)[
  #block(
    fill: luma(248),
    stroke: 0.5pt + luma(210),
    inset: 10pt,
    radius: 5pt,
    width: 80%,
    [
      *Padrão do modo menor natural:* T – T – *½T* – T – T – *½T* – T
      #h(1em) → #h(1em) T · 2 · b3 · 4 · 5 · b6 · b7
    ],
  )
]

== Diferenças em Intervalos: Maior × Menor

#v(0.8em)

#align(center)[
  #table(
    columns: (0.6fr, 1fr, 1fr),
    align: center + horizon,
    stroke: 0.5pt + luma(190),
    fill: (col, row) => if row == 0 { luma(232) } else if calc.odd(row) { white } else { luma(248) },
    [*Grau*], [*Escala Maior (C)*], [*Escala Menor Natural (Am)*],
    [T], [Dó], [Lá],
    [2], [Ré], [Si],
    [b3 / 3], [*Mi (3)*], [*Dó (b3)*],
    [4], [Fá], [Ré],
    [5], [Sol], [Mi],
    [b6 / 6], [*Lá (6)*], [*Fá (b6)*],
    [b7 / 7M], [*Si (7M)*], [*Sol (b7)*],
  )
]

#v(0.5em)

#align(center)[
  #text(size: 9pt, fill: luma(120))[
    Os graus *b3, b6 e b7* distinguem o modo menor do maior — são os graus "bemolizados" que dão o caráter sombrio.
  ]
]

#pagebreak()

== Campo Harmônico de Am

Empilhando terças sobre cada grau da escala de Lá Menor Natural:

#v(0.8em)

#align(center)[
  #table(
    columns: (0.5fr, 0.8fr, 0.5fr, 0.5fr, 0.5fr, 0.5fr, 1.5fr, 1fr),
    align: center + horizon,
    stroke: 0.5pt + luma(190),
    fill: (col, row) => {
      if row == 0 { luma(232) } else if col == 0 { luma(240) } else { white }
    },
    [*Grau*], [*Acorde*], [*T*], [*3ª*], [*5ª*], [*7ª*], [*Notas*], [*Tipo*],
    [I], [Am7], [lá], [dó], [mi], [sol], [lá · dó · mi · sol], [Menor 7],
    [II], [Bø], [si], [ré], [fá], [lá], [si · ré · fá · lá], [Meio-Dim.],
    [III], [C7M], [dó], [mi], [sol], [si], [dó · mi · sol · si], [Maior 7M],
    [IV], [Dm7], [ré], [fá], [lá], [dó], [ré · fá · lá · dó], [Menor 7],
    [V], [Em7], [mi], [sol], [si], [ré], [mi · sol · si · ré], [Menor 7],
    [VI], [F7M], [fá], [lá], [dó], [mi], [fá · lá · dó · mi], [Maior 7M],
    [VII], [G7], [sol], [si], [ré], [fá], [sol · si · ré · fá], [Dominante 7],
  )
]

#v(1em)

#align(center)[
  #block(
    fill: luma(248),
    stroke: 0.5pt + luma(210),
    inset: 10pt,
    radius: 5pt,
    width: 90%,
    [
      *Padrão do campo menor natural:* Im7 · IIø · IIIM7 · IVm7 · Vm7 · VIM7 · VII7 \
      #v(0.3em)
      #text(
        size: 9pt,
        fill: luma(120),
      )[Repare: é o mesmo campo harmônico de Dó Maior, apenas começando do grau VI (Lá).]
    ],
  )
]

#v(1.5em)

== Acordes Práticos em Am

#v(1em)

#align(center)[
  #grid(
    columns: 7,
    gutter: 0.8em,
    align: center,
    block[
      #box(chord("x,0,2,2,1,0", name: "Am"))
      #v(0.2em)
      #text(size: 8pt, weight: "bold")[I — Am]
    ],
    block[
      #box(chord("x,2,3,2,3,x", name: "BØ"))
      #v(0.2em)
      #text(size: 8pt, weight: "bold")[II — Bø]
    ],
    block[
      #box(chord("x,3,2,0,1,0", name: "C"))
      #v(0.2em)
      #text(size: 8pt, weight: "bold")[III — C]
    ],
    block[
      #box(chord("x,x,0,2,3,1", name: "Dm"))
      #v(0.2em)
      #text(size: 8pt, weight: "bold")[IV — Dm]
    ],
    block[
      #box(chord("0,2,2,0,0,0", name: "Em"))
      #v(0.2em)
      #text(size: 8pt, weight: "bold")[V — Em]
    ],
    block[
      #box(chord("1,3,3,2,1,1", name: "F"))
      #v(0.2em)
      #text(size: 8pt, weight: "bold")[VI — F]
    ],
    block[
      #box(chord("3,2,0,0,0,3", name: "G"))
      #v(0.2em)
      #text(size: 8pt, weight: "bold")[VII — G]
    ],
  )
]

#v(2em)

== Progressão Clássica em Tom Menor

Uma das progressões mais comuns em Lá Menor, usada em centenas de músicas:

#v(0.8em)

#explainer-component(
  align(center)[
    #grid(
      columns: 4,
      gutter: 1em,
      align: center,
      block[
        #box(chord("x,0,2,2,1,0", name: "Am"))
        #v(0.2em)
        #text(size: 8pt)[Am (I)]
      ],
      block[
        #box(chord("1,3,3,2,1,1", name: "F"))
        #v(0.2em)
        #text(size: 8pt)[F (VI)]
      ],
      block[
        #box(chord("x,3,2,0,1,0", name: "C"))
        #v(0.2em)
        #text(size: 8pt)[C (III)]
      ],
      block[
        #box(chord("3,2,0,0,0,3", name: "G"))
        #v(0.2em)
        #text(size: 8pt)[G (VII)]
      ],
    )
  ],
  [
    A progressão *I – VI – III – VII* (Am – F – C – G) é a base de inúmeras músicas: desde baladas pop até rock e música latina.

    Em termos de funções: Tônica – Relativo Maior da Sub. – Relativo Maior – Dominante natural. O campo menor é rico em possibilidades!
  ],
)
