#import "/templates/layout.typ": *
#import "/templates/components.typ": *
#import "@preview/conchord:0.4.0": new-chordgen

#show: aula.with(
  instrumento: "Guitarra",
  nivel: "Iniciante",
)

#let chord = new-chordgen(number-to-left: true, use-shadow-barre: false, colors: (hold: black, barre: black))

// Linha de diagramas que não se divide entre páginas.
#let linha-acordes(items, columns: 5, gutter: 1.4em) = block(
  breakable: false,
  width: 100%,
  below: 1.2em,
  grid-acordes(chord: chord, columns: columns, gutter: gutter, items),
)

// Exercício curto que não se divide entre páginas.
#let ex(..args, body) = block(breakable: false, width: 100%, exercicio(..args, body))

= Sistema CAGED

O *CAGED* é um método para organizar o braço da guitarra a partir de cinco acordes maiores abertos (tocados com cordas soltas): *C* (Dó), *A* (Lá), *G* (Sol), *E* (Mi) e *D* (Ré). A ideia central é que esses cinco desenhos não são acordes isolados, mas *shapes móveis*: com uma pestana, cada um pode ser levado para qualquer casa e formar qualquer acorde maior.

#objetivos((
  [Reconhecer os cinco shapes do CAGED e a posição da tônica em cada um],
  [Transportar um shape pelo braço com pestana para formar outros acordes],
  [Tocar o mesmo acorde em cinco regiões diferentes do braço],
  [Escolher shapes próximos para tocar progressões sem grandes saltos],
))

== 1. Os cinco shapes abertos

Observe a geometria de cada desenho e, principalmente, *em quais cordas está a tônica* (a nota que dá nome ao acorde). É ela que serve de referência quando o shape for movido.

#linha-acordes((
  (tabs: "x,3,2,0,1,0", nome: " ", titulo: "C", detalhe: "tônica: 5ª e 2ª"),
  (tabs: "x,0,2,2,2,0", nome: " ", titulo: "A", detalhe: "tônica: 5ª e 3ª"),
  (tabs: "3,2,0,0,0,3", nome: " ", titulo: "G", detalhe: "tônica: 6ª, 3ª e 1ª"),
  (tabs: "0,2,2,1,0,0", nome: " ", titulo: "E", detalhe: "tônica: 6ª, 4ª e 1ª"),
  (tabs: "x,x,0,2,3,2", nome: " ", titulo: "D", detalhe: "tônica: 4ª e 2ª"),
))

A tônica *mais grave* de cada shape é a mais usada como guia:

#tabela(
  columns: (1fr, 1.4fr, 2fr),
  ([Shape], [Tônica mais grave], [Outras tônicas]),
  (
    ([E e G], [6ª corda (Mi grave)], [E: 4ª e 1ª · G: 3ª e 1ª]),
    ([A e C], [5ª corda (Lá)], [A: 3ª · C: 2ª]),
    ([D], [4ª corda (Ré)], [2ª]),
  ),
)

== 2. Movendo um shape com pestana

Num acorde aberto, as cordas soltas soam porque o *nut* (a peça no alto do braço, onde as cordas se apoiam) funciona como uma "pestana" na casa zero. Para mover o shape, você monta o desenho com os outros dedos e faz o papel do nut com o *dedo indicador*, numa pestana.

=== Exemplo: o shape de E

No E aberto, a tônica é a 6ª corda solta (Mi). Monte o mesmo desenho com os dedos 2, 3 e 4, suba tudo *uma casa* e faça pestana na casa 1: a tônica passa a ser *Fá*, e o acorde vira *F*. Subindo até a casa 3, a tônica é *Sol*, e o acorde vira *G*.

