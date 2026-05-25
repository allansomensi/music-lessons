#import "../../../../templates/layout.typ": *

#show: aula.with(
  instrumento: "Violão",
  nivel: "Iniciante",
)

#let sc(sym) = {
  let (bg, fg, label) = if sym == "D" {
    (color-brand-soft, color-brand, "↓")
  } else if sym == "U" {
    (color-accent-soft, rgb("#15803d"), "↑")
  } else if sym == "X" {
    (luma(215), luma(50), "✕")
  } else if sym == "d" {
    (color-brand-soft, rgb("color-brand-soft"), "↓")
  } else {
    (white, color-rule-dark, "·")
  }
  box(
    width: 24pt,
    height: 26pt,
    fill: bg,
    radius: 3pt,
    stroke: 0.5pt + color-rule-dark,
    align(center + horizon, text(fill: fg, size: 13pt, weight: "bold")[#label]),
  )
}

#let beat-label(t) = box(
  width: 24pt,
  height: 20pt,
  align(center + horizon, text(size: 8pt, weight: "bold")[#t]),
)

#let strum-row(beats, pattern) = {
  grid(
    columns: (50pt,) + range(pattern.len()).map(_ => 26pt),
    align: center + horizon,
    gutter: 2pt,
    [#text(size: 8.5pt, fill: luma(80))[#beats]],
    ..pattern.map(sc)
  )
}

#let beat-header(labels) = {
  grid(
    columns: (50pt,) + range(labels.len()).map(_ => 26pt),
    align: center + horizon,
    gutter: 2pt,
    [],
    ..labels.map(beat-label)
  )
}

= Ritmos e Batidas

A mão direita no violão é responsável pelo *ritmo* — o que mais define o estilo e a "cara" de uma música. A mesma progressão de acordes pode soar completamente diferente dependendo da batida usada.

== Conceitos Básicos

#v(0.8em)

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 1em,
  block(
    fill: color-brand-soft,
    stroke: 0.6pt + color-brand-soft,
    inset: 10pt,
    radius: 5pt,
    [
      #align(center)[#text(weight: "bold")[↓ Batida para Baixo]]
      #v(0.3em)
      #set text(size: 9pt)
      A palheta ou os dedos passam pelas cordas *de cima para baixo* (da 6ª para a 1ª corda). Geralmente cai nos tempos fortes (1, 2, 3, 4).
    ],
  ),
  block(
    fill: color-accent-soft,
    stroke: 0.6pt + rgb("#86efac"),
    inset: 10pt,
    radius: 5pt,
    [
      #align(center)[#text(weight: "bold")[↑ Batida para Cima]]
      #v(0.3em)
      #set text(size: 9pt)
      A palheta passa *de baixo para cima* (da 1ª para a 6ª corda). Geralmente cai nos contratempos ("e" ou "&").
    ],
  ),
  block(
    fill: color-subtle-bg,
    stroke: 0.5pt + color-rule-dark,
    inset: 10pt,
    radius: 5pt,
    [
      #align(center)[#text(weight: "bold")[✕ Abafado]]
      #v(0.3em)
      #set text(size: 9pt)
      A mão toca as cordas mas as abafa ao mesmo tempo, criando um som percussivo. Muito usado em funk e samba.
    ],
  ),
)

#align(center)[
  #block(
    fill: color-subtle-bg,
    stroke: 0.5pt + color-rule-dark,
    inset: 10pt,
    radius: 5pt,
    width: 78%,
    [
      Em um compasso de *4/4*, cada tempo pode ser dividido em dois: o tempo forte (1, 2, 3, 4) e o contratempo ("e" ou "&"). Uma colcheia dura metade de um tempo.
    ],
  )
]

== Batidas Essenciais

=== Batida 1 — Down-Strokes (Iniciante absoluto)

Apenas batidas para baixo em cada tempo. É a base — aprenda a manter o tempo antes de qualquer coisa.

#v(0.8em)

#align(center)[
  #beat-header(([1], [2], [3], [4]))
  #strum-row([4/4 — Simples], ("D", "D", "D", "D"))
]

