#import "../../../../templates/layout.typ": *
#import "@preview/conchord:0.4.0": new-chordgen

#show: aula.with(
  instrumento: "Guitarra",
  nivel: "Iniciante",
)

#let chord = new-chordgen(number-to-left: true, use-shadow-barre: false, colors: (hold: black, barre: black))

= Tensões Harmônicas

Além das 4 notas da tétrade (T, 3, 5, 7), é possível adicionar mais notas ao acorde para enriquecer sua cor harmônica. Essas notas adicionais são chamadas de *tensões* e são os intervalos *acima da oitava*: a *9ª, 11ª* e *13ª* — que nada mais são do que a 2ª, 4ª e 6ª oitavadas.

== A Relação entre Intervalos e Tensões

#align(center)[
  #table(
    columns: (1fr, 0.6fr, 0.6fr, 2.5fr),
    align: center + horizon,
    stroke: 0.5pt + color-rule-dark,
    fill: (col, row) => if row == 0 { color-subtle-bg } else if calc.odd(row) { white } else { color-subtle-bg },
    [*Intervalo dentro da 8va*], [*Escrita*], [*Tensão*], [*Exemplo a partir de Dó*],
    [2ª menor], [b2], [b9], [Dó → Réb (= 9ª menor)],
    [2ª maior], [2], [9], [Dó → Ré (= 9ª maior)],
    [2ª aum.], [\#2], [\#9], [Dó → Ré\# (= 9ª aum.)],
    [4ª justa], [4], [11], [Dó → Fá (= 11ª justa)],
    [4ª aum.], [\#4], [\#11], [Dó → Fá\# (= 11ª aum.)],
    [6ª menor], [b6], [b13], [Dó → Láb (= 13ª menor)],
    [6ª maior], [6], [13], [Dó → Lá (= 13ª maior)],
  )
]

#align(center)[
  #block(
    fill: color-subtle-bg,
    stroke: 0.5pt + color-rule-dark,
    inset: 10pt,
    radius: 5pt,
    width: 80%,
    [
      *Regra:* Tensão = intervalo correspondente + 7 (exemplo: 2ª → 9ª, 4ª → 11ª, 6ª → 13ª)
    ],
  )
]

== Tensões Disponíveis por Acorde (Campo de C)

Nem toda tensão funciona sobre todo acorde. As tensões "disponíveis" são as que pertencem à escala do campo harmônico e soam bem com o acorde. A tabela abaixo mostra as tensões naturais de cada grau em Dó Maior:

#align(center)[
  #table(
    columns: (0.7fr, 1fr, 0.7fr, 0.7fr, 0.7fr, 0.7fr),
    align: center + horizon,
    stroke: 0.5pt + color-rule-dark,
    fill: (col, row) => {
      if row == 0 { color-subtle-bg } else if col == 0 { color-subtle-bg } else { white }
    },
    [*Acorde*], [*Tipo*], [*7ª*], [*9 (2ª)*], [*11 (4ª)*], [*13 (6ª)*],
    [C7M  (I)], [Maior 7M], [7M], [9], [\#11], [13],
    [Dm7  (II)], [Menor 7], [7], [9], [11], [13],
    [Em7  (III)], [Menor 7], [7], [b9], [11], [b13],
    [F7M  (IV)], [Maior 7M], [7M], [9], [\#11], [13],
    [G7   (V)], [Dominante 7], [7], [9], [—], [13],
    [Am7  (VI)], [Menor 7], [7], [9], [11], [b13],
    [Bø   (VII)], [Meio-Dim.], [7], [b9], [11], [b13],
  )
]

#align(center)[
  #text(size: 8.5pt, fill: color-muted)[
    *Observação:* O acorde G7 (V) evita a 11ª justa pois ela conflita com a 3ª (Si). Em seu lugar, usa-se a *\#11* (Dó\#) para criar o modo Lídio-Dominante.
  ]
]

== Exemplos Sonoros: Acordes com Tensões

Os exemplos abaixo mostram como as tensões enriquecem acordes do campo de Dó. As notas extras não mudam a função do acorde — apenas adicionam cor:

#align(center)[
  #grid(
    columns: 5,
    gutter: 1.2em,
    align: center,
    block[
      #box(chord("x,3,2,0,3,0", name: "C7M9"))
      #v(0.3em)
      #text(size: 8.5pt, weight: "bold")[C7M com 9] \
      #text(size: 7.5pt, fill: color-muted)[do · mi · sol · si · ré]
    ],
    block[
      #box(chord("x,x,0,2,1,1", name: "Dm7"))
      #v(0.3em)
      #text(size: 8.5pt, weight: "bold")[Dm7 com 11] \
      #text(size: 7.5pt, fill: color-muted)[ré · fá · lá · do]
    ],
    block[
      #box(chord("3,x,3,4,5,x", name: "G7(13)"))
      #v(0.3em)
      #text(size: 8.5pt, weight: "bold")[G7 com 13] \
      #text(size: 7.5pt, fill: color-muted)[sol · fá · si · lá]
    ],
    block[
      #box(chord("x,0,2,0,1,0", name: "Am7"))
      #v(0.3em)
      #text(size: 8.5pt, weight: "bold")[Am7 com 11] \
      #text(size: 7.5pt, fill: color-muted)[lá · mi · sol · do]
    ],
    block[
      #box(chord("x,3,4,4,3,3", name: "Fmaj7"))
      #v(0.3em)
      #text(size: 8.5pt, weight: "bold")[F7M com 9] \
      #text(size: 7.5pt, fill: color-muted)[fá · lá · do · mi]
    ],
  )
]

#v(2em)

== Como Pensar nas Tensões na Prática

#v(0.8em)

#explainer-component(
  align(center)[
    #set text(size: 9.5pt)
    #table(
      columns: (0.6fr, 1fr),
      stroke: 0.5pt + color-rule-dark,
      fill: (col, row) => if row == 0 { color-subtle-bg } else { white },
      align: right + horizon,
      [*Tensão*], [*Sonoridade*],
      [9 (Ré em C)], [cor aberta, ensolarada],
      [\#11 (Fá\# em C)], [cor lídio, flutuante],
      [13 (Lá em G7)], [doce, jazz clássico],
      [b9 (Réb em G7)], [tenso, dramático],
      [\#9 (Ré\# em G7)], [blues, Hendrix],
    )
  ],
  [
    Na prática, as tensões são mais sentidas do que calculadas. Toque um *G7* e experimente adicionar uma nota: Lá (13), Réb (b9) ou Ré\# (\#9), cada uma tem uma cor diferente.

    Com o tempo, você começa a *ouvir* qual tensão o acorde está "pedindo" no contexto da música.
  ],
)