#linha-acordes(columns: 3, gutter: 3em, (
  (tabs: "0,2,2,1,0,0", nome: " ", titulo: "E", detalhe: "aberto"),
  (tabs: "1,3,3,2,1,1", nome: " ", titulo: "F", detalhe: "shape de E, pestana na casa 1"),
  (tabs: "3,5,5,4,3,3", nome: " ", titulo: "G", detalhe: "shape de E, pestana na casa 3"),
))

#caixa(tipo: "resumo", titulo: "Regra")[
  A casa da pestana é a casa da tônica na corda-guia. Para um shape de E, procure a nota desejada na 6ª corda; para um shape de A, na 5ª corda. Exemplo: Ré está na casa 5 da 5ª corda, então o *D com shape de A* é feito com pestana na casa 5.
]

== 3. Um acorde, cinco regiões

Os shapes se encaixam pelo braço sempre na mesma ordem, que dá nome ao sistema: *C → A → G → E → D*, e depois recomeça (C → A…). Dois shapes vizinhos sempre compartilham uma tônica na mesma corda e casa: ela é o "ponto de encaixe" entre eles. Veja o acorde de *Dó maior* nas cinco regiões:

#linha-acordes((
  (tabs: "x,3,2,0,1,0", nome: " ", titulo: "Shape C", detalhe: "casas 0–3"),
  (tabs: "x,3,5,5,5,3", nome: " ", titulo: "Shape A", detalhe: "casas 3–5"),
  (tabs: "8,7,5,5,5,8", nome: " ", titulo: "Shape G", detalhe: "casas 5–8"),
  (tabs: "8,10,10,9,8,8", nome: " ", titulo: "Shape E", detalhe: "casas 8–10"),
  (tabs: "x,x,10,12,13,12", nome: " ", titulo: "Shape D", detalhe: "casas 10–13"),
))

#caixa(tipo: "dica")[
  O shape de G completo é difícil de segurar. Na prática, toque só as quatro cordas agudas: *x,x,5,5,5,8* (Sol, Dó, Mi, Dó) — o acorde continua sendo C.
]

== 4. Economia de movimento

O maior ganho do CAGED é poder tocar uma progressão inteira *numa mesma região do braço*, escolhendo para cada acorde o shape mais próximo. Veja a progressão I – IV – V em Sol maior (*G – C – D*) em duas regiões.

=== Região 1: casas 2 a 5

As tônicas do G (6ª corda) e do C (5ª corda) estão ambas na casa 3; o D usa o shape de C, logo ao lado.

#linha-acordes(columns: 3, gutter: 3em, (
  (tabs: "3,5,5,4,3,3", nome: " ", titulo: "G", detalhe: "shape de E"),
  (tabs: "x,3,5,5,5,3", nome: " ", titulo: "C", detalhe: "shape de A"),
  (tabs: "x,5,4,2,3,2", nome: " ", titulo: "D", detalhe: "shape de C"),
))

=== Região 2: casas 7 a 12

#linha-acordes(columns: 3, gutter: 3em, (
  (tabs: "x,10,9,7,8,7", nome: " ", titulo: "G", detalhe: "shape de C"),
  (tabs: "8,10,10,9,8,8", nome: " ", titulo: "C", detalhe: "shape de E"),
  (tabs: "10,12,12,11,10,10", nome: " ", titulo: "D", detalhe: "shape de E"),
))

Toque as duas versões com metrônomo, devagar (por volta de 60 BPM). O objetivo não é velocidade, e sim fluidez: repare como a mão quase não se desloca.

== 5. Exercícios

#ex(titulo: "Que acorde é este?")[
  Escreva o nome do acorde formado por cada shape com pestana na casa indicada.

  #tabela-preencher(
    columns: (1.4fr,) + (1fr,) * 6,
    ([Shape / casa], [E / 5], [E / 7], [E / 2], [A / 5], [A / 7], [A / 2]),
    (([Acorde],) + (none,) * 6,),
  )
]