=== Batida 2 — Pop/Rock Básico

A batida mais comum em músicas pop e rock. Tempos 1 e 3 mais fortes, contratempos para cima.

#v(0.8em)

#align(center)[
  #beat-header(([1], [e], [2], [e], [3], [e], [4], [e]))
  #strum-row([Pop/Rock], ("D", " ", "D", "U", "D", " ", "D", "U"))
]

=== Batida 3 — Balada / Folk

Suave e fluida. Bastante usada em músicas lentas e canciones acústicas.

#v(0.8em)

#align(center)[
  #beat-header(([1], [e], [2], [e], [3], [e], [4], [e]))
  #strum-row([Balada], ("D", " ", "D", "U", " ", "U", "D", "U"))
]

=== Batida 4 — Samba/MPB

Ritmo binário (2/4 na prática), com o acento no contratempo. Base do samba e de muito MPB.

#v(0.8em)

#align(center)[
  #beat-header(([1], [e], [2], [e], [3], [e], [4], [e]))
  #strum-row([Samba / MPB], ("D", "X", "D", "U", "X", "U", "D", "U"))
]

=== Batida 5 — Reggae

O reggae tem o acento no contratempo dos tempos 2 e 4 (o "offbeat"). As batidas são curtas e abafadas.

#v(0.8em)

#align(center)[
  #beat-header(([1], [e], [2], [e], [3], [e], [4], [e]))
  #v(4pt)
  #strum-row([Reggae], (" ", "U", "X", " ", " ", "U", "X", " "))
]

== Como Praticar

#explainer-component(
  align(center)[
    #grid(
      columns: 1,
      gutter: 0.8em,
      block(
        fill: luma(245),
        stroke: 0.5pt + color-rule-dark,
        inset: 10pt,
        radius: 4pt,
        width: 100%,
        [
          #set text(size: 9pt)
          *Passo 1* — Sem metrônomo: pratique o movimento da mão direita no ar, apenas para internalizar o padrão. \
          *Passo 2* — Com um acorde só (ex: Em): adicione o violão em ♩ = 50 BPM. \
          *Passo 3* — Com dois acordes (ex: Em → C): troque o acorde a cada compasso. \
          *Passo 4* — Acelere o metrônomo gradualmente. Não avance se a troca sair suja.
        ],
      ),
    )
  ],
  [
    O erro mais comum é *olhar para a mão direita* enquanto troca de acordes. Treine a troca de acorde sem batida primeiro — os dedos precisam saber onde ir sem precisar de sua atenção total.

    *A mão direita nunca para.* Mesmo que você não toque o acorde a tempo, mantenha o movimento da mão direita. É melhor errar o acorde do que errar o ritmo.
  ],
)

== Referências de Batida por Estilo

#align(center)[
  #table(
    columns: (1fr, 1fr, 1.5fr),
    align: center + horizon,
    stroke: 0.5pt + color-rule-dark,
    fill: (col, row) => if row == 0 { color-subtle-bg } else if calc.odd(row) { white } else { color-subtle-bg },
    [*Estilo*], [*Batida Base*], [*Referência*],
    [Pop / Rock Acústico], [Batida 2], ["Wonderwall" - Oasis, músicas do Ed Sheeran],
    [Balada / Folk], [Batida 3], ["Blackbird" intro, músicas de João Gilberto],
    [Samba / MPB], [Batida 4], [Tim Maia, Caetano Veloso, Djavan],
    [Reggae / Bob Marley], [Batida 5], ["No Woman No Cry", "Redemption Song"],
    [Bossa Nova], [Dedilhado], [João Gilberto, Tom Jobim],
  )
]

#v(1.5em)

#align(center)[
  #block(
    fill: color-brand-soft,
    stroke: 0.5pt + color-brand-soft,
    inset: 12pt,
    radius: 5pt,
    width: 80%,
    [
      *Dica:* Escolha *uma batida por semana* e domine ela antes de aprender a próxima. Toque músicas que você conhece usando essa batida. A absorção rítmica vem da repetição.
    ],
  )
]
