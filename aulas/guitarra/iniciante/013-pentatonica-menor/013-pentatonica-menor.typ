#import "/templates/layout.typ": *
#import "/templates/components.typ": *

#show: aula.with(
  instrumento: "Guitarra",
  nivel: "Iniciante",
)

// Exercício curto que não se divide entre páginas.
#let ex(..args, body) = block(breakable: false, width: 100%, exercicio(..args, body))

// Diagrama de posição com legenda, centralizado.
#let posicao(titulo, legenda, fs, dados) = block(breakable: false, width: 100%, align(center)[
  #text(size: 10pt, weight: "bold")[#titulo] \
  #text(size: 8.5pt, fill: color-muted)[#legenda]
  #v(0.2em)
  #braco-notas(fs: fs, dados)
])

= Escala Pentatônica Menor

A *pentatônica menor* é a escala mais usada para solar no rock, no blues, no pop e no metal. Com apenas *cinco notas* e sem semitons entre notas vizinhas, ela soa bem sobre praticamente todos os acordes de um tom menor, o que a torna a porta de entrada ideal para o improviso.

#objetivos((
  [Entender de onde vem a pentatônica menor e qual é a sua fórmula],
  [Tocar as cinco posições da escala em Lá menor, sabendo o grau de cada nota],
  [Ligar as posições ao sistema CAGED],
  [Transportar a escala para outros tons],
  [Tocar e criar frases simples começando e terminando na tônica],
))

== 1. A fórmula

A pentatônica menor é a escala menor natural *sem o 2º e o 6º graus*. Retirando essas duas notas, sobram os graus mais estáveis e característicos:

#tabela(
  columns: (2.8fr,) + (1fr,) * 7,
  ([Grau], [T], [2], [b3], [4], [5], [b6], [7]),
  (
    ([*Menor natural (Am)*], [Lá], [Si], [Dó], [Ré], [Mi], [Fá], [Sol]),
    ([*Pentatônica menor (Am)*], [*Lá*], [—], [*Dó*], [*Ré*], [*Mi*], [—], [*Sol*]),
  ),
)

#caixa(tipo: "resumo", titulo: "Fórmula")[
  *T – b3 – 4 – 5 – 7* #h(0.6em) (7 = sétima menor). Em Lá menor: *Lá – Dó – Ré – Mi – Sol*.
]

Curiosidade útil: a pentatônica de Lá menor tem exatamente as mesmas notas da pentatônica de *Dó maior* (Dó, Ré, Mi, Sol, Lá), assim como Lá menor é o relativo de Dó maior. Muda apenas a nota que funciona como tônica.

== 2. As cinco posições em Lá menor

Cada *posição* é um desenho que cobre cerca de quatro casas e duas notas por corda. Os círculos mostram o *grau* de cada nota; os pretos (T) são as tônicas (Lá). Nos diagramas, a corda de cima é a 6ª (Mi grave) e os números do topo indicam a casa.

#grid(
  columns: (1fr, 1fr, 1fr),
  column-gutter: 0.8em,
  row-gutter: 1.6em,
  posicao([Posição 1], [casas 5 a 8], 5, (
    ("T", "", "", "b3"),
    ("4", "", "5", ""),
    ("7", "", "T", ""),
    ("b3", "", "4", ""),
    ("5", "", "", "7"),
    ("T", "", "", "b3"),
  )),
  posicao([Posição 2], [casas 7 a 10], 7, (
    ("", "b3", "", "4"),
    ("5", "", "", "7"),
    ("T", "", "", "b3"),
    ("4", "", "5", ""),
    ("", "7", "", "T"),
    ("", "b3", "", "4"),
  )),
  posicao([Posição 3], [casas 9 a 13], 9, (
    ("", "4", "", "5", ""),
    ("", "7", "", "T", ""),
    ("", "b3", "", "4", ""),
    ("5", "", "", "7", ""),
    ("", "T", "", "", "b3"),
    ("", "4", "", "5", ""),
  )),

  posicao([Posição 4], [casas 12 a 15], 12, (
    ("5", "", "", "7"),
    ("T", "", "", "b3"),
    ("4", "", "5", ""),
    ("7", "", "T", ""),
    ("", "b3", "", "4"),
    ("5", "", "", "7"),
  )),
  posicao([Posição 5], [casas 2 a 5 (ou 14 a 17)], 2, (
    ("", "7", "", "T"),
    ("", "b3", "", "4"),
    ("5", "", "", "7"),
    ("T", "", "", "b3"),
    ("", "4", "", "5"),
    ("", "7", "", "T"),
  )),
  align(center + horizon, block(
    width: 100%,
    fill: color-subtle-bg,
    stroke: 0.5pt + color-rule-dark,
    inset: 10pt,
    radius: 5pt,
    align(left, text(size: 9pt)[
      A *posição 1* (a "caixa") é a mais usada. Comece com o *indicador na casa 5* e use um dedo por casa: indicador na 5, médio na 6, anelar na 7 e mínimo na 8.
    ]),
  )),
)

