#import "../../../templates/layout.typ": explainer-component, lesson-template
#import "@preview/conchord:0.4.0": new-chordgen

#show: lesson-template.with(
  module: "Guitarra",
  level: "Iniciante",
)

#let chord = new-chordgen(number-to-left: true, use-shadow-barre: false, colors: (hold: black, barre: black))

= Sistema CAGED

O *Sistema CAGED* é uma das ferramentas mais importantes para mapear e visualizar o braço da guitarra de forma lógica. O nome é um acrônimo formado pelas cifras de cinco acordes abertos (sem pestana) fundamentais: *C* (Dó), *A* (Lá), *G* (Sol), *E* (Mi) e *D* (Ré).

A vantagem do CAGED é que esses cinco formatos não são apenas acordes isolados, mas sim *"shapes" móveis*. Ao dominar a localização da tônica em cada formato, você pode transportar essas posições por todo o braço para encontrar qualquer acorde maior.

== 1. Os 5 Shapes Fundamentais (Abertos)

Abaixo estão os formatos básicos na posição aberta. Memorizar a geometria da mão e a posição da tônica em cada um deles é o primeiro passo.

#align(center)[
  #grid(
    columns: 5,
    gutter: 1.5em,
    [#box(chord("x,3,2,0,1,0", name: "C"))],
    [#box(chord("x,0,2,2,2,0", name: "A"))],
    [#box(chord("3,2,0,0,0,3", name: "G"))],
    [#box(chord("0,2,2,1,0,0", name: "E"))],
    [#box(chord("x,x,0,2,3,2", name: "D"))],
  )
]

== 2. Mobilidade com Pestana

A corda solta (aberta) em um acorde só funciona graças à "pestana zero" da guitarra: o _nut_. Para movermos esses acordes pelo braço e alterarmos o tom, precisamos substituir a ação do _nut_ pelo nosso dedo indicador, criando uma *pestana*.

=== Exemplo Prático: Movendo o Shape de E

O shape de *E (Mi Maior)* tem sua tônica na 6ª corda solta.
Se você usar seus outros dedos para montar o acorde, avançar o formato inteiro em uma casa e usar o indicador para fazer uma pestana na casa 1, a sua nova tônica será a nota Fá.

O acorde resultante, com a mesma geometria, passa a ser um *F (Fá Maior)*. Se arrastar o bloco inteiro para a 3ª casa, a tônica passa a ser a nota Sol, formando um *G (Sol Maior)*.

#align(center)[
  #grid(
    columns: 3,
    gutter: 2.5em,
    [#box(chord("0,2,2,1,0,0", name: "E (Shape E)"))],
    [#box(chord("1,3,3,2,1,1", name: "F (Shape E)"))],
    [#box(chord("3,5,5,4,3,3", name: "G (Shape E)"))],
  )
]

== 3. Conectando os Shapes ao Longo do Braço

A regra de ouro do CAGED é que os formatos se conectam pelo braço em uma ordem infinita e contínua: *C -> A -> G -> E -> D -> C -> A...*

Isso significa que você pode tocar o mesmo acorde em 5 regiões diferentes da guitarra. Abaixo, vamos mapear o acorde de *Dó Maior (C)* usando todos os 5 formatos consecutivos:

#align(center)[
  #grid(
    columns: 5,
    gutter: 1.5em,
    [#box(chord("x,3,2,0,1,0", name: "C (Shape C)"))],
    [#box(chord("x,3,5,5,5,3", name: "C (Shape A)"))],
    [#box(chord("8,7,5,5,5,8", name: "C (Shape G)"))],
    [#box(chord("8,10,10,9,8,8", name: "C (Shape E)"))],
    [#box(chord("x,x,10,12,13,12", name: "C (Shape D)"))],
  )
]

*Dica de Estudo:* Não tente decorar tudo de uma vez. Foque em memorizar onde a *Tônica* de cada shape se encontra:

- Shapes de *E* e *G*: Tônica na 6ª corda.
- Shapes de *A* e *C*: Tônica na 5ª corda.
- Shape de *D*: Tônica na 4ª corda.

== 4. Exercícios: Economia de Movimento

O verdadeiro poder do CAGED não é apenas encontrar acordes espalhados, mas permitir que você toque progressões inteiras na mesma região do braço, com o mínimo de esforço.

Abaixo, vamos tocar uma progressão I - IV - V em Sol Maior (*G - C - D*) em duas regiões diferentes.

=== Região 1 (Foco nas casas 3 a 5)

Nesta região, a sua mão mal precisa sair do lugar. A tônica do G e do C estão ambas na casa 3 (cordas 6 e 5).

- *G* no Shape de *E* (Tônica na 6ª corda)
- *C* no Shape de *A* (Tônica na 5ª corda)
- *D* no Shape de *C* (Tônica na 5ª corda, descendo o shape a partir da casa 5)

#align(center)[
  #grid(
    columns: 3,
    gutter: 2.5em,
    [#box(chord("3,5,5,4,3,3", name: "G (Shape E)"))],
    [#box(chord("x,3,5,5,5,3", name: "C (Shape A)"))],
    [#box(chord("x,5,4,2,3,2", name: "D (Shape C)"))],
  )
]

=== Região 2 (Foco nas casas 7 a 10)

Agora vamos tocar a mesma progressão mais para o meio do braço. Novamente, observe a proximidade das tônicas:

- *G* no Shape de *C* (Tônica na 5ª corda, casa 10)
- *C* no Shape de *E* (Tônica na 6ª corda, casa 8)
- *D* no Shape de *E* (Tônica na 6ª corda, casa 10)

#align(center)[
  #grid(
    columns: 3,
    gutter: 2.5em,
    [#box(chord("x,10,9,7,8,7", name: "G (Shape C)"))],
    [#box(chord("8,10,10,9,8,8", name: "C (Shape E)"))],
    [#box(chord("10,12,12,11,10,10", name: "D (Shape E)"))],
  )
]

*Prática:* Toque ambas as sequências usando um metrônomo em um andamento lento (ex: 60 BPM). O foco não é a velocidade, mas sim a fluidez: repare como os formatos se complementam geometricamente e evitam que você dê grandes saltos pelo braço.
