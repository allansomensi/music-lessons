#import "/templates/layout.typ": *
#import "/templates/components.typ": *

#show: aula.with(
  instrumento: "Guitarra",
  nivel: "Exercícios — Intermediário",
)

// ------------------------------------------------------------
// Ajustes locais
// ------------------------------------------------------------

// Tabelas sem justificação (evita espaçamentos estranhos nas células).
#show table: set par(justify: false)
#show heading: set block(sticky: true)

// Resposta do gabarito que não se divide entre páginas.
#let resp(n, body) = block(breakable: false, width: 100%, resposta(n, body))

// Tabela compacta para o gabarito.
#let tabela-gab(headers, rows, columns: none) = align(center, block(
  stroke: 0.5pt + color-rule-dark,
  radius: 4pt,
  clip: true,
  width: 100%,
  table(
    columns: if columns == none { (1fr,) * headers.len() } else { columns },
    align: center + horizon,
    stroke: 0.5pt + color-rule-light,
    inset: (x: 5pt, y: 4.5pt),
    fill: (c, r) => if r == 0 { color-subtle-bg-alt } else if calc.even(r) { color-subtle-bg } else { white },
    ..headers.map(h => text(weight: "bold", h)),
    ..rows.flatten(),
  ),
))

// Exercício que não se divide entre páginas.
#let ex(titulo: none, nivel: none, body) = block(
  breakable: false,
  width: 100%,
  exercicio(titulo: titulo, nivel: nivel, body),
)

= Escalas, Modos e Tons Menores

Este material reúne exercícios progressivos para fixar o vocabulário melódico de nível intermediário: os *sete modos gregos*, as escalas *menor harmônica* e *menor melódica*, os campos harmônicos que elas geram e os *arpejos de tétrades* que ligam a escala ao acorde. Cada resposta escrita deve, depois, virar som no instrumento.

== Como usar este material

#[
  #set text(size: 10pt)
  #passos((
    [Resolva *na ordem*: em cada bloco os exercícios vão do nível *Médio* (aplicação direta de uma fórmula) ao *Desafio* (conceitos combinados, enarmonia, visualização no braço).],
    [Escreva a lápis. Em escalas de sete notas use *uma letra para cada nota* (Si\# em Dó\# menor harmônica, e não Dó).],
    [*Toque* cada escala, modo ou arpejo sobre o acorde correspondente — um acorde em loop ou um backing track bastam.],
    [Confira no *Gabarito* (últimas páginas), marque os erros e, mais tarde, refaça o exercício sem olhar a resposta.],
  ))
]

== Conteúdos cobertos

#[
  #set text(size: 9.5pt)
  #tabela(
    columns: (1.25fr, 4.5fr, 0.75fr),
    alinhamento: (left + horizon, left + horizon, center + horizon),
    ([Bloco], [O que você pratica], [Exerc.]),
    (
      ([*1. Modos Gregos*], [Fórmulas, notas em vários tons, nota característica, modo de cada grau do campo, relativos × paralelos, modo no braço], [1–7]),
      ([*2. Tons Menores*], [Menor natural, harmônica e melódica; campos harmônicos; progressões no campo menor harmônico; frígio dominante], [8–13]),
      ([*3. Arpejos*], [Notas de tétrades, identificação de arpejos, arpejos no braço e na tablatura, arpejo a partir da 3ª], [14–18]),
    ),
  )
]

#v(0.4em)

#caixa(tipo: "resumo", titulo: none, width: 100%)[
  #set text(size: 9.5pt)
  #align(left)[*Convenções:* #h(4pt) Intervalos: T (tônica), b2, 2, b3, 3, 4, \#4, b5, 5, \#5, b6, 6, *b7* (7ª menor) e *7M* (7ª maior). Cifras: C7M, Cm7, C7, Cø = Cm7(b5), Cº7, Cm(7M) (menor com 7ª maior) e C7M(\#5) (maior com 7ª maior e 5ª aumentada). Níveis: *Médio* — aplicação direta; *Desafio* — raciocínio combinado.]
]

#pagebreak()


// ============================================================
// BLOCO 1 — MODOS GREGOS
// ============================================================