=== O mapa completo

As cinco posições se encaixam: as notas da direita de uma posição são as notas da esquerda da seguinte. Depois da posição 5, o desenho recomeça na posição 1, doze casas acima (casa 17).

#v(0.3em)
#align(center, braco-notas(fs: 1, casa-largura: 23pt, (
  ("", "", "7", "", "T", "", "", "b3", "", "4", "", "5", "", "", "7", "", "T"),
  ("", "", "b3", "", "4", "", "5", "", "", "7", "", "T", "", "", "b3", "", "4"),
  ("", "5", "", "", "7", "", "T", "", "", "b3", "", "4", "", "5", "", "", "7"),
  ("", "T", "", "", "b3", "", "4", "", "5", "", "", "7", "", "T", "", "", "b3"),
  ("b3", "", "4", "", "5", "", "", "7", "", "T", "", "", "b3", "", "4", "", "5"),
  ("", "", "7", "", "T", "", "", "b3", "", "4", "", "5", "", "", "7", "", "T"),
)))

== 3. Conexão com o CAGED

Cada posição da pentatônica fica "dentro" de um shape de acorde *menor* do CAGED (os shapes de Em, Dm, Cm, Am e Gm), levados para o tom de Lá menor. As tônicas da posição coincidem com as tônicas do shape:

#tabela(
  columns: (1fr, 1.1fr, 1.5fr, 1fr),
  ([Posição], [Shape (menor)], [Tônicas (Lá)], [Casas]),
  (
    ([1], [Em], [6ª, 4ª e 1ª cordas], [5–8]),
    ([2], [Dm], [4ª e 2ª cordas], [7–10]),
    ([3], [Cm], [5ª e 2ª cordas], [9–13]),
    ([4], [Am], [5ª e 3ª cordas], [12–15]),
    ([5], [Gm], [6ª, 3ª e 1ª cordas], [2–5 ou 14–17]),
  ),
)

== 4. Mudando de tom

As posições são *móveis*. Para tocar a pentatônica em outro tom, encontre a nova tônica na 6ª corda e coloque ali o primeiro dedo da posição 1; as outras posições acompanham na mesma ordem.

#tabela(
  columns: (2.2fr,) + (1fr,) * 6,
  ([Tom], [F\#m], [Gm], [Am], [Bm], [Cm], [Em]),
  (([*Casa da posição 1*], [2], [3], [5], [7], [8], [0 ou 12]),),
)

== 5. Tocando a escala

Comece pela posição 1, subindo e descendo, com palhetada alternada (para baixo e para cima) e metrônomo. Depois toque o lick ao lado, que usa só a posição 1 e termina na tônica (Lá, na 4ª corda).

#grid(
  columns: (1fr, 1fr),
  column-gutter: 1em,
  tab(
    titulo: "Posição 1 — subindo (desça ao contrário)",
    "e|---------------------5-8--|\nB|-----------------5-8------|\nG|-------------5-7----------|\nD|---------5-7--------------|\nA|-----5-7------------------|\nE|-5-8----------------------|",
  ),
  tab(
    titulo: "Lick clássico em Lá menor",
    "e|--------------------------|\nB|--8b10r8--5---------------|\nG|-------------7--5---------|\nD|-------------------7~~----|\nA|--------------------------|\nE|--------------------------|",
  ),
)

#v(0.4em)

Na tab do lick: *8b10* = bend (toque a casa 8 e empurre a corda até soar a nota da casa 10); *r8* = solte o bend de volta à casa 8; *\~\~* = vibrato.

#caixa(tipo: "dica", titulo: "Regra prática")[
  Comece e termine as frases na *tônica*. Enquanto você não sabe exatamente o que tocar, voltar para a tônica sempre soa resolvido.
]

== 6. Exercícios

#ex(titulo: "Notas da escala")[
  Escreva as cinco notas da pentatônica menor de cada tom, na ordem T – b3 – 4 – 5 – 7.

  #tabela-preencher(
    columns: (1.1fr,) + (1fr,) * 5,
    ([Tom], [T], [b3], [4], [5], [7]),
    (
      ([Em], none, none, none, none, none),
      ([Dm], none, none, none, none, none),
      ([Gm], none, none, none, none, none),
    ),
  )
]

