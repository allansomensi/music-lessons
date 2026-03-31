#import "../../../../templates/layout.typ": aula, explainer-component
#import "@preview/conchord:0.4.0": new-chordgen

#show: aula.with(
  module: "Guitarra",
  level: "Iniciante",
)

#let chord = new-chordgen(number-to-left: true, use-shadow-barre: false, colors: (hold: black, barre: black))

= Tétrades

A *tétrade* é uma tríade com mais uma nota empilhada em terça acima da quinta: a *Sétima*. Enquanto as tríades definem o caráter básico do acorde (maior ou menor), as tétrades adicionam cor, tensão e profundidade harmônica. São a base da harmonia do Jazz, Blues, Bossa Nova e de boa parte da música popular.

#v(1em)

== As 4 Principais Tétrades

#align(center)[
  #table(
    columns: (1.6fr, 0.9fr, 0.5fr, 0.5fr, 0.5fr, 0.5fr, 1.8fr),
    align: center + horizon,
    stroke: 0.5pt + luma(190),
    fill: (col, row) => if row == 0 { luma(232) } else if calc.odd(row) { white } else { luma(248) },
    [*Tipo*], [*Símbolo*], [*T*], [*3ª*], [*5ª*], [*7ª*], [*Sonoridade*],
    [Maior com 7ª Maior], [C7M / Cmaj7], [T], [3], [5], [7M], [Suave, etéreo],
    [Dominante (7ª menor)], [C7], [T], [3], [5], [7], [Tenso, quer resolver],
    [Menor com 7ª menor], [Cm7], [T], [b3], [5], [7], [Sombrio, fluido],
    [Meio-Diminuto], [Cm7#super[b5] / C#sym.circle.small], [T], [b3], [b5], [7], [Muito tenso, instável],
  )
]

#v(1em)

== Construção: Empilhando Terças

#align(center)[
  #grid(
    columns: (1fr, 1fr, 1fr, 1fr),
    gutter: 0.8em,
    block(
      width: 100%,
      fill: luma(232),
      stroke: 0.6pt,
      inset: 11pt,
      radius: 5pt,
      [
        #align(center)[#text(weight: "bold", size: 10.5pt)[C7M (Cmaj7)]]
        #v(0.5em)
        #set text(size: 9pt)
        #grid(
          columns: (0.6fr, 1fr),
          gutter: 4pt,
          [*T*], [do],
          [*3*], [mi],
          [*5*], [sol],
          [*7M*], [si],
        )
      ],
    ),
    block(
      width: 100%,
      fill: luma(232),
      stroke: 0.6pt,
      inset: 11pt,
      radius: 5pt,
      [
        #align(center)[#text(weight: "bold", size: 10.5pt)[C7 (Dominante)]]
        #v(0.5em)
        #set text(size: 9pt)
        #grid(
          columns: (0.6fr, 1fr),
          gutter: 4pt,
          [*T*], [do],
          [*3*], [mi],
          [*5*], [sol],
          [*7*], [sib],
        )
      ],
    ),
    block(
      width: 100%,
      fill: luma(232),
      stroke: 0.6pt,
      inset: 11pt,
      radius: 5pt,
      [
        #align(center)[#text(weight: "bold", size: 10.5pt)[Cm7]]
        #v(0.5em)
        #set text(size: 9pt)
        #grid(
          columns: (0.6fr, 1fr),
          gutter: 4pt,
          [*T*], [do],
          [*b3*], [mib],
          [*5*], [sol],
          [*7*], [sib],
        )
      ],
    ),
    block(
      width: 100%,
      fill: luma(232),
      stroke: 0.6pt,
      inset: 11pt,
      radius: 5pt,
      [
        #align(center)[#text(weight: "bold", size: 10.5pt)[Cm7#super[b5] (Ø)]]
        #v(0.5em)
        #set text(size: 9pt)
        #grid(
          columns: (0.6fr, 1fr),
          gutter: 4pt,
          [*T*], [do],
          [*b3*], [mib],
          [*b5*], [solb],
          [*7*], [sib],
        )
      ],
    ),
  )
]

#v(1em)

== Exemplos com Tônica em Dó (C)

#v(1em)

#align(center)[
  #grid(
    columns: 4,
    gutter: 2em,
    align: center,
    block[
      #box(chord("x,3,2,0,0,0", name: "Cmaj7"))
      #v(0.4em)
      #text(size: 9.5pt, weight: "bold")[C7M] \
      #text(size: 8.5pt, fill: luma(110))[do · mi · sol · si]
    ],
    block[
      #box(chord("x,3,2,3,1,0", name: "C7"))
      #v(0.4em)
      #text(size: 9.5pt, weight: "bold")[C7] \
      #text(size: 8.5pt, fill: luma(110))[do · mi · sib · do]
    ],
    block[
      #box(chord("x,3,5,3,4,3", name: "Cm7"))
      #v(0.4em)
      #text(size: 9.5pt, weight: "bold")[Cm7] \
      #text(size: 8.5pt, fill: luma(110))[do · sol · sib · mib]
    ],
    block[
      #box(chord("x,3,4,3,4,x", name: "CØ"))
      #v(0.4em)
      #text(size: 9.5pt, weight: "bold")[CØ (Cm7#super[b5])] \
      #text(size: 8.5pt, fill: luma(110))[do · solb · sib · mib]
    ],
  )
]