#block(sticky: true)[
  == 1. Modos Gregos

  Os sete modos nascem da escala maior: cada um começa num grau diferente e, por isso, tem uma *fórmula intervalar* própria. Pense em cada modo de duas formas: *relativa* (as notas de qual escala maior?) e *paralela* (o que muda em relação à maior ou à menor natural com a mesma tônica?).
]

#ex(titulo: "Fórmulas dos modos", nivel: "Médio")[
  Complete a fórmula intervalar de cada modo (a partir da tônica), o tipo de tétrade formada sobre o 1º grau e a *nota característica* — o intervalo que diferencia o modo da escala maior (modos maiores) ou da menor natural (modos menores). A primeira linha é um exemplo.

  #v(0.4em)
  #tabela-preencher(
    columns: (1fr, 2.6fr, 1fr, 1.3fr),
    altura: 1cm,
    ([Modo], [Fórmula (T … 7ª)], [Tétrade], [Nota característica]),
    (
      ([Jônico], [T – 2 – 3 – 4 – 5 – 6 – 7M], [X7M], [— (referência)]),
      ([Dórico], none, none, none),
      ([Frígio], none, none, none),
      ([Lídio], none, none, none),
      ([Mixolídio], none, none, none),
      ([Eólio], none, none, none),
      ([Lócrio], none, none, none),
    ),
  )
]

#ex(titulo: "Que modo é este?", nivel: "Médio")[
  Cada coleção abaixo começa na tônica do modo. Identifique o modo, a escala maior relativa e a nota característica.

  #v(0.4em)
  #tabela-preencher(
    columns: (2.4fr, 1fr, 1fr, 1fr),
    altura: 0.9cm,
    ([Notas (a partir da tônica)], [Modo], [Relativo maior], [Nota caract.]),
    (
      ([a) E – F\# – G – A – B – C\# – D], none, none, none),
      ([b) F – G – A – B – C – D – E], none, none, none),
      ([c) Ab – Bb – C – Db – Eb – F – Gb], none, none, none),
      ([d) C\# – D – E – F\# – G – A – B], none, none, none),
      ([e) B – C – D – E – F\# – G – A], none, none, none),
      ([f) D – E – F\# – G\# – A – B – C\#], none, none, none),
    ),
  )
]

#ex(titulo: "Notas dos modos em vários tons", nivel: "Médio")[
  Escreva as sete notas de cada modo (uma letra por nota) e indique a escala maior de onde ele vem (o *relativo maior*).

  #v(0.4em)
  #tabela-preencher(
    columns: (1.25fr,) + (0.62fr,) * 7 + (1fr,),
    altura: 1cm,
    ([Modo], [1], [2], [3], [4], [5], [6], [7], [Maior de origem]),
    (
      ([D dórico],) + (none,) * 8,
      ([E frígio],) + (none,) * 8,
      ([Bb lídio],) + (none,) * 8,
      ([A mixolídio],) + (none,) * 8,
      ([F\# eólio],) + (none,) * 8,
      ([C\# lócrio],) + (none,) * 8,
      ([Eb dórico],) + (none,) * 8,
      ([G frígio],) + (none,) * 8,
    ),
  )
]

#ex(titulo: "Um modo para cada acorde do campo", nivel: "Médio")[
  No tom de *Si bemol maior*, escreva a tétrade de cada grau, o modo que soa sobre ela e as notas desse modo começando pela fundamental do acorde.

  #v(0.4em)
  #tabela-preencher(
    columns: (0.6fr, 1fr, 1.1fr, 3fr),
    altura: 0.85cm,
    ([Grau], [Tétrade], [Modo], [Notas do modo (a partir da fundamental)]),
    (
      ([I], none, none, none),
      ([II], none, none, none),
      ([III], none, none, none),
      ([IV], none, none, none),
      ([V], none, none, none),
      ([VI], none, none, none),
      ([VII], none, none, none),
    ),
  )
]

#ex(titulo: "Modos paralelos: do mais claro ao mais escuro", nivel: "Desafio")[
  Escreva os sete modos com tônica *Sol*, do mais brilhante (lídio) ao mais escuro (lócrio). De um modo para o seguinte, *apenas uma nota* é abaixada em ½ tom. Anote, na última coluna, qual nota mudou em relação à linha anterior e a escala maior de origem de cada modo.

  #v(0.4em)
  #tabela-preencher(
    columns: (1.05fr, 3fr, 1fr, 1fr),
    altura: 1.15cm,
    ([Modo], [Notas (G …)], [Nota que mudou], [Maior de origem]),
    (
      ([G lídio], none, [—], none),
      ([G jônico], none, none, none),
      ([G mixolídio], none, none, none),
      ([G dórico], none, none, none),
      ([G eólio], none, none, none),
      ([G frígio], none, none, none),
      ([G lócrio], none, none, none),
    ),
  )
]

