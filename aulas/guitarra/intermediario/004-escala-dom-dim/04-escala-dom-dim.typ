#import "../../../../templates/layout.typ": *
#import "@preview/conchord:0.4.0": new-chordgen

#show: aula.with(
  instrumento: "Guitarra",
  nivel: "Intermediário",
)

#let chord = new-chordgen(number-to-left: true, use-shadow-barre: false, colors: (hold: black, barre: black))

// ─── fretboard helper ──────────────────────────────────────────────────────
#let nd(k) = box(
  width: 20pt,
  height: 20pt,
  align(center + horizon, if k == "R" { box(width: 14pt, height: 14pt, fill: color-brand, radius: 7pt) } else if k
    == "N" { box(width: 14pt, height: 14pt, fill: color-muted, radius: 7pt) } else if k == "X" {
    box(width: 14pt, height: 14pt, fill: rgb("#dc2626"), radius: 7pt)
  } else { line(start: (0pt, 0pt), end: (20pt, 0pt), stroke: 0.5pt + color-rule-dark) }),
)
#let neck(data, fs: 1) = {
  let nf = data.at(0).len()
  let hdr = ([],) + range(nf).map(i => align(center, text(size: 7.5pt, weight: "bold")[#(fs + i)]))
  let bdy = data
    .enumerate()
    .map(p => {
      let i = p.at(0)
      let row = p.at(1)
      (align(center, text(size: 8pt, fill: luma(50))[#(6 - i)]),) + row.map(nd)
    })
    .flatten()
  table(
    columns: (13pt,) + range(nf).map(_ => 22pt),
    align: center + horizon,
    inset: (x: 0pt, y: 3pt),
    stroke: (x, y) => if x == 0 or y == 0 { 0.5pt + color-rule-dark } else { 0.4pt + luma(220) },
    fill: (c, r) => if r == 0 { color-subtle-bg } else if c == 0 { luma(242) } else { white },
    ..hdr, ..bdy,
  )
}

= Escala Dominante Diminuta

A *Escala Dominante Diminuta* (também chamada de *Octatônica* ou *Dom-Dim*) é uma das ferramentas mais poderosas do jazz, metal e música contemporânea. Com *8 notas*, ela intercala tom e semitom (H-W: half-whole) e cobre *todas* as tensões disponíveis sobre um acorde dominante.

== A Simetria da Escala

A Dom-Dim alterna sistematicamente *1 semitom – 1 tom* a partir da tônica. Essa simetria cria uma escala que *se repete a cada 3 semitons* — ela só tem 3 formas distintas no total.

#v(0.8em)

#align(center)[
  #block(
    fill: color-subtle-bg,
    stroke: 0.5pt + color-rule-dark,
    inset: 12pt,
    radius: 5pt,
    width: 92%,
    [
      #text(weight: "bold")[G Dom-Dim (G7 com todas as tensões)]
      #v(0.6em)
      #let notas = ("G", "Ab", "Bb", "B", "C#", "D", "E", "F", "G")
      #let degs = ("1", "b9", "b3/\#9", "3", "b5/\#11", "5", "13", "b7", "1")
      #let fills = (
        color-brand-soft, // R
        rgb("#fee2e2"), // b9
        rgb("#fee2e2"), // #9
        color-accent-soft, // 3
        rgb("#fee2e2"), // b5
        color-accent-soft, // 5
        color-accent-soft, // 13
        color-accent-soft, // b7
        color-brand-soft, // R
      )
      #grid(
        columns: 9,
        gutter: 2pt,
        ..notas
          .enumerate()
          .map(((i, n)) => box(
            width: 38pt,
            height: 32pt,
            fill: fills.at(i),
            stroke: 0.4pt + color-rule-dark,
            radius: 3pt,
            align(center + horizon)[
              #text(size: 10pt, weight: "bold")[#n]
              #v(1pt)
              #text(size: 7pt, fill: color-muted)[#degs.at(i)]
            ],
          )),
      )
      #v(0.5em)
      #text(size: 7.5pt, fill: color-muted)[
        Azul = tônica · Verde = notas do acorde (3, 5, b7) · Vermelho = tensões (b9, \#9, b5/\#11)
      ]
    ],
  )
]

#v(1em)

#align(center)[
  #block(
    fill: color-brand-soft,
    stroke: 0.5pt + color-brand-soft,
    inset: 10pt,
    radius: 5pt,
    width: 80%,
    [
      *A escala Dom-Dim contém simultaneamente:* b9, \#9, \#11 e 13 — todas as tensões do acorde dominante. Por isso ela é a escolha ideal para improvisar sobre *V7 com alterações*.
    ],
  )
]

#pagebreak()

== A Simetria das 3 Formas

A escala só tem 3 formas únicas. Começar em G, Bb, Db ou E produz a *mesma escala*.

#v(0.8em)

#align(center)[
  #table(
    columns: (1fr, 1.5fr, 1.5fr),
    align: center + horizon,
    stroke: 0.5pt + color-rule-dark,
    fill: (col, row) => if row == 0 { color-subtle-bg } else if row == 1 { rgb("#ffe4e6") } else if row == 2 {
      rgb("#fef9c3")
    } else { color-accent-soft },
    [*Grupo*], [*Tônicas equivalentes*], [*Notas compartilhadas*],
    [Grupo 1], [G · Bb · Db · E], [G Ab Bb B C\# D E F],
    [Grupo 2], [Ab · B · D · F], [Ab A B C D Eb F Gb],
    [Grupo 3], [A · C · Eb · F\#], [A Bb C C\# Eb E F\# G],
  )
]

#v(0.8em)

