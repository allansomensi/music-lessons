#import "../../../../templates/layout.typ": *
#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node

#show: aula.with(
  instrumento: "Guitarra",
  nivel: "Intermediário",
)

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

= Escala Menor Harmônica e Melódica

O modo menor natural tem um "problema" do ponto de vista tonal: seu V grau é *menor* (Em no campo de Am), o que enfraquece a cadência para a tônica. Para resolver isso, a música ocidental criou duas variantes que *elevam o 7º grau*, gerando um dominante com sensível.

== Comparando as Três Escalas Menores

#v(0.8em)

#align(center)[
  #table(
    columns: (1.5fr, 0.5fr, 0.5fr, 0.5fr, 0.5fr, 0.5fr, 0.5fr, 0.5fr, 1.8fr),
    align: center + horizon,
    stroke: 0.5pt + color-rule-dark,
    fill: (col, row) => {
      if row == 0 { color-subtle-bg } else if col == 6 and row == 2 { rgb("#fef9c3") } else if (
        (col == 6 or col == 7) and row == 3
      ) { color-accent-soft } else { white }
    },
    [*Escala*], [*1*], [*2*], [*b3*], [*4*], [*5*], [*6*], [*7*], [*Notas (em Lá)*],
    [Menor Natural], [A], [B], [C], [D], [E], [F], [G], [A B C D E F G],
    [*Menor Harmônica*], [A], [B], [C], [D], [E], [F], [*G\#*], [A B C D E F G\#],
    [*Menor Melódica*], [A], [B], [C], [D], [E], [*F\#*], [*G\#*], [A B C D E F\# G\#],
  )
]

#v(0.5em)

#align(center)[
  #text(size: 8.5pt, fill: color-muted)[Células destacadas = notas alteradas em relação à escala menor natural]
]

#pagebreak()

= Escala Menor Harmônica

A *Menor Harmônica* eleva o *7º grau em ½ tom*, criando a *sensível* (nota que "puxa" para a tônica). O resultado é o acorde dominante *E7* no V grau de Am — a cadência V7 → Im tão poderosa quanto no tom maior.

== Por que "Harmônica"?

#v(0.8em)

#align(center)[
  #diagram(
    spacing: (15mm, 15mm),
    node((0, 0), [Menor Natural \ V = *Em*], stroke: 0.5pt, shape: fletcher.shapes.rect, fill: color-subtle-bg),
    node((1, 0), [Cadência fraca \ Em → Am], stroke: 0.5pt, shape: fletcher.shapes.rect, fill: rgb("#fef2f2")),
    node((0, 1), [Menor Harmônica \ V = *E7*], stroke: 0.5pt, shape: fletcher.shapes.rect, fill: color-accent-soft),
    node((1, 1), [Cadência forte \ E7 → Am ✓], stroke: 0.5pt, shape: fletcher.shapes.rect, fill: color-accent-soft),
    edge((0, 0), (1, 0), "->"),
    edge((0, 1), (1, 1), "->"),
    edge((0, 0), (0, 1), "->", label: "G → G#"),
  )
]

== O Campo Harmônico Menor Harmônico (em Am)

#v(0.8em)