#ex(titulo: "Qual é o grau?")[
  Todas as notas abaixo pertencem à posição 1 de Lá menor. Escreva a nota e o grau (T, b3, 4, 5 ou 7).

  #tabela-preencher(
    columns: (1.1fr,) + (1fr,) * 6,
    ([Corda / casa], [6ª / 8], [5ª / 7], [4ª / 5], [3ª / 7], [2ª / 5], [1ª / 5]),
    (
      ([Nota],) + (none,) * 6,
      ([Grau],) + (none,) * 6,
    ),
  )
]

#ex(titulo: "Desenhe a posição 1 em Sol menor")[
  A tônica de Sol menor está na casa 3 da 6ª corda. Preencha o braço com a posição 1 de Gm, escrevendo o grau dentro de cada nota.

  #v(0.3em)
  #align(center, braco-vazio(casas: 4, fs: 3, casa-largura: 30pt))
]

#ex(titulo: "Mudando de tom")[
  Em que casa da 6ª corda começa a posição 1 de cada tom?

  #tabela-preencher(
    columns: (1.3fr,) + (1fr,) * 6,
    ([Tom], [Dm], [Cm], [F\#m], [Bm], [Em], [Gm]),
    (([Casa],) + (none,) * 6,),
  )
]

#ex(titulo: "De onde vem a escala?")[
  Quais dois graus da escala menor natural são retirados para formar a pentatônica menor? Em Lá menor, quais são essas notas?

  #linhas-resposta(2)
]

#ex(titulo: "Crie o seu lick")[
  Usando apenas a posição 1 de Lá menor, escreva uma frase curta (de 6 a 10 notas) que *comece e termine na tônica*. Use pelo menos um bend ou um hammer-on. Depois toque sobre uma base de Am.

  #tab-vazia(sistemas: 2, compassos: 2)
]

=== Sugestão de prática

#rotina-estudo((
  ([Posição 1 subindo e descendo, palhetada alternada], [5 min], [60–90]),
  ([Posição 1 dizendo o grau de cada nota em voz alta], [5 min], [60]),
  ([Lick clássico e variações, sobre base de Am], [5 min], [70]),
  ([Ligar a posição 1 à posição 2 (subir em uma, descer na outra)], [5 min], [60–80]),
))

=== Autoavaliação

#checklist((
  [Sei a fórmula T – b3 – 4 – 5 – 7 e as notas de Lá menor],
  [Toco a posição 1 de cor, subindo e descendo, no tempo],
  [Sei onde estão as tônicas em cada posição],
  [Toco a posição 1 em qualquer tom a partir da 6ª corda],
  [Improviso frases curtas que começam e terminam na tônica],
))

#gabarito[
  #resposta(1)[
    Em: Mi – Sol – Lá – Si – Ré · Dm: Ré – Fá – Sol – Lá – Dó · Gm: Sol – Sib – Dó – Ré – Fá.
  ]
  #resposta(2)[
    6ª / 8 = Dó (b3) · 5ª / 7 = Mi (5) · 4ª / 5 = Sol (7) · 3ª / 7 = Ré (4) · 2ª / 5 = Mi (5) · 1ª / 5 = Lá (T).
  ]
  #resposta(3)[
    Mesmo desenho da posição 1 de Lá menor, duas casas abaixo (casas 3 a 6). Tônicas (Sol) na 6ª corda casa 3, na 4ª corda casa 5 e na 1ª corda casa 3.

    #v(0.3em)
    #align(center, braco-notas(fs: 3, casa-largura: 30pt, (
      ("T", "", "", "b3"),
      ("4", "", "5", ""),
      ("7", "", "T", ""),
      ("b3", "", "4", ""),
      ("5", "", "", "7"),
      ("T", "", "", "b3"),
    )))
  ]
  #resposta(4)[
    Dm = 10 · Cm = 8 · F\#m = 2 · Bm = 7 · Em = 0 (cordas soltas) ou 12 · Gm = 3.
  ]
  #resposta(5)[
    O 2º e o 6º graus (2 e b6). Em Lá menor: Si e Fá.
  ]
  #resposta(6)[
    Resposta pessoal. Confira se todas as notas estão na posição 1 (casas 5 a 8, conforme o diagrama) e se a primeira e a última nota são Lá (6ª corda casa 5, 4ª corda casa 7 ou 1ª corda casa 5).
  ]
]
