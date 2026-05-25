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
    == "N" { box(width: 14pt, height: 14pt, fill: color-muted, radius: 7pt) } else if k == "T" {
    box(width: 14pt, height: 14pt, fill: rgb("#15803d"), radius: 7pt)
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

= Escala Maior — 7 Posições no Braço

A *Escala Maior* é a base de toda a teoria tonal ocidental. Você já a conhece como a fonte do campo harmônico. Agora vamos mapeá-la *completamente* pelo braço em 7 posições ligadas ao Sistema CAGED, para que você possa improvisar e criar melodias em qualquer região.

== Fórmula e Intervalos

#v(0.8em)

#align(center)[
  #table(
    columns: (1fr, 0.6fr, 0.6fr, 0.6fr, 0.6fr, 0.6fr, 0.6fr, 0.6fr),
    align: center + horizon,
    stroke: 0.5pt + color-rule-dark,
    fill: (col, row) => if row == 0 { color-subtle-bg } else { white },
    [*Grau*], [*1*], [*2*], [*3*], [*4*], [*5*], [*6*], [*7M*],
    [*Intervalo*], [T], [2M], [3M], [4J], [5J], [6M], [7M],
    [*Em C*], [C], [D], [E], [F], [G], [A], [B],
    [*Dist.*], [—], [T], [T], [½], [T], [T], [T],
  )
]

#v(0.5em)

#align(center)[
  #block(
    fill: color-subtle-bg,
    stroke: 0.5pt + color-rule-dark,
    inset: 10pt,
    radius: 5pt,
    width: 80%,
    [*Padrão de tons:* T – T – ½ – T – T – T – ½ (sempre, em qualquer tonalidade)],
  )
]

#pagebreak()

== As 7 Posições (Em G Maior — tônica no 3º traste)

Legenda: *●* azul = Tônica (G) · *●* cinza = demais notas da escala

#v(1em)

=== Posição 1 — Shape E (CAGED)

#align(center)[
  #grid(
    columns: (auto, 1fr),
    gutter: 2em,
    align: horizon,
    neck(
      (
        ("R", " ", "N", " ", "N", " "),
        (" ", "N", " ", "N", " ", "R"),
        (" ", "N", " ", "N", " ", " "),
        (" ", "N", " ", " ", "N", " "),
        (" ", "N", " ", "N", " ", "R"),
        ("R", " ", "N", " ", "N", " "),
      ),
      fs: 3,
    ),
    block(fill: color-subtle-bg, stroke: 0.5pt + color-rule-dark, inset: 10pt, radius: 5pt, [#set text(size: 9pt)
      Tônica na *6ª e 1ª corda, 3ª casa*. \
      Shape âncora do CAGED. \
      Região: casas 3–7.]),
  )
]

#v(1.2em)

=== Posição 2 — Shape D (CAGED)

#align(center)[
  #grid(
    columns: (auto, 1fr),
    gutter: 2em,
    align: horizon,
    neck(
      (
        (" ", "N", " ", "N", " ", "N"),
        ("R", " ", "N", " ", "N", " "),
        ("N", " ", "N", " ", " ", "R"),
        ("N", " ", "N", " ", "N", " "),
        (" ", "N", " ", "N", " ", "N"),
        (" ", "N", " ", "N", " ", "N"),
      ),
      fs: 5,
    ),
    block(fill: color-subtle-bg, stroke: 0.5pt + color-rule-dark, inset: 10pt, radius: 5pt, [#set text(size: 9pt)
      Tônica na *5ª corda, 5ª casa*. \
      Conecta com a Posição 1 pelo lado agudo. \
      Região: casas 5–9.]),
  )
]

#v(1.2em)

=== Posição 3 — Shape C (CAGED)

#align(center)[
  #grid(
    columns: (auto, 1fr),
    gutter: 2em,
    align: horizon,
    neck(
      (
        ("N", " ", "N", " ", "N", " "),
        (" ", "N", " ", "N", " ", "R"),
        (" ", "N", " ", "N", " ", "N"),
        ("N", " ", "N", " ", " ", "N"),
        ("N", " ", "N", " ", "R", " "),
        ("N", " ", "N", " ", "N", " "),
      ),
      fs: 7,
    ),
    block(fill: color-subtle-bg, stroke: 0.5pt + color-rule-dark, inset: 10pt, radius: 5pt, [#set text(size: 9pt)
      Tônica na *4ª e 5ª corda, 10ª/5ª corda*. \
      Região do meio do braço. \
      Casas 7–11.]),
  )
]

#v(1.2em)

=== Posição 4 — Shape A (CAGED)