#align(center)[
  #table(
    columns: (0.5fr, 0.8fr, 0.5fr, 0.5fr, 0.5fr, 0.5fr, 1.5fr, 1fr),
    align: center + horizon,
    stroke: 0.5pt + color-rule-dark,
    fill: (col, row) => {
      if row == 0 { color-subtle-bg } else if row == 5 { rgb("#ffe4e6") } // V grau destacado
      else if col == 0 { color-subtle-bg } else { white }
    },
    [*Grau*], [*Acorde*], [*T*], [*3ª*], [*5ª*], [*7ª*], [*Notas*], [*Tipo*],
    [I], [Am(maj7)], [lá], [dó], [mi], [sol\#], [lá · dó · mi · sol\#], [Menor Maj7],
    [II], [Bø], [si], [ré], [fá], [lá], [si · ré · fá · lá], [Meio-Dim.],
    [III], [C+7M], [dó], [mi], [sol\#], [si], [dó · mi · sol\# · si], [Aum. Maj7],
    [IV], [Dm7], [ré], [fá], [lá], [dó], [ré · fá · lá · dó], [Menor 7],
    [*V*], [*E7*], [mi], [sol\#], [si], [ré], [mi · sol\# · si · ré], [*Dominante!*],
    [VI], [F7M], [fá], [lá], [dó], [mi], [fá · lá · dó · mi], [Maior 7M],
    [VII], [G\#dim7], [sol\#], [si], [ré], [fá], [sol\# · si · ré · fá], [Dim. 7],
  )
]

#v(0.8em)

#align(center)[
  #block(
    fill: rgb("#ffe4e6"),
    stroke: 0.5pt + rgb("#fca5a5"),
    inset: 10pt,
    radius: 5pt,
    width: 85%,
    [
      O *V grau vira E7* — com o G\# (sensível) que resolve no Lá (tônica). Essa cadência *E7 → Am* é o coração da Menor Harmônica e é usada em toda música clássica, flamenco e metal.
    ],
  )
]

== Posição 1 da Menor Harmônica (em Am — tônica no 5º traste)

A mesma estrutura da pentatônica, agora com as 7 notas. O G\# (nota característica) fica *1 semitom acima* de onde estaria o G natural.

#v(0.8em)

#align(center)[
  #grid(
    columns: (auto, 1fr),
    gutter: 2em,
    align: horizon,
    neck(
      (
        ("R", " ", "N", " ", "N", "X"),
        ("N", " ", "R", " ", "N", " "),
        ("N", " ", "N", "X", " ", "R"),
        ("N", " ", "N", " ", "X", " "),
        ("N", " ", "R", " ", "N", " "),
        ("R", " ", "N", " ", "N", "X"),
      ),
      fs: 5,
    ),
    block(fill: rgb("#fef9c3"), stroke: 0.6pt + rgb("#eab308"), inset: 11pt, radius: 5pt, [
      #set text(size: 9pt)
      *●* azul = Tônica (A) \
      *●* cinza = notas da escala \
      *●* vermelho = G\# (nota característica)
      #v(0.5em)
      O G\# cria um intervalo de *2ª aumentada* entre o F e o G\# — o som "oriental" característico da escala.
    ]),
  )
]

#pagebreak()

= Escala Menor Melódica

A *Menor Melódica* resolve a "aspereza" do intervalo de 2ª aumentada da Menor Harmônica (F – G\#) elevando também o *6º grau*. O resultado é uma escala mais suave ao cantar ou tocar melodias lineares.

== Contexto Histórico

Na música clássica, a Menor Melódica sobe com F\# e G\# e *desce com os graus naturais* (volta para a Menor Natural). No jazz e na guitarra moderna, usamos a forma ascendente nos dois sentidos — chamada de *Menor Melódica do Jazz* ou *Escala de Lá Jazz*.

#v(0.8em)

#align(center)[
  #block(
    fill: color-subtle-bg,
    stroke: 0.5pt + color-rule-dark,
    inset: 11pt,
    radius: 5pt,
    width: 90%,
    [
      #grid(
        columns: (1fr, 1fr),
        gutter: 1.5em,
        block(fill: color-brand-soft, stroke: 0.5pt + color-brand-soft, inset: 10pt, radius: 4pt, [
          #align(center)[#text(weight: "bold")[Uso Clássico (bidirecional)]]
          #v(0.4em)
          #set text(size: 9pt)
          *Subida:* A B C D E *F\# G\#* A \
          *Descida:* A G F E D C B A \
          (= menor natural descendo)
        ]),
        block(fill: color-accent-soft, stroke: 0.5pt + rgb("#86efac"), inset: 10pt, radius: 4pt, [
          #align(center)[#text(weight: "bold")[Uso Moderno / Jazz (unidirecional)]]
          #v(0.4em)
          #set text(size: 9pt)
          *Sempre:* A B C D E *F\# G\#* A \
          Usada nos dois sentidos — é a mais comum na guitarra moderna.
        ]),
      )
    ],
  )
]

== O Campo Harmônico Menor Melódico (em Am)

