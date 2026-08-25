#import "../../../../templates/layout.typ": *
#import "@preview/conchord:0.4.0": new-chordgen
#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node

#show: aula.with(
  instrumento: "Guitarra",
  nivel: "Iniciante",
)

#let chord = new-chordgen(number-to-left: true, use-shadow-barre: false, colors: (hold: black, barre: black))

#show <chord>: set text(fill: color-strong, weight: "bold")

= Funções Harmônicas e Cadências

No campo harmônico maior, cada acorde exerce uma *função*: um papel emocional e estrutural dentro do tom. Entender funções é o que permite criar progressões coerentes, identificar acordes em músicas de ouvido e improvisar com consciência.

== As 3 Funções Fundamentais

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 1em,
  block(
    width: 100%,
    fill: color-subtle-bg,
    stroke: 0.5pt + color-rule-dark,
    inset: 12pt,
    radius: 5pt,
    [
      #align(center)[#text(weight: "bold", size: 11pt)[TÔNICA (T)]]
      #v(0.5em)
      #set text(size: 9.5pt)
      Estabilidade e repouso. É o "lar" do tom. Progressões geralmente começam e terminam aqui.
      #v(0.5em)
      C7M (I), Em7 (III), Am7 (VI)
    ],
  ),
  block(
    width: 100%,
    fill: color-subtle-bg,
    stroke: 0.5pt + color-rule-dark,
    inset: 12pt,
    radius: 5pt,
    [
      #align(center)[#text(weight: "bold", size: 11pt)[SUBDOMINANTE (S)]]
      #v(0.5em)
      #set text(size: 9.5pt)
      Movimento e preparação. Cria uma sensação de partida, afastando-se da tônica.
      #v(0.5em)
      F7M (IV), Dm7 (II)
    ],
  ),
  block(
    width: 100%,
    fill: color-subtle-bg,
    stroke: 0.5pt + color-rule-dark,
    inset: 12pt,
    radius: 5pt,
    [
      #align(center)[#text(weight: "bold", size: 11pt)[DOMINANTE (D)]]
      #v(0.5em)
      #set text(size: 9.5pt)
      Tensão máxima. Contém o trítono, que exige resolução na tônica.
      #v(0.5em)
      G7 (V), Bø (VII)
    ],
  ),
)

== Mapa de Funções no Campo de C

#align(center)[
  #table(
    columns: (0.5fr, 0.8fr, 0.8fr, 0.8fr, 0.8fr, 0.8fr, 0.8fr, 0.8fr),
    align: center + horizon,
    stroke: 0.5pt + color-rule-dark,
    fill: (col, row) => {
      if row == 0 { luma(230) } else if row == 1 { white } else { color-subtle-bg }
    },
    [*Grau*], [I], [II], [III], [IV], [V], [VI], [VII],
    [*Acorde*], [C7M], [Dm7], [Em7], [F7M], [G7], [Am7], [Bø],
    [*Função*], [*T*], [S], [T#sub[R]], [*S*], [*D*], [T#sub[R]], [D#sub[R]],
  )
]

#align(center)[
  #text(size: 8.5pt, fill: color-secondary)[T = Tônica · S = Subdominante · D = Dominante · R = Relativo]
]

== Cadências