#ex(titulo: "A dórico no braço", nivel: "Desafio")[
  No braço abaixo (casas 4 a 9), marque *todas* as notas de *Lá dórico* que existem nessa região. Escreva dentro de cada círculo o intervalo (T, 2, b3, 4, 5, 6, b7) e destaque a nota característica (6 = Fá\#) com um círculo mais forte. Depois toque a escala ascendente e descendente sobre um acorde Am7.

  #v(0.5em)
  #align(center, braco-vazio(casas: 6, fs: 4, casa-largura: 30pt))
]


#ex(titulo: "Relativos × paralelos", nivel: "Desafio")[
  Responda de forma curta.

  a) *D dórico* e *C jônico* têm exatamente as mesmas notas. Eles são modos relativos ou paralelos? Por que soam diferentes se as notas são as mesmas?
  #linhas-resposta(3)

  b) *D dórico* e *D eólio* têm a mesma tônica. Qual nota diferencia um do outro?
  #linhas-resposta(1)

  c) A progressão Am7 – D7 repetida em loop sugere qual modo de Lá? Justifique pela nota Fá\# do acorde D7.
  #linhas-resposta(3)

  d) Você quer tocar *E frígio*. Qual escala maior você pode "pensar" para encontrar as notas rapidamente? E se quiser *E lídio*?
  #linhas-resposta(2)

  e) Qual é a única diferença entre *C mixolídio* e *C jônico*? Sobre que tipo de acorde o mixolídio soa naturalmente?
  #linhas-resposta(2)

  f) Toque *A eólio* e depois *A dórico* sobre um acorde Am7 em loop. Descreva com suas palavras a diferença de cor e diga qual nota a provoca.
  #linhas-resposta(3)
]

// ============================================================
// BLOCO 2 — TONS MENORES
// ============================================================

#block(sticky: true)[
  == 2. Tons Menores: Natural, Harmônica e Melódica

  A menor natural tem o V grau menor; a *menor harmônica* eleva o 7º grau e cria a sensível (V7 → Im); a *menor melódica* (forma do jazz) eleva também o 6º grau. Cada uma gera um campo harmônico diferente.
]

#ex(titulo: "As três escalas menores", nivel: "Médio")[
  Escreva as escalas menor natural, harmônica e melódica de cada tom. Lembre-se: uma letra por nota (em Dó\# menor harmônica aparece um *Si\#*).

  #v(0.4em)
  #tabela-preencher(
    columns: (0.55fr, 1.8fr, 1.8fr, 1.8fr),
    altura: 1.2cm,
    ([Tom], [Menor natural], [Menor harmônica], [Menor melódica]),
    (
      ([Em], none, none, none),
      ([Gm], none, none, none),
      ([Bm], none, none, none),
      ([Fm], none, none, none),
      ([C\#m], none, none, none),
    ),
  )
]

#ex(titulo: "Natural, harmônica ou melódica?", nivel: "Médio")[
  Identifique a tônica e o tipo de escala menor de cada coleção (as notas começam na tônica).

  #v(0.4em)
  #tabela-preencher(
    columns: (2.6fr, 1fr, 1.4fr),
    altura: 1cm,
    ([Notas], [Tônica], [Tipo de menor]),
    (
      ([a) G – A – Bb – C – D – E – F\#], none, none),
      ([b) C – D – Eb – F – G – Ab – B], none, none),
      ([c) F\# – G\# – A – B – C\# – D – E], none, none),
      ([d) B – C\# – D – E – F\# – G – A\#], none, none),
      ([e) D – E – F – G – A – B – C\#], none, none),
      ([f) Bb – C – Db – Eb – F – Gb – A], none, none),
      ([g) E – F\# – G – A – B – C\# – D\#], none, none),
    ),
  )
]

#ex(titulo: "Campo harmônico menor harmônico", nivel: "Médio")[
  Monte as tétrades do campo menor harmônico nos três tons. Use as cifras Xm(7M), Xø, X7M(\#5), Xm7, X7, X7M e Xº7.

  #v(0.4em)
  #tabela-preencher(
    columns: (0.6fr,) + (1fr,) * 7,
    altura: 1.2cm,
    ([Tom], [I], [II], [bIII], [IV], [V], [bVI], [VII]),
    (
      ([Em],) + (none,) * 7,
      ([Dm],) + (none,) * 7,
      ([Gm],) + (none,) * 7,
    ),
  )

  #v(0.3em)
  Qual grau desse campo resolve com mais força na tônica? Que nota dele é a sensível em cada tom?
  #linhas-resposta(3)
]

#ex(titulo: "Campo harmônico menor melódico", nivel: "Médio")[
  Monte as tétrades do campo menor melódico (forma do jazz, igual subindo e descendo) em Dó, Mi e Sol menor.

  #v(0.4em)
  #tabela-preencher(
    columns: (0.6fr,) + (1fr,) * 7,
    altura: 1.2cm,
    ([Tom], [I], [II], [bIII], [IV], [V], [VI], [VII]),
    (
      ([Cm],) + (none,) * 7,
      ([Em],) + (none,) * 7,
      ([Gm],) + (none,) * 7,
    ),
  )

  #v(0.3em)
  Compare com o campo menor harmônico: quais graus mudam de qualidade? Qual grau gera um dominante com \#11?
  #linhas-resposta(3)
]

