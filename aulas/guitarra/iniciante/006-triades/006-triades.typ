#import "../../../../templates/layout.typ": *
#import "@preview/conchord:0.4.0": new-chordgen

#show: aula.with(
  instrumento: "Guitarra",
  nivel: "Iniciante",
)

#let chord = new-chordgen(number-to-left: true, use-shadow-barre: false, colors: (hold: black, barre: black))

= Tríades

A *tríade* é o bloco fundamental de todo acorde. Ela é formada por exatamente *3 notas* empilhadas em intervalos de terça, são elas a *Tônica (T)*, a *Terça (3)* e a *Quinta (5)*. Ao alterarmos os intervalos de terça e de quinta, obtemos os *4 tipos fundamentais* de tríades.

#v(1em)

== As 4 Categorias

#align(center)[
  #table(
    columns: (1.5fr, 0.8fr, 0.5fr, 0.5fr, 0.5fr, 1.8fr),
    align: center + horizon,
    stroke: 0.5pt + color-rule-dark,
    fill: (col, row) => if row == 0 { color-subtle-bg } else if calc.odd(row) { white } else { color-subtle-bg },
    [*Tipo*], [*Símbolo*], [*T*], [*3ª*], [*5ª*], [*Distâncias*],
    [Maior], [C], [T], [3], [5], [T + 2 tons + 1,5 tom],
    [Menor], [Cm], [T], [b3], [5], [T + 1,5 tom + 2 tons],
    [Diminuta], [Cm(b5)], [T], [b3], [b5], [T + 1,5 tom + 1,5 tom],
    [Aumentada], [C+], [T], [3], [\#5], [T + 2 tons + 2 tons],
  )
]

#v(1em)

== Receita Visual de Cada Tipo

#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  gutter: 0.8em,
  block(
    width: 100%,
    fill: color-subtle-bg,
    stroke: 0.6pt,
    inset: 8pt,
    radius: 5pt,
    align(center)[
      #text(weight: "bold", size: 10.5pt)[Maior] #v(0.4em)
      T #h(2pt) · #h(2pt) #h(2pt) 3 #h(2pt) · #h(2pt) 5
    ],
  ),
  block(
    width: 100%,
    fill: color-subtle-bg,
    stroke: 0.6pt,
    inset: 8pt,
    radius: 5pt,
    align(center)[
      #text(weight: "bold", size: 10.5pt)[Menor] #v(0.4em)
      T #h(2pt) · #h(2pt) #h(2pt) b3 #h(2pt) · #h(2pt) 5
    ],
  ),
  block(
    width: 100%,
    fill: color-subtle-bg,
    stroke: 0.6pt,
    inset: 8pt,
    radius: 5pt,
    align(center)[
      #text(weight: "bold", size: 10.5pt)[Diminuta] #v(0.4em)
      T #h(2pt) · #h(2pt) #h(2pt) b3 #h(2pt) · #h(2pt) b5
    ],
  ),
  block(
    width: 100%,
    fill: color-subtle-bg,
    stroke: 0.6pt,
    inset: 8pt,
    radius: 5pt,
    align(center)[
      #text(weight: "bold", size: 10.5pt)[Aumentada] #v(0.4em)
      T #h(2pt) · #h(2pt) #h(2pt) 3 #h(2pt) · #h(2pt) \#5
    ],
  ),
)

#v(1em)

== Exemplos com Tônica em C

As quatro tríades abaixo partem da mesma tônica, mas soam completamente diferentes somente alterando suas terças e quintas.

#v(1em)

#align(center)[
  #grid(
    columns: 4,
    gutter: 2em,
    align: center,
    block[
      #box(chord("x,3,2,0,1,0", name: "C")) \
      #text(size: 9.5pt, weight: "bold")[Maior] \
      #text(size: 8.5pt, fill: color-muted)[dó · mi · sol]
    ],
    block[
      #box(chord("x,3,5,5,4,3", name: "Cm")) \
      #text(size: 9.5pt, weight: "bold")[Menor] \
      #text(size: 8.5pt, fill: color-muted)[dó · mib · sol]
    ],
    block[
      #box(chord("x,3,4,5,4,x", name: "Cdim")) \
      #text(size: 9.5pt, weight: "bold")[Diminuta] \
      #text(size: 8.5pt, fill: color-muted)[dó · mib · solb]
    ],
    block[
      #box(chord("x,3,2,1,1,0", name: "C+")) \
      #text(size: 9.5pt, weight: "bold")[Aumentada] \
      #text(size: 8.5pt, fill: color-muted)[dó · mi · sol\#]
    ],
  )
]

