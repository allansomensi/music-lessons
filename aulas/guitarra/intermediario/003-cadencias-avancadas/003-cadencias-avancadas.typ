#import "../../../../templates/layout.typ": *
#import "@preview/conchord:0.4.0": new-chordgen
#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node

#show: aula.with(
  instrumento: "Guitarra",
  nivel: "Intermediário",
)

#let chord = new-chordgen(number-to-left: true, use-shadow-barre: false, colors: (hold: black, barre: black))

#show <chord>: set text(fill: color-strong, weight: "bold")

// ─── fretboard helper
#let nd(k) = box(
  width: 20pt,
  height: 20pt,
  align(center + horizon, if k == "R" {
    box(width: 14pt, height: 14pt, fill: color-strong, radius: 7pt)
  } else if k == "N" {
    box(width: 14pt, height: 14pt, fill: white, stroke: 1pt + color-strong, radius: 7pt)
  } else if k == "X" {
    box(width: 14pt, height: 14pt, fill: luma(150), stroke: 1pt + color-strong, radius: 7pt)
  } else {
    line(start: (0pt, 0pt), end: (20pt, 0pt), stroke: 0.5pt + color-rule-dark)
  }),
)

#let neck(data, fs: 1) = {
  let nf = data.at(0).len()
  let hdr = ([],) + range(nf).map(i => align(center, text(size: 8pt, weight: "bold")[#(fs + i)]))
  let bdy = data
    .enumerate()
    .map(p => {
      let i = p.at(0)
      let row = p.at(1)
      (align(center, text(size: 8pt, fill: color-strong)[#(6 - i)]),) + row.map(nd)
    })
    .flatten()
  table(
    columns: (15pt,) + range(nf).map(_ => 24pt),
    align: center + horizon,
    inset: (x: 0pt, y: 3pt),
    stroke: (x, y) => if x == 0 or y == 0 { 0.5pt + color-strong } else { 0.4pt + color-rule-dark },
    fill: (c, r) => if r == 0 { color-subtle-bg } else if c == 0 { color-subtle-bg } else { white },
    ..hdr, ..bdy,
  )
}

= Cadências Avançadas

Uma *cadência* é qualquer movimento harmônico que cria sensação de repouso ou resolução. Você já conhece o II-V-I básico. Aqui vamos expandir o vocabulário de cadências para tom maior, menor, e as técnicas de *substituição e dominante secundário*.

== Revisão: As Cadências Fundamentais

#v(0.8em)

#align(center)[
  #table(
    columns: (1fr, 1fr, 1.5fr, 1.5fr),
    align: center + horizon,
    stroke: 0.5pt + color-rule-dark,
    fill: (col, row) => if row == 0 { color-subtle-bg } else if calc.odd(row) { white } else { color-subtle-bg },
    [*Cadência*], [*Fórmula*], [*Em Dó Maior*], [*Função*],
    [Autêntica], [V7 → I], [G7 → C], [Máxima resolução],
    [Plagal], [IV → I], [F → C], [Repouso suave ("Amém")],
    [Composta], [II – V – I], [Dm7 – G7 – C], [Jazz / Bossa — completa],
    [Interrompida], [V → VI], [G7 → Am], [Surpresa, fuga da resolução],
    [V → Im], [V7 → Im], [E7 → Am], [Cadência em tom menor],
  )
]

#pagebreak()

= Dominantes Secundários

O *dominante secundário* é um acorde V7 emprestado temporariamente para resolver em *qualquer grau do campo*, não apenas no I. É a ferramenta mais importante para criar tensão local e colorir progressões.

== Construção

Para cada grau do campo, criamos um acorde dominante que aponta para ele: o *V7 do grau X*.

#v(0.8em)

#align(center)[
  #block(
    fill: color-subtle-bg,
    stroke: 0.5pt + color-rule-dark,
    inset: 12pt,
    radius: 5pt,
    width: 92%,
    [
      #table(
        columns: (0.5fr, 0.8fr, 0.8fr, 1fr, 1.8fr),
        align: center + horizon,
        stroke: 0.5pt + color-rule-dark,
        fill: (col, row) => {
          if row == 0 { color-subtle-bg } else if col == 3 { luma(230) } else if col == 0 {
            color-subtle-bg
          } else {
            white
          }
        },
        [*Grau alvo*], [*Acorde alvo*], [*V7 de…*], [*Dominante Secundário*], [*Resolução*],
        [II], [Dm7], [V/II], [*A7*], [A7 → Dm7],
        [III], [Em7], [V/III], [*B7*], [B7 → Em7],
        [IV], [F7M], [V/IV], [*C7*], [C7 → F7M],
        [V], [G7], [V/V], [*D7*], [D7 → G7 → C],
        [VI], [Am7], [V/VI], [*E7*], [E7 → Am7],
      )
      #v(0.4em)
      #text(size: 8pt, fill: color-muted)[Campo de Dó Maior · o V/V (D7) é o mais comum em progressões pop e rock.]
    ],
  )
]

