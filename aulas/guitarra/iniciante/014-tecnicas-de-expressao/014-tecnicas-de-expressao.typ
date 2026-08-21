#import "../../../../templates/layout.typ": *

#show: aula.with(
  instrumento: "Guitarra",
  nivel: "Iniciante",
)

= Técnicas de Expressão

A guitarra elétrica tem uma vantagem única: a capacidade de *dobrar e prolongar notas* de formas que outros instrumentos não conseguem. Essas técnicas são o que transforma uma série de notas em uma frase musical com emoção e personalidade.

== Legato: Hammer-on e Pull-off

O *legato* conecta notas com fluidez, sem que a palheta precise tocar cada nota individualmente. O resultado é um som mais suave e rápido.

#grid(
  columns: (1fr, 1fr),
  gutter: 1.5em,
  block(
    width: 100%,
    fill: color-subtle-bg,
    stroke: 0.5pt + color-rule-dark,
    inset: 12pt,
    radius: 5pt,
    [
      #align(center)[#text(weight: "bold", size: 11pt)[Hammer-on (H)]]
      #set text(size: 9.5pt)
      Toque a primeira nota com a palheta. Em seguida, *"martele"* a próxima casa (sem usar a palheta) com força suficiente para a nota soar por si só.
      #v(0.5em)
      *Na tablatura:* `5h7` significa tocar a casa 5 e martelar a 7.
    ],
  ),
  block(
    width: 100%,
    fill: color-subtle-bg,
    stroke: 0.5pt + color-rule-dark,
    inset: 12pt,
    radius: 5pt,
    [
      #align(center)[#text(weight: "bold", size: 11pt)[Pull-off (P)]]
      #set text(size: 9.5pt)
      Pressione *dois dedos simultâneos*. Toque a nota mais aguda com a palheta. Em seguida, *puxe* o dedo de cima para baixo, fazendo a nota mais grave soar.
      #v(0.5em)
      *Na tablatura:* `7p5` significa tocar a casa 7 e fazer pull-off para a 5.
    ],
  ),
)

#align(center)[
  #block(
    fill: white,
    stroke: 0.5pt + color-rule-dark,
    inset: 12pt,
    radius: 5pt,
    width: 60%,
    [
      #set text(font: "Courier New", size: 9pt)
      #raw(
        lang: "text",
        block: true,
        "Exercício de H.O. + P.O.:
e|--5h7p5--7p5-5h7--|
B|------------------|
G|------------------|",
      )
    ],
  )
]

== Bend

O *bend* estica a corda, elevando a afinação em tempo real. É a técnica mais expressiva da guitarra elétrica, permite "cantar" dentro das notas.

#align(center)[
  #table(
    columns: (1.2fr, 0.8fr, 2fr, 1.5fr),
    align: center + horizon,
    stroke: 0.5pt + color-rule-dark,
    fill: (col, row) => if row == 0 { color-subtle-bg } else if calc.odd(row) { white } else { color-subtle-bg },
    [*Tipo*], [*Símbolo*], [*Descrição*], [*Aplicação*],
    [Meio Bend], [½B], [Sobe 1 semitom (1 casa)], [Blues, expressão sutil],
    [Bend Inteiro], [B ou 1B], [Sobe 1 tom (2 casas)], [Rock, bluesy, clássico],
    [Bend e Release], [B\&R], [Sobe e desce na mesma nota], [Frase completa, melódico],
    [Pre-Bend], [PB], [Dobra antes de tocar], [Efeito surpresa],
    [Unison Bend], [UB], [Dobra uma corda, outra já na nota alvo], [Rock pesado, épico],
  )
]

Use *dois ou três dedos* para dobrar (ex: anelar apoiado por médio e indicador). Toda a força vem do pulso girando, não só dos dedos.

Para verificar se seu bend está afinado, toque a nota alvo primeiro (ex: casa 7), depois faça o bend a partir da casa 5. Ambas devem soar *idênticas*.

#v(1em)

#caixa-destaque(width: 85%)[
  *Dica:* Encordoamento .009 (tensão super leve) facilita muito os bends. Com encordoamentos .011 ou .012 você precisa de mais força na mão esquerda (e mais calos).
]

#pagebreak()

== Vibrato

O *vibrato* é uma oscilação rítmica da afinação que *sustenta e anima* uma nota longa. É a assinatura pessoal do guitarrista e cada um desenvolve o seu com o tempo.

#v(0.5em)

#grid(
  columns: (1fr, 1fr),
  gutter: 1.5em,
  block(
    width: 100%,
    fill: color-subtle-bg,
    stroke: 0.5pt + color-rule-dark,
    inset: 12pt,
    radius: 5pt,
    [
      #align(center)[#text(weight: "bold", size: 10.5pt)[Vibrato de Pulso]]
      #v(0.5em)
      #set text(size: 9.5pt)
      O pulso *gira* suavemente, fazendo o dedo empurrar e soltar a corda repetidamente. É o vibrato mais natural e musical.
    ],
  ),
  block(
    width: 100%,
    fill: color-subtle-bg,
    stroke: 0.5pt + color-rule-dark,
    inset: 12pt,
    radius: 5pt,
    [
      #align(center)[#text(weight: "bold", size: 10.5pt)[Vibrato Clássico]]
      #v(0.5em)
      #set text(size: 9.5pt)
      O dedo se move *paralelo às casas*. Vibrato mais suave, muito usado na música clássica e por violinistas.
    ],
  ),
)

#v(1.5em)

== Slide

O *slide* conecta duas notas deslizando o dedo pelo braço, mantendo a pressão na corda. O som é contínuo e fluido, sem interrupção entre as notas.

#v(0.5em)

#align(center)[
  #grid(
    columns: (1fr, 1fr),
    gutter: 2em,
    block(
      fill: color-subtle-bg,
      stroke: 0.5pt + color-rule-dark,
      inset: 12pt,
      radius: 5pt,
      [
        #align(center)[#text(weight: "bold", size: 10.5pt)[Slide de Dedo]]
        #set text(size: 9.5pt)
        Toque a nota de origem com a palheta e *deslize o dedo* até o destino, mantendo a pressão. O destino soa sem nova palhetada.
        #v(0.4em)
        *Na tablatura:* `5/7` (slide para cima) ou `7\5` (slide para baixo)
      ],
    ),
    block(
      fill: color-subtle-bg,
      stroke: 0.5pt + color-rule-dark,
      inset: 12pt,
      radius: 5pt,
      [
        #align(center)[#text(weight: "bold", size: 10.5pt)[Slide com Bottleneck]]
        #set text(size: 9.5pt)
        Um tubo de vidro ou metal desliza sobre as cordas. Produz um som vocal, impossível de replicar de outra forma.
      ],
    ),
  )
]

#v(2em)

= Exercício

#align(center)[
  #block(
    fill: color-subtle-bg,
    stroke: 0.5pt + color-rule-dark,
    inset: 14pt,
    radius: 5pt,
    width: 88%,
    [
      #set text(font: "Courier New", size: 9pt)
      #raw(
        lang: "text",
        block: true,
        "Frase com todas as técnicas:
e|--8b(9)-------5h7p5--|
B|---------------------|
G|---------7/9---------|  vib~
D|---------------------|
A|---------------------|
E|---------------------|
   bend  slide  H.O P.O   vibrato",
      )
    ],
  )
]

#v(1.5em)

#caixa-destaque(width: 85%)[
  *Conceito fundamental:* Não é a velocidade que torna uma frase musical — é a *intenção*. Uma nota longa com vibrato e bend bem afinado comunica mais do que 20 notas rápidas sem expressão.
]
