#import "../../../../templates/layout.typ": *
#import "@preview/conchord:0.4.0": new-chordgen

#show: aula.with(
  instrumento: "Guitarra",
  nivel: "Iniciante",
)

#let chord = new-chordgen(number-to-left: true, use-shadow-barre: false, colors: (hold: black, barre: black))
#show <chord>: set text(fill: color-strong, weight: "bold")

// =============================
// FRETBOARD DIAGRAM HELPER
// =============================
#let nd(k) = box(
  width: 20pt,
  height: 20pt,
  align(center + horizon, if k == "R" {
    // Tônica
    box(width: 14pt, height: 14pt, fill: color-strong, radius: 7pt)
  } else if k == "N" {
    // Notas da escala
    box(width: 14pt, height: 14pt, fill: white, stroke: 1pt + color-strong, radius: 7pt)
  } else {
    // Corda vazia
    line(start: (0pt, 0pt), end: (20pt, 0pt), stroke: 0.5pt + color-rule-dark)
  }),
)

#let neck(data, fs: 1) = {
  let nf = data.at(0).len()
  // Cabeçalho dos trastes (ex: 5, 6, 7, 8)
  let hdr = ([],) + range(nf).map(i => align(center, text(size: 8pt, weight: "bold")[#(fs + i)]))

  let bdy = data
    .enumerate()
    .map(p => {
      let i = p.at(0)
      let row = p.at(1)
      // Números das cordas à esquerda (6, 5, 4, 3, 2, 1)
      (align(center, text(size: 8pt, fill: color-strong)[#(6 - i)]),) + row.map(nd)
    })
    .flatten()

  table(
    columns: (15pt,) + range(nf).map(_ => 24pt),
    align: center + horizon,
    inset: (x: 0pt, y: 3pt),
    // Bordas pretas sólidas para maior clareza na impressão
    stroke: (x, y) => if x == 0 or y == 0 { 0.5pt + color-strong } else { 0.4pt + color-rule-dark },
    fill: (c, r) => if r == 0 { color-subtle-bg } else if c == 0 { color-subtle-bg } else { white },
    ..hdr, ..bdy,
  )
}

= Escala Pentatônica Menor

A *pentatônica menor* é a escala mais usada no rock, blues, pop e metal. Com apenas *5 notas*, ela é perdoadora — quase qualquer nota da escala soa bem sobre os acordes do tom. É a primeira escala de lead da maioria dos guitarristas.

== A Fórmula

A pentatônica menor retira o 2º e o 6º grau da escala menor natural, deixando apenas os graus mais expressivos:

#v(0.8em)

#align(center)[
  #table(
    columns: (1fr, 0.6fr, 0.6fr, 0.6fr, 0.6fr, 0.6fr, 1.6fr),
    align: center + horizon,
    stroke: 0.5pt + color-rule-dark,
    fill: (col, row) => if row == 0 { color-subtle-bg } else if col == 5 { luma(230) } else { white },
    [*Escala*], [*1*], [*b3*], [*4*], [*5*], [*b7*], [*Em Lá Menor (Am)*],
    [Menor Natural], [T], [b3], [4], [5], [b6], [b7],
    [*Penta Menor*], [*T*], [*b3*], [*4*], [*5*], [—], [*b7*],
    [], [Lá], [Dó], [Ré], [Mi], [—], [Sol],
  )
]

== As 5 Posições (Em Am — Tônica no 5º traste)

Cada posição cobre uma região do braço. Juntas, elas formam um mapa completo. A tônica (●) é a referência principal de cada posição.

#v(1em)

=== Posição 1 — A "Caixa" (o shape mais importante)

#align(center)[
  #grid(
    columns: (auto, 1fr),
    gutter: 2em,
    align: horizon,
    neck(
      (
        ("R", " ", " ", "N"),
        ("N", " ", "N", " "),
        ("N", " ", "R", " "),
        ("N", " ", "N", " "),
        ("N", " ", " ", "N"),
        ("R", " ", " ", "N"),
      ),
      fs: 5,
    ),
    block(
      fill: color-subtle-bg,
      stroke: 0.5pt + color-rule-dark,
      inset: 11pt,
      radius: 5pt,
      [
        #set text(size: 9.5pt)
        A posição mais usada do rock e blues. Começa com o *indicador na casa 5*. \
        #v(0.5em)
        Note que a tônica (●) aparece na *6ª, 4ª e 1ª corda*.
      ],
    ),
  )
]

#v(1.5em)

=== Posição 2

#align(center)[
  #neck(
    (
      (" ", "N", " ", "N"),
      ("N", " ", " ", "N"),
      ("R", " ", " ", "N"),
      ("N", " ", "N", " "),
      (" ", "N", " ", "R"),
      (" ", "N", " ", "N"),
    ),
    fs: 7,
  )
]

