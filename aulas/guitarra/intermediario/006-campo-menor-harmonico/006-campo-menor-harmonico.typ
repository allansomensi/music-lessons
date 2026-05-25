#import "../../../../templates/layout.typ": *
#import "@preview/conchord:0.4.0": new-chordgen
#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node

#show: aula.with(
  instrumento: "Guitarra",
  nivel: "Intermediário",
)

#let chord = new-chordgen(number-to-left: true, use-shadow-barre: false, colors: (hold: black, barre: black))

= Campo Harmônico Menor Harmônico — Aplicações

Você já viu a construção da Menor Harmônica. Nesta aula vamos explorar *como usar o campo* na prática: os acordes mais importantes, as progressões características e os modos gerados pela escala.

== Revisão: O Campo em Am Harmônico

#v(0.8em)

#align(center)[
  #table(
    columns: (0.5fr, 0.9fr, 1fr, 0.8fr, 1.8fr),
    align: center + horizon,
    stroke: 0.5pt + color-rule-dark,
    fill: (col, row) => {
      if row == 0 { color-subtle-bg } else if row == 5 { rgb("#ffe4e6") } else if row == 1 or row == 7 {
        color-brand-soft
      } else if col == 0 { color-subtle-bg } else { white }
    },
    [*Grau*], [*Acorde*], [*Notas*], [*Tipo*], [*Modo gerado*],
    [I], [Am(maj7)], [A C E G\#], [Menor Maj7], [*Menor Harmônica*],
    [II], [Bø], [B D F A], [Meio-Dim.], [Lócrio \#6],
    [III], [Cmaj7\#5], [C E G\# B], [Aum. Maj7], [Jônico \#5],
    [IV], [Dm7], [D F A C], [Menor 7], [Dórico \#4],
    [*V*], [*E7*], [E G\# B D], [*Dominante 7*], [*Mixolídio b9 b13*],
    [VI], [Fmaj7], [F A C E], [Maior 7M], [Lídio \#2],
    [VII], [G\#dim7], [G\# B D F], [Dim. 7], [*Alterada dim. (Locrian bb7)*],
  )
]

#pagebreak()

= Os 3 Acordes Mais Usados do Campo Menor Harmônico

== 1. Im(maj7) — O Tônico Menor com Sétima Maior

O acorde mais característico do tom menor harmônico. Esse acorde existe porque G\# (a sensível) é a sétima maior de Am.

#v(0.8em)

#align(center)[
  #grid(
    columns: 3,
    gutter: 2em,
    align: center,
    block[
      #box(chord("x,0,2,1,1,0", name: "Am(maj7)")) \
      #v(0.3em)
      #text(size: 9pt, weight: "bold")[Am(maj7)] \
      #text(size: 8pt, fill: color-muted)[lá · dó · mi · sol\#]
    ],
    block[
      #box(chord("x,0,2,2,1,0", name: "Am")) \
      #v(0.3em)
      #text(size: 9pt)[Am (para comparar)] \
      #text(size: 8pt, fill: color-muted)[lá · dó · mi · sol]
    ],
    block[
      #box(chord("0,2,0,1,0,0", name: "E7")) \
      #v(0.3em)
      #text(size: 9pt, weight: "bold")[E7 (V7)] \
      #text(size: 8pt, fill: color-muted)[mi · sol\# · si · ré]
    ],
  )
]

#v(0.8em)

#align(center)[
  #block(
    fill: color-subtle-bg,
    stroke: 0.5pt + color-rule-dark,
    inset: 10pt,
    radius: 5pt,
    width: 80%,
    [
      *Progressão clássica:* Am(maj7) → Am7 → Am6 → E7 → Am \
      #text(
        size: 8.5pt,
        fill: color-muted,
      )[A descida cromática no baixo (G\# → G → F\#) cria uma das progressões mais emocionantes da música ocidental. Usada em "Misty", tangos, e inúmeras músicas de cinema.]
    ],
  )
]

== 2. E7 — O Dominante com Sensível

Já explorado — é a razão de existir da Menor Harmônica. O G\# (sensível) cria a tensão máxima que resolve no A.

== 3. G\#dim7 — O Diminuto com 7ª Completa

O VII grau gera um *acorde diminuto com quatro notas*, completamente simétrico (formado por terças menores empilhadas). Ele funciona como um *E7(b9) sem fundamental* — um dominante disfarçado.

#v(0.8em)

#align(center)[
  #grid(
    columns: (1fr, 1fr),
    gutter: 2em,
    block(
      fill: color-subtle-bg,
      stroke: 0.5pt + color-rule-dark,
      inset: 11pt,
      radius: 5pt,
      [
        #align(center)[#box(chord("x,x,1,2,1,2", name: "G#dim7"))]
        #v(0.3em)
        #align(center)[
          #text(size: 9pt, weight: "bold")[G\#dim7] \
          #text(size: 8pt, fill: color-muted)[sol\# · si · ré · fá]
        ]
      ],
    ),
    block(
      fill: rgb("#fef9c3"),
      stroke: 0.6pt + rgb("#eab308"),
      inset: 11pt,
      radius: 5pt,
      [
        #set text(size: 9pt)
        *Por que o dim7 = V7(b9) sem fundamental?*
        #v(0.4em)
        G\#dim7 = G\# B D F \
        E7(b9) = E G\# B D F \
        #v(0.4em)
        Remova o E — sobra o G\#dim7. Eles *resolvem da mesma forma* no Am!
      ],
    ),
  )
]

