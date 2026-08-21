#import "../../../../templates/layout.typ": *
#import "@preview/conchord:0.4.0": new-chordgen

#show: aula.with(
  instrumento: "Violão",
  nivel: "Iniciante",
)

#let chord = new-chordgen(number-to-left: true, use-shadow-barre: false, colors: (hold: black, barre: black))

= Primeiros Acordes

Os acordes abertos são o ponto de partida do violão. Eles usam cordas soltas (abertas), o que facilita o som e reduz o esforço da mão esquerda. Dominar esses 7 acordes abre a porta para centenas de músicas.

#v(1em)

#caixa-destaque[
  *Dica:* pressione a corda *logo atrás do traste*, não em cima e não no meio. Use a *ponta dos dedos* e mantenha os outros dedos curvados para não abafar as cordas soltas.
]

#v(1em)

== Os 7 Acordes Essenciais

#v(1em)

#align(center)[
  #grid(
    columns: 4,
    gutter: 1.8em,
    align: center,
    block[
      #box(chord("x,0,2,2,1,0", name: "Am")) \
      #v(0.4em)
      #text(size: 10pt, weight: "bold")[Am — Lá Menor] \
      #text(size: 8.5pt, fill: color-muted)[2: 4ª corda / 3ª casa \
        3: 3ª corda / 2ª casa \
        1: 2ª corda / 1ª casa]
    ],
    block[
      #box(chord("0,2,2,0,0,0", name: "Em")) \
      #v(0.4em)
      #text(size: 10pt, weight: "bold")[Em — Mi Menor] \
      #text(size: 8.5pt, fill: color-muted)[2: 5ª corda / 2ª casa \
        3: 4ª corda / 2ª casa \
        O mais fácil para começar!]
    ],
    block[
      #box(chord("0,2,2,1,0,0", name: "E")) \
      #v(0.4em)
      #text(size: 10pt, weight: "bold")[E — Mi Maior] \
      #text(size: 8.5pt, fill: color-muted)[2: 5ª corda / 2ª casa \
        3: 4ª corda / 2ª casa \
        1: 3ª corda / 1ª casa]
    ],
    block[
      #box(chord("x,0,2,2,2,0", name: "A")) \
      #v(0.4em)
      #text(size: 10pt, weight: "bold")[A — Lá Maior] \
      #text(size: 8.5pt, fill: color-muted)[1: 4ª corda / 2ª casa \
        2: 3ª corda / 2ª casa \
        3: 2ª corda / 2ª casa]
    ],
  )
]

#v(2em)

#align(center)[
  #grid(
    columns: 3,
    gutter: 1.8em,
    align: center,
    block[
      #box(chord("x,x,0,2,3,2", name: "D")) \
      #v(0.4em)
      #text(size: 10pt, weight: "bold")[D — Ré Maior] \
      #text(size: 8.5pt, fill: color-muted)[1: 3ª corda / 2ª casa \
        2: 1ª corda / 2ª casa \
        3: 2ª corda / 3ª casa]
    ],
    block[
      #box(chord("3,2,0,0,0,3", name: "G")) \
      #v(0.4em)
      #text(size: 10pt, weight: "bold")[G — Sol Maior] \
      #text(size: 8.5pt, fill: color-muted)[2: 5ª corda / 2ª casa \
        3: 6ª corda / 3ª casa \
        4: 1ª corda / 3ª casa]
    ],
    block[
      #box(chord("x,3,2,0,1,0", name: "C")) \
      #v(0.4em)
      #text(size: 10pt, weight: "bold")[C — Dó Maior] \
      #text(size: 8.5pt, fill: color-muted)[1: 2ª corda / 1ª casa \
        2: 4ª corda / 2ª casa \
        3: 5ª corda / 3ª casa]
    ],
  )
]

#pagebreak()

== Erros Comuns e Como Corrigir

#v(0.8em)

#align(center)[
  #table(
    columns: (1.3fr, 1.3fr, 1.5fr),
    align: center + horizon,
    stroke: 0.5pt + color-rule-dark,
    fill: (col, row) => if row == 0 { color-subtle-bg } else if calc.odd(row) { white } else { color-subtle-bg },
    [*Problema*], [*Causa*], [*Solução*],
    [Nota abafada / com ruído], [Dedo longe do traste ou pressão insuficiente], [Mover dedo bem perto do traste],
    [Corda vizinha abafada], [Barriga do dedo tocando corda solta], [Curvar mais os dedos — use a ponta],
    [Dor excessiva na ponta dos dedos],
    [Normal nas primeiras semanas],
    [Praticar 15-20 min por dia, os calos virão naturalmente],

    [Acorde D com corda grave soando],
    [Polegar da mão esquerda subindo demais],
    [Manter o polegar na parte traseira do braço],

    [Troca de acordes lenta],
    [Tentando mover os dedos um por um],
    [Mover *todos os dedos juntos* visualizando o destino],
  )
]

#v(1em)

== Transições Essenciais

As trocas de acorde são o maior desafio no início. Treine as transições *abaixo em loop*, sem se preocupar com ritmo no início. Quando sair limpo, adicione o metrônomo em ♩ = 50 BPM.

#v(1em)

#explainer-component(
  align(center)[
    #grid(
      columns: 3,
      gutter: 1.5em,
      align: center,
      block[
        #box(chord("0,2,2,0,0,0", name: "Em"))
        #v(0.2em)
      ],
      block[
        #align(center + horizon)[
          #text(size: 20pt, fill: luma(150))[→]
        ]
      ],
      block[
        #box(chord("x,3,2,0,1,0", name: "C"))
      ],
    )
  ],
  [
    *Em → C*. Os dedos 2 e 3 permanecem praticamente no mesmo lugar; o dedo 1 sobe para a 2ª corda. #v(0.4em)
    *Técnica dos "dedos âncora"*: mantenha os dedos que não mudam de posição encostados nas cordas enquanto move os outros.
  ],
)

#v(1.5em)

#align(center)[
  #table(
    columns: (1.5fr, 2fr, 1.5fr),
    align: center + horizon,
    stroke: 0.5pt + color-rule-dark,
    fill: (col, row) => if row == 0 { color-subtle-bg } else { white },
    [*Transição*], [*Dica Prática*], [*Dificuldade*],
    [Em → Am], [Manter dedo 3 fixo na 4ª corda], [Fácil],
    [A → D], [Girar o pulso para alcançar D], [Média],
    [G → C], [Dedos 2 e 3 "giram" para a posição de C], [Média],
    [C → G], [Dedo 3 ancora na 5ª corda], [Média],
    [D → G], [Movimento completo, sem âncora], [Difícil],
    [F → C], [Pestana completa no 1º traste], [Mais difícil],
  )
]

#v(1.5em)

#caixa-destaque(width: 80%)[
  *Plano de estudo:* não tente aprender os 7 acordes de uma vez. Comece com *Em, Am e C* na primeira semana. Adicione *G e D* na segunda. Com esses 5, você já toca dezenas de músicas populares.
]