Uma *cadência* é um movimento de acordes que cria uma sensação de repouso ou movimento. As três cadências principais são:

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 1em,
  block(
    width: 100%,
    fill: color-subtle-bg,
    stroke: 0.5pt + color-rule-dark,
    inset: 12pt,
    radius: 5pt,
    [
      #text(weight: "bold")[Autêntica] #v(0.4em)
      #align(center)[
        #diagram(
          spacing: 16mm,
          node((0, 0), [V], stroke: 0.5pt, shape: fletcher.shapes.rect, fill: white),
          node((1, 0), [I], stroke: 0.5pt, shape: fletcher.shapes.rect, fill: white),
          edge((0, 0), (1, 0), "->"),
        )
        #v(0.3em)
        #text(size: 8.5pt)[G7 → C7M]
      ]
      #v(0.4em)
      #set text(size: 9pt)
      O movimento mais forte da harmonia tonal. A tensão do dominante resolve direto na tônica.
    ],
  ),
  block(
    width: 100%,
    fill: color-subtle-bg,
    stroke: 0.5pt + color-rule-dark,
    inset: 12pt,
    radius: 5pt,
    [
      #text(weight: "bold")[Plagal] #v(0.4em)
      #align(center)[
        #diagram(
          spacing: 16mm,
          node((0, 0), [IV], stroke: 0.5pt, shape: fletcher.shapes.rect, fill: white),
          node((1, 0), [I], stroke: 0.5pt, shape: fletcher.shapes.rect, fill: white),
          edge((0, 0), (1, 0), "->"),
        )
        #v(0.3em)
        #text(size: 8.5pt)[F7M → C7M]
      ]
      #v(0.4em)
      #set text(size: 9pt)
      Movimento suave, quase vocal. Chamada de "Amém" por ser usada em hinos religiosos.
    ],
  ),
  block(
    width: 100%,
    fill: color-subtle-bg,
    stroke: 0.5pt + color-rule-dark,
    inset: 12pt,
    radius: 5pt,
    [
      #text(weight: "bold")[Composta (II – V – I)] #v(0.4em)
      #align(center)[
        #diagram(
          spacing: 13mm,
          node((0, 0), [II], stroke: 0.5pt, shape: fletcher.shapes.rect, fill: white),
          node((1, 0), [V], stroke: 0.5pt, shape: fletcher.shapes.rect, fill: white),
          node((2, 0), [I], stroke: 0.5pt, shape: fletcher.shapes.rect, fill: white),
          edge((0, 0), (1, 0), "->"),
          edge((1, 0), (2, 0), "->"),
        )
        #v(0.3em)
        #text(size: 8.5pt)[Dm7 → G7 → C7M]
      ]
      #v(0.4em)
      #set text(size: 9pt)
      A progressão mais importante do jazz e da bossa nova. Subdominante → Dominante → Tônica.
    ],
  ),
)

== Progressão II–V–I

O *II-V-I* é onipresente na música ocidental. Ele combina as três funções em sequência: *Subdominante → Dominante → Tônica*, criando uma narrativa harmônica completa de tensão e repouso.

#v(0.8em)

#explainer-component(
  align(center)[
    #grid(
      columns: 3,
      gutter: 1.5em,
      align: center,
      block[
        #box(chord("x,x,0,2,1,1", name: "Dm7"))
        #v(0.2em)
        #text(size: 8.5pt, weight: "bold")[Dm7 (II)]\
        #text(size: 8pt, fill: color-secondary)[Subdominante]
      ],
      block[
        #box(chord("3,2,0,0,0,1", name: "G7"))
        #v(0.2em)
        #text(size: 8.5pt, weight: "bold")[G7 (V)]\
        #text(size: 8pt, fill: color-secondary)[Dominante]
      ],
      block[
        #box(chord("x,3,2,0,0,0", name: "C7M"))
        #v(0.2em)
        #text(size: 8.5pt, weight: "bold")[C7M (I)]\
        #text(size: 8pt, fill: color-secondary)[Tônica]
      ],
    )
  ],
  [
    O II-V-I funciona em *qualquer tonalidade*. Em Sol Maior, por exemplo: *Am7 → D7 → G7M*. Em Fá Maior: *Gm7 → C7 → F7M*.

    Aprenda a identificar e tocar esse padrão em todas as tonalidades, ele aparece em praticamente toda música popular e jazz.
  ],
  inverted: true,
)

#v(2em)

== Relativos

Todo tom maior possui um *relativo menor* (um tom menor que compartilha exatamente as mesmas notas). Para encontrá-lo, desça uma terça menor (1,5 tom) da tônica:

#align(center)[
  #table(
    columns: (1fr, 1fr, 1fr),
    align: center + horizon,
    stroke: 0.5pt + color-rule-dark,
    fill: (col, row) => if row == 0 { color-subtle-bg } else { white },
    [*Tom Maior*], [*Relativo Menor*], [*Acorde Relativo*],
    [C (I)], [A (VI)], [Am7],
    [F (IV)], [D (II)], [Dm7],
    [G (V)], [E (III)], [Em7],
  )
]

#v(1em)

#align(center)[
  #text(size: 9pt, fill: color-secondary)[
    *Nota:* C7M e Am7 são *relativos*: compartilham as mesmas notas (dó, ré, mi, fá, sol, lá, si). Por isso soam "parecidos" e podem se substituir em muitos contextos.
  ]
]
