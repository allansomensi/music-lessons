#import "../../../../templates/layout.typ": *
#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node

#show: aula.with(
  instrumento: "Guitarra",
  nivel: "Intermediário",
)

= Modos Gregos

Os *modos gregos* são 7 escalas derivadas da escala maior. Cada modo começa em um grau diferente da mesma escala, o que altera a sequência de tons e semitons e, consequentemente, o *caráter sonoro* do modo. Não são escalas completamente diferentes, são perspectivas diferentes das mesmas notas.

#v(2em)

#align(center)[
  #diagram(
    spacing: (18mm, 18mm),
    node-stroke: 0.5pt + color-rule-dark,
    node-shape: rect,

    node((0, 0), [Escala Maior], fill: color-subtle-bg),
    node((1, -1.5), [I — *Jônico*], fill: white),
    node((1, -0.9), [II — *Dórico*], fill: white),
    node((1, -0.3), [III — *Frígio*], fill: white),
    node((1, 0.3), [IV — *Lídio*], fill: white),
    node((1, 0.9), [V — *Mixolídio*], fill: white),
    node((1, 1.5), [VI — *Eólio*], fill: white),
    node((1, 2.1), [VII — *Lócrio*], fill: white),

    edge((0, 0), (1, -1.5), "->"),
    edge((0, 0), (1, -0.9), "->"),
    edge((0, 0), (1, -0.3), "->"),
    edge((0, 0), (1, 0.3), "->"),
    edge((0, 0), (1, 0.9), "->"),
    edge((0, 0), (1, 1.5), "->"),
    edge((0, 0), (1, 2.1), "->"),
  )
]

#v(2em)

== Os 7 Modos — Visão Completa

Todos derivados de C Maior (C D E F G A B), cada modo começando em uma nota diferente:

#v(1em)

#align(center)[
  #table(
    columns: (0.4fr, 1fr, 1.2fr, 1fr, 0.7fr, 1.8fr),
    align: center + horizon,
    stroke: 0.5pt + color-rule-dark,
    fill: (col, row) => if row == 0 { color-subtle-bg } else if calc.odd(row) { white } else { luma(245) },
    [*Grau*], [*Modo*], [*Notas (em C)*], [*Fórmula*], [*Tipo*], [*Caráter*],
    [I], [Jônico], [C D E F G A B], [T T ½ T T T ½], [Maior], [Alegre, brilhante],
    [II], [Dórico], [D E F G A B C], [T ½ T T T ½ T], [Menor], [Jazz-funk, suave],
    [III], [Frígio], [E F G A B C D], [½ T T T ½ T T], [Menor], [Espanhol, Flamenco, Árabe],
    [IV], [Lídio], [F G A B C D E], [T T T ½ T T ½], [Maior], [Místico, sonhador, etéreo],
    [V], [Mixolídio], [G A B C D E F], [T T ½ T T ½ T], [Maior], [Blues, rock, country],
    [VI], [Eólio], [A B C D E F G], [T ½ T T ½ T T], [Menor], [Melancólico, expressivo],
    [VII], [Lócrio], [B C D E F G A], [½ T T ½ T T T], [Dim.], [Instável, dissonante],
  )
]

#pagebreak()

== Os 3 Modos Mais Usados na Prática

=== Dórico — O Modo Menor do Jazz e do Rock

O Dórico é um modo menor com a *6ª maior* (não bemolizada). Isso o torna mais "aberto" e luminoso que o eólio. É o modo favorito do jazz-fusion e do rock progressivo.

#v(0.8em)

#grid(
  columns: (1fr, 1fr),
  gutter: 1.5em,
  block(
    fill: color-subtle-bg,
    stroke: 0.5pt + color-rule-dark,
    inset: 12pt,
    radius: 5pt,
    [
      *Fórmula:* T – b3 – 4 – 5 – *6* – b7 \
      #v(0.4em)
      *Em A Dórico:* A B C D E *F\#* G \
      #v(0.4em)
      #text(
        size: 9pt,
      )[A diferença do A Eólio (Am natural) é o F\# em vez de F. Esse meio tom faz toda a diferença na cor do modo.]
    ],
  ),
  block(
    fill: color-subtle-bg,
    stroke: 0.5pt + color-rule-dark,
    inset: 12pt,
    radius: 5pt,
    [
      *Sobre qual acorde usar:* acorde *menor* em um contexto de jazz, funk ou modal. \
      #v(0.4em)
      *Referências:* "So What" (Miles Davis), "Smoke on the Water" (Deep Purple), "Oye Como Va" (Santana).
    ],
  ),
)