#ex(titulo: "Onde fica a pestana?")[
  Escreva em que casa você deve fazer a pestana para obter cada acorde.

  #tabela-preencher(
    columns: (1.4fr,) + (1fr,) * 6,
    ([Acorde / shape], [A / E], [C / E], [F\# / E], [C / A], [Bb / A], [E / A]),
    (([Casa],) + (none,) * 6,),
  )
]

#ex(titulo: "O G em cinco regiões")[
  O G aberto usa o shape de G. Seguindo a ordem do CAGED, escreva os quatro shapes seguintes e a casa da *tônica mais grave* de cada um.

  #tabela-preencher(
    columns: (1.4fr,) + (1fr,) * 5,
    ([Ordem], [1º], [2º], [3º], [4º], [5º]),
    (
      ([Shape], [G], none, none, none, none),
      ([Casa da tônica], [3 (6ª corda)], none, none, none, none),
    ),
  )
]

#ex(titulo: "Escreva os shapes")[
  Escreva os acordes pedidos como seis números (da 6ª para a 1ª corda, com "x" para corda abafada), como nos exemplos da aula: x,3,5,5,5,3.

  #grid(
    columns: (1fr, 1fr),
    row-gutter: 1.1em,
    column-gutter: 1.5em,
    [a) D com shape de A: #box(width: 3.5cm, height: 0.9em, stroke: (bottom: 0.6pt + color-rule-dark))],
    [b) A com shape de E: #box(width: 3.5cm, height: 0.9em, stroke: (bottom: 0.6pt + color-rule-dark))],

    [c) B com shape de A: #box(width: 3.5cm, height: 0.9em, stroke: (bottom: 0.6pt + color-rule-dark))],
    [d) D com shape de E: #box(width: 3.5cm, height: 0.9em, stroke: (bottom: 0.6pt + color-rule-dark))],
  )
]

#ex(titulo: "Monte uma região")[
  Escolha shapes para tocar *A – D – E* (I – IV – V em Lá maior) entre as casas 4 e 9, sem saltos grandes. Escreva o shape e a casa de cada acorde e depois toque.

  #linhas-resposta(2)
]

=== Sugestão de prática

#rotina-estudo((
  ([Os cinco shapes abertos, dizendo onde está a tônica], [5 min], [—]),
  ([C nas cinco regiões, subindo e descendo o braço], [5 min], [60]),
  ([G – C – D nas regiões 1 e 2, quatro tempos por acorde], [10 min], [60–80]),
))

=== Autoavaliação

#checklist((
  [Sei onde está a tônica em cada um dos cinco shapes],
  [Encontro qualquer acorde maior com os shapes de E e de A],
  [Toco o mesmo acorde em pelo menos três regiões],
  [Toco G – C – D sem tirar a mão da região],
))

#gabarito[
  #resposta(1)[
    E / 5 = A · E / 7 = B · E / 2 = F\# · A / 5 = D · A / 7 = E · A / 2 = B.
  ]
  #resposta(2)[
    A (shape E) = casa 5 · C (shape E) = 8 · F\# (shape E) = 2 · C (shape A) = 3 · Bb (shape A) = 1 · E (shape A) = 7.
  ]
  #resposta(3)[
    G (casa 3, 6ª corda) → E (casa 3, 6ª corda) → D (casa 5, 4ª corda) → C (casa 10, 5ª corda) → A (casa 10, 5ª corda). Em tabs: 3,2,0,0,0,3 · 3,5,5,4,3,3 · x,x,5,7,8,7 · x,10,9,7,8,7 · x,10,12,12,12,10.
  ]
  #resposta(4)[
    a) x,5,7,7,7,5 · b) 5,7,7,6,5,5 · c) x,2,4,4,4,2 · d) 10,12,12,11,10,10.
  ]
  #resposta(5)[
    Uma possibilidade: A com shape de E na casa 5 (5,7,7,6,5,5), D com shape de A na casa 5 (x,5,7,7,7,5) e E com shape de A na casa 7 (x,7,9,9,9,7).
  ]
]
