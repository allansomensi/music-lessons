#import "../../../../templates/layout.typ": aula, explainer-component
#import "@preview/conchord:0.4.0": new-chordgen

#show: aula.with(
  instrumento: "Guitarra",
  nivel: "Iniciante",
)

#let chord = new-chordgen(number-to-left: true, use-shadow-barre: false, colors: (hold: black, barre: black))

= Primeiros Acordes

Um acorde é a combinação de três ou mais notas tocadas ao mesmo tempo. Eles formam a base harmônica da música, fornecendo o contexto necessário para a melodia.

Dominar as formas básicas no braço da guitarra é o passo essencial para começar a tocar suas primeiras músicas. Além de repertório, essa prática desenvolve a coordenação e a força necessárias para evoluir para estruturas mais complexas no futuro.

#v(1.5em)

#align(center)[
  #block(
    fill: luma(248),
    stroke: 0.5pt + luma(210),
    inset: 10pt,
    radius: 5pt,
    width: 82%,
    [
      *Dica:* Na guitarra, a tensão das cordas é menor que no violão. Cuidado para não apertar com força excessiva, pois isso pode dobrar levemente a corda (micro-bend) e desafinar o acorde. Pressione logo atrás do traste com a *ponta dos dedos*.
    ],
  )
]

#v(1.5em)

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
      #text(size: 8.5pt, fill: luma(110))[2: 4ª corda / 2ª casa \
        3: 3ª corda / 2ª casa \
        1: 2ª corda / 1ª casa]
    ],
    block[
      #box(chord("0,2,2,0,0,0", name: "Em")) \
      #v(0.4em)
      #text(size: 10pt, weight: "bold")[Em — Mi Menor] \
      #text(size: 8.5pt, fill: luma(110))[2: 5ª corda / 2ª casa \
        3: 4ª corda / 2ª casa]
    ],
    block[
      #box(chord("0,2,2,1,0,0", name: "E")) \
      #v(0.4em)
      #text(size: 10pt, weight: "bold")[E — Mi Maior] \
      #text(size: 8.5pt, fill: luma(110))[2: 5ª corda / 2ª casa \
        3: 4ª corda / 2ª casa \
        1: 3ª corda / 1ª casa]
    ],
    block[
      #box(chord("x,0,2,2,2,0", name: "A")) \
      #v(0.4em)
      #text(size: 10pt, weight: "bold")[A — Lá Maior] \
      #text(size: 8.5pt, fill: luma(110))[1: 4ª corda / 2ª casa \
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
      #text(size: 8.5pt, fill: luma(110))[1: 3ª corda / 2ª casa \
        2: 1ª corda / 2ª casa \
        3: 2ª corda / 3ª casa]
    ],
    block[
      #box(chord("3,2,0,0,0,3", name: "G")) \
      #v(0.4em)
      #text(size: 10pt, weight: "bold")[G — Sol Maior] \
      #text(size: 8.5pt, fill: luma(110))[2: 5ª corda / 2ª casa \
        3: 6ª corda / 3ª casa \
        4: 1ª corda / 3ª casa]
    ],
    block[
      #box(chord("x,3,2,0,1,0", name: "C")) \
      #v(0.4em)
      #text(size: 10pt, weight: "bold")[C — Dó Maior] \
      #text(size: 8.5pt, fill: luma(110))[1: 2ª corda / 1ª casa \
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
    stroke: 0.5pt + luma(190),
    fill: (col, row) => if row == 0 { luma(232) } else if calc.odd(row) { white } else { luma(248) },
    [*Problema*], [*Causa*], [*Solução*],
    [Nota abafada / sem som], [Dedo longe do traste ou pressão insuficiente], [Mover dedo bem perto do traste],
    [Ruído indesejado nas cordas soltas],
    [Falta de muting, muito comum na guitarra],
    [Encoste levemente a lateral dos dedos da mão esquerda ou a mão direita nas cordas que não devem soar],

    [Acorde D soando grave/sujo],
    [Corda Mizão soando livremente],
    [Use o polegar da mão esquerda para encostar de leve na 6ª corda e silenciá-la],

    [Desafinação ao tocar],
    [Apertando a corda com muita força contra a escala],
    [Relaxe a mão esquerda. Use apenas a força necessária para a nota soar limpa],

    [Troca de acordes lenta],
    [Tentando mover os dedos um por um],
    [Mover *todos os dedos juntos* visualizando o acorde destino],
  )
]

#v(1em)

== Transições

As trocas de acorde são o maior desafio no início. Treine as transições abaixo *em loop*, usando a palheta com ataques consistentes.

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
    *Técnica dos dedos âncora*: mantenha os dedos que não mudam de posição encostados nas cordas enquanto move os outros. Isso ajuda muito na fluidez.
  ],
)

#v(1.5em)

#align(center)[
  #table(
    columns: (1.5fr, 2fr, 1.5fr),
    align: center + horizon,
    stroke: 0.5pt + luma(190),
    fill: (col, row) => if row == 0 { luma(232) } else { white },
    [*Transição*], [*Dica Prática*], [*Dificuldade*],
    [Em → Am], [Manter a mão na mesma posição], [Fácil],
    [A → D], [Girar o pulso para alcançar o D], [Média],
    [G → C], [Dedos 2 e 3 giram como um bloco para a posição de C], [Média],
    [C → G], [Dedo 2 ancora na 5ª corda], [Média],
    [D → G], [Foque no dedo 2 indo para a 6ª corda], [Difícil],
  )
]

#v(1.5em)

#pagebreak()

== Exercício de Casa: A Progressão Pop Rock

Para colocar o que aprendemos em prática, treine esta que é uma das progressões mais famosas. Ela aparece em diversas músicas de Pop e Rock. Por exemplo, ela é a progressão usada no refrão da música It's My Life, do Bon Jovi.

#v(2em)

#align(center)[
  #grid(
    columns: 4,
    gutter: 2.5em,
    align: center,
    block[
      #box(chord("0,2,2,0,0,0", name: "Em")) \
      #v(0.5em)
    ],
    block[
      #box(chord("x,3,2,0,1,0", name: "C")) \
      #v(0.5em)
    ],
    block[
      #box(chord("3,2,0,0,0,3", name: "G")) \
      #v(0.5em)
    ],
    block[
      #box(chord("x,x,0,2,3,2", name: "D")) \
      #v(0.5em)
    ],
  )
]

#v(2.5em)

#align(center)[
  #block(
    fill: rgb("#fef3c7"),
    stroke: 0.5pt + rgb("#fde68a"),
    inset: 12pt,
    radius: 5pt,
    width: 85%,
    [
      *Como praticar:* \ Toque cada acorde 4 vezes para baixo usando a palheta, focando na precisão. O desafio aqui é a transição do *G para o D*. Comece devagar, mas tente não parar a batida da mão direita durante as trocas de acorde.
    ],
  )
]

#v(1.5em)

#align(center)[
  #block(
    fill: rgb("#f0fdf4"),
    stroke: 0.5pt + rgb("#bbf7d0"),
    inset: 12pt,
    radius: 5pt,
    width: 85%,
    [
      *Técnica de Memorização:* \ Para acelerar a memória muscular, monte um acorde corretamente. Em seguida, tire a mão esquerda do braço da guitarra, abra e feche a mão esquerda algumas vezes e desvie o olhar do braço. Volte e tente montar o acorde novamente. Esse processo "reseta" a posição da sua mão e força o cérebro a recriar o formato do zero, fortalecendo a conexão motora e fazendo com que você arme o acorde muito mais rápido.

      #image("attachments/tecnica-memorizacao.svg", width: 90%)
    ],
  )
]