#v(1em)

#align(center)[
  #grid(
    columns: 4,
    gutter: 2.5em,
    align: center,
    block[
      #box(chord("x,x,0,2,3,1", name: "Dm7")) \
      #v(0.4em)
      #text(size: 8.5pt, weight: "bold")[Dm7 (II)]
    ],
    block[
      #box(chord("x,0,2,2,2,0", name: "A7")) \
      #v(0.4em)
      #text(size: 8.5pt, weight: "bold")[A7 (V/II)]
    ],
    block[
      #box(chord("x,x,0,2,3,1", name: "Dm7")) \
      #v(0.4em)
      #text(size: 8.5pt, weight: "bold")[Dm7 (II)]
    ],
    block[
      #box(chord("3,2,0,0,0,1", name: "G7")) \
      #v(0.4em)
      #text(size: 8.5pt, weight: "bold")[G7 (V)]
    ],
  )
]

#v(1.5em)

#caixa-destaque(width: 90%)[
  Progressão: *Dm7 – A7 – Dm7 – G7 – C*

  O A7 é o V/II. Quando ele aparece, o ouvido "teletransporta" momentaneamente para o tom de Ré menor, antes de retornar ao tom principal. É exatamente esse "desvio" que cria a sensação de riqueza harmônica.
]

#pagebreak()

= Substituição de Trítono

A *substituição de trítono* (SubV) é a técnica jazz mais importante depois do II-V-I. Ela substitui um acorde dominante por outro, cujo *trítono interno é idêntico* ao original — apenas invertido.

== A Lógica

#v(0.8em)

#align(center)[
  #diagram(
    spacing: (18mm, 14mm),
    node((0, 0), [G7 \ (3ª=Si, 7ª=Fá)], stroke: 0.5pt + color-rule-dark, shape: fletcher.shapes.rect, fill: white),
    node((1, 0), [Trítono \ Si ↔ Fá], stroke: 0.5pt + color-rule-dark, shape: fletcher.shapes.rect, fill: luma(230)),
    node((2, 0), [Db7 \ (3ª=Fá, 7ª=Si)], stroke: 0.5pt + color-rule-dark, shape: fletcher.shapes.rect, fill: white),
    node((0, 1), [G7 → C], stroke: 0.5pt + color-rule-dark, shape: fletcher.shapes.rect, fill: color-subtle-bg),
    node((2, 1), [*Db7 → C*], stroke: 0.5pt + color-rule-dark, shape: fletcher.shapes.rect, fill: color-subtle-bg),
    edge((0, 0), (1, 0), "->"),
    edge((1, 0), (2, 0), "->"),
    edge((0, 0), (0, 1), "->"),
    edge((2, 0), (2, 1), "->"),
    edge((0, 1), (2, 1), "<->", label: "soa = !"),
  )
]

#v(0.8em)

#caixa-destaque(width: 80%)[
  *Regra:* o SubV de qualquer dominante está a *trítono de distância* (6 semitons). \
  SubV do G7 = *Db7*. SubV do D7 = *Ab7*. SubV do A7 = *Eb7*.
]

== Aplicação no II-V-I

#v(0.8em)

#align(center)[
  #block(
    stroke: 0.5pt + color-rule-dark,
    radius: 6pt,
    clip: true,
    [
      #table(
        columns: (1fr, 1fr, 1fr, 1fr),
        align: center + horizon,
        stroke: 0.5pt + color-rule-light,
        fill: (col, row) => if row == 0 { color-subtle-bg } else if row == 1 { white } else { color-subtle-bg },
        [*Progressão*], [*II*], [*V*], [*I*],
        [Original], [Dm7], [G7], [C7M],
        [Com SubV], [Dm7], [*Db7*], [C7M],
        [Cromático!], [Dm7], [Db7 → C7M], [(semitom abaixo)],
      )
    ],
  )
]

#v(0.5em)

#align(center)[
  #text(size: 8.5pt, fill: color-muted)[
    O Db7 resolve *por semitom* no C — o movimento mais suave possível. Isso cria a linha de baixo cromática tão característica do jazz.
  ]
]

#pagebreak()

= Cadência em Tom Menor