#v(1.5em)

=== Frígio — O Modo Flamenco e Metal

O Frígio começa com um *semitom* (b2), dando-lhe um caráter espanhol, árabe e sombrio. É muito usado no metal e no flamenco.

#v(0.8em)

#grid(
  columns: (1fr, 1fr),
  gutter: 1.5em,
  block(
    fill: color-subtle-bg,
    stroke: 0.5pt + color-rule-dark,
    inset: 12pt,
    radius: 5pt,
    [
      *Fórmula:* T – *b2* – b3 – 4 – 5 – b6 – b7 \
      #v(0.4em)
      *Em E Frígio:* E *F* G A B C D \
      #v(0.4em)
      #text(
        size: 9pt,
      )[A segunda menor (b2) é o elemento definidor — cria aquela tensão característica no início da escala.]
    ],
  ),
  block(
    fill: color-subtle-bg,
    stroke: 0.5pt + color-rule-dark,
    inset: 12pt,
    radius: 5pt,
    [
      *Sobre qual acorde usar:* acorde *menor* — especialmente quando há movimento Im → bII. \
      #v(0.4em)
      *Referências:* "Eruption" intro (Van Halen), músicas de Flamenco, "War" (Joe Satriani), Metallica (riffs em modo frígio).
    ],
  ),
)

#v(1.5em)

=== Mixolídio — O Modo do Rock e Blues

O Mixolídio é idêntico ao modo maior, mas com a *7ª bemolizada* (b7). É o som do blues-rock, do country e do rock clássico — "maior com aquele gostinho de blues".

#v(0.8em)

#grid(
  columns: (1fr, 1fr),
  gutter: 1.5em,
  block(
    fill: color-subtle-bg,
    stroke: 0.5pt + color-rule-dark,
    inset: 12pt,
    radius: 5pt,
    [
      *Fórmula:* T – 2 – 3 – 4 – 5 – 6 – *b7* \
      #v(0.4em)
      *Em G Mixolídio:* G A B C D E *F* \
      #v(0.4em)
      #text(
        size: 9pt,
      )[O Fá natural (b7) cria a sensação do acorde dominante G7 — exatamente por isso soa tão bem sobre acordes maiores no blues.]
    ],
  ),
  block(
    fill: color-subtle-bg,
    stroke: 0.5pt + color-rule-dark,
    inset: 12pt,
    radius: 5pt,
    [
      *Sobre qual acorde usar:* acorde *maior* ou *dominante 7* (I7 em progressões de blues). \
      #v(0.4em)
      *Referências:* "Sweet Home Chicago" (blues), "Norwegian Wood" (Beatles), solos de Carlos Santana, músicas de country.
    ],
  ),
)

#pagebreak()

== Como Pensar os Modos na Prática

Há duas formas de enxergar modos. A forma *relativa* parte das notas de C Maior. A forma *paralela* é mais útil para improvisar:

#v(0.8em)

#align(center)[
  #table(
    columns: (1fr, 1.5fr, 2fr),
    align: center + horizon,
    stroke: 0.5pt + color-rule-dark,
    fill: (col, row) => if row == 0 { color-subtle-bg } else if calc.odd(row) { white } else { color-subtle-bg },
    [*Modo*], [*Pensamento Relativo*], [*Pensamento Paralelo (mais útil)*],
    [Dórico], [Escala de C Maior começando em D], [Menor natural com a 6ª elevada],
    [Frígio], [Escala de C Maior começando em E], [Menor natural com a 2ª bemolizada],
    [Lídio], [Escala de C Maior começando em F], [Maior com a 4ª aumentada],
    [Mixolídio], [Escala de C Maior começando em G], [Maior com a 7ª bemolizada],
  )
]

#v(1.5em)

#caixa-destaque(width: 85%)[
  *Dica prática:* Para improvisar em modo Dórico, *não* pense "vou tocar a escala de C Maior começando em D". Pense: *"estou em Am, mas uso a 6ª maior (F\#) quando quiser aquela cor jazzística"*. O pensamento paralelo conecta o modo diretamente ao acorde que você está tocando.
]