#ex(titulo: "Progressões no campo menor harmônico", nivel: "Desafio")[
  Escreva as cifras de cada progressão nos tons de Ré menor e Si menor. Use as tétrades do campo menor harmônico, exceto onde o grau indica tríade (Im).

  #v(0.4em)
  #tabela-preencher(
    columns: (1.7fr, 2fr, 2fr),
    altura: 1.2cm,
    ([Graus], [Ré menor], [Si menor]),
    (
      ([a) Im – IVm7 – V7 – Im], none, none),
      ([b) bVI7M – IIø – V7 – Im(7M)], none, none),
      ([c) Im – VIIº7 – Im – V7], none, none),
      ([d) Im – bIII7M(\#5) – IVm7 – V7], none, none),
    ),
  )

  #v(0.3em)
  Em (c), o VIIº7 pode substituir qual acorde? Por quê?
  #linhas-resposta(2)
]

#ex(titulo: "O modo frígio dominante", nivel: "Desafio")[
  O 5º modo da menor harmônica é o *frígio dominante* (Mixolídio b9 b13): fórmula T – b2 – 3 – 4 – 5 – b6 – b7. Escreva o frígio dominante de cada nota, a menor harmônica de onde ele vem e o acorde de resolução.

  #v(0.4em)
  #tabela-preencher(
    columns: (1.1fr, 2.8fr, 1.3fr, 1fr),
    altura: 1.4cm,
    ([Frígio dom.], [Notas], [Menor harmônica], [Resolve em]),
    (
      ([E], none, none, none),
      ([A], none, none, none),
      ([B], none, none, none),
      ([D], none, none, none),
    ),
  )
]


// ============================================================
// BLOCO 3 — ARPEJOS
// ============================================================

#block(sticky: true)[
  == 3. Arpejos de Tétrades

  Arpejo é o acorde tocado nota a nota. Saber as quatro notas de cada tétrade — e enxergá-las no braço — é o que permite *mirar notas do acorde* durante um solo.
]

