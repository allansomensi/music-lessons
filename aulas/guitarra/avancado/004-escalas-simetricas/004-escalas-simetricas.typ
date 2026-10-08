#import "/templates/layout.typ": *
#import "/templates/components.typ": *
#import "/templates/components.typ" as comp
#import "@preview/conchord:0.4.0": new-chordgen

#show: aula.with(
  instrumento: "Guitarra",
  nivel: "Avançado",
)

#let chord = new-chordgen(number-to-left: true, use-shadow-barre: false, colors: (hold: black, barre: black))
#show <chord>: set text(fill: color-strong, weight: "bold")
#show table: set par(justify: false)

// Caixas inseparáveis (não quebram entre páginas)
#let caixa(..args) = block(width: 100%, breakable: false, comp.caixa(..args))

// Tabelas inseparáveis (evita tabela partida entre páginas)
#let tabela(..args) = block(width: 100%, breakable: false, comp.tabela(..args))
#let tabela-preencher(..args) = block(width: 100%, breakable: false, comp.tabela-preencher(..args))

// Legenda curta abaixo de diagramas
#let legenda(body) = align(center, text(size: 8.5pt, fill: color-muted, body))

// Braço + título lado a lado
#let braco-titulado(titulo, dados, fs: 1) = block(breakable: false)[
  #align(center, text(size: 9.5pt, weight: "bold", fill: color-strong, titulo))
  #v(-0.3em)
  #align(center, braco-notas(dados, fs: fs))
]

// Dados de braço (primeira linha = 6ª corda)
#let g-domdim = (
  ("", "T", "*b9", "", "*#9"),
  ("3", "", "*#11", "5", ""),
  ("*13", "b7", "", "T", "*b9"),
  ("", "*#9", "3", "", "*#11"),
  ("", "5", "", "*13", "b7"),
  ("", "T", "*b9", "", "*#9"),
)

#let ab-tst = (
  ("", "*7M", "T", "", "*2"),
  ("b3", "", "*4", "b5", ""),
  ("*b6", "bb7", "", "*7M", "T"),
  ("", "*2", "b3", "", "*4"),
  ("", "b5", "", "*b6", "bb7"),
  ("", "*7M", "T", "", "*2"),
)

#let g-wt = (
  ("", "T", "", "9", ""),
  ("3", "", "*#11", "", "*#5"),
  ("", "b7", "", "T", ""),
  ("9", "", "3", "", "*#11"),
  ("", "", "*#5", "", "b7"),
  ("", "T", "", "9", ""),
)

= Escalas Simétricas

A maioria das escalas mais usadas — maior, menores, modos — mistura tons e semitons de forma irregular, e é justamente essa irregularidade que cria um centro tonal. As *escalas simétricas* fazem o contrário: repetem um mesmo padrão de intervalos até completar a oitava. O resultado é um som ambíguo, "flutuante", que o jazz, a MPB moderna e a música erudita do século XX usam para colorir acordes dominantes e diminutos. Nesta aula você vai entender a lógica da simetria, dominar as duas escalas simétricas mais usadas (tons inteiros e diminuta) e transformá-las em frases reais sobre o II-V-I.

#objetivos((
  [Entender por que dividir a oitava em partes iguais gera escalas com poucas transposições],
  [Construir e aplicar a escala de tons inteiros sobre acordes 7(\#5) e aumentados],
  [Distinguir a diminuta *tom-semitom* (acordes º7) da *semitom-tom* ou dom-dim (acordes 7(b9))],
  [Reconhecer que existem apenas 2 escalas de tons inteiros e 3 escalas diminutas],
  [Tocar padrões de digitação e licks que exploram o deslocamento de 2 e 3 casas],
))

== 1. O que é simetria na escala

A oitava tem 12 semitons. Sempre que dividimos esses 12 semitons em *partes iguais*, obtemos uma estrutura que se repete — e, portanto, uma estrutura que "não sabe" qual é a sua tônica. Cada nota pode ser vista como ponto de partida, porque a sequência de intervalos é a mesma a partir de qualquer uma delas.

