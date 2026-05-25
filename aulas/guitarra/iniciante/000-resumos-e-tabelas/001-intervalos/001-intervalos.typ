#import "/templates/layout.typ": *

#show: aula.with(
  instrumento: "Guitarra / Violão",
  nivel: "Teoria Musical",
)

= Resumo de Intervalos Musicais

Este guia serve como material de apoio e consulta rápida para o estudo de formação de acordes, percepção harmônica, mapeamento do braço, etc.

#v(1em)

== 1. A Escala Cromática

A escala cromática contém todas as 12 notas disponíveis na música ocidental, distanciadas por intervalos de exatamente 1 semitom (o que equivale a 1 casa no braço do instrumento).

#align(center)[
  #block(
    fill: color-subtle-bg,
    stroke: 0.5pt + color-rule-dark,
    inset: 12pt,
    radius: 4pt,
    text(weight: "bold", size: 11pt)[
      C #h(4pt) → #h(4pt) C\# → #h(4pt) D #h(4pt) → #h(4pt) D\# → #h(4pt) E #h(4pt) → #h(4pt) F #h(4pt) → #h(4pt) F\# → #h(4pt) G #h(4pt) → #h(4pt) G\# → #h(4pt) A #h(4pt) → #h(4pt) A\# → #h(4pt) B
    ],
  )
]

#v(1em)

== 2. Tabela Geral de Intervalos (Simples)

Abaixo estão listados os intervalos simples dentro do limite de uma oitava, utilizando a nota *C (Dó)* como nossa Tônica (T) fixa de referência:

#align(center)[
  #table(
    columns: (1fr, 2.5fr, 1.2fr),
    stroke: 0.5pt + color-rule-dark,
    fill: (col, row) => if row == 0 { color-subtle-bg } else if calc.odd(row) { white } else { color-subtle-bg },
    align: center + horizon,
    [*Semitons*], [*Nome do Intervalo*], [*Abreviação*],
    [0], [Tônica], [T],
    [1], [Segunda Menor], [b2 / \#T],
    [2], [Segunda Maior], [2],
    [3], [Terça Menor], [b3],
    [4], [Terça Maior], [3],
    [5], [Quarta Justa], [4],
    [6], [Quarta Aumentada / Quinta Diminuta], [\#4 / b5],
    [7], [Quinta Justa], [5],
    [8], [Quinta Aumentada / Sexta Menor], [\#5 / b6],
    [9], [Sexta Maior / Sétima Diminuta], [6 / b7],
    [10], [Sétima Menor], [7],
    [11], [Sétima Maior], [7M / maj7 / 7+ / $triangle$],
    [12], [Oitava Justa], [8],
  )
]

#pagebreak()

== 3. Intervalos Compostos: A Regra do "+ 7"

Quando as notas ultrapassam a primeira oitava (passando do limite da 8ª justa), elas passam a ser chamadas de *intervalos compostos* (conhecidas na prática como as extensões ou tensões do acorde).

Para descobrir visual e matematicamente qual intervalo simples corresponde à tensão na oitava superior, basta usar a regra de *somar 7*:

#v(1em)

#align(center)[
  #block(
    stroke: 1pt + color-brand-soft,
    inset: 15pt,
    radius: 6pt,
    width: 100%,
    [
      #grid(
        columns: (1fr, 1fr, 1fr),
        align: center + horizon,
        gutter: 1em,
        [
          #text(weight: "bold", size: 16pt, fill: color-brand)[2ª]           #text(
            size: 10pt,
            fill: color-secondary,
          )[Intervalo Simples]           #v(0.6em)
          #text(weight: "bold", size: 12pt, fill: color-accent)[\+ 7]           #v(0.6em)
          #text(weight: "bold", size: 16pt, fill: color-brand)[9ª]           #text(
            size: 10pt,
            fill: color-secondary,
          )[Nona]
        ],
        [
          #text(weight: "bold", size: 16pt, fill: color-brand)[4ª]           #text(
            size: 10pt,
            fill: color-secondary,
          )[Intervalo Simples]           #v(0.6em)
          #text(weight: "bold", size: 12pt, fill: color-accent)[\+ 7]           #v(0.6em)
          #text(weight: "bold", size: 16pt, fill: color-brand)[11ª]           #text(
            size: 10pt,
            fill: color-secondary,
          )[Décima Primeira]
        ],
        [
          #text(weight: "bold", size: 16pt, fill: color-brand)[6ª]           #text(
            size: 10pt,
            fill: color-secondary,
          )[Intervalo Simples]           #v(0.6em)
          #text(weight: "bold", size: 12pt, fill: color-accent)[\+ 7]           #v(0.6em)
          #text(weight: "bold", size: 16pt, fill: color-brand)[13ª]           #text(
            size: 10pt,
            fill: color-secondary,
          )[Décima Terceira]
        ],
      )
    ],
  )
]

#v(1em)
*Nota Prática:* No braço do instrumento, a nota possui o mesmo nome técnico e a mesma posição física relativa, mas sua nomenclatura muda na análise harmônica para sinalizar que ela atua como uma extensão superior sobreposta à tétrade base.

== 4. Exemplos de Acordes Analisados

Veja abaixo a aplicação real dessa soma e distribuição de intervalos na estruturação de três tipos comuns de acordes:

#v(1em)

#block(
  fill: color-subtle-bg,
  stroke: (left: 4pt + color-brand),
  inset: (x: 15pt, y: 12pt),
  width: 100%,
  radius: (right: 4pt),
  [
    *1. C7M(9) — Acorde de Dó Maior com Sétima Maior e Nona*
    #v(0.3em)
    • *Notas:* C — E — G — B — D \
    • *Intervalos:* T — 3 — 5 — 7M — 9
  ],
)

#v(1.2em)

#block(
  fill: color-subtle-bg,
  stroke: (left: 4pt + color-brand-soft),
  inset: (x: 15pt, y: 12pt),
  width: 100%,
  radius: (right: 4pt),
  [
    *2. Am7(11) — Acorde de Lá Menor com Sétima e Décima Primeira*
    #v(0.3em)
    • *Notas:* A — C — E — G — D \
    • *Intervalos:* T — b3 — 5 — 7 — 11
  ],
)

#v(1.2em)

#block(
  fill: color-subtle-bg,
  stroke: (left: 4pt + color-accent),
  inset: (x: 15pt, y: 12pt),
  width: 100%,
  radius: (right: 4pt),
  [
    *3. G7(b13) — Acorde de Sol Maior com Sétima e Décima Terceira Menor*
    #v(0.3em)
    • *Notas:* G — B — D — F — Eb \
    • *Intervalos:* T — 3 — 5 — 7 — b13
  ],
)