O tom menor tem particularidades importantes. A *cadência autêntica em menor* usa o *V7* da Escala Menor Harmônica (com a sensível \#7).

#v(0.8em)

#align(center)[
  #diagram(
    spacing: (16mm, 14mm),
    node((0, 0), [IIø (Bø)], stroke: 0.5pt + color-rule-dark, shape: fletcher.shapes.rect, fill: white),
    node((1, 0), [V7 (E7)], stroke: 0.5pt + color-rule-dark, shape: fletcher.shapes.rect, fill: luma(230)),
    node((2, 0), [Im (Am)], stroke: 0.5pt + color-rule-dark, shape: fletcher.shapes.rect, fill: color-subtle-bg),
    edge((0, 0), (1, 0), "->"),
    edge((1, 0), (2, 0), "->"),
    node((0, 1), text(size: 8pt)[Subdominante \ Meio-Dim.], stroke: none),
    node((1, 1), text(size: 8pt)[Dominante \ com sensível G\#], stroke: none),
    node((2, 1), text(size: 8pt)[Tônica Menor], stroke: none),
  )
]

#v(1em)

#align(center)[
  #grid(
    columns: 3,
    gutter: 2em,
    align: center,
    block[
      #box(chord("x,2,3,2,3,x", name: "Bø")) \
      #v(0.4em)
      #text(size: 9pt, weight: "bold")[Bø (IIø)] \
      #text(size: 8pt, fill: color-muted)[si · ré · fá · lá]
    ],
    block[
      #box(chord("0,2,0,1,0,0", name: "E7")) \
      #v(0.4em)
      #text(size: 9pt, weight: "bold")[E7 (V7)] \
      #text(size: 8pt, fill: color-muted)[mi · sol\# · si · ré]
    ],
    block[
      #box(chord("x,0,2,2,1,0", name: "Am")) \
      #v(0.4em)
      #text(size: 9pt, weight: "bold")[Am (Im)] \
      #text(size: 8pt, fill: color-muted)[lá · dó · mi]
    ],
  )
]

#pagebreak()

= Progressões Cíclicas e Sequenciais

== Círculo de Quintas

A progressão por *quintas descendentes* é a mais natural da harmonia tonal: cada acorde resolve no próximo como um dominante.

#v(0.8em)

#align(center)[
  #diagram(
    spacing: (12mm, 12mm),
    node-stroke: 0.5pt + color-rule-dark,
    node-shape: fletcher.shapes.rect,
    node((0, 0), [Bø], fill: color-subtle-bg),
    node((1, 0), [E7], fill: white),
    node((2, 0), [Am7], fill: color-subtle-bg),
    node((3, 0), [D7], fill: white),
    node((4, 0), [G7M], fill: color-subtle-bg),
    node((5, 0), [C7M], fill: white),
    edge((0, 0), (1, 0), "->"),
    edge((1, 0), (2, 0), "->"),
    edge((2, 0), (3, 0), "->"),
    edge((3, 0), (4, 0), "->"),
    edge((4, 0), (5, 0), "->"),
  )
]

#v(0.5em)

#align(center)[
  #text(
    size: 8.5pt,
    fill: color-muted,
  )[Cada acorde resolve uma quinta abaixo. Toda a progressão é uma cadência em cascata.]
]

#v(1.5em)

== Progressões Pop Modernas com Dominantes Secundários

#align(center)[
  #block(
    fill: color-subtle-bg,
    stroke: 0.5pt + color-rule-dark,
    inset: 12pt,
    radius: 5pt,
    width: 92%,
    [
      #table(
        columns: (1.5fr, 2fr, 1.5fr),
        align: center + horizon,
        stroke: 0.4pt + color-rule-dark,
        fill: (col, row) => if row == 0 { color-subtle-bg } else if calc.odd(row) { white } else { color-subtle-bg },
        [*Progressão*], [*Análise*], [*Referências*],
        [C – E7 – Am – F], [I – V/VI – VI – IV], ["Don't Stop Me Now" — Queen],
        [C – A7 – Dm – G7], [I – V/II – II – V], [jazz/bossa clássica],
        [G – D7 – G – C – D7 – G], [I – V/V – I – IV – V/V – I], [country, rock clássico],
        [Am – E7 – Am – F – C – G – E7], [Im – V7 – Im – VI – III – VII – V7], [flamenco, metal clássico],
      )
    ],
  )
]

#v(1.5em)

#explainer-component(
  align(center)[
    #block(fill: color-subtle-bg, stroke: 0.5pt + color-rule-dark, inset: 11pt, radius: 5pt, width: 88%, [
      #set text(size: 9pt)
      *Passo a passo para aplicar dominantes secundários:*
      #v(0.5em)
      + Identifique o grau para o qual você quer criar tensão extra (ex: Am = VI).
      + Calcule o dominante: uma quinta acima do grau alvo (Am → E → E7).
      + Insira o E7 *um acorde antes* do Am na progressão.
      + Opcional: preceda o E7 com o seu próprio II grau (Bm7b5) para um II-V-I secundário.
    ])
  ],
  [
    Dominantes secundários não mudam o tom da música — apenas criam *gravidade local*. O ouvinte sente o "puxão" para o próximo acorde sem perceber conscientemente a técnica.

    Com o tempo, você começa a *ouvir* os dominantes naturalmente nas músicas que já conhece.
  ],
)
