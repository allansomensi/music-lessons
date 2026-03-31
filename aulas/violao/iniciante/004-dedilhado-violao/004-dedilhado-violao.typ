#import "../../../../templates/layout.typ": aula, explainer-component
#import "@preview/conchord:0.4.0": new-chordgen

#show: aula.with(
  instrumento: "Violão",
  nivel: "Iniciante",
)

#let chord = new-chordgen(number-to-left: true, use-shadow-barre: false, colors: (hold: black, barre: black))

= Dedilhado

No dedilhado, cada dedo da mão direita é responsável por uma ou mais cordas específicas. O resultado é um som mais suave, melódico e íntimo do que a palheta, fundamental na Bossa Nova, MPB, Folk e música clássica.

== A Notação p-i-m-a

Os dedos recebem nomes do sistema espanhol de música, universalmente usados:

#align(center)[
  #table(
    columns: (0.5fr, 0.7fr, 1fr, 1.5fr),
    align: center + horizon,
    stroke: 0.5pt + luma(190),
    fill: (col, row) => if row == 0 { luma(232) } else if calc.odd(row) { white } else { luma(248) },
    [*Letra*], [*Dedo*], [*Nome (espanhol)*], [*Corda(s) responsável(is)*],
    [*p*], [Polegar], [_pulgar_], [6ª, 5ª e 4ª cordas (graves)],
    [*i*], [Indicador], [_índice_], [3ª corda],
    [*m*], [Médio], [_medio_], [2ª corda],
    [*a*], [Anular], [_anular_], [1ª corda],
  )
]

#v(0.6em)

#align(center)[
  #block(
    fill: luma(248),
    stroke: 0.5pt + luma(210),
    inset: 10pt,
    radius: 5pt,
    width: 80%,
    [
      O polegar *desce* sobre as cordas graves, enquanto os dedos i, m e a *sobem* nas cordas agudas. Mantenha os dedos ligeiramente curvados e toque perto da ponta das unhas (se tiver) ou da ponta da polpa do dedo.
    ],
  )
]

== Postura da Mão Direita

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 1em,
  block(
    fill: rgb("#eff6ff"),
    stroke: 0.6pt + rgb("#93c5fd"),
    inset: 10pt,
    radius: 5pt,
    [
      #align(center)[#text(weight: "bold")[✓ Punho arredondado]]
      #v(0.3em)
      #set text(size: 9pt)
      A mão forma uma curva natural, como se segurasse uma laranja. O pulso fica levemente elevado acima do tampo.
    ],
  ),
  block(
    fill: rgb("#eff6ff"),
    stroke: 0.6pt + rgb("#93c5fd"),
    inset: 10pt,
    radius: 5pt,
    [
      #align(center)[#text(weight: "bold")[✓ Dedos curvados]]
      #v(0.3em)
      #set text(size: 9pt)
      Cada dedo sobe *para dentro da mão* após tocar a corda (movimento de "beliscar"). Evite movimentos paralelos ao tampo.
    ],
  ),
  block(
    fill: rgb("#fef2f2"),
    stroke: 0.6pt + rgb("#fca5a5"),
    inset: 10pt,
    radius: 5pt,
    [
      #align(center)[#text(weight: "bold")[✗ Pulso colado no tampo]]
      #v(0.3em)
      #set text(size: 9pt)
      Apoiar o pulso no tampo limita o movimento e cansa rápido. Alguns apoiam o mínimo no cavalete — ok com moderação.
    ],
  ),
)

#pagebreak()

== Padrões de Dedilhado

Pratique cada padrão sobre um único acorde (Ex: Am) até ficar fluido, depois experimente trocar acordes mantendo o padrão.

#v(1em)

=== Padrão 1 — Arpegio Simples (p-i-m-a)

O padrão mais básico. Uma nota de cada vez, de grave para agudo.

#v(0.6em)