== Formas Fechadas

Tríades *sem cordas soltas* são chamadas de *formas fechadas* e podem ser transportadas para qualquer tonalidade simplesmente deslizando o formato pelo braço. A geometria da mão não muda, apenas a casa em que a tônica se encontra.

#explainer-component(
  align(center)[
    #grid(
      columns: 3,
      gutter: 1.5em,
      block[#box(chord("x,0,2,2,2,0", name: "A"))],
      block[#box(chord("x,2,4,4,4,2", name: "B"))],
      block[#box(chord("x,3,5,5,5,3", name: "C"))],
    )
  ],
  [
    O *Modelo A* (derivado do acorde aberto de Lá Maior) deslizando pelo braço. Cada 2 casas sobem 1 tom; cada 1 casa sobe 1 semitom.

    Esse é o princípio central do *Sistema CAGED*: os 5 modelos são tríades maiores transportáveis que cobrem o braço inteiro.
  ],
)

#align(center)[
  #block(
    fill: color-subtle-bg,
    stroke: 0.5pt + color-rule-dark,
    inset: 12pt,
    radius: 5pt,
    width: 80%,
    [
      #text(weight: "bold")[Resumo Rápido:] A diferença entre Maior e Menor é de apenas *1 semitom na terça*. Baixando também a quinta em 1 semitom, chegamos na Diminuta. Subindo a quinta da Maior em 1 semitom, obtemos a Aumentada.
    ],
  )
]

== Inversões de Tríades

Uma tríade não precisa ter obrigatoriamente a Tônica como a nota mais grave. Quando alteramos a nota que fica no baixo, criamos as *inversões*.

== As 3 Posições Possíveis

#align(center)[
  #table(
    columns: (1fr, 1fr, 1.5fr, 1.5fr),
    align: center + horizon,
    stroke: 0.5pt + color-rule-dark,
    fill: (col, row) => if row == 0 { color-subtle-bg } else if calc.odd(row) { white } else { color-subtle-bg },
    [*Posição*], [*Baixo*], [*Ordem das Notas*], [*Sonoridade / Uso*],
    [Fundamental], [Tônica], [T - 3 - 5], [Forte e estável],
    [1ª Inversão], [Terça], [3 - 5 - T], [Mais aberta, excelente ponte],
    [2ª Inversão], [Quinta], [5 - T - 3], [Mais tensa],
  )
]

== Exemplos de Inversões em Acordes Abertos (Dó Maior)

Podemos visualizar como as inversões funcionam na prática alterando a nota mais grave dos acordes abertos tradicionais. Abaixo, vemos como o formato clássico de Dó Maior (C) é adaptado para criar suas inversões, mantendo a base do acorde e mudando apenas o baixo.

#align(center)[
  #grid(
    columns: 3,
    gutter: 4em,
    align: center,
    block[
      #box(chord("x,3,2,0,1,0", name: "C")) \
      #text(size: 9.5pt, weight: "bold")[Estado Fundamental] \
      #text(size: 8.5pt, fill: color-muted)[dó · mi · sol] \
      #text(size: 8pt, style: "italic")[Tônica no baixo]
    ],
    block[
      #box(chord("x,x,2,0,1,0", name: "C/E")) \
      #text(size: 9.5pt, weight: "bold")[1ª Inversão] \
      #text(size: 8.5pt, fill: color-muted)[mi · sol · dó] \
      #text(size: 8pt, style: "italic")[Terça no baixo]
    ],
    block[
      #box(chord("3,3,2,0,1,0", name: "C/G")) \
      #text(size: 9.5pt, weight: "bold")[2ª Inversão] \
      #text(size: 8.5pt, fill: color-muted)[sol · dó · mi] \
      #text(size: 8pt, style: "italic")[Quinta no baixo]
    ],
  )
]