#ex(titulo: "Notas dos arpejos", nivel: "Médio")[
  Escreva a tônica, a 3ª, a 5ª e a 7ª de cada tétrade. Atenção à grafia: em F\#ø a 5ª é *Dó* (e não Si\#); em G\#º7 a 7ª é *Fá* (7ª diminuta).

  #v(0.4em)
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1em,
    tabela-preencher(
      columns: (1.1fr, 0.8fr, 0.8fr, 0.8fr, 0.8fr),
      altura: 1.15cm,
      ([Acorde], [T], [3ª], [5ª], [7ª]),
      (
        ([Cm7],) + (none,) * 4,
        ([F7M],) + (none,) * 4,
        ([Bb7],) + (none,) * 4,
        ([F\#ø],) + (none,) * 4,
        ([G\#º7],) + (none,) * 4,
        ([Am(7M)],) + (none,) * 4,
      ),
    ),
    tabela-preencher(
      columns: (1.1fr, 0.8fr, 0.8fr, 0.8fr, 0.8fr),
      altura: 1.15cm,
      ([Acorde], [T], [3ª], [5ª], [7ª]),
      (
        ([Db7M],) + (none,) * 4,
        ([E7],) + (none,) * 4,
        ([Bm7],) + (none,) * 4,
        ([Ab7],) + (none,) * 4,
        ([C\#m7],) + (none,) * 4,
        ([Eb7M(\#5)],) + (none,) * 4,
      ),
    ),
  )
]

#ex(titulo: "Que arpejo é este?", nivel: "Médio")[
  Dê a cifra da tétrade formada por cada grupo de notas (já empilhadas em terças, a partir da fundamental).

  #v(0.4em)
  #tabela-preencher(
    columns: (2fr, 1fr, 2fr, 1fr),
    altura: 1.1cm,
    ([Notas], [Cifra], [Notas], [Cifra]),
    (
      ([a) D – F\# – A – C], none, [e) C\# – E – G – Bb], none),
      ([b) G – Bb – Db – F], none, [f) F – A – C\# – E], none),
      ([c) Bb – D – F – A], none, [g) A – C – E – G\#], none),
      ([d) E – G – B – D], none, [h) Ab – C – Eb – G], none),
      ([i) B – D\# – F\# – A\#], none, [k) F\# – A – C – Eb], none),
      ([j) Eb – Gb – Bb – Db], none, [l) C – Eb – G – B], none),
    ),
  )
]

#ex(titulo: "Arpejos no braço", nivel: "Médio")[
  Marque nos braços todas as notas do arpejo pedido dentro da região indicada e escreva o intervalo em cada círculo (T, 3/b3, 5, 7M/b7). Pinte as tônicas.

  #v(0.5em)
  #grid(
    columns: (1fr, 1fr),
    gutter: 1em,
    align(center)[
      *a) G7M — casas 2 a 5*
      #v(0.3em)
      #braco-vazio(casas: 4, fs: 2, casa-largura: 34pt)
    ],
    align(center)[
      *b) Am7 — casas 5 a 8*
      #v(0.3em)
      #braco-vazio(casas: 4, fs: 5, casa-largura: 34pt)
    ],
  )
]

#ex(titulo: "Arpejos do II-V-I na tablatura", nivel: "Desafio")[
  Escreva na tablatura os arpejos de Dm7 – G7 – C7M, um por compasso, em quatro semínimas ascendentes (T – 3 – 5 – 7). Todas as notas devem ficar entre as *casas 7 e 10*, sem mudar de posição. Depois toque em loop a 70 BPM e responda: quais notas de um acorde ficam a ½ tom de uma nota do acorde seguinte?

  #tab-vazia(sistemas: 3, compassos: 3, altura-linha: 11pt)

  Notas a ½ tom de distância entre acordes vizinhos:
  #linhas-resposta(2)
]

#ex(titulo: "Arpejo a partir da 3ª", nivel: "Desafio")[
  Um recurso clássico de improvisação é tocar o arpejo que começa na *3ª do acorde*. Para cada caso, escreva as notas do arpejo, os intervalos que elas formam com a fundamental do acorde de base e a cifra completa resultante.

  #v(0.4em)
  #tabela-preencher(
    columns: (1.4fr, 1.5fr, 1.8fr, 1.4fr),
    altura: 1.2cm,
    ([Arpejo sobre acorde], [Notas do arpejo], [Intervalos sobre a fundamental], [Som resultante]),
    (
      ([Em7 sobre C7M], none, none, none),
      ([Am7 sobre F7M], none, none, none),
      ([Bø sobre G7], none, none, none),
      ([Dm7 sobre Bb7M], none, none, none),
      ([F\#ø sobre D7], none, none, none),
    ),
  )

  #v(0.3em)
  Qual regra geral você observa? Que nota do acorde de base nunca aparece nesse arpejo?
  #linhas-resposta(3)
]

#v(0.8em)