#v(1.5em)

=== Posição 3

#align(center)[
  #neck(
    (
      (" ", "N", " ", "N", " "),
      (" ", "N", " ", "R", " "),
      (" ", "N", " ", "N", " "),
      ("N", " ", " ", "N", " "),
      (" ", "R", " ", " ", "N"),
      (" ", "N", " ", "N", " "),
    ),
    fs: 9,
  )
]

#v(1.5em)

=== Posição 4

#align(center)[
  #neck(
    (
      ("N", " ", " ", "N"),
      ("R", " ", " ", "N"),
      ("N", " ", "N", " "),
      ("N", " ", "R", " "),
      (" ", "N", " ", "N"),
      ("N", " ", " ", "N"),
    ),
    fs: 12,
  )
]

#v(1.5em)

=== Posição 5

#align(center)[
  #neck(
    (
      (" ", "N", " ", "R"),
      (" ", "N", " ", "N"),
      ("N", " ", " ", "N"),
      ("R", " ", " ", "N"),
      (" ", "N", " ", "N"),
      (" ", "N", " ", "R"),
    ),
    fs: 2,
  )
]

#pagebreak()

== Conexão com o CAGED

As 5 posições da pentatônica se sobrepõem exatamente com os 5 shapes do CAGED. Cada posição "habita" dentro de um shape:

#v(0.8em)

#align(center)[
  #table(
    columns: (1fr, 1fr, 1fr, 1fr),
    align: center + horizon,
    stroke: 0.5pt + color-rule-dark,
    fill: (col, row) => if row == 0 { color-subtle-bg } else if calc.odd(row) { white } else { color-subtle-bg },
    [*Posição Penta*], [*Shape CAGED*], [*Tônica (Am)*], [*Casas aprox.*],
    [Posição 1], [Shape E], [6ª, 4ª e 1ª corda], [5–8],
    [Posição 2], [Shape D], [4ª e 2ª corda], [7–10],
    [Posição 3], [Shape C], [5ª e 2ª corda], [9–13],
    [Posição 4], [Shape A], [5ª e 3ª corda], [12–15],
    [Posição 5], [Shape G], [6ª, 3ª e 1ª corda], [2–5 (ou 14–17)],
  )
]

#v(1.5em)

== Aplicando: Blues e Rock

#explainer-component(
  align(center)[
    #block(
      fill: color-subtle-bg,
      stroke: 0.5pt + color-rule-dark,
      inset: 12pt,
      radius: 5pt,
      [
        #set text(font: "Courier New", size: 9pt)
        #raw(
          lang: "text",
          block: true,
          "Am  (Pos.1 — casas 5 a 8)
e|--5h8----8-------|
B|--------8-5------|
G|----------7-5----|
D|----------7-5----|
A|-----------------|
E|-----------------|
 bend  pull-off",
        )
      ],
    )
  ],
  [
    Este é um dos licks mais clássicos do blues usando apenas a Posição 1.

    #v(0.4em)
    *Regra prática:* comece e termine na *tônica*. Enquanto não sabe exatamente o que tocar, voltar para a tônica sempre soa resolvido.
  ],
  inverted: true,
)

#v(1.5em)

#caixa-destaque(width: 85%)[
  *Plano de estudo:* Domine a *Posição 1* por completo antes de aprender as outras. Toque subindo e descendo, improvise sobre uma base de Am, experimente bends e vibratos. Só então expanda para a Posição 2. A conexão entre posições vem naturalmente com o tempo.
]