#v(1em)

#align(center)[
  #block(
    fill: luma(248),
    stroke: 0.5pt + luma(210),
    inset: 12pt,
    radius: 5pt,
    width: 80%,
    [
      #text(weight: "bold")[Resumo Rápido:] Uma *tétrade* é uma tríade com a adição da *Sétima*. Adicionar uma Sétima Maior (7M) traz um som sofisticado, enquanto a Sétima menor (7) cria a tensão característica do acorde Dominante.
    ],
  )
]

#pagebreak()

== O Acorde Dominante

O acorde de *7ª dominante* (ex: G7, C7, A7) é o acorde de maior tensão harmônica. Ele contém um *trítono* (a distância mais dissonante da música) entre a 3 e a 7, e essa tensão naturalmente busca se resolver na tônica.

#v(0.8em)

#explainer-component(
  align(center)[
    #grid(
      columns: 2,
      gutter: 2em,
      block[
        #box(chord("3,2,0,0,0,1", name: "G7"))
        #v(0.2em)
        #text(size: 8.5pt, fill: luma(110))[sol · si · ré · fá]
      ],
      block[
        #box(chord("x,3,2,0,1,0", name: "C"))
        #v(0.2em)
        #text(size: 8.5pt, fill: luma(110))[do · mi · sol]
      ],
    )
  ],
  [
    O *G7* contém um trítono entre Si (3ª) e Fá (7ª). Essa dissonância "puxa" o acorde em direção ao *C*, onde as notas Si e Fá resolvem em Dó e Mi. #v(0.5em)
    Esse movimento *V7 → I* é a cadência mais fundamental da harmonia tonal ocidental.
  ],
  inverted: true,
)

#v(1em)

= Inversões de Tétrades

Como as tétrades são compostas por quatro notas, possuem quatro posições estruturais. Alterar a nota mais grave (o baixo) transforma a textura do acorde, oferecendo novas possibilidades de condução de vozes.

Abaixo estão mapeadas as inversões dos quatro tipos fundamentais, todas construídas a partir da tónica Dó (C).

== Maior com 7ª Maior (C7M)

#v(0.8em)

#align(center)[
  #grid(
    columns: 4,
    gutter: 2.5em,
    align: center,
    block[
      #box(chord("8,x,9,9,8,x", name: "C7M")) \
      #v(0.4em)
      #text(size: 9.5pt, weight: "bold")[Estado Fundamental] \
      #text(size: 8.5pt, fill: luma(110))[Tónica no baixo (C)]
    ],
    block[
      #box(chord("12,x,10,12,12,x", name: "C7M/E")) \
      #v(0.4em)
      #text(size: 9.5pt, weight: "bold")[1ª Inversão] \
      #text(size: 8.5pt, fill: luma(110))[Terça no baixo (E)]
    ],
    block[
      #box(chord("3,x,2,4,1,x", name: "C7M/G")) \
      #v(0.4em)
      #text(size: 9.5pt, weight: "bold")[2ª Inversão] \
      #text(size: 8.5pt, fill: luma(110))[Quinta no baixo (G)]
    ],
    block[
      #box(chord("7,x,5,5,5,x", name: "C7M/B")) \
      #v(0.4em)
      #text(size: 9.5pt, weight: "bold")[3ª Inversão] \
      #text(size: 8.5pt, fill: luma(110))[Sétima no baixo (B)]
    ],
  )
]

== Dominante (C7)

#v(0.8em)

#align(center)[
  #grid(
    columns: 4,
    gutter: 2.5em,
    align: center,
    block[
      #box(chord("8,x,8,9,8,x", name: "C7")) \
      #v(0.4em)
      #text(size: 9.5pt, weight: "bold")[Estado Fundamental] \
      #text(size: 8.5pt, fill: luma(110))[Tónica no baixo (C)]
    ],
    block[
      #box(chord("12,x,10,12,11,x", name: "C7/E")) \
      #v(0.4em)
      #text(size: 9.5pt, weight: "bold")[1ª Inversão] \
      #text(size: 8.5pt, fill: luma(110))[Terça no baixo (E)]
    ],
    block[
      #box(chord("3,x,2,3,1,x", name: "C7/G")) \
      #v(0.4em)
      #text(size: 9.5pt, weight: "bold")[2ª Inversão] \
      #text(size: 8.5pt, fill: luma(110))[Quinta no baixo (G)]
    ],
    block[
      #box(chord("6,x,5,5,5,x", name: "C7/Bb")) \
      #v(0.4em)
      #text(size: 9.5pt, weight: "bold")[3ª Inversão] \
      #text(size: 8.5pt, fill: luma(110))[Sétima no baixo (Bb)]
    ],
  )
]