A Menor Melódica gera acordes muito usados no jazz e na fusão. Veja os graus mais importantes:

#v(0.8em)

#align(center)[
  #table(
    columns: (0.5fr, 0.9fr, 1.6fr, 1fr, 1.8fr),
    align: center + horizon,
    stroke: 0.5pt + color-rule-dark,
    fill: (col, row) => if row == 0 { color-subtle-bg } else if row == 2 or row == 5 or row == 7 {
      color-brand-soft
    } else if col == 0 { color-subtle-bg } else { white },
    [*Grau*], [*Acorde*], [*Tipo*], [*Modo gerado*], [*Aplicação típica*],
    [I], [Am(maj7)], [Menor Maj7], [Menor Melódica], [Im em progressões modais],
    [II], [Bm7], [Menor 7], [Dórico b2], [IIm em cadências jazz],
    [III], [C+7M], [Aumentado Maj7], [Lídio Aumentado], [Som "Coltrane", jazz modal],
    [IV], [D7], [Dominante 7], [Lídio Dominante], [V7\#11 substituições],
    [V], [E7], [Dominante 7], [Mixolídio b6], [V7 em tom menor],
    [VI], [F\#ø], [Meio-Dim.], [Lócrio Natural 2], [IIø em II-V-I menor],
    [VII], [G\#7alt], [Dominante Alt.], [Alterada], [*Acorde Alterado* — jazz!],
  )
]

#v(0.8em)

#align(center)[
  #block(
    fill: color-brand-soft,
    stroke: 0.5pt + color-brand-soft,
    inset: 11pt,
    radius: 5pt,
    width: 85%,
    [
      #text(weight: "bold")[Destaque: O VII Grau — Escala Alterada]
      #v(0.4em)
      #set text(size: 9pt)
      O 7º grau da Menor Melódica gera a *Escala Alterada* (todos os intervalos alterados: b9, \#9, b5/\#11, b13). É o vocabulário do jazz moderno, tocado sobre acordes dominantes para criar máxima tensão antes de resolver.
    ],
  )
]

== Posição 1 da Menor Melódica (em Am)

#v(0.8em)

#align(center)[
  #grid(
    columns: (auto, 1fr),
    gutter: 2em,
    align: horizon,
    neck(
      (
        ("R", " ", "N", " ", "N", "N"),
        ("N", " ", "R", " ", "N", "N"),
        ("N", " ", "N", "N", " ", "R"),
        ("N", " ", "N", " ", "N", "N"),
        ("N", " ", "R", " ", "N", "N"),
        ("R", " ", "N", " ", "N", "N"),
      ),
      fs: 5,
    ),
    block(fill: color-subtle-bg, stroke: 0.5pt + color-rule-dark, inset: 11pt, radius: 5pt, [
      #set text(size: 9pt)
      Compare com a Menor Natural: a diferença está no *F\#* (6ª corda, posições específicas) e no *G\#*.
      #v(0.5em)
      A escala tem um fluxo ascendente muito suave — quase "maior" na parte de cima, com a terça menor no início.
    ]),
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
      width: 88%,
      [
        #set text(size: 9pt)
        #table(
          columns: (1fr, 1fr, 1fr),
          align: center + horizon,
          stroke: 0.4pt + color-rule-dark,
          fill: (col, row) => if row == 0 { luma(228) } else { white },
          [*Situação*], [*Escala recomendada*], [*Por quê*],
          [Cadência V → Im], [Menor Harmônica], [Cria o E7 com sensível],
          [Linha melódica suave], [Menor Melódica], [Evita o intervalo aumentado],
          [Improviso sobre Im7], [Menor Natural], [Som mais "aberto" e modal],
          [Sobre G\#7alt / V7alt], [Menor Melódica (7º grau)], [Gera todas as alterações],
        )
      ],
    )
  ],
  [
    *Como escolher?* Na prática, as três escalas se mesclam na mesma frase. Guitarristas experientes trocam entre elas nota a nota, guiados pelo ouvido. O estudo separado serve para *reconhecer as cores* de cada uma e poder escolhê-las intencionalmente.
  ],
)