#align(center)[
  #block(
    fill: luma(248),
    stroke: 0.5pt + luma(200),
    inset: 12pt,
    radius: 5pt,
    width: 78%,
    [
      #set text(font: "Courier New", size: 9.5pt)
      #raw(
        lang: "text",
        block: true,
        "Am
e|--0-----0---|
B|----1-----1-|
G|------2-----|
D|--2---------|
A|--0---------|
E|------------|
   p  i  m  a",
      )
    ],
  )
]

#v(1em)

=== Padrão 2 — Baixo + Acorde (p + i-m-a)

O polegar toca o baixo, depois os três dedos tocam as cordas agudas juntos. Muito usado em canções folk e MPB.

#v(0.6em)

#align(center)[
  #block(
    fill: luma(248),
    stroke: 0.5pt + luma(200),
    inset: 12pt,
    radius: 5pt,
    width: 78%,
    [
      #set text(font: "Courier New", size: 9.5pt)
      #raw(
        lang: "text",
        block: true,
        "Am                          Em
e|--0---0-0-0---0---0-0-0---|
B|--1---1-1-1---0---0-0-0---|
G|--2---2-2-2---0---0-0-0---|
D|--2-----------2-----------|
A|--0-----------2-----------|
E|--0-----------0-----------|
   p   ima  p   ima",
      )
    ],
  )
]

=== Padrão 3 — Baixo Alternado (p-i-p-m-p-a)

O polegar alterna entre duas cordas graves, criando um efeito de "caminhada" de baixo. Base do estilo Travis picking e violão popular.

#v(0.6em)

#align(center)[
  #block(
    fill: luma(248),
    stroke: 0.5pt + luma(200),
    inset: 12pt,
    radius: 5pt,
    width: 80%,
    [
      #set text(font: "Courier New", size: 9.5pt)
      #raw(
        lang: "text",
        block: true,
        "G
e|--3-----------3---------|
B|----3-------3-----------|
G|------0---0-------------|
D|--------0-----------0---|
A|--2-----------2---------|
E|--3-----------3---------|
   p  i  p  m  p  a  p...",
      )
    ],
  )
]

#v(1.5em)

== Introdução à Bossa Nova

A batida de Bossa Nova criada por *João Gilberto* combina polegar sincopado com dedos das cordas agudas. O ritmo do polegar segue o padrão do samba, enquanto as cordas agudas criam um "contracanto".

#v(1em)

#explainer-component(
  align(center)[
    #block(
      fill: luma(248),
      stroke: 0.5pt + luma(200),
      inset: 12pt,
      radius: 5pt,
      width: 92%,
      [
        #set text(size: 9pt)
        *Divisão rítmica da Bossa Nova (1 compasso em 4/4):*
        #v(0.5em)
        #set text(font: "Courier New", size: 9pt)
        #raw(
          lang: "text",
          block: true,
          "Tempo:  1   e   2   e   3   e   4   e
Polegar: p           p       p
Dedos:       (ima)       (ima)       (ima)",
        )
        #v(0.5em)
        #set text(font: "Courier New")
        O polegar antecipa ligeiramente o tempo, criando a síncope característica.
      ],
    )
  ],
  [
    A Bossa Nova tem um swing sutil que vem da *síncope do polegar*. Não tente acertar tudo de uma vez — comece com o padrão do polegar isolado até internalizar o ritmo, depois adicione os dedos.

    #v(0.4em)
    *Referência:* "Garota de Ipanema", "Chega de Saudade" — João Gilberto.
  ],
  inverted: true,
)

#v(1.5em)

#align(center)[
  #block(
    fill: luma(248),
    stroke: 0.5pt + luma(210),
    inset: 12pt,
    radius: 5pt,
    width: 82%,
    [
      *Sobre as unhas:* guitarristas clássicos e violonistas de estilo dedicado mantêm as unhas da mão direita ligeiramente compridas para obter mais brilho e controle. Não é obrigatório, mas faz diferença no timbre. Se usar unhas, lixe-as em curva suave para não "pegar" na corda.
    ],
  )
]