#pagebreak()

= Os 7 Modos da Menor Harmônica

Cada grau da escala gera um modo com caráter único. Os mais usados na guitarra:

#v(0.8em)

#align(center)[
  #table(
    columns: (0.5fr, 1.2fr, 1.5fr, 1fr, 1.8fr),
    align: center + horizon,
    stroke: 0.5pt + color-rule-dark,
    fill: (col, row) => {
      if row == 0 { color-subtle-bg } else if row == 1 { color-brand-soft } else if row == 5 {
        rgb("#ffe4e6")
      } else if (
        row == 7
      ) { rgb("#fef9c3") } else if col == 0 { color-subtle-bg } else { white }
    },
    [*Grau*], [*Nome do Modo*], [*Fórmula*], [*Acorde base*], [*Caráter*],
    [I], [Menor Harmônica], [1 2 b3 4 5 b6 7M], [Im(maj7)], [Dramático, profundo],
    [II], [Lócrio \#6], [1 b2 b3 4 b5 6 b7], [IIø], [Instável com brilho],
    [III], [Jônico \#5], [1 2 3 4 \#5 6 7M], [IIImaj7\#5], [Aumentado, flutuante],
    [IV], [Dórico \#4], [1 2 b3 \#4 5 6 b7], [IVm7], [Exótico, modal],
    [*V*], [*Mixolídio b9 b13*], [1 b2 3 4 5 b6 b7], [*V7*], [*Tensão máxima — Flamenco!*],
    [VI], [Lídio \#2], [1 \#2 3 \#4 5 6 7M], [VImaj7], [Oriental, místico],
    [VII], [Alterada Dim. (Locrian bb7)], [1 b2 b3 4 b5 b6 bb7], [VIIdim7], [Extremamente tenso],
  )
]

#v(1.5em)

== Destaque: Modo V — Mixolídio b9 b13 (Frígio Dominante)

Este modo é o *coração do flamenco e do metal neoclássico*. Ele soa sobre o E7 do campo de Am e tem aquele caráter espanhol inconfundível.

#v(0.8em)

#align(center)[
  #grid(
    columns: (1fr, 1fr),
    gutter: 1.5em,
    block(
      fill: rgb("#ffe4e6"),
      stroke: 0.6pt + rgb("#f43f5e"),
      inset: 11pt,
      radius: 5pt,
      [
        #align(center)[#text(weight: "bold")[Frígio Dominante em E]]
        #v(0.5em)
        #set text(size: 9pt)
        *Notas:* E F G\# A B C D \
        *Fórmula:* 1 b2 3 4 5 b6 b7 \
        #v(0.4em)
        É o V grau da Menor Harmônica de Am. A grande terceira (G\#) com a segunda menor (F) cria o som "espanhol".
      ],
    ),
    block(
      fill: rgb("#ffe4e6"),
      stroke: 0.6pt + rgb("#f43f5e"),
      inset: 11pt,
      radius: 5pt,
      [
        #align(center)[#text(weight: "bold")[Aplicação]]
        #v(0.5em)
        #set text(size: 9pt)
        Usar sobre: *E7, E7(b9)*, qualquer dominante antes de Am.
        #v(0.4em)
        Referências: Paco de Lucía, Yngwie Malmsteen, Ritchie Blackmore, "Eruption" (Van Halen), música árabe e turca.
        #v(0.4em)
        *Movimento característico:* F → E (b2 → 1) cria a tensão de semitom do flamenco.
      ],
    ),
  )
]

#pagebreak()

= Progressões Características

== Progressão 1: Im(maj7) descendo

#align(center)[
  #grid(
    columns: 4,
    gutter: 1.5em,
    align: center,
    block[
      #box(chord("x,0,2,1,1,0", name: "Am(maj7)")) \
      #text(size: 8pt)[Im(maj7)]
    ],
    block[
      #box(chord("x,0,2,2,1,0", name: "Am7")) \
      #text(size: 8pt)[Im7]
    ],
    block[
      #box(chord("x,0,2,2,2,0", name: "Am6")) \
      #text(size: 8pt)[Im6]
    ],
    block[
      #box(chord("0,2,0,1,0,0", name: "E7")) \
      #text(size: 8pt)[V7]
    ],
  )
]

