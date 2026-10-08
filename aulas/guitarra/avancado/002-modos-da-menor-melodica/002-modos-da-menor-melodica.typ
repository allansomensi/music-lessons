#import "/templates/layout.typ": *
#import "/templates/components.typ": *
#import "@preview/conchord:0.4.0": new-chordgen

#show: aula.with(
  instrumento: "Guitarra",
  nivel: "Avançado",
)

#let chord = new-chordgen(number-to-left: true, use-shadow-barre: false, colors: (hold: black, barre: black))
#show <chord>: set text(fill: color-strong, weight: "bold")

#show table: set par(justify: false)

// Caixa que não se parte entre duas páginas.
#let caixa-f(..args) = block(breakable: false, width: 100%, caixa(..args))

// Tabela que não se separa do cabeçalho na quebra de página.
#let tabela-f(..args) = block(breakable: false, width: 100%, tabela(..args))

// Grade compacta de diagramas: acorde (nome no diagrama), título e vozes.
#let acordes(items, columns: 4) = align(center, grid(
  columns: (1fr,) * columns,
  row-gutter: 1.1em,
  align: center,
  ..items.map(item => block(breakable: false)[
    #box(chord(item.tabs, name: item.nome))
    #v(0.15em)
    #text(size: 9.5pt, weight: "bold")[#item.titulo] \
    #text(size: 8pt, fill: color-muted)[#item.detalhe]
  ]),
))

// Braço com legenda abaixo.
#let braco-legenda(dados, fs: 1, legenda: none) = block(breakable: false, width: 100%)[
  #align(center, braco-notas(dados, fs: fs))
  #if legenda != none {
    v(0.2em)
    align(center, text(size: 8.5pt, fill: color-muted, legenda))
  }
]

= Modos da Menor Melódica

Se a escala maior é a "mãe" da harmonia diatônica, a *menor melódica* é a mãe da harmonia do jazz moderno. Dos seus sete modos saem os sons que definem o vocabulário de Bill Evans, Herbie Hancock, Pat Metheny e de boa parte da MPB instrumental: o lídio dominante, o lócrio \#2 e, principalmente, a escala *alterada*. A boa notícia é que você não precisa decorar sete escalas novas: basta dominar uma — a menor melódica — e saber *de onde* partir.

#objetivos((
  [Conhecer a menor melódica do jazz e o seu campo harmônico],
  [Conhecer os sete modos: fórmula, notas e acorde típico de cada um],
  [Saber qual modo usar sobre cada acorde — e achá-lo pelo atalho da menor melódica],
  [Tocar a menor melódica e a escala alterada no braço],
  [Aplicar os modos no II-V-I menor: Dm7(b5) – G7alt – Cm(7M)],
))

== 1. A menor melódica do jazz

Na música erudita, a menor melódica sobe com a 6ª e a 7ª elevadas e desce como menor natural. No jazz e na música popular, ela é usada *igual nos dois sentidos* — é dessa versão, chamada *menor melódica do jazz*, que vamos derivar os modos. Em Dó:

#v(0.3em)

#caixa-destaque(width: 80%)[
  #align(center)[
    #text(size: 13pt, weight: "bold")[C – D – Eb – F – G – A – B] \
    #v(0.2em)
    #text(size: 10pt)[Fórmula: T – 2 – b3 – 4 – 5 – 6 – 7M #h(1em) · #h(1em) Distâncias: T – ST – T – T – T – T – ST]
  ]
]

#v(0.4em)

Duas leituras ajudam a memorizá-la: ela é uma *escala maior com a 3ª abaixada* (C maior com Eb) e também um *dórico com 7ª maior* (C dórico com B). Compare:

#v(0.3em)

#tabela-f(
  columns: (1.4fr, 0.5fr, 0.5fr, 0.5fr, 0.5fr, 0.5fr, 0.5fr, 0.5fr, 1.3fr),
  ([Escala (em Dó)], [1], [2], [3], [4], [5], [6], [7], [Diferença]),
  (
    ([Maior (jônio)], [C], [D], [E], [F], [G], [A], [B], [—]),
    ([Dórico], [C], [D], [Eb], [F], [G], [A], [Bb], [—]),
    ([*Menor melódica*], [C], [D], [*Eb*], [F], [G], [A], [*B*], [b3 da maior; 7M do dórico]),
    ([Menor harmônica], [C], [D], [Eb], [F], [G], [Ab], [B], [b6 no lugar da 6]),
  ),
)

