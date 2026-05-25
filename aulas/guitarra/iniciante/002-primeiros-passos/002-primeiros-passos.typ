#import "../../../../templates/layout.typ": *
#import "@preview/conchord:0.4.0": new-chordgen

#show: aula.with(
  instrumento: "Guitarra",
  nivel: "Iniciante",
)

#let chord = new-chordgen(number-to-left: true, use-shadow-barre: false, colors: (hold: color-ink, barre: color-ink))

= Primeiros Passos

Antes de tocar qualquer música, dois hábitos precisam ser desenvolvidos desde o início: *postura* e *mínimo de força necessária*. A guitarra elétrica perdoa mais do que o violão, as cordas são mais finas, mas os vícios posturais se formam rapidamente. Por isso é importante que seja aplicada a técnica correta desde o início a fim de evitar lesões futuras.

== A Palheta

Segure a palheta entre o *polegar e o indicador*, com apenas uma pequena ponta aparecendo. O movimento de ataque parte do *pulso*, não do cotovelo e nem do antebraço.

#align(center)[
  #grid(
    columns: (1fr, 1fr),
    gutter: 1em,
    block(
      width: 100%,
      fill: color-subtle-bg,
      stroke: 0.6pt + color-accent,
      inset: 10pt,
      radius: 5pt,
      [
        #align(center)[#text(weight: "bold", size: 10pt, fill: color-accent)[✓ Correto]]
        #v(0.4em)
        #set text(size: 9pt)
        Polegar sobre indicador. \
        Ponta curta. \
        Pulso *relaxado*. \
        Movimento vindo do pulso.
      ],
    ),
    block(
      width: 100%,
      fill: none,
      stroke: 0.6pt + color-rule-dark,
      inset: 10pt,
      radius: 5pt,
      [
        #align(center)[#text(weight: "bold", size: 10pt, fill: color-strong)[✗ Errado]]
        #v(0.4em)
        #set text(size: 9pt)
        Palheta presa com força. \
        Muita ponta exposta. \
        Pulso rígido. \
        Movimento do cotovelo/antebraço.
      ],
    ),
  )
]

== Mão Esquerda: Pressão e Postura

Pressione a corda *logo atrás do traste* (não em cima e não no meio). Use a *ponta dos dedos*, nunca a barriga, para evitar esbarrar nas cordas adjacentes. O polegar fica na parte traseira do braço, aproximadamente oposto ao dedo médio, funcionando como um ponto de apoio e não como um alicate.

#align(center)[
  #block(
    fill: color-subtle-bg,
    stroke: 0.5pt + color-rule-dark,
    inset: 12pt,
    radius: 5pt,
    width: 85%,
    [
      *Teste da nota limpa:* pressione qualquer corda e toque devagar. Se houver um trastejamento (chiado metálico), aumente levemente a pressão ou aproxime o dedo do traste. Se as cordas vizinhas abafarem quando não deveriam, ajuste a curvatura do dedo.

      Objetivo de ouro: *aplicar o mínimo de força necessária para a nota soar limpa*. Excesso de força gera tensão, lentidão e pode até desafinar a nota.
    ],
  )
]

=== Curvatura e o Formato de "C"
A mão esquerda deve assumir um formato natural e arredondado, como se você estivesse segurando uma maçã. A palma da mão *não* deve encostar na base do braço do instrumento na maior parte do tempo. Essa curvatura garante que a força venha da articulação dos dedos e não de um aperto excessivo da mão inteira, além de deixar o caminho livre para as cordas de baixo vibrarem.

=== Economia de Movimento
Um dos maiores segredos para ganhar fluidez é manter os dedos que não estão tocando *próximos à escala*. Se ao levantar um dedo você o afasta vários centímetros da corda (o famoso dedo voador), perderá uma fração de segundo valiosa para recolocá-lo, além de gastar energia à toa. Acostume-se a relaxar os dedos sobre a posição de repouso.

#pagebreak()

= Power Chords

O *Power Chord* é o acorde do rock. Usa apenas *2 notas* (Tônica e Quinta Justa) e por não ter terça, ele não é maior nem menor. Funciona perfeitamente com distorção sem soar "sujo". É a porta de entrada para centenas de músicas.

== Os 4 Shapes Essenciais

#v(0.5em)