#tabela(
  columns: (0.9fr, 1.3fr, 1.3fr, 1.6fr, 1fr),
  ([*Divisão*], [*Intervalo*], [*Estrutura*], [*Escala derivada*], [*Versões*]),
  (
    ([12 ÷ 2], [trítono (6 st)], [C – F\#], [eixo do SubV], [6]),
    ([12 ÷ 3], [3ª maior (4 st)], [tríade aumentada], [escala aumentada], [4]),
    ([12 ÷ 4], [3ª menor (3 st)], [acorde º7], [*diminuta* (T-ST / ST-T)], [*3*]),
    ([12 ÷ 6], [tom (2 st)], [—], [*tons inteiros*], [*2*]),
    ([12 ÷ 12], [semitom], [—], [cromática], [1]),
  ),
)

#v(0.6em)

A última coluna é a consequência mais importante: como o padrão se repete a cada X semitons, transpor a escala X semitons acima produz *exatamente as mesmas notas*. Por isso só existem 2 escalas de tons inteiros diferentes e só 3 escalas diminutas diferentes — o compositor francês Olivier Messiaen chamou essas estruturas de *modos de transposição limitada*.


== 2. A escala de tons inteiros

A escala de tons inteiros (também chamada *hexafônica*) tem *6 notas*, todas separadas por um tom. A partir de Dó:

#tabela(
  columns: (1.4fr,) + (1fr,) * 6,
  ([*Tônica*], [*T*], [*9*], [*3*], [*\#11*], [*\#5 (b13)*], [*b7*]),
  (
    ([Dó], [C], [D], [E], [F\#], [G\#], [Bb]),
    ([Sol], [G], [A], [B], [C\#], [D\#], [F]),
  ),
)

#v(0.6em)

Repare no que ela *tem*: tônica, 3ª maior e 7ª menor (o esqueleto de um dominante), mais 9, \#11 e \#5. E no que ela *não tem*: 5ª justa, b9, \#9 e 13. Ela é a escala do dominante com *quinta aumentada* — C7(\#5), C7(9, \#5), C7(b13, \#11) — e da tríade aumentada C+. Como não há 5ª justa, evite-a sobre acordes que tenham 5 ou 13 na harmonia ou na melodia.

=== Só existem duas

Como a escala sobe de tom em tom, começar um tom acima reproduz a mesma coleção. Todas as 12 notas se dividem em apenas dois grupos:

#tabela(
  columns: (1fr, 2fr, 2.2fr),
  ([*Coleção*], [*Notas*], [*Serve para os dominantes 7(\#5)*]),
  (
    ([Tons inteiros 1], [C – D – E – F\# – G\# – A\#], [C7, D7, E7, F\#7, Ab7 (G\#7), Bb7]),
    ([Tons inteiros 2], [Db – Eb – F – G – A – B], [Db7, Eb7, F7, G7, A7, B7]),
  ),
)

#v(0.6em)

Note que a coleção de Sol (G A B C\# D\# F) é a mesma de Db (Db Eb F G A B), apenas grafada de outra forma. Note também que cada coleção atende a três pares de dominantes a trítono de distância — G7 e seu SubV Db7, por exemplo, usam a mesma escala de tons inteiros.

#block(breakable: false)[
=== Digitação: duas e três notas por corda

O desenho abaixo cobre duas oitavas de Sol tons inteiros entre as casas 2 e 6. Toque com um dedo por casa (o indicador cobre as casas 2 e 3). Os círculos cinza marcam as notas características: \#11 e \#5.

#grid(
  columns: (auto, 1fr),
  column-gutter: 1.5em,
  align: horizon,
  braco-titulado([Sol tons inteiros — casas 2 a 6], g-wt, fs: 2),
  [
    #set text(size: 9.5pt)
    - O padrão de cordas é *2 – 3 – 2 – 3 – 2 – 2* notas.
    - Desloque o desenho *2 casas acima* (tônica na casa 5): você toca Lá tons inteiros — mesmas notas, outros rótulos.
    - Desloque mais 2 casas (casa 7): Si tons inteiros. Continua sendo a mesma coleção.
    - Desloque *1 casa* e você muda de coleção (Láb tons inteiros = coleção 1).
  ],
)
]

#v(0.4em)

#caixa(tipo: "dica", titulo: "No braço")[
  A simetria vira geometria: um desenho da escala diminuta deslocado *3 casas* (uma 3ª menor) toca as mesmas notas; um desenho de tons inteiros deslocado *2 casas* (um tom) também. Você aprende um único desenho e o reaproveita pelo braço inteiro.
]

=== Padrão melódico: tríades aumentadas a cada tom

A escala de tons inteiros é a soma de duas tríades aumentadas a um tom de distância: em Sol, G+ (G B D\#) e A+ (A C\# F). Como cada tríade aumentada também é simétrica (repete a cada 4 casas), um único desenho de três cordas descendo de 2 em 2 casas percorre toda a escala:

#tab(
  "  G7(#5)                                C7M\ne|-------7--------5--------3--------1--|-0-----------|\nB|----8--------6--------4--------2-----|-------------|\nG|-8--------6--------4--------2--------|-------------|\nD|-------------------------------------|-------------|\nA|-------------------------------------|-------------|\nE|-------------------------------------|-------------|",
  titulo: "Lick 1 — tríades aumentadas descendo 2 casas (tercinas)",
  legenda: [Os grupos alternam as duas tríades aumentadas da escala — G+ (D\#-G-B, depois B-D\#-G) e A+ (C\#-F-A, depois A-C\#-F) —, sempre com o mesmo shape. O Fá final (b7 de G7) resolve no Mi (3ª de C7M).],
)


== 3. A escala diminuta: duas leituras da mesma coleção

A escala diminuta tem *8 notas* e alterna tons e semitons. Dependendo de começar pelo tom ou pelo semitom, ela recebe dois nomes — e duas aplicações bem diferentes.

=== Tom-semitom (T-ST): a escala do acorde º7

#tabela(
  columns: (1.5fr,) + (1fr,) * 8,
  ([*Dó T-ST*], [C], [D], [Eb], [F], [Gb], [Ab], [A], [B]),
  (
    ([Intervalo], [*T*], [9], [*b3*], [11], [*b5*], [b13], [*bb7*], [7M]),
  ),
)

#v(0.6em)

As notas em negrito formam o próprio *Cº7* (C Eb Gb Bbb — o Lá, grafado como Sibb, é a 7ª diminuta). As outras quatro ficam *um tom acima de cada nota do acorde* — são as tensões disponíveis de um diminuto: 9, 11, b13 e 7M. Use a T-ST sobre acordes º7 em função própria, como o diminuto de passagem C7M – C\#º7 – Dm7.

=== Semitom-tom (ST-T): a escala dom-dim

#tabela(
  columns: (1.5fr,) + (1fr,) * 8,
  ([*Sol ST-T*], [G], [Ab], [Bb], [B], [C\#], [D], [E], [F]),
  (
    ([Intervalo], [*T*], [b9], [\#9], [*3*], [\#11], [*5*], [13], [*b7*]),
  ),
)

#v(0.6em)

Agora o esqueleto é de *dominante*: T, 3, 5 e b7 de G7 — com a 5ª justa e a 13 naturais, mas as nonas alteradas (b9 e \#9) e a \#11. É a escala de *G7(b9, \#9, \#11, 13)*, por isso o apelido *dom-dim* (dominante-diminuta). O \#9 é grafado como Bb por praticidade de leitura; teoricamente é um Lá sustenido.

#caixa(tipo: "atencao", titulo: "Dom-dim × alterada")[
  As duas têm b9, \#9 e \#11, mas a dom-dim tem *5 e 13 naturais*, enquanto a alterada (7º modo da menor melódica: T, b9, \#9, 3, \#11, b13, b7) tem *b13* e nenhuma 5ª justa. Se a melodia ou o acorde pede b13, a dom-dim está errada; se pede 13, a alterada está errada.
]

=== Mesma coleção, outro ponto de partida

Escreva as notas de Sol ST-T e as de Láb T-ST lado a lado:

#tabela(
  columns: (1.6fr,) + (1fr,) * 8,
  ([*Notas*], [G], [Ab], [Bb], [B], [C\#], [D], [E], [F]),
  (
    ([Sol ST-T (G7)], [T], [b9], [\#9], [3], [\#11], [5], [13], [b7]),
    ([Láb T-ST (Abº7)], [7M], [T], [2], [b3], [4], [b5], [b6], [bb7]),
  ),
)

#v(0.6em)

São *as mesmas oito notas*. Isso não é coincidência: G7(b9) = G + B D F Ab, e B D F Ab é um acorde diminuto (Bº7 = Dº7 = Fº7 = Abº7). Daí as duas regras de bolso:

#caixa(tipo: "resumo", titulo: "Regras de equivalência")[
  - *Dom-dim de X = T-ST de X + 1 semitom.* G dom-dim = Ab T-ST (= B, D ou F T-ST).
  - *T-ST de X = dom-dim de X − 1 semitom.* Cº7 → C T-ST = B dom-dim (= D, F ou Ab dom-dim).
  - Todo º7 é um dominante 7(b9) sem tônica: Cº7 = B7(b9), D7(b9), F7(b9) ou Ab7(b9) sem a fundamental.
]

=== Só existem três escalas diminutas

Como a escala repete a cada 3ª menor, as 12 dom-dims (e as 12 T-STs) se reduzem a três coleções. Cada coleção é a soma de dois acordes º7 vizinhos:

#tabela(
  columns: (0.75fr, 2.2fr, 1.35fr, 1.35fr, 1.25fr),
  ([*Coleção*], [*Notas*], [*Dom-dim de*], [*T-ST de*], [*º7 contidos*]),
  (
    ([I], [C Db Eb E F\# G A Bb], [C, Eb, F\#, A], [Db, E, G, Bb], [Cº7 + C\#º7]),
    ([II], [Db D E F G Ab Bb B], [Db, E, G, Bb], [D, F, Ab, B], [C\#º7 + Dº7]),
    ([III], [D Eb F F\# G\# A B C], [D, F, Ab, B], [Eb, F\#, A, C], [Dº7 + D\#º7]),
  ),
)

#v(0.6em)

Uma consequência prática: os quatro dominantes a uma 3ª menor de distância — G7, Bb7, Db7 e E7 — compartilham a mesma dom-dim. Entre eles está o *SubV* (Db7 é o SubV de G7), o que explica por que linhas dom-dim soam tão naturais na substituição de trítono.


== 4. Digitação da escala diminuta

O desenho abaixo é Sol dom-dim entre as casas 2 e 6, três notas por corda (quatro na 4ª corda). À direita, *as mesmas posições* rotuladas a partir de Láb (T-ST): só muda o nome dos graus. Os círculos cinza são as tensões de cada leitura.

#grid(
  columns: (1fr, 1fr),
  column-gutter: 1em,
  braco-titulado([Sol dom-dim (sobre G7)], g-domdim, fs: 2),
  braco-titulado([Láb T-ST (sobre Abº7)], ab-tst, fs: 2),
)

#v(0.3em)
#legenda[Preto = tônica da leitura · branco = notas do acorde · cinza = tensões disponíveis.]

#v(0.6em)

Agora aplique a simetria: o mesmo desenho deslocado *3 casas acima* (tônica na casa 6 da 6ª corda) é Sib dom-dim — mesmas notas de Sol dom-dim. Deslocado 6 casas, é Réb dom-dim; 9 casas, Mi dom-dim. O acorde º7 mostra o mesmo fenômeno de forma ainda mais clara: o shape se repete idêntico a cada 3 casas, e cada inversão tem uma nota diferente no baixo.

#block(breakable: false)[
#grid-acordes(
  chord: chord,
  columns: 4,
  (
    (tabs: "x,2,3,1,3,x", titulo: "Bº7", nome: "", detalhe: "B – F – Ab – D"),
    (tabs: "x,5,6,4,6,x", titulo: "Dº7", nome: "", detalhe: "D – Ab – B – F"),
    (tabs: "x,8,9,7,9,x", titulo: "Fº7", nome: "", detalhe: "F – B – D – Ab"),
    (tabs: "x,11,12,10,12,x", titulo: "Abº7", nome: "", detalhe: "Ab – D – F – B"),
  ),
)

#v(0.3em)
#legenda[As quatro formas são o mesmo acorde (= G7(b9) sem tônica). Todas pertencem à coleção II.]
]

#block(breakable: false)[
== 5. Padrões melódicos na dom-dim

=== Tríades maiores a cada 3ª menor

Dentro de Sol dom-dim cabem quatro tríades maiores (e quatro menores) separadas por 3ª menor: *G, Bb, Db e E*. Cada uma produz um conjunto diferente de tensões sobre G7:

#tabela(
  columns: (0.9fr, 1.2fr, 1.4fr, 2.2fr),
  ([*Tríade*], [*Notas*], [*Sobre G7 =*], [*Som resultante*]),
  (
    ([G], [G – B – D], [T – 3 – 5], [o próprio acorde, sem tensão]),
    ([Bb], [Bb – D – F], [\#9 – 5 – b7], [G7(\#9), cor "blues"]),
    ([Db], [Db – F – Ab], [\#11 – b7 – b9], [G7(b9, \#11), sonoridade do SubV]),
    ([E], [E – G\# – B], [13 – b9 – 3], [G7(b9, 13), a cor dom-dim clássica]),
  ),
)
]

#v(0.6em)

Na guitarra isso fica ainda mais simples: um mesmo shape de tríade nas cordas 3-2-1 deslocado de 3 em 3 casas percorre as quatro tríades. O lick abaixo desce E → Db → Bb e fecha com G, resolvendo a sensível (Si) na tônica de C7M.

#tab(
  "  G7(b9,13)                 G7(b9)                    C7M\ne|-------7-----------4-----|-------1-----------------|-------------|\nB|----9-----9-----6-----6--|----3-----3--------3-----|-------------|\nG|-9-----------6-----------|-3--------------4-----4--|-5-----------|\nD|-------------------------|-------------5-----------|-------------|\nA|-------------------------|-------------------------|-------------|\nE|-------------------------|-------------------------|-------------|",
  titulo: "Lick 2 — tríades maiores a cada 3ª menor (colcheias)",
  legenda: [Compasso 1: E (casas 9-9-7) e Db (6-6-4) — mesmo shape, 3 casas abaixo. Compasso 2: Bb (3-3-1) e G nas cordas 4-3-2.],
)

=== Célula deslocada por 3 casas

Qualquer grupo de notas da escala, deslocado 3 casas, continua dentro da escala. Escolha uma célula curta — aqui, duas notas na 1ª corda e duas na 2ª — e repita-a descendo o braço:

#tab(
  "  G7(b9)                                              C7M\ne|-13-12-------10-9--------|-7--6--------4--3--------|-------------|\nB|-------14-12-------11-9--|-------8--6--------5--3--|-5-----------|\nG|-------------------------|-------------------------|-------------|\nD|-------------------------|-------------------------|-------------|\nA|-------------------------|-------------------------|-------------|\nE|-------------------------|-------------------------|-------------|",
  titulo: "Lick 3 — célula de 4 notas descendo 3 casas (colcheias)",
  legenda: [Mesma digitação em todas as células (dedos 2-1 na 1ª corda, 3-1 na 2ª). A última célula termina em Ré (5ª de G7), que sobe para Mi (3ª de C7M).],
)

#caixa(tipo: "dica")[
  Simetria demais soa mecânica. Use o deslocamento para gerar a ideia e depois *quebre o padrão* na resolução: a última nota deve cair numa nota-guia do acorde seguinte (3ª ou 7ª), como nos licks acima.
]


#block(breakable: false)[
== 6. Aplicação no II-V-I

O lugar natural das escalas simétricas é o *acorde dominante* (e o diminuto de passagem). Escolha a escala pelas tensões que o acorde ou a melodia pedem:

#tabela(
  columns: (1.5fr, 1.7fr, 1.5fr, 2fr),
  ([*Acorde*], [*Tensões presentes*], [*Escala simétrica*], [*Observação*]),
  (
    ([G7(b9, 13)], [b9, 13 (5 justa)], [Sol dom-dim], [a combinação típica da dom-dim]),
    ([G7(\#9) / G7(b9, \#11)], [\#9 ou b9, \#11], [Sol dom-dim], [também cabe na alterada]),
    ([G7(\#5) / G7(9, \#5)], [9, \#5], [Sol tons inteiros], [sem 5ª justa, sem b9/\#9]),
    ([G7(b9, b13)], [b9, b13], [nenhuma], [mixolídio b9 b13 ou alterada]),
    ([Bº7 (= G7(b9))], [—], [Si T-ST = Sol dom-dim], [diminuto com função de V7]),
    ([C\#º7 de passagem], [—], [Dó\# T-ST], [equivale a A7(b9) sem tônica → Dm7]),
  ),
)
]

#v(0.6em)

#grid-acordes(
  chord: chord,
  columns: 4,
  (
    (tabs: "3,x,3,4,5,4", titulo: "G7(b9, 13)", nome: "", detalhe: "dom-dim"),
    (tabs: "x,10,9,10,11,x", titulo: "G7(#9)", nome: "", detalhe: "dom-dim"),
    (tabs: "3,x,3,4,4,x", titulo: "G7(#5)", nome: "", detalhe: "tons inteiros"),
    (tabs: "x,2,3,1,3,x", titulo: "Bº7", nome: "", detalhe: "Si T-ST"),
  ),
)

#v(0.6em)

#block(breakable: false)[
A frase a seguir usa Ré dórico no IIm7, Sol dom-dim no V7 — com a última célula do Lick 3 seguida de uma célula semelhante nas cordas 3 e 4 — e resolve a 7ª de G7 (Fá) na 3ª de C7M (Mi):

#tab(
  "  Dm7                       G7(b9)                    C7M\ne|-------------5-----------|-4--3--------------------|-------------------------|\nB|----------6-----6-----5--|-------5--3--------------|-------------------5-----|\nG|-------5-----------7-----|-------------4--3--------|-------------4-----------|\nD|----7--------------------|-------------------6--3--|-2-----5-----------------|\nA|-5-----------------------|-------------------------|-------------------------|\nE|-------------------------|-------------------------|-------------------------|",
  titulo: "Lick 4 — II-V-I em Dó com dom-dim no V7",
  legenda: [Compassos 1-2 em colcheias; compasso 3 em semínimas (arpejo de C7M a partir da 3ª).],
)
]

#caixa(tipo: "atencao", titulo: "Em tom menor")[
  No II-V-I menor (Dm7(b5) – G7 – Cm), a 13 natural da dom-dim (Mi) choca com o Mib da tônica. Ali prefira a alterada ou o mixolídio b9 b13 (5º modo da menor harmônica). Use a dom-dim no menor só como cor deliberada.
]

== 7. Exercícios

#block(breakable: false)[
#exercicio(titulo: "Dom-dim e suas equivalências", nivel: "escrita")[
  Escreva as 8 notas da escala dom-dim pedida e indique de quais notas a mesma coleção é uma escala T-ST.

  #tabela-preencher(
    ([*Dom-dim*], [*Notas (8)*], [*= T-ST de…*], [*Coleção*]),
    (
      ([A], none, none, none),
      ([D], none, none, none),
      ([E], none, none, none),
      ([Bb], none, none, none),
    ),
    columns: (0.8fr, 2.6fr, 1.6fr, 0.9fr),
    altura: 0.72cm,
  )
]
]

#block(breakable: false)[
#exercicio(titulo: "Qual escala simétrica?", nivel: "análise")[
  Para cada acorde, indique a escala simétrica adequada (dom-dim, T-ST ou tons inteiros, com a tônica) ou escreva "nenhuma" e justifique.

  #grid(
    columns: (1fr, 1fr, 1fr, 1fr),
    column-gutter: 1em,
    row-gutter: 0.75em,
    [a) Eb7(\#5)], [b) Bº7], [c) A7(b9, 13)], [d) F7(9, \#11, b13)],
    [e) D7(b9, b13)], [f) C7(\#9, 13)], [g) Ab7(9, \#5)], [h) F\#º7 (passagem)],
  )
  #linhas-resposta(3)
]
]

#block(breakable: false)[
#exercicio(titulo: "Tons inteiros", nivel: "escrita")[
  a) Escreva as duas coleções de tons inteiros. b) Por que não existe uma terceira? c) Qual coleção serve para B7(\#5)? E para Bb7(\#5)?
  #linhas-resposta(2)
]
]

#block(breakable: false)[
#exercicio(titulo: "Componha um lick", nivel: "composição")[
  Escreva uma frase de 3 compassos sobre *Dm7 | G7(b9) | C7M* usando no G7 pelo menos duas tríades de Sol dom-dim deslocadas por 3 casas. A última nota do G7 deve resolver em uma nota-guia de C7M (Mi ou Si).

  #tab-vazia(sistemas: 1, compassos: 3)
]
]
#block(breakable: false)[
#exercicio(titulo: "Tríades a cada 3ª menor", nivel: "escrita")[
  Na escala Ré dom-dim, encontre as quatro tríades maiores separadas por 3ª menor e diga que tensões cada uma gera sobre D7.

  #tabela-preencher(
    ([*Tríade*], [*Notas*], [*Intervalos sobre D7*]),
    (
      ([D], none, none),
      (none, none, none),
      (none, none, none),
      (none, none, none),
    ),
    columns: (0.8fr, 1.4fr, 2fr),
    altura: 0.6cm,
  )
]
]

#block(breakable: false)[
#exercicio(titulo: "Desenho no braço", nivel: "braço")[
  Desenhe *Lá dom-dim* entre as casas 4 e 8, três notas por corda (quatro em uma delas), escrevendo o intervalo dentro de cada círculo. Dica: compare com o desenho de Sol dom-dim da seção 4.

  #align(center, braco-vazio(casas: 5, fs: 4))
]
]


#block(breakable: false)[
#text(weight: "bold", size: 10pt, fill: color-strong)[Sugestão de prática]
#rotina-estudo((
  ([Tons inteiros: desenho das casas 2-6, depois a partir de 4, 6 e 8], [5 min], [60–80]),
  ([Dom-dim (casas 2-6, depois 5, 8 e 11) + º7 em 4 inversões], [10 min], [60–80]),
  ([Licks 1 a 3 com resolução em C7M], [8 min], [70–100]),
  ([II-V-I (Lick 4) em Dó, Fá e Sib], [6 min], [80]),
))
]

