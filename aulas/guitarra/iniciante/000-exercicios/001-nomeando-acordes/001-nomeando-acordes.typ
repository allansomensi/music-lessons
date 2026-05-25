#import "/templates/layout.typ": *
#import "@preview/conchord:0.4.0": new-chordgen

#show: aula.with(
  instrumento: "Guitarra / Violão",
  nivel: "Exercícios de Fixação",
)

#let chord = new-chordgen(
  number-to-left: true,
  use-shadow-barre: false,
  colors: (hold: black, barre: black),
)

#let chord-vazio = new-chordgen(
  number-to-left: true,
  use-shadow-barre: false,
  colors: (hold: gray, barre: gray),
)

= Nomeie os Acordes

Preencha a linha abaixo de cada diagrama com a cifra correta do acorde representado.

#v(2em)

#let ex1(tabs) = align(center)[
  #box(chord(tabs))
  #v(1em)
  #line(length: 1.5cm, stroke: 0.8pt + black)
]

#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  row-gutter: 4em,
  align: center + horizon,

  // Linha 1: Tríades Básicas (Maior e Menor)
  // C
  ex1("x,3,2,0,1,0"),
  // Am
  ex1("x,0,2,2,1,0"),
  // G
  ex1("3,2,0,0,0,3"),
  // D
  ex1("x,x,0,2,3,2"),

  // Linha 2: Tétrades (7, maj7, m7)
  // E7
  ex1("0,2,0,1,0,0"),
  // Fmaj7
  ex1("x,x,3,2,1,0"),
  // Dm7
  ex1("x,x,0,2,1,1"),
  // B7
  ex1("x,2,4,2,4,2"),

  // Linha 3: Acordes Suspensos e Inversões
  // Dsus4
  ex1("x,x,0,2,3,3"),
  // Asus2
  ex1("x,0,2,2,0,0"),
  // G/B
  ex1("x,2,0,0,3,3"),
  // C/G
  ex1("3,3,2,0,1,0"),

  // Linha 4: Diminutos, Aumentados, Extensões e m7(b5)
  // Bm7(b5)
  ex1("x,2,3,2,3,x"),
  // Cm7(b5)
  ex1("x,3,4,2,4,x"),
  // Aaug
  ex1("x,0,3,2,2,1"),
  // C7(9)
  ex1("x,3,2,3,3,x"),
)

#pagebreak()

= Identifique as Notas

Preencha os espaços vazios (círculos) de cada diagrama com a *nota musical* correspondente àquela corda e casa. Preencha também a linha abaixo com o nome do acorde.

#v(2em)

#let ex2(tabs) = align(center)[
  #box(chord-vazio(tabs))
  #v(1em)
  #line(length: 1.5cm, stroke: 0.8pt + black)
]

#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  row-gutter: 4em,
  align: center + horizon,

  // Linha 1: Extensões (maj7, 9)
  // Cmaj7
  ex2("x,3,2,0,0,0"),
  // Am9
  ex2("x,0,2,4,1,0"),
  // Dm7(9)
  ex2("x,5,3,5,5,x"),
  // G7
  ex2("3,2,0,0,0,1"),

  // Linha 2: Alterações e 13s
  // E7(b9)
  ex2("0,2,0,1,0,1"),
  // Fmaj7(#11)
  ex2("1,3,3,2,0,0"),
  // Bb7(13)
  ex2("6,x,6,7,8,x"),
  // B7(#9)
  ex2("x,2,1,2,3,x"),

  // Linha 3: Suspensos (sus4, sus2)
  // D9sus4
  ex2("x,5,5,5,5,x"),
  // A7sus4
  ex2("x,0,2,0,3,0"),
  // Csus2
  ex2("x,3,0,0,3,3"),
  // Gsus4
  ex2("3,x,0,0,1,3"),

  // Linha 4: Inversões (1ª e 2ª)
  // C/E (1ª inv)
  ex2("0,3,2,0,1,0"),
  // G/D (2ª inv)
  ex2("x,x,0,0,0,3"),
  // Am/C (1ª inv)
  ex2("x,3,2,2,1,0"),
  // D/A (2ª inv)
  ex2("x,0,0,2,3,2"),
)

#pagebreak()

= Identifique os Intervalos

Preencha os espaços vazios de cada diagrama com o *intervalo* correspondente em relação à tônica do acorde (Ex: T, 3, b3, 5, b5, 7, maj7). Preencha também o nome do acorde na linha abaixo.

#v(2em)

#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  row-gutter: 4em,
  align: center + horizon,

  // Linha 1: Alterados Complexos (#9, b13, b9)
  // G7(b13)
  ex2("3,x,3,4,4,x"),
  // C7(#9#5)
  ex2("x,3,2,3,4,4"),
  // A7(b9b13)
  ex2("5,x,5,6,6,6"),
  // E7(#9)
  ex2("x,7,6,7,8,x"),

  // Linha 2: Inversões Avançadas (incluindo 3ª inversão)
  // E/G# (1ª inv)
  ex2("4,x,2,1,0,0"),
  // Cmaj7/G (2ª inv)
  ex2("3,3,2,0,0,0"),
  // Dm7/C (3ª inv)
  ex2("x,3,x,2,3,1"),
  // G7/F (3ª inv)
  ex2("1,2,0,0,0,3"),

  // Linha 3: Jazz Voicings e Acordes Meio-Diminutos
  // Cmaj9
  ex2("x,3,2,4,3,x"),
  // F#m7b5
  ex2("2,x,2,2,1,x"),
  // Fdim7
  ex2("x,8,9,7,9,x"),
  // Em11
  ex2("0,x,4,2,3,0"),

  // Linha 4: Menor com 7M, Tensões Variadas
  // Am7M
  ex2("x,0,2,1,1,0"),
  // D(b9/13)
  ex2("x,5,4,5,4,7"),
  // Gmaj7(#5)
  ex2("3,x,4,4,4,x"),
  // C(add9)
  ex2("x,3,2,0,3,0"),
)