#v(0.5em)

#align(center)[
  #text(
    size: 8.5pt,
    fill: color-muted,
  )[A linha cromática no baixo: Sol\# → Sol → Fá\# → Mi. Progressão usada em "Stairway to Heaven" (intro) e inúmeros tangos.]
]

#v(1.2em)

== Progressão 2: IIø – V7 – Im (Cadência Menor Clássica)

#align(center)[
  #grid(
    columns: 3,
    gutter: 2em,
    align: center,
    block[
      #box(chord("x,2,3,2,3,x", name: "Bø")) \
      #v(0.3em)
      #text(size: 9pt, weight: "bold")[Bø (IIø)] \
      #text(size: 8pt, fill: color-muted)[Subdominante]
    ],
    block[
      #box(chord("0,2,0,1,0,0", name: "E7")) \
      #v(0.3em)
      #text(size: 9pt, weight: "bold")[E7 (V7)] \
      #text(size: 8pt, fill: color-muted)[Dominante]
    ],
    block[
      #box(chord("x,0,2,2,1,0", name: "Am")) \
      #v(0.3em)
      #text(size: 9pt, weight: "bold")[Am (Im)] \
      #text(size: 8pt, fill: color-muted)[Tônica]
    ],
  )
]

#v(1.2em)

== Progressão 3: Lídio \#2 (VI grau) → V7 → Im

Uma das progressões mais exóticas e cinematográficas:

#align(center)[
  #grid(
    columns: 3,
    gutter: 2em,
    align: center,
    block[
      #box(chord("1,3,3,2,1,1", name: "Fmaj7")) \
      #v(0.3em)
      #text(size: 9pt, weight: "bold")[Fmaj7 (VI)] \
      #text(size: 8pt, fill: color-muted)[Lídio \#2 em F]
    ],
    block[
      #box(chord("0,2,0,1,0,0", name: "E7")) \
      #v(0.3em)
      #text(size: 9pt, weight: "bold")[E7 (V7)]
    ],
    block[
      #box(chord("x,0,2,2,1,0", name: "Am")) \
      #v(0.3em)
      #text(size: 9pt, weight: "bold")[Am (Im)]
    ],
  )
]

#v(1.5em)

#explainer-component(
  align(center)[
    #block(fill: luma(245), stroke: 0.5pt + color-rule-dark, inset: 11pt, radius: 5pt, width: 90%, [
      #set text(size: 9pt)
      #table(
        columns: (1fr, 1.5fr, 1.5fr),
        align: center + horizon,
        stroke: 0.4pt + color-rule-dark,
        fill: (col, row) => if row == 0 { luma(228) } else { white },
        [*Estilo*], [*Progressão típica*], [*Acorde característico*],
        [Flamenco], [Im – VII – VI – V7], [E7 com Frígio Dom.],
        [Jazz menor], [IIø – V7 – Im(maj7)], [Bø – E7 – Am(maj7)],
        [Clássico/Romântico], [Im(maj7) – Im7 – Im6 – V7], [Descida cromática],
        [Metal Neoclássico], [Im – VII dim7 – V7 – Im], [G\#dim7 como substituto],
      )
    ])
  ],
  [
    O *Campo Menor Harmônico* é mais rico e dramaticamente mais tenso do que o campo maior. A chave para usá-lo bem é entender que o G\# (sensível) não está sempre presente — você *escolhe* quando ativá-lo, alternando com a Menor Natural conforme a expressão desejada.
  ],
)