#v(0.4em)

Empilhando terças sobre cada grau, obtemos o campo harmônico da menor melódica em Dó: *Cm(7M) – Dm7 – Eb7M(\#5) – F7 – G7 – Am7(b5) – Bm7(b5)*. Repare em três fatos que vão importar: há *dois acordes dominantes* (F7 e G7), *dois meio-diminutos* (Aø e Bø) e nenhuma "nota a evitar" séria sobre a tônica — por isso Cm(7M) e Cm6 soam tão estáveis.

#caixa-f(tipo: "atencao", titulo: "Cifragem")[
  Neste material, o acorde menor com 7ª maior é escrito *Cm(7M)*; você também vai encontrar Cm7M, Cm(maj7) e Cm(Δ7) — é sempre o mesmo tipo de acorde.
]

== 2. Os sete modos

Cada modo começa num grau da menor melódica de Dó e usa *as mesmas sete notas*. A tabela mostra o nome, as notas e o acorde que o jazz associa a cada um.

#v(0.3em)

#tabela-f(
  columns: (0.5fr, 1.3fr, 1.8fr, 1.9fr, 1.3fr),
  ([Grau], [Modo], [Notas], [Fórmula], [Acorde típico]),
  (
    ([I], [Menor melódica], [C D Eb F G A B], [T 2 b3 4 5 6 7M], [Cm(7M), Cm6]),
    ([II], [Dórico b2], [D Eb F G A B C], [T b2 b3 4 5 6 b7], [D7sus4(b9)]),
    ([III], [Lídio aumentado], [Eb F G A B C D], [T 2 3 \#4 \#5 6 7M], [Eb7M(\#5)]),
    ([IV], [Lídio dominante], [F G A B C D Eb], [T 2 3 \#4 5 6 b7], [F7(\#11)]),
    ([V], [Mixolídio b6], [G A B C D Eb F], [T 2 3 4 5 b6 b7], [G7(b13)]),
    ([VI], [Lócrio \#2], [A B C D Eb F G], [T 2 b3 4 b5 b6 b7], [Am7(b5) com 9 · Aø(9)]),
    ([VII], [Alterado (superlócrio)], [B C D Eb F G A], [T b9 \#9 3 b5 b13 b7], [B7alt]),
  ),
)

#v(0.4em)

#cartoes-info(columns: (1fr, 1fr), (
  (titulo: "I · Menor melódica", corpo: [A tônica menor do jazz e da bossa nova. A 6ª maior e a 7ª maior dão um menor "luminoso", sem o peso da b6. Acordes: Cm(7M), Cm6, Cm6(9).]),
  (titulo: "II · Dórico b2", corpo: [Também chamado frígio \#6. Embora contenha a b3 (F), o acorde característico é o *D7sus4(b9)* (D G A C Eb): a 4ª substitui a 3ª e a b9 dá a cor frígia. Som do jazz modal.]),
  (titulo: "III · Lídio aumentado", corpo: [Um lídio com a 5ª aumentada. Acorde: *Eb7M(\#5)* (Eb G B D) — que soa como uma tríade de G maior sobre baixo Eb (G/Eb). Substitui a tônica maior com uma cor "suspensa".]),
  (titulo: "IV · Lídio dominante", corpo: [Mixolídio com \#4 (ou lídio com b7). Acorde: *F7(\#11)*. É a escala dos dominantes que *não* resolvem uma 5ª abaixo: SubV, II7, bVII7, IV7 do tom menor.]),
  (titulo: "V · Mixolídio b6", corpo: [Mixolídio com a 6ª abaixada (também mixolídio b13). Acorde: *G7(b13)* ou G7(9 b13). É o dominante do tom menor com 9ª natural.]),
  (titulo: "VI · Lócrio #2", corpo: [Lócrio com a 2ª maior. Acorde: *Aø(9)*. A 9ª natural (B) suaviza o meio-diminuto — é a escala padrão para o IIø do II-V-I menor.]),
))

#v(0.6em)

#block(breakable: false)[
  #cartoes-info(columns: (1fr,), (
    (titulo: "VII · Alterado (superlócrio)", corpo: [Escrito como lócrio, seria B C D Eb F G A (T b2 b3 b4 b5 b6 b7). Mas o jazz o lê como *dominante*: Eb é enarmônico de D\#, a *3ª maior* de B; A é a *b7*. Restam C (b9), D (\#9), F (b5/\#11) e G (b13/\#5): *todas* as tensões do dominante aparecem alteradas — daí o nome. Acorde: *B7alt*. É a escala de máxima tensão antes de uma resolução.]),
  ))
]

== 3. Os modos a partir de Dó

Para tocar sobre um acorde de Dó, você precisa do modo *começando em Dó*. A tabela mostra os sete modos com tônica C (modos paralelos) e de qual menor melódica cada um vem.

#v(0.3em)

#tabela-f(
  columns: (1.3fr, 1.8fr, 1.8fr, 1.1fr, 1.2fr),
  ([Modo], [Fórmula], [Em Dó], [Vem de], [Acorde]),
  (
    ([Menor melódica], [T 2 b3 4 5 6 7M], [C D Eb F G A B], [C mel.], [Cm(7M), Cm6]),
    ([Dórico b2], [T b2 b3 4 5 6 b7], [C Db Eb F G A Bb], [Bb mel.], [C7sus4(b9)]),
    ([Lídio aumentado], [T 2 3 \#4 \#5 6 7M], [C D E F\# G\# A B], [A mel.], [C7M(\#5)]),
    ([Lídio dominante], [T 2 3 \#4 5 6 b7], [C D E F\# G A Bb], [G mel.], [C7(\#11)]),
    ([Mixolídio b6], [T 2 3 4 5 b6 b7], [C D E F G Ab Bb], [F mel.], [C7(b13)]),
    ([Lócrio \#2], [T 2 b3 4 b5 b6 b7], [C D Eb F Gb Ab Bb], [Eb mel.], [Cm7(b5), Cø(9)]),
    ([Alterado], [T b9 \#9 3 b5 b13 b7], [C Db Eb E Gb Ab Bb], [Db mel.], [C7alt]),
  ),
)

#v(0.4em)

#caixa-f(tipo: "dica", titulo: "Grafia do alterado")[
  Vindo de Db menor melódica (Db Eb Fb Gb Ab Bb C), o C alterado seria C Db Eb *Fb* Gb Ab Bb. Na prática escreve-se *E* (a 3ª maior do C7) e lê-se Eb como \#9 (D\#): C – Db – D\# – E – F\# – G\# – Bb.
]

== 4. Qual modo para qual acorde

A escolha do modo depende do *acorde* e da sua *função*. Use a tabela como referência rápida (exemplos em Dó):

#v(0.3em)

#tabela-f(
  columns: (1.1fr, 2.4fr, 1.3fr, 1.5fr),
  ([Acorde], [Situação típica], [Modo], [Menor melódica]),
  (
    ([Cm(7M), Cm6], [Tônica menor (Im); acorde final de tema menor], [Menor melódica], [a própria (C)]),
    ([C7sus4(b9)], [Dominante suspenso, vamp modal], [Dórico b2], [um tom abaixo (Bb)]),
    ([C7M(\#5)], [Tônica maior com 5ª aumentada], [Lídio aumentado], [3ª menor abaixo (A)]),
    ([C7(\#11)], [SubV, II7, bVII7, IV7 em menor; dominante que não resolve 5ª abaixo], [Lídio dominante], [5ª justa acima (G)]),
    ([C7(b13)], [V7 indo para tônica menor, com 9ª natural], [Mixolídio b6], [4ª justa acima (F)]),
    ([Cm7(b5)], [IIø do tom menor], [Lócrio \#2], [3ª menor acima (Eb)]),
    ([C7alt], [V7 indo para maior ou menor, tensão máxima], [Alterado], [meio-tom acima (Db)]),
  ),
)

== 5. A regra prática: pense na menor melódica

Em vez de decorar sete fórmulas, guarde *de onde partir*. As três regras mais usadas no dia a dia:

#v(0.3em)

#cartoes-info((
  (titulo: [Lídio dominante], corpo: [#set par(justify: false)
    *= menor melódica uma 5ª acima.* \ D7(\#11) → *A menor melódica* (A B C D E F\# G\#). A partir de D: D E F\# G\# A B C — T 2 3 \#4 5 6 b7.]),
  (titulo: [Alterado], corpo: [#set par(justify: false)
    *= menor melódica meio-tom acima.* \ G7alt → *Ab menor melódica* (Ab Bb Cb Db Eb F G). A partir de G: G Ab Bb B Db Eb F — T b9 \#9 3 b5 b13 b7.]),
  (titulo: [Lócrio \#2], corpo: [#set par(justify: false)
    *= menor melódica uma 3ª menor acima.* \ Dm7(b5) → *F menor melódica* (F G Ab Bb C D E). A partir de D: D E F G Ab Bb C — T 2 b3 4 b5 b6 b7.]),
))

#v(0.5em)

#caixa-f(tipo: "resumo")[
  Sobre o acorde *X*: X7(\#11) → menor melódica da *5ª acima* · X7alt → *meio-tom acima* · Xm7(b5) → *3ª menor acima* · X7(b13) → *4ª acima* · X7sus4(b9) → *um tom abaixo* · X7M(\#5) → *3ª menor abaixo* · Xm(7M) → *a própria*.
]

#v(0.4em)

Na guitarra, isso significa que *um único desenho* serve para tudo. A forma da menor melódica que você toca para Am(7M) é a mesma que você usa para D7(\#11), F\#m7(b5) e G\#7alt — muda apenas a nota que você trata como alvo.

== 6. No braço

As posições abaixo usam uma casa por dedo, com pequena extensão. Em cinza estão as notas que diferenciam cada escala: na menor melódica, a *6ª* e a *7ª maior* (o que a separa do dórico e da menor natural); no alterado, as notas-guia *3* e *b7* — que, junto com a tônica, são as únicas notas do acorde que não sofrem alteração.

#v(0.4em)

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 0.5em,
  braco-legenda(
    fs: 3,
    legenda: [C menor melódica \ tônica na 5ª corda, casa 3],
    (
      ("5", "", "*6", "", "*7M"),
      ("T", "", "2", "b3", ""),
      ("4", "", "5", "", "*6"),
      ("", "*7M", "T", "", "2"),
      ("", "b3", "", "4", ""),
      ("5", "", "*6", "", "*7M"),
    ),
  ),
  braco-legenda(
    fs: 7,
    legenda: [C menor melódica \ tônica na 6ª corda, casa 8],
    (
      ("*7M", "T", "", "2", "b3"),
      ("", "4", "", "5", ""),
      ("*6", "", "*7M", "T", ""),
      ("2", "b3", "", "4", ""),
      ("", "5", "", "*6", ""),
      ("*7M", "T", "", "2", "b3"),
    ),
  ),
  braco-legenda(
    fs: 3,
    legenda: [G alterado (= Ab menor melódica) \ casas 3 a 7],
    (
      ("T", "b9", "", "#9", "*3"),
      ("", "b5", "", "b13", ""),
      ("*b7", "", "T", "b9", ""),
      ("#9", "*3", "", "b5", ""),
      ("", "b13", "", "*b7", ""),
      ("T", "b9", "", "#9", "*3"),
    ),
  ),
)

#v(0.6em)

#caixa-f(tipo: "dica", titulo: "Leia o mesmo desenho de dois jeitos")[
  As casas do G alterado são exatamente as da *Ab menor melódica*: o Ab está na 6ª e na 1ª corda, casa 4. Pratique a escala pensando em Ab (para achar o desenho) e depois pensando em G (para ouvir a b9, a \#9, a b13 e a resolução).
]

== 7. Aplicação: II-V-I menor

#block(breakable: false)[
  O II-V-I menor é o lugar natural dos modos da menor melódica. Em Dó menor, cada acorde tem o seu modo — e cada modo vem de uma menor melódica diferente:

  #v(0.2em)
  #tabela(
    columns: (1fr, 1.1fr, 1.3fr, 1.9fr),
    ([Acorde], [Modo], [Menor melódica], [Notas]),
    (
      ([Dm7(b5)], [D lócrio \#2], [F menor melódica], [D E F G Ab Bb C]),
      ([G7alt], [G alterado], [Ab menor melódica], [G Ab Bb B Db Eb F]),
      ([Cm(7M)], [C menor melódica], [C menor melódica], [C D Eb F G A B]),
    ),
  )
]

#v(0.5em)

#block(breakable: false)[
  Para acompanhar, use voicings com fundamental na 5ª e na 6ª corda (o G7alt abaixo é um G7(b9 b13): fundamental, b7 e 3ª do G7 com a b9 e a b13 do G alterado por cima):

  #acordes((
    (tabs: "x,5,6,5,6,x,*", nome: "Dm7(b5)", titulo: "Dm7(b5)", detalhe: "T · b5 · b7 · b3"),
    (tabs: "3,x,3,4,4,4,*", nome: "G7(b9 b13)", titulo: "G7alt", detalhe: "T · b7 · 3 · b13 · b9"),
    (tabs: "x,3,5,4,4,3", nome: "Cm(7M)", titulo: "Cm(7M)", detalhe: "T · 5 · 7M · b3 · 5"),
    (tabs: "x,3,x,2,4,3,*", nome: "Cm6", titulo: "Cm6", detalhe: "T · 6 · b3 · 5"),
  ))
]

#v(0.6em)

#tab(
  titulo: "Linha sobre o II-V-I menor (colcheias; último compasso em semínimas)",
  legenda: [Compasso 1: D lócrio \#2 (arpejo de Dø + a 9ª E) · Compasso 2: G alterado, partindo da 3ª (B) · Compasso 3: o Db (b5 de G7) resolve no C, seguido do arpejo de Cm(7M).],
  "  Dm7(b5)                   G7alt                     Cm(7M)\ne|-------------------------|-------------4-----------|-------------3-----7-----|\nB|-------------5--6--5-----|-------4--6-----6--4-----|-------4-----------------|\nG|----------5-----------5--|-4--6-----------------6--|-5-----------------------|\nD|----3--6-----------------|-------------------------|-------------------------|\nA|-5-----------------------|-------------------------|-------------------------|\nE|-------------------------|-------------------------|-------------------------|",
)

#v(0.4em)

#caixa-f(tipo: "dica", titulo: "Um detalhe que vale ouro")[
  O Dø(9) sem fundamental (F – C – E – Ab, casas *x,x,3,5,5,4*) é exatamente um *Fm(7M)* — o acorde de tônica da F menor melódica. Isso confirma a regra do lócrio \#2: sobre Dm7(b5), pense em F menor melódica.
]

== 8. Exercícios

#block(breakable: false)[#exercicio(titulo: "Os modos de G menor melódica", nivel: "Escrita")[
  A G menor melódica é G – A – Bb – C – D – E – F\#. Complete a tabela com os sete modos.

  #tabela-preencher(
    ([Grau], [Modo], [Notas], [Acorde típico]),
    (
      ([I], none, none, none),
      ([II], none, none, none),
      ([III], none, none, none),
      ([IV], none, none, none),
      ([V], none, none, none),
      ([VI], none, none, none),
      ([VII], none, none, none),
    ),
    columns: (0.5fr, 1.3fr, 2fr, 1.2fr),
    altura: 0.75cm,
  )
]]

#block(breakable: false)[#exercicio(titulo: "Use o atalho", nivel: "Aplicação")[
  Para cada acorde, escreva o modo indicado e a menor melódica de onde ele vem.

  #tabela-preencher(
    ([Acorde], [Modo], [Menor melódica], [Acorde], [Modo], [Menor melódica]),
    (
      ([E7(\#11)], none, none, [Eb7(\#11)], none, none),
      ([Bb7alt], none, none, [Bm7(b5)], none, none),
      ([F\#m7(b5)], none, none, [Ab7(b13)], none, none),
      ([A7alt], none, none, [D7sus4(b9)], none, none),
    ),
    columns: (0.9fr, 1fr, 1fr, 0.9fr, 1fr, 1fr),
    altura: 0.75cm,
  )
]]

#block(breakable: false)[#exercicio(titulo: "Identifique o modo", nivel: "Análise")[
  Diga o nome do modo (com a tônica) e de qual menor melódica ele vem.

  #tabela-preencher(
    ([Notas], [Modo], [Menor melódica]),
    (
      ([a) E F\# G\# A\# B C\# D], none, none),
      ([b) A Bb C Db Eb F G], none, none),
      ([c) F G A B C\# D E], none, none),
      ([d) B C\# D E F G A], none, none),
      ([e) D E F\# G A Bb C], none, none),
    ),
    columns: (1.6fr, 1.2fr, 1fr),
    altura: 0.75cm,
  )
]]

#block(breakable: false)[#exercicio(titulo: "II-V-I menor em Lá", nivel: "Aplicação")[
  Complete a tabela para o II-V-I *Bm7(b5) – E7alt – Am(7M)*.

  #tabela-preencher(
    ([Acorde], [Modo], [Menor melódica], [Notas (a partir da tônica do acorde)]),
    (
      ([Bm7(b5)], none, none, none),
      ([E7alt], none, none, none),
      ([Am(7M)], none, none, none),
    ),
    columns: (0.9fr, 1.1fr, 1.1fr, 2fr),
    altura: 0.75cm,
  )
]]

#block(breakable: false)[#exercicio(titulo: "Por que “alterado”?", nivel: "Escrita")[
  Explique, com as notas de B alterado (B C D Eb F G A), por que esse modo é lido como dominante e por que recebe o nome de "alterado".

  #linhas-resposta(3)
]]

#block(breakable: false)[#exercicio(titulo: "Um desenho, dois acordes", nivel: "Braço")[
  Marque no braço a *A menor melódica* entre as casas 4 e 8 (escreva o nome de cada nota). Depois circule as notas que formam o *D7(\#11)* (D – F\# – A – C – G\#) e responda: qual modo você está tocando quando usa esse desenho sobre D7(\#11)?

  #align(center, braco-vazio(casas: 5, fs: 4))
  #linhas-resposta(1)
]]

#block(breakable: false)[#exercicio(titulo: "Improvisação sobre o II-V-I menor", nivel: "Prática")[
  Grave (ou use um play-along) o ciclo | Dm7(b5) | G7alt | Cm(7M) | Cm(7M) | a 80 BPM. Improvise em colcheias usando só as posições da seção 6, trocando de menor melódica a cada acorde (F → Ab → C). Comece cada compasso numa nota-guia (3ª ou 7ª) do acorde e termine a frase no compasso 3 com uma nota de Cm(7M).
]]

#block(breakable: false)[#exercicio(titulo: "Componha a sua linha", nivel: "Criação")[
  Escreva uma linha de colcheias para | Dm7(b5) | G7alt | Cm(7M) | usando D lócrio \#2, G alterado e C menor melódica, na região das casas 3 a 7. Regras: comece o compasso 2 numa nota-guia de G7 (B ou F) e termine o compasso 3 numa nota de Cm(7M). Use a primeira pauta como rascunho e a segunda para a versão final.

  #tab-vazia(sistemas: 2, compassos: 3, altura-linha: 12pt)
]]

#block(breakable: false, above: 1.2em)[
  === Sugestão de prática

  #rotina-estudo((
    ([C menor melódica nas duas posições, subindo e descendo, em colcheias], [8 min], [70–90]),
    ([Mesmo desenho lido como D7(\#11), F\#m7(b5) e G\#7alt: tocar a escala a partir de cada tônica], [8 min], [70]),
    ([G alterado (= Ab menor melódica) resolvendo em C e em Cm], [8 min], [70–80]),
    ([Linha da seção 7 e variações próprias sobre o II-V-I menor], [10 min], [80]),
    ([Atalho mental: sortear acordes e dizer a menor melódica em voz alta], [6 min], [—]),
  ))
]

#block(breakable: false, above: 0.8em)[
  #checklist(titulo: "Autoavaliação", (
    [Escrevo a menor melódica e os seus sete modos em qualquer tom.],
    [Sei o acorde típico de cada modo e a situação em que ele aparece.],
    [Encontro instantaneamente a menor melódica de X7(\#11), X7alt e Xm7(b5).],
    [Toco a menor melódica e o alterado no braço sem consultar o diagrama.],
    [Improviso sobre o II-V-I menor resolvendo as tensões em notas do acorde seguinte.],
  ))
]

#gabarito[
  #resposta(1)[
    I G menor melódica: G A Bb C D E F\# — Gm(7M) · II A dórico b2: A Bb C D E F\# G — A7sus4(b9) · III Bb lídio aumentado: Bb C D E F\# G A — Bb7M(\#5) · IV C lídio dominante: C D E F\# G A Bb — C7(\#11) · V D mixolídio b6: D E F\# G A Bb C — D7(b13) · VI E lócrio \#2: E F\# G A Bb C D — Eø(9) · VII F\# alterado: F\# G A Bb C D E — F\#7alt.
  ]
  #resposta(2)[
    E7(\#11): E lídio dominante, B menor melódica · Bb7alt: Bb alterado, B (Cb) menor melódica · F\#m7(b5): F\# lócrio \#2, A menor melódica · A7alt: A alterado, Bb menor melódica · Eb7(\#11): Eb lídio dominante, Bb menor melódica · Bm7(b5): B lócrio \#2, D menor melódica · Ab7(b13): Ab mixolídio b6, Db menor melódica · D7sus4(b9): D dórico b2, C menor melódica.
  ]
  #resposta(3)[
    a) E lídio dominante (B menor melódica) · b) A alterado (Bb menor melódica) · c) F lídio aumentado (D menor melódica) · d) B lócrio \#2 (D menor melódica) · e) D mixolídio b6 (G menor melódica).
  ]
  #resposta(4)[
    Bm7(b5): B lócrio \#2, D menor melódica, B C\# D E F G A · E7alt: E alterado, F menor melódica, E F G G\# Bb C D (G\# = Ab) · Am(7M): A menor melódica, A B C D E F\# G\#.
  ]
  #resposta(5)[
    Lidas a partir de B, as notas Eb (= D\#) e A são a 3ª maior e a b7 — o trítono de um acorde dominante (B7). As demais notas são tensões, todas alteradas: C = b9, D = \#9, F = b5/\#11, G = b13/\#5. Como não há nenhuma tensão natural (9, 11 ou 13), o modo recebe o nome de "alterado".
  ]
  #resposta(6)[
    Sobre D7(\#11), esse desenho é o *D lídio dominante*. Notas de D7(\#11) destacadas em cinza:
    #v(0.3em)
    #align(center, braco-notas(fs: 4, (
      ("*G#", "*A", "", "B", "*C"),
      ("", "*D", "", "E", ""),
      ("*F#", "", "*G#", "*A", ""),
      ("B", "*C", "", "*D", ""),
      ("", "E", "", "*F#", ""),
      ("*G#", "*A", "", "B", "*C"),
    )))
  ]
  #resposta(7)[
    Exercício prático — critério de sucesso: quatro voltas seguidas sem parar, com a menor melódica correta em cada acorde, notas-guia no tempo 1 e resolução audível do G7alt (b9 → 5, b13 → b3 ou b5 → T) no Cm(7M).
  ]
  #resposta(8)[
    Resposta pessoal — critério de sucesso: todas as notas pertencem ao modo de cada compasso (confira com as posições da seção 6), o compasso 2 começa em B ou F e o último compasso termina em C, Eb, G ou B. Compare com a linha da seção 7.
  ]
]