#block(breakable: false)[
  == Autoavaliação

  Antes de conferir o gabarito, marque o que você já consegue fazer *sem consultar* nenhum material:

  #checklist((
    [Escrevo a fórmula dos sete modos e digo a nota característica de cada um.],
    [Encontro as notas de qualquer modo pensando no relativo maior *e* na alteração em relação à maior/menor paralela.],
    [Escrevo as três escalas menores em qualquer tom, com a grafia correta (uma letra por nota).],
    [Monto o campo menor harmônico e o menor melódico e reconheço o V7 com sensível.],
    [Toco os arpejos de X7M, Xm7, X7, Xø e Xº7 em pelo menos duas regiões do braço.],
    [Uso o arpejo a partir da 3ª para tocar a 9ª sobre acordes maiores, menores e dominantes.],
  ))
]

// ============================================================
// GABARITO
// ============================================================

#gabarito[
  #resp(1)[
    #tabela-gab(
      columns: (1fr, 2.6fr, 0.9fr, 1.6fr),
      ([Modo], [Fórmula], [Tétrade], [Nota característica]),
      (
        ([Jônico], [T – 2 – 3 – 4 – 5 – 6 – 7M], [X7M], [— (referência)]),
        ([Dórico], [T – 2 – b3 – 4 – 5 – 6 – b7], [Xm7], [6 (6ª maior)]),
        ([Frígio], [T – b2 – b3 – 4 – 5 – b6 – b7], [Xm7], [b2]),
        ([Lídio], [T – 2 – 3 – \#4 – 5 – 6 – 7M], [X7M], [\#4]),
        ([Mixolídio], [T – 2 – 3 – 4 – 5 – 6 – b7], [X7], [b7]),
        ([Eólio], [T – 2 – b3 – 4 – 5 – b6 – b7], [Xm7], [— (referência menor)]),
        ([Lócrio], [T – b2 – b3 – 4 – b5 – b6 – b7], [Xø], [b5]),
      ),
    )
    Critério: no eólio, aceite também "b6" — é a nota que o distingue do dórico.
  ]

  #resp(2)[
    a) E dórico · D maior · C\# (6) — b) F lídio · C maior · B (\#4) — c) Ab mixolídio · Db maior · Gb (b7) — d) C\# lócrio · D maior · G (b5) — e) B frígio · G maior · C (b2) — f) D lídio · A maior · G\# (\#4).
  ]

  #resp(3)[
    D dórico: D E F G A B C (C maior) · E frígio: E F G A B C D (C maior) · Bb lídio: Bb C D E F G A (F maior) · A mixolídio: A B C\# D E F\# G (D maior) · F\# eólio: F\# G\# A B C\# D E (A maior) · C\# lócrio: C\# D E F\# G A B (D maior) · Eb dórico: Eb F Gb Ab Bb C Db (Db maior) · G frígio: G Ab Bb C D Eb F (Eb maior).
  ]

  #resp(4)[
    #tabela-gab(
      columns: (0.5fr, 0.9fr, 1fr, 2.6fr),
      ([Grau], [Tétrade], [Modo], [Notas]),
      (
        ([I], [Bb7M], [Jônico], [Bb C D Eb F G A]),
        ([II], [Cm7], [Dórico], [C D Eb F G A Bb]),
        ([III], [Dm7], [Frígio], [D Eb F G A Bb C]),
        ([IV], [Eb7M], [Lídio], [Eb F G A Bb C D]),
        ([V], [F7], [Mixolídio], [F G A Bb C D Eb]),
        ([VI], [Gm7], [Eólio], [G A Bb C D Eb F]),
        ([VII], [Aø], [Lócrio], [A Bb C D Eb F G]),
      ),
    )
  ]

  #resp(5)[
    #tabela-gab(
      columns: (1fr, 2.4fr, 1.2fr, 1fr),
      ([Modo], [Notas], [Mudou], [Origem]),
      (
        ([G lídio], [G A B C\# D E F\#], [—], [D maior]),
        ([G jônico], [G A B C D E F\#], [C\# → C (4)], [G maior]),
        ([G mixolídio], [G A B C D E F], [F\# → F (b7)], [C maior]),
        ([G dórico], [G A Bb C D E F], [B → Bb (b3)], [F maior]),
        ([G eólio], [G A Bb C D Eb F], [E → Eb (b6)], [Bb maior]),
        ([G frígio], [G Ab Bb C D Eb F], [A → Ab (b2)], [Eb maior]),
        ([G lócrio], [G Ab Bb C Db Eb F], [D → Db (b5)], [Ab maior]),
      ),
    )
  ]

  #resp(6)[
    Lá dórico (A B C D E F\# G) nas casas 4 a 9 — em cinza, a 6ª (Fá\#):
    #v(0.3em)
    #align(center, braco-notas(
      fs: 4,
      casa-largura: 24pt,
      (
        ("", "T", "", "2", "b3", ""),
        ("", "4", "", "5", "", "*6"),
        ("*6", "b7", "", "T", "", "2"),
        ("2", "b3", "", "4", "", "5"),
        ("", "5", "", "*6", "b7", ""),
        ("", "T", "", "2", "b3", ""),
      ),
    ))
    Critério: 20 notas; nenhuma nota de fora da escala (Fá natural, Sol\# etc.).
  ]

  #resp(7)[
    a) Relativos (mesmas notas, tônicas diferentes). Soam diferentes porque o centro tonal muda: os intervalos são medidos a partir de Ré, e o acorde de base passa a ser Dm7. — b) Si (dórico) × Sib (eólio): a 6ª maior × 6ª menor. — c) Lá dórico: o Fá\# é a 3ª de D7 e, sobre Lá, é a 6ª maior — nota característica do dórico (notas de G maior). — d) E frígio = notas de C maior; E lídio = notas de B maior. — e) A 7ª: Sib (b7) no mixolídio × Si (7M) no jônico. Soa sobre acordes dominantes (C7). — f) Resposta pessoal; critério: o aluno deve apontar a 6ª (Fá\# no dórico × Fá no eólio) como responsável pelo som mais "aberto" do dórico.
  ]

  #resp(8)[
    #tabela-gab(
      columns: (0.5fr, 1.7fr, 1.7fr, 1.7fr),
      ([Tom], [Natural], [Harmônica], [Melódica]),
      (
        ([Em], [E F\# G A B C D], [E F\# G A B C *D\#*], [E F\# G A B *C\# D\#*]),
        ([Gm], [G A Bb C D Eb F], [G A Bb C D Eb *F\#*], [G A Bb C D *E F\#*]),
        ([Bm], [B C\# D E F\# G A], [B C\# D E F\# G *A\#*], [B C\# D E F\# *G\# A\#*]),
        ([Fm], [F G Ab Bb C Db Eb], [F G Ab Bb C Db *E*], [F G Ab Bb C *D E*]),
        ([C\#m], [C\# D\# E F\# G\# A B], [C\# D\# E F\# G\# A *B\#*], [C\# D\# E F\# G\# *A\# B\#*]),
      ),
    )
  ]

  #resp(9)[
    a) G menor melódica — b) C menor harmônica — c) F\# menor natural — d) B menor harmônica — e) D menor melódica — f) Bb menor harmônica — g) E menor melódica.
  ]

  #resp(10)[
    #tabela-gab(
      columns: (0.5fr,) + (1fr,) * 7,
      ([Tom], [I], [II], [bIII], [IV], [V], [bVI], [VII]),
      (
        ([Em], [Em(7M)], [F\#ø], [G7M(\#5)], [Am7], [*B7*], [C7M], [D\#º7]),
        ([Dm], [Dm(7M)], [Eø], [F7M(\#5)], [Gm7], [*A7*], [Bb7M], [C\#º7]),
        ([Gm], [Gm(7M)], [Aø], [Bb7M(\#5)], [Cm7], [*D7*], [Eb7M], [F\#º7]),
      ),
    )
    O V7 (dominante com sensível). Sensíveis: D\# (Em), C\# (Dm), F\# (Gm). O VIIº7 também tem função dominante.
  ]

  #resp(11)[
    #tabela-gab(
      columns: (0.5fr,) + (1fr,) * 7,
      ([Tom], [I], [II], [bIII], [IV], [V], [VI], [VII]),
      (
        ([Cm], [Cm(7M)], [Dm7], [Eb7M(\#5)], [F7], [G7], [Aø], [Bø]),
        ([Em], [Em(7M)], [F\#m7], [G7M(\#5)], [A7], [B7], [C\#ø], [D\#ø]),
        ([Gm], [Gm(7M)], [Am7], [Bb7M(\#5)], [C7], [D7], [Eø], [F\#ø]),
      ),
    )
    Mudam: II (ø → m7), IV (m7 → 7), VI (7M → ø, e a fundamental sobe ½ tom) e VII (º7 → ø). O IV7 (F7, A7, C7) gera o dominante com \#11 — o modo lídio dominante.
  ]

  #resp(12)[
    a) Dm – Gm7 – A7 – Dm | Bm – Em7 – F\#7 – Bm. — b) Bb7M – Eø – A7 – Dm(7M) | G7M – C\#ø – F\#7 – Bm(7M). — c) Dm – C\#º7 – Dm – A7 | Bm – A\#º7 – Bm – F\#7. — d) Dm – F7M(\#5) – Gm7 – A7 | Bm – D7M(\#5) – Em7 – F\#7. \
    O VIIº7 substitui o V7 (é um V7(b9) sem fundamental: C\#º7 = C\# E G Bb ⊂ A7(b9)); contém o trítono e a sensível.
  ]

  #resp(13)[
    E: E F G\# A B C D · Lá menor harmônica · Am — A: A Bb C\# D E F G · Ré menor harmônica · Dm — B: B C D\# E F\# G A · Mi menor harmônica · Em — D: D Eb F\# G A Bb C · Sol menor harmônica · Gm.
  ]

  #resp(14)[
    Cm7: C Eb G Bb · F7M: F A C E · Bb7: Bb D F Ab · F\#ø: F\# A C E · G\#º7: G\# B D F · Am(7M): A C E G\# · Db7M: Db F Ab C · E7: E G\# B D · Bm7: B D F\# A · Ab7: Ab C Eb Gb · C\#m7: C\# E G\# B · Eb7M(\#5): Eb G B D.
  ]

  #resp(15)[
    a) D7 — b) Gø (Gm7(b5)) — c) Bb7M — d) Em7 — e) C\#º7 — f) F7M(\#5) — g) Am(7M) — h) Ab7M — i) B7M — j) Ebm7 — k) F\#º7 — l) Cm(7M).
  ]

  #resp(16)[
    #grid(
      columns: (1fr, 1fr),
      gutter: 1em,
      align(center)[
        *a) G7M — casas 2 a 5*
        #v(0.2em)
        #braco-notas(fs: 2, casa-largura: 26pt, (
          ("7M", "T", "", ""),
          ("3", "", "", "5"),
          ("", "", "7M", "T"),
          ("", "", "3", ""),
          ("", "5", "", ""),
          ("7M", "T", "", ""),
        ))
      ],
      align(center)[
        *b) Am7 — casas 5 a 8*
        #v(0.2em)
        #braco-notas(fs: 5, casa-largura: 26pt, (
          ("T", "", "", "b3"),
          ("", "", "5", ""),
          ("b7", "", "T", ""),
          ("b3", "", "", ""),
          ("5", "", "", "b7"),
          ("T", "", "", "b3"),
        ))
      ],
    )
  ]

  #resp(17)[
    Resposta-modelo (outras digitações são válidas se respeitarem a região 7–10 e a ordem T-3-5-7):
    #v(0.2em)
    #tab(
      "   Dm7          G7           C7M\ne|------------|------------|-----------7-|\nB|------------|------------|--------8----|\nG|------------|-------7-10-|-----9-------|\nD|-------7-10-|----9-------|-10----------|\nA|----8-------|-10---------|-------------|\nE|-10---------|------------|-------------|",
    )
    Critério: Dm7 = D F A C · G7 = G B D F · C7M = C E G B; nenhuma nota fora das casas 7–10. Notas a ½ tom: o Dó (7ª de Dm7) e o Si (3ª de G7) — 4ª corda, casas 10 e 9; o Fá (7ª de G7) e o Mi (3ª de C7M) — 3ª corda, casas 10 e 9. São as notas-guia da cadência.
  ]

  #resp(18)[
    Em7/C7M: E G B D → 3 5 7M 9 → C7M(9) · Am7/F7M: A C E G → 3 5 7M 9 → F7M(9) · Bø/G7: B D F A → 3 5 b7 9 → G7(9) · Dm7/Bb7M: D F A C → 3 5 7M 9 → Bb7M(9) · F\#ø/D7: F\# A C E → 3 5 b7 9 → D7(9). \
    Regra: o arpejo da 3ª gera "acorde sem fundamental + 9ª" (3-5-7-9). A fundamental nunca aparece — por isso o som fica moderno e leve.
  ]
]