#align(center)[
  #grid(
    columns: (auto, 1fr),
    gutter: 2em,
    align: horizon,
    neck(
      (
        ("N", " ", "N", " ", "R", " "),
        ("N", " ", "N", " ", "N", " "),
        (" ", "N", " ", "N", " ", "N"),
        (" ", "N", " ", "N", " ", "R"),
        (" ", "N", " ", "R", " ", "N"),
        ("N", " ", "N", " ", "R", " "),
      ),
      fs: 9,
    ),
    block(fill: color-subtle-bg, stroke: 0.5pt + color-rule-dark, inset: 10pt, radius: 5pt, [#set text(size: 9pt)
      Tônica na *5ª corda, 10ª casa* e na *2ª/1ª*. \
      Região: casas 9–13.]),
  )
]

#v(1.2em)

=== Posição 5 — Shape G (CAGED) · Oitava acima da Pos. 1

#align(center)[
  #grid(
    columns: (auto, 1fr),
    gutter: 2em,
    align: horizon,
    neck(
      (
        ("R", " ", "N", " ", "N", " "),
        (" ", "N", " ", "N", " ", "R"),
        (" ", "N", " ", "N", " ", "N"),
        (" ", "N", " ", " ", "N", " "),
        (" ", "N", " ", "N", " ", "R"),
        ("R", " ", "N", " ", "N", " "),
      ),
      fs: 12,
    ),
    block(fill: color-subtle-bg, stroke: 0.5pt + color-rule-dark, inset: 10pt, radius: 5pt, [#set text(size: 9pt)
      *Oitava* da Posição 1. \
      Mesma geometria, uma oitava acima. \
      Casas 12–16.]),
  )
]

#pagebreak()

== Conexão Visual das Posições

As posições se encaixam lado a lado cobrindo o braço inteiro sem gaps. O último dedo de uma posição toca a mesma nota que o primeiro dedo da seguinte.

#v(0.8em)

#align(center)[
  #table(
    columns: (1fr, 1fr, 1fr, 1fr, 1fr),
    align: center + horizon,
    stroke: 0.5pt + color-rule-dark,
    fill: (col, row) => if row == 0 { color-subtle-bg } else if col == 0 { color-brand-soft } else if col == 1 {
      color-accent-soft
    } else if col == 2 { rgb("#fef9c3") } else if col == 3 { rgb("#ede9fe") } else { rgb("#ffe4e6") },
    [*Posição 1*], [*Posição 2*], [*Posição 3*], [*Posição 4*], [*Posição 5*],
    [Shape E], [Shape D], [Shape C], [Shape A], [Shape G],
    [Casas 3–7], [Casas 5–9], [Casas 7–11], [Casas 9–13], [Casas 12+],
    [Tônica 6ª/3ª], [Tônica 5ª/5ª], [Tônica 4ª/10ª], [Tônica 5ª/10ª], [= Pos. 1 + 8va],
  )
]

#v(1.5em)

== Exercícios de Ligação

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
          "G Maior — ligando Pos. 1 e 2 na 1ª corda:
e|--5--7--8--10--12--|
       ↑       ↑
     Pos.1   Pos.2",
        )
      ],
    )
  ],
  [
    *Sequência de estudo:*

    1. Toque cada posição isolada, subindo e descendo.
    2. Ligue *Pos. 1 → Pos. 2* usando a 1ª corda como ponte.
    3. Ligue *Pos. 2 → Pos. 3* da mesma forma.
    4. Toque a escala inteira sem parar, do grave ao agudo.

    #v(0.4em)
    Metrônomo em ♩ = 60 BPM. Priorize *limpeza*, não velocidade.
  ],
)

#v(1.5em)

== Aplicação: A Escala Maior no Contexto Harmônico

#align(center)[
  #block(
    fill: color-brand-soft,
    stroke: 0.5pt + color-brand-soft,
    inset: 12pt,
    radius: 5pt,
    width: 85%,
    [
      #text(weight: "bold")[Sobre qual acorde improvisar com a Escala Maior:]
      #v(0.6em)
      #set text(size: 9pt)
      #table(
        columns: (1fr, 1.5fr, 1.5fr),
        align: center + horizon,
        stroke: 0.4pt + color-rule-dark,
        fill: (col, row) => if row == 0 { color-subtle-bg } else { white },
        [*Contexto*], [*Acorde*], [*Tom/Modo*],
        [Progressão maior], [I, IV, V], [Tom da tônica],
        [Acorde maior isolado], [Cmaj7, Gmaj7...], [Jônico],
        [Acorde dominante], [G7 → C], [Mixolídio no V],
      )
    ],
  )
]