#align(center)[
  #block(
    fill: rgb("#fef9c3"),
    stroke: 0.5pt + rgb("#eab308"),
    inset: 10pt,
    radius: 5pt,
    width: 80%,
    [
      #text(weight: "bold")[Implicação prática:] Um único shape no braço serve para *4 tonalidades*. Aprenda uma posição e você instantaneamente tem 4 acordes cobertos.
    ],
  )
]

== Posição Principal (G Dom-Dim — tônica no 3º traste, 6ª corda)

#v(0.8em)

#align(center)[
  #grid(
    columns: (auto, 1fr),
    gutter: 2em,
    align: horizon,
    neck(
      (
        ("R", "N", " ", "N", "X", "N"),
        (" ", "N", "X", "N", " ", "R"),
        (" ", "N", "X", "N", "R", " "),
        ("N", "X", "N", " ", "R", "N"),
        ("X", "N", " ", "R", "N", " "),
        ("R", "N", " ", "N", "X", "N"),
      ),
      fs: 3,
    ),
    block(fill: color-subtle-bg, stroke: 0.5pt + color-rule-dark, inset: 11pt, radius: 5pt, [
      #set text(size: 9pt)
      *●* azul = Tônica (G) \
      *●* cinza = notas da escala \
      *●* vermelho = tensões alteradas (b9, \#9, b5)
      #v(0.5em)
      Repare na *simetria visual*: o padrão de dedilhado se repete a cada 3 casas — característica da octatônica.
    ]),
  )
]

#pagebreak()

== Sons Característicos: Licks Dom-Dim

A escala gera dois recursos idiomáticos muito característicos: *arpejos diminutos encadeados* e *sequências de semitons*.

=== Recurso 1: Arpejos Dim7 em Paralelo

Como a escala contém 2 arpejos dim7 sobrepostos, você pode encadear formas de dim7 subindo de semitom em semitom.

#v(0.8em)

#align(center)[
  #block(
    fill: color-subtle-bg,
    stroke: 0.5pt + color-rule-dark,
    inset: 12pt,
    radius: 5pt,
    width: 85%,
    [
      #set text(font: "Courier New", size: 9pt)
      #raw(
        lang: "text",
        block: true,
        "Sobre G7 — arpejos Bdim7 + Fdim7 encadeados:
e|--7--8--10--11--|
B|--8--9----------|
G|--7--8--10--11--|
D|--8--9----------|
A|----------------|
E|----------------|
  Bdim  Fdim  (repete a cada 3 semitons)",
      )
    ],
  )
]

=== Recurso 2: Sequências Cromáticas de Aproximação

#v(0.8em)

#align(center)[
  #block(
    fill: color-subtle-bg,
    stroke: 0.5pt + color-rule-dark,
    inset: 12pt,
    radius: 5pt,
    width: 85%,
    [
      #set text(font: "Courier New", size: 9pt)
      #raw(
        lang: "text",
        block: true,
        "Lick clássico de jazz sobre G7 → C:
e|--10--11--12--10--9--8--10--|
B|---------------------------|
G|---------------------------|
  (Dom-dim descendo → resolve em C)",
      )
    ],
  )
]

#pagebreak()

== Acordes Gerados pela Dom-Dim

Dentro da escala existem vários acordes úteis que podem ser usados como *substitutos do G7* ou como *arpejos para improvisar*.

#v(0.8em)

#align(center)[
  #grid(
    columns: 4,
    gutter: 2em,
    align: center,
    block[
      #box(chord("3,2,0,0,0,1", name: "G7")) \
      #v(0.3em)
      #text(size: 8.5pt, weight: "bold")[G7] \
      #text(size: 7.5pt, fill: color-muted)[o acorde base]
    ],
    block[
      #box(chord("3,2,0,1,0,1", name: "G7b9")) \
      #v(0.3em)
      #text(size: 8.5pt, weight: "bold")[G7(b9)] \
      #text(size: 7.5pt, fill: color-muted)[tensão dramática]
    ],
    block[
      #box(chord("x,x,1,2,0,1", name: "Bdim7")) \
      #v(0.3em)
      #text(size: 8.5pt, weight: "bold")[Bdim7] \
      #text(size: 7.5pt, fill: color-muted)[arpejo dim na escala]
    ],
    block[
      #box(chord("x,x,3,4,3,4", name: "Bb7")) \
      #v(0.3em)
      #text(size: 8.5pt, weight: "bold")[Bb7] \
      #text(size: 7.5pt, fill: color-muted)[SubV a 3 semitons]
    ],
  )
]

#v(1.5em)

#explainer-component(
  align(center)[
    #table(
      columns: (1fr, 1.5fr),
      align: center + horizon,
      stroke: 0.4pt + color-rule-dark,
      fill: (col, row) => if row == 0 { color-subtle-bg } else if calc.odd(row) { white } else { color-subtle-bg },
      [*Contexto*], [*Quando usar Dom-Dim*],
      [V7 → I (jazz)], [Improvisar sobre o G7 antes de resolver],
      [V7 com b9], [Progressões menores (E7 → Am)],
      [II-V-I alterado], [Combinar com escala alterada no V],
      [Metal / Neoclássico], [Sequências de dim7 em alta velocidade],
      [Blues moderno], [Adicionar cromatismo sofisticado],
    )
  ],
  [
    A Dom-Dim é difícil de decorar como escala linear, mas *muito fácil* como *conjunto de shapes simétricos*. Aprenda um shape de dim7 e deslize-o de semitom em semitom — você está tocando dom-dim sem perceber.

    #v(0.4em)
    Referências: Allan Holdsworth, John Scofield, Mike Stern, Guthrie Govan.
  ],
)