== Menor com 7ª Menor (Cm7)

#v(0.8em)

#align(center)[
  #grid(
    columns: 4,
    gutter: 2.5em,
    align: center,
    block[
      #box(chord("8,x,8,8,8,x", name: "Cm7")) \
      #v(0.4em)
      #text(size: 9.5pt, weight: "bold")[Estado Fundamental] \
      #text(size: 8.5pt, fill: luma(110))[Tónica no baixo (C)]
    ],
    block[
      #box(chord("11,x,10,12,11,x", name: "Cm7/Eb")) \
      #v(0.4em)
      #text(size: 9.5pt, weight: "bold")[1ª Inversão] \
      #text(size: 8.5pt, fill: luma(110))[Terça no baixo (Eb)]
    ],
    block[
      #box(chord("3,x,1,3,1,x", name: "Cm7/G")) \
      #v(0.4em)
      #text(size: 9.5pt, weight: "bold")[2ª Inversão] \
      #text(size: 8.5pt, fill: luma(110))[Quinta no baixo (G)]
    ],
    block[
      #box(chord("6,x,5,5,4,x", name: "Cm7/Bb")) \
      #v(0.4em)
      #text(size: 9.5pt, weight: "bold")[3ª Inversão] \
      #text(size: 8.5pt, fill: luma(110))[Sétima no baixo (Bb)]
    ],
  )
]

== Meio-Diminuto (Cm7#super[b5])

#v(0.8em)


#align(center)[
  #grid(
    columns: 4,
    gutter: 2.5em,
    align: center,
    block[
      #box(chord("8,x,8,8,7,x", name: "CØ")) \
      #v(0.4em)
      #text(size: 9.5pt, weight: "bold")[Estado Fundamental] \
      #text(size: 8.5pt, fill: luma(110))[Tónica no baixo (C)]
    ],
    block[
      #box(chord("11,x,10,11,11,x", name: "CØ/Eb")) \
      #v(0.4em)
      #text(size: 9.5pt, weight: "bold")[1ª Inversão] \
      #text(size: 8.5pt, fill: luma(110))[Terça no baixo (Eb)]
    ],
    block[
      #box(chord("2,x,1,3,1,x", name: "CØ/Gb")) \
      #v(0.4em)
      #text(size: 9.5pt, weight: "bold")[2ª Inversão] \
      #text(size: 8.5pt, fill: luma(110))[Quinta no baixo (Gb)]
    ],
    block[
      #box(chord("6,x,4,5,4,x", name: "CØ/Bb")) \
      #v(0.4em)
      #text(size: 9.5pt, weight: "bold")[3ª Inversão] \
      #text(size: 8.5pt, fill: luma(110))[Sétima no baixo (Bb)]
    ],
  )
]

#v(1em)

= Aplicação Prática: Condução de Vozes

Na prática, os guitarristas raramente saltam pelo braço do instrumento tocando apenas acordes no estado fundamental. A grande utilidade de conhecer todas as inversões é permitir uma *condução de vozes* suave. Isso significa conectar acordes movendo as notas o mínimo possível de uma posição para a outra.

#v(0.4em)

#explainer-component(
  align(center)[
    #grid(
      columns: 2,
      gutter: 2em,
      block[
        #box(chord("x,5,3,5,5,x", name: "Dm7"))
        #v(0.2em)
        #text(size: 8.5pt, fill: luma(110))[II: Dm7 (Fundamental)]
      ],
      block[
        #box(chord("3,x,3,4,3,x", name: "G7"))
        #v(0.2em)
        #text(size: 8.5pt, fill: luma(110))[V: G7 (Fundamental)]
      ],
    )
  ],
  [
    Ao tocar a clássica progressão *II - V - I* (ex: Dm7 -> G7 -> C7M), tente usar um acorde no estado fundamental seguido de outro invertido. Você notará que as notas quase não mudam de lugar nas cordas mais agudas, criando uma transição muito mais fluida, madura e musical.
  ],
  inverted: false,
)

#v(1em)

#align(center)[
  #block(
    fill: luma(248),
    stroke: 0.5pt + luma(210),
    inset: 12pt,
    radius: 5pt,
    width: 80%,
    [
      #text(weight: "bold")[Dica:] Não tente decorar todas as posições em um único dia. Escolha apenas um tipo de tétrade (ex: Tétrade Dominante) e toque suas quatro inversões subindo e descendo o braço. Concentre-se em visualizar onde o baixo (T, 3, 5 ou 7) se encontra em cada formato.
    ],
  )
]
