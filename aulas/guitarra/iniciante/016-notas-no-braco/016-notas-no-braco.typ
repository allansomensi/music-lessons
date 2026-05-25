#import "../../../../templates/layout.typ": *
#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node

#show: aula.with(
  instrumento: "Guitarra",
  nivel: "Intermediário",
)

// ─── helpers ───────────────────────────────────────────────────────────────

#let cell-note(n, hl: false, root: false) = box(
  width: 28pt,
  height: 22pt,
  fill: if root { color-brand } else if hl { color-brand-soft } else { color-subtle-bg },
  stroke: 0.4pt + color-rule-dark,
  align(center + horizon, text(
    size: 7.5pt,
    weight: if root or hl { "bold" } else { "regular" },
    fill: if root { white } else if hl { color-brand-soft } else { luma(80) },
  )[#n]),
)

#let fretboard-full(roots) = {
  // roots: dict of (string-index, fret-index) -> "R" | "N" | ""
  // string 1 = most treble row (index 5), fret 0 = open
  let strings = ("E2", "A2", "D3", "G3", "B3", "E4")
  let open-notes = (
    ("E", "F", "F#", "G", "G#", "A", "A#", "B", "C", "C#", "D", "D#", "E"),
    ("A", "A#", "B", "C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A"),
    ("D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B", "C", "C#", "D"),
    ("G", "G#", "A", "A#", "B", "C", "C#", "D", "D#", "E", "F", "F#", "G"),
    ("B", "C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"),
    ("E", "F", "F#", "G", "G#", "A", "A#", "B", "C", "C#", "D", "D#", "E"),
  )
  let acc = ("F#", "G#", "A#", "C#", "D#")
  let is-acc(n) = n.ends-with("#") or n.ends-with("b")
  let hdr = ([],) + range(13).map(i => align(center, text(size: 7pt, weight: "bold")[#if i == 0 [S] else [#i]]))
  let rows = open-notes
    .enumerate()
    .map(((si, seq)) => {
      let label = align(center, text(size: 7.5pt, weight: "bold", fill: luma(60))[#strings.at(si)])
      (label,) + seq.map(n => cell-note(n, hl: not is-acc(n), root: false))
    })
    .flatten()
  table(
    columns: (30pt,) + range(13).map(_ => 28pt),
    align: center + horizon,
    stroke: 0.3pt + color-rule-dark,
    fill: (c, r) => if r == 0 { luma(228) } else if c == 0 { color-subtle-bg } else { white },
    inset: (x: 0pt, y: 2pt),
    ..hdr, ..rows,
  )
}

= Notas no Braço

Saber *onde estão as notas* no braço é a fundação de tudo: improvisação, leitura de cifra, transporte de acordes e construção de escalas. Um guitarrista que não conhece as notas está sempre "no escuro" — depende de shapes decorados sem entender o porquê.

== A Lógica Cromática

A guitarra é um instrumento *cromático*: cada casa sobe exatamente *1 semitom*. Com 12 semitons, as notas se repetem a partir da 12ª casa (oitava acima da corda solta).

#v(0.8em)

#align(center)[
  #block(
    fill: color-subtle-bg,
    stroke: 0.5pt + color-rule-dark,
    inset: 12pt,
    radius: 5pt,
    width: 90%,
    [
      #text(weight: "bold")[Mapa Completo — 12 Casas (casas naturais destacadas)]
      #v(0.8em)
      #set text(size: 7.8pt)
      #let open-notes = (
        ("E", "F", "F#", "G", "G#", "A", "A#", "B", "C", "C#", "D", "D#", "E"),
        ("A", "A#", "B", "C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A"),
        ("D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B", "C", "C#", "D"),
        ("G", "G#", "A", "A#", "B", "C", "C#", "D", "D#", "E", "F", "F#", "G"),
        ("B", "C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"),
        ("E", "F", "F#", "G", "G#", "A", "A#", "B", "C", "C#", "D", "D#", "E"),
      )
      #let strings = ("6ª(E)", "5ª(A)", "4ª(D)", "3ª(G)", "2ª(B)", "1ª(E)")
      #let is-acc(n) = n.ends-with("#") or n.ends-with("b")
      #let acc-fill = color-strong
      #let nat-fill = color-subtle-bg
      #table(
        columns: (36pt,) + range(13).map(_ => 28pt),
        align: center + horizon,
        stroke: 0.3pt + color-rule-dark,
        fill: (col, row) => {
          if col == 0 or row == 0 { luma(228) } else {
            let seq = open-notes.at(row - 1)
            if is-acc(seq.at(col - 1)) { acc-fill } else { nat-fill }
          }
        },
        inset: (x: 2pt, y: 5pt),
        [*Corda*],
        ..range(13).map(i => text(weight: "bold", size: 7pt, fill: luma(60))[#if i == 0 [S] else [#i]]),
        ..open-notes
          .enumerate()
          .map(((si, seq)) => (
            text(weight: "bold", size: 7.5pt, fill: luma(60))[#strings.at(si)],
            ..seq.map(n => text(
              size: 7.5pt,
              weight: if is-acc(n) { "bold" } else { "regular" },
              fill: if is-acc(n) { white } else { luma(40) },
            )[#n]),
          ))
          .flatten(),
      )
      #v(0.4em)
      #text(size: 7pt, fill: color-muted)[S = Solta · células escuras = notas com acidente (\#)]
    ],
  )
]

#pagebreak()

== Pontos de Referência: As Notas nas Casas Marcadas

As marcações no braço (pontos no 3º, 5º, 7º, 9º e duplo no 12º) não são decoração — são *âncoras de navegação*. Memorize as notas nesses pontos primeiro.

#v(1em)

#align(center)[
  #table(
    columns: (1fr, 1fr, 1fr, 1fr, 1fr),
    align: center + horizon,
    stroke: 0.5pt + color-rule-dark,
    fill: (col, row) => if row == 0 { color-subtle-bg } else if calc.odd(row) { white } else { color-subtle-bg },
    [*Casa*], [*Marca*], [*6ª corda (E)*], [*5ª corda (A)*], [*4ª corda (D)*],
    [3ª], [•], [G], [C], [F],
    [5ª], [•], [A], [D], [G],
    [7ª], [•], [B], [E], [A],
    [9ª], [•], [C\#], [F\#], [B],
    [12ª], [••], [E (8va)], [A (8va)], [D (8va)],
  )
]

#v(1.5em)

== Estratégia: Octavas como Mapa

O *shape de oitava* é a ferramenta mais poderosa para encontrar qualquer nota. Se você sabe onde está uma nota em uma corda, encontra imediatamente a mesma nota (uma oitava acima) nas cordas adjacentes.

#v(0.8em)

#align(center)[
  #grid(
    columns: (1fr, 1fr, 1fr),
    gutter: 1.2em,
    block(
      fill: color-brand-soft,
      stroke: 0.6pt + color-brand-soft,
      inset: 11pt,
      radius: 5pt,
      [
        #align(center)[#text(weight: "bold")[Oitava: cordas 6→4]]
        #v(0.5em)
        #set text(size: 9pt)
        Pule *2 cordas* para cima e avance *2 casas* à frente.
        #v(0.4em)
        _Ex: G na 6ª / casa 3 → G na 4ª / casa 5_
      ],
    ),
    block(
      fill: color-brand-soft,
      stroke: 0.6pt + color-brand-soft,
      inset: 11pt,
      radius: 5pt,
      [
        #align(center)[#text(weight: "bold")[Oitava: cordas 5→3]]
        #v(0.5em)
        #set text(size: 9pt)
        Pule *2 cordas* para cima e avance *2 casas* à frente.
        #v(0.4em)
        _Ex: D na 5ª / casa 5 → D na 3ª / casa 7_
      ],
    ),
    block(
      fill: rgb("#fef9c3"),
      stroke: 0.6pt + rgb("#eab308"),
      inset: 11pt,
      radius: 5pt,
      [
        #align(center)[#text(weight: "bold")[Oitava: cordas 6→3 (atenção!)]],
        #v(0.5em)
        #set text(size: 9pt)
        Pule *3 cordas* e avance *3 casas*. \
        (O intervalo B→G é terça, não quarta.)
        #v(0.4em)
        _Ex: A na 6ª / casa 5 → A na 3ª / casa 7_
      ],
    ),
  )
]

#pagebreak()

== As Notas nas Cordas 6 e 5 — Memorização Prioritária

Dominar as cordas mais graves é o caminho mais rápido para mapear o braço inteiro, pois a maioria dos shapes (CAGED, power chords, barre chords) tem sua *tônica nessas cordas*.

#v(0.8em)

#align(center)[
  #block(
    fill: color-subtle-bg,
    stroke: 0.5pt + color-rule-dark,
    inset: 12pt,
    radius: 5pt,
    width: 95%,
    [
      #text(weight: "bold")[6ª Corda (Mi grave) — naturais]
      #v(0.6em)
      #let notas6 = ("E", "·", "F", "·", "G", "·", "A", "·", "B", "C", "·", "D", "·", "E")
      #let casas6 = ("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12")
      #grid(
        columns: 13,
        gutter: 0pt,
        ..casas6.map(c => box(
          width: 32pt,
          height: 18pt,
          fill: luma(228),
          stroke: 0.4pt + color-rule-dark,
          align(center + horizon, text(size: 7.5pt, weight: "bold")[#c]),
        )),
        ..("E", "·", "F", "·", "G", "·", "A", "·", "B", "C", "·", "D", "E").map(n => box(
          width: 32pt,
          height: 24pt,
          fill: if n == "·" { color-strong } else { color-brand-soft },
          stroke: 0.4pt + color-rule-dark,
          align(center + horizon, text(
            size: 9pt,
            weight: "bold",
            fill: if n == "·" { color-muted } else { color-brand-soft },
          )[#n]),
        )),
      )
      #v(1em)
      #text(weight: "bold")[5ª Corda (Lá) — naturais]
      #v(0.6em)
      #grid(
        columns: 13,
        gutter: 0pt,
        ..casas6.map(c => box(
          width: 32pt,
          height: 18pt,
          fill: luma(228),
          stroke: 0.4pt + color-rule-dark,
          align(center + horizon, text(size: 7.5pt, weight: "bold")[#c]),
        )),
        ..("A", "·", "B", "C", "·", "D", "·", "E", "F", "·", "G", "·", "A").map(n => box(
          width: 32pt,
          height: 24pt,
          fill: if n == "·" { color-strong } else { color-accent-soft },
          stroke: 0.4pt + color-rule-dark,
          align(center + horizon, text(
            size: 9pt,
            weight: "bold",
            fill: if n == "·" { color-muted } else { color-accent-soft },
          )[#n]),
        )),
      )
    ],
  )
]

#v(1.5em)

#explainer-component(
  align(center)[
    #block(
      fill: luma(245),
      stroke: 0.5pt + color-rule-dark,
      inset: 11pt,
      radius: 5pt,
      width: 90%,
      [
        #set text(size: 9pt)
        #table(
          columns: (1fr, 1fr, 1fr),
          align: center + horizon,
          stroke: 0.4pt + color-rule-dark,
          fill: (col, row) => if row == 0 { luma(228) } else { white },
          [*Nota*], [*6ª corda (casa)*], [*5ª corda (casa)*],
          [C], [8ª], [3ª],
          [D], [10ª], [5ª],
          [E], [12ª / 0ª], [7ª],
          [F], [1ª], [8ª],
          [G], [3ª], [10ª],
          [A], [5ª], [0ª / 12ª],
          [B], [7ª], [2ª],
        )
      ],
    )
  ],
  [
    *Plano de memorização:* Escolha *uma nota por dia*. Encontre ela em todas as casas das cordas 6 e 5. Em uma semana você tem um mapa sólido do braço inteiro.

    #v(0.4em)
    Exercício prático: pegue um drone em Lá e toque apenas a nota A em todas as regiões do braço. Isso treina o ouvido junto com a memória visual.
  ],
)