#block(breakable: false, checklist(
  (
    [Explico por que só existem 2 escalas de tons inteiros e 3 diminutas.],
    [Diferencio T-ST (sobre º7) e ST-T (sobre 7(b9)) sem consultar o material.],
    [Converto dom-dim de X em T-ST de X + 1 semitom de cabeça.],
    [Toco os desenhos de tons inteiros e dom-dim em pelo menos três posições.],
    [Escolho entre dom-dim, tons inteiros e alterada pelas tensões do acorde.],
    [Resolvo minhas frases simétricas numa nota-guia do acorde seguinte.],
  ),
  titulo: "Autoavaliação",
))

#gabarito[
  #resposta(1)[
    *A dom-dim:* A – Bb – C – C\# – D\# – E – F\# – G · equivale à T-ST de Bb, C\#, E, G · coleção I. \
    *D dom-dim:* D – Eb – F – F\# – G\# – A – B – C · equivale à T-ST de Eb, F\#, A, C · coleção III. \
    *E dom-dim:* E – F – G – G\# – A\# – B – C\# – D · equivale à T-ST de F, Ab, B, D · coleção II. \
    *Bb dom-dim:* Bb – B – C\# – D – E – F – G – Ab · equivale à T-ST de B, D, F, Ab · coleção II (a mesma de Sol e de Mi).
  ]
  #resposta(2)[
    a) Eb tons inteiros (coleção 2). b) Si T-ST (= Sol, Sib, Réb ou Mi dom-dim). c) Lá dom-dim. d) Fá tons inteiros (F G A B C\# Eb: 9, \#11, b13, sem 5ª justa). e) *Nenhuma*: a b13 exclui a dom-dim (que tem 13) e a b9 exclui os tons inteiros (que têm 9) — use mixolídio b9 b13 ou alterada. f) Dó dom-dim (\#9 e 13 estão nela). g) Láb tons inteiros (coleção 1). h) Fá\# T-ST (coleção III), pois F\#º7 = F7(b9) / D7(b9)… sem tônica.
  ]
  #resposta(3)[
    a) C D E F\# G\# A\# e Db Eb F G A B. b) Porque a escala se repete a cada tom: começar em qualquer nota da coleção 1 dá a coleção 1; as notas que sobram (um semitom acima) formam a coleção 2 — não há uma terceira posição possível. c) B7(\#5): coleção 2 (B C\# D\# F G A = Db Eb F G A B). Bb7(\#5): coleção 1.
  ]
  #resposta(4)[
    Exercício criativo — critérios: (1) no G7, só notas de G Ab Bb B C\# D E F; (2) ao menos duas tríades entre G, Bb, Db e E, com o mesmo shape a 3 casas de distância; (3) a última nota do G7 caminha por grau conjunto para Mi ou Si no C7M (ex.: Fá → Mi, Ré → Mi ou Sib → Si).
  ]
  #resposta(5)[
    D (D F\# A) = T – 3 – 5 · F (F A C) = \#9 – 5 – b7 · Ab (Ab C Eb) = \#11 – b7 – b9 · B (B D\# F\#) = 13 – b9 – 3.
  ]
  #resposta(6)[
    Lá dom-dim é o desenho de Sol dom-dim deslocado *2 casas acima*. Todo desenho de escala é móvel; o que a simetria acrescenta é que deslocamentos de *3* casas mantêm as mesmas notas (2 casas mudam de coleção: Lá pertence à coleção I).
    #v(0.3em)
    #align(center, braco-notas(g-domdim, fs: 4))
  ]
]