#align(center)[
  #grid(
    columns: 4,
    gutter: 1.5em,
    align: center,
    block[
      #box(chord("0,2,2,x,x,x", name: "E5")) \
      #v(0.3em)
      #text(size: 9.5pt, weight: "bold")[E5 — Mi5] \
      #text(size: 8pt, fill: color-muted)[Tônica: 6ª corda solta]
    ],
    block[
      #box(chord("x,0,2,2,x,x", name: "A5")) \
      #v(0.3em)
      #text(size: 9.5pt, weight: "bold")[A5 — Lá5] \
      #text(size: 8pt, fill: color-muted)[Tônica: 5ª corda solta]
    ],
    block[
      #box(chord("x,x,0,2,x,x", name: "D5")) \
      #v(0.3em)
      #text(size: 9.5pt, weight: "bold")[D5 — Ré5] \
      #text(size: 8pt, fill: color-muted)[Tônica: 4ª corda solta]
    ],
    block[
      #box(chord("3,5,5,x,x,x", name: "G5")) \
      #v(0.3em)
      #text(size: 9.5pt, weight: "bold")[G5 — Sol5] \
      #text(size: 8pt, fill: color-muted)[Shape móvel — 6ª corda]
    ],
  )
]

== Movendo pelo Braço

O shape nunca muda, apenas desliza. A nota que o *indicador pressiona na corda mais grave* é a tônica do acorde.

#align(center)[
  #table(
    columns: (1.3fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
    align: center + horizon,
    stroke: 0.4pt + color-rule-dark,
    fill: (col, row) => if row == 0 or col == 0 { color-subtle-bg } else { white },
    inset: (x: 4pt, y: 5pt),
    [*Corda / Casa*], [1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12],
    [*6ª corda (E)*], [F5], [F\#5], [G5], [Ab5], [A5], [Bb5], [B5], [C5], [C\#5], [D5], [Eb5], [E5],
    [*5ª corda (A)*], [Bb5], [B5], [C5], [C\#5], [D5], [Eb5], [E5], [F5], [F\#5], [G5], [Ab5], [A5],
  )
]

== Palm Mute

O *Palm Mute* cria aquele som percussivo e abafado característico do rock e metal. A lateral da mão direita (a parte abaixo do dedo mínimo) repousa *levemente* sobre as cordas, próximo à ponte.

#explainer-component(
  align(center)[
    #block(
      fill: color-subtle-bg,
      stroke: 0.5pt,
      inset: 14pt,
      radius: 5pt,
      width: 90%,
      [
        #set text(size: 9.5pt)
        #grid(
          columns: (1fr, 1fr),
          gutter: 1em,
          block(
            fill: none,
            stroke: 0.5pt + color-accent,
            inset: 8pt,
            radius: 4pt,
            [
              *Próximo à ponte* \
              Som mais *aberto* \
              e brilhante
            ],
          ),
          block(
            fill: none,
            stroke: 0.5pt + color-rule-dark,
            inset: 8pt,
            radius: 4pt,
            [
              *Longe da ponte* \
              Som mais *abafado* \
              e percussivo
            ],
          ),
        )
      ],
    )
  ],
  [
    O contato da mão deve ser *muito leve*, a corda ainda precisa vibrar. Se o som ficar completamente mudo, você está pressionando demais.

    Na tablatura, o Palm Mute é indicado com *P.M.* ou *P.M.---* abaixo das notas afetadas.
  ],
)

= Exercício

Progressão *E5 - G5 - A5 - G5* com Palm Mute nos tempos 1 e 2 de cada compasso. Metrônomo em *♩ = 60 BPM*. Foco total na limpeza, não na velocidade.

#v(1em)

#align(center)[
  #block(
    fill: color-subtle-bg,
    stroke: 0.5pt + color-rule-dark,
    inset: 14pt,
    radius: 5pt,
    width: 90%,
    [
      #set text(font: "Courier New", size: 9pt)
      #raw(
        lang: "text",
        block: true,
        "    E5                G5                A5                G5
P.M.-----          P.M.----          P.M.----          P.M.----
e|-----------------|-----------------|-----------------|-----------------|
B|-----------------|-----------------|-----------------|-----------------|
G|-----------------|-----------------|-----------------|-----------------|
D|-----------------|-----------------|-----------------|-----------------|
A|--2---2---2---2--|--5---5---5---5--|--7---7---7---7--|--5---5---5---5--|
E|--0---0---0---0--|--3---3---3---3--|--5---5---5---5--|--3---3---3---3--|",
      )
    ],
  )
]
