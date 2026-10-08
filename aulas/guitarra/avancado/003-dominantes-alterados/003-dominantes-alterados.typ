#import "/templates/layout.typ": *
#import "/templates/components.typ": *
#import "@preview/conchord:0.4.0": new-chordgen

#show: aula.with(
  instrumento: "Guitarra",
  nivel: "Avançado",
)

#let chord = new-chordgen(number-to-left: true, use-shadow-barre: false, colors: (hold: black, barre: black))
#show <chord>: set text(fill: color-strong, weight: "bold")

#let legenda(body) = align(center, text(size: 8.5pt, fill: color-muted, body))

= Dominantes Alterados

O acorde dominante é o mais "elástico" da harmonia tonal: sobre ele quase tudo é permitido, desde que resolva. É no V7 que o jazz e a MPB colocam as suas cores mais fortes — a b9 de um choro, a \#9 de um blues, a b13 de uma bossa em tom menor, a \#11 de um SubV. Nesta aula você vai organizar essas tensões, aprender a cifrá-las e a tocá-las, escolher a escala certa para cada combinação e, o mais importante, fazer cada tensão *resolver* no acorde seguinte.

#objetivos((
  [Conhecer as seis tensões do dominante (9, b9, \#9, \#11, 13, b13) e quando cada uma cabe],
  [Ler e escrever a cifragem dos dominantes alterados sem ambiguidade],
  [Tocar os voicings práticos de 7(9), 7(13), 7(\#11), 7(b9), 7(\#9), 7(b13), 7(\#5) e 7alt],
  [Escolher a escala a partir das tensões: mixolídio, lídio dominante, frígio dominante, dom-dim, alterado],
  [Conduzir cada tensão para uma nota do acorde de resolução, no II-V-I maior e menor],
))

== 1. As tensões do dominante

Sobre um acorde dominante podem ser empilhadas seis tensões: duas *naturais* (9 e 13), a *\#11* e três *alteradas* (b9, \#9 e b13). A 11ª justa (C em G7) é *nota a evitar*: ela forma uma 9ª menor com a 3ª do acorde e "apaga" a função dominante — só aparece em acordes sus4. A tabela usa G7, o V de Dó maior e de Dó menor:


#tabela(
  columns: (0.7fr, 0.8fr, 0.8fr, 1.6fr, 2.2fr),
  ([Tensão], [Em G7], [Tipo], [Cabe bem quando resolve em…], [Observação]),
  (
    ([9], [A], [natural], [maior; em menor, só junto da b13], [diatônica de Dó maior]),
    ([b9], [Ab], [alterada], [menor (é diatônica) e maior], [a tensão típica do V7 do tom menor]),
    ([\#9], [A\# (Bb)], [alterada], [maior e menor], [soa como uma 3ª menor sobre a maior: o som do blues]),
    ([\#11], [C\#], [alterada], [maior e menor], [substitui a 4ª; típica do dominante que não resolve 5ª abaixo]),
    ([13], [E], [natural], [maior], [em menor, choca com o Eb da tônica: evite]),
    ([b13], [Eb], [alterada], [menor (é diatônica) e maior], [mesmo som da \#5 quando a 5ª justa sai]),
  ),
)


#cartoes-info((
  (titulo: [Resolvendo em maior (G7 → C)], corpo: [As tensões *naturais* 9 e 13 soam "dentro" do tom. As alteradas (b9, \#9, b13) não pertencem a Dó maior, mas são justamente o tempero do jazz: criam atrito e resolvem por semitom em notas de C7M.]),
  (titulo: [Resolvendo em menor (G7 → Cm)], corpo: [A *b9 (Ab)* e a *b13 (Eb)* são notas da própria tonalidade de Dó menor — por isso soam naturais. A \#9 também funciona. A 13 natural (E) contradiz o Eb da tônica e deve ser evitada; a 9 natural só com a b13 (mixolídio b6).]),
))


#caixa(tipo: "dica", titulo: "Combinações que funcionam")[
  b9 + \#9 · b9 + b13 · \#9 + b13 (*alterado*) · b9 + 13 · \#9 + 13 (*dom-dim*) · 9 + \#11 + 13 (*lídio dominante*) · 9 + b13 (*mixolídio b6*). Evite misturar a mesma tensão natural e alterada no mesmo voicing (9 com b9, 13 com b13).
]

== 2. Cifragem

A cifra diz *quais* tensões o compositor quer. Quando ela não diz, o acompanhador escolhe pelo contexto (maior ou menor) e pela melodia.


#tabela(
  columns: (1.1fr, 1.5fr, 2.8fr),
  ([Cifra], [Notas em G], [Leitura]),
  (
    ([G7(9)], [G B D F A], [9ª natural — a "cor neutra" do dominante]),
    ([G7(13) · G7(9,13)], [G B F E · G B F A E], [13ª natural; a cifra americana G13 já subentende a 9ª]),
    ([G7(\#11)], [G B D F C\#], [com 9 e 13 opcionais: som do lídio dominante]),
    ([G7(b9)], [G B D F Ab], [9ª menor sobre o dominante]),
    ([G7(\#9)], [G B D F A\#], [9ª aumentada; A\# soa como Bb]),
    ([G7(b13)], [G B (D) F Eb], [b13 como tensão: a 5ª justa pode estar presente ou subentendida]),
    ([G7(\#5)], [G B D\# F], [a 5ª justa é *substituída* pela \#5: acorde aumentado com 7ª]),
    ([G7(b9,b13)], [G B F Ab Eb], [as duas tensões diatônicas do tom menor]),
    ([G7(\#9,b13)], [G B F A\# Eb], [o voicing "alt" mais comum na guitarra]),
    ([G7alt], [G B F + tensões alteradas], [b9, \#9, \#11/b5 e b13/\#5 à escolha do músico; sem 5ª justa e sem tensões naturais]),
  ),
)


#caixa(tipo: "atencao", titulo: "b13 ou #5?")[
  Eb e D\# são o mesmo som. Escreva *7(\#5)* quando o acorde é aumentado (não há 5ª justa) e *7(b13)* quando a nota é uma tensão acima de um dominante com 5ª. Na guitarra, como a 5ª costuma ser omitida, o mesmo shape serve para as duas cifras — o nome muda conforme a melodia e a escala (tons inteiros para o \#5; mixolídio b6, frígio dominante ou alterado para a b13).
]

== 3. Voicings práticos

Todos os shapes abaixo estão em *C7* e são móveis: desloque-os para qualquer tom mantendo o desenho. Abaixo de cada diagrama, as vozes do grave para o agudo. Quando falta espaço para as tensões, a 5ª é a primeira nota a sair: ela é a nota menos característica do acorde.

=== Tensões naturais e \#11

#grid-acordes(chord: chord, columns: (1fr,) * 4, (
  (tabs: "x,3,2,3,3,3", nome: "C7(9)", titulo: "9ª natural", detalhe: "T · 3 · 7 · 9 · 5"),
  (tabs: "x,3,2,3,3,5", nome: "C7(9,13)", titulo: "9ª e 13ª naturais", detalhe: "T · 3 · 7 · 9 · 13"),
  (tabs: "8,x,8,9,10,x,*", nome: "C7(13)", titulo: "13ª, baixo na 6ª", detalhe: "T · 7 · 3 · 13"),
  (tabs: "8,x,8,9,7,x,*", nome: "C7(#11)", titulo: "#11, baixo na 6ª", detalhe: "T · 7 · 3 · #11"),
))

=== Tensões alteradas simples

#grid-acordes(chord: chord, columns: (1fr,) * 4, (
  (tabs: "x,3,2,3,2,x,*", nome: "C7(b9)", titulo: "b9, baixo na 5ª", detalhe: "T · 3 · 7 · b9"),
  (tabs: "x,x,2,3,2,3,*", nome: "Eº7", titulo: "= C7(b9) sem T", detalhe: "3 · 7 · b9 · 5"),
  (tabs: "x,3,2,3,4,x", nome: "C7(#9)", titulo: "#9 (“acorde Hendrix”)", detalhe: "T · 3 · 7 · #9"),
  (tabs: "8,x,8,9,9,x,*", nome: "C7(b13)", titulo: "b13, baixo na 6ª", detalhe: "T · 7 · 3 · b13"),
))

=== Combinações alteradas

#grid-acordes(chord: chord, columns: (1fr,) * 4, (
  (tabs: "x,3,x,3,5,4,*", nome: "C7(#5)", titulo: "#5 no lugar da 5ª", detalhe: "T · 7 · 3 · #5"),
  (tabs: "x,3,2,3,4,4", nome: "C7(#9,b13)", titulo: "#9 e b13", detalhe: "T · 3 · 7 · #9 · b13"),
  (tabs: "x,3,2,3,2,4", nome: "C7(b9,b13)", titulo: "b9 e b13", detalhe: "T · 3 · 7 · b9 · b13"),
  (tabs: "x,x,2,3,4,4", nome: "C7alt", titulo: "sem fundamental", detalhe: "3 · 7 · #9 · b13"),
))

#caixa(tipo: "dica", titulo: "O truque do diminuto")[
  Tirando a fundamental de C7(b9), sobram E – G – Bb – Db: um *Eº7*. Como o acorde diminuto é simétrico (repete-se a cada 3 casas), o mesmo shape *x,x,2,3,2,3* deslocado para as casas 5, 8 e 11 continua sendo C7(b9) — e também serve para A7(b9), F\#7(b9) e Eb7(b9).
]

== 4. Escolha de escala

A regra é simples: *a escala precisa conter as tensões da cifra* (e as notas do acorde). As tensões escolhidas apontam para uma única escala. Em G7, pensando no II-V-I de Dó:


#tabela(
  columns: (1.6fr, 1.7fr, 1.5fr, 1.2fr, 1.7fr),
  ([Escala], [Fórmula], [Em G], [Tensões], [Uso típico]),
  (
    ([Mixolídio], [T 2 3 4 5 6 7], [G A B C D E F], [9, 13], [V7 → maior; blues]),
    ([Lídio dominante], [T 2 3 \#4 5 6 7], [G A B C\# D E F], [9, \#11, 13], [SubV, II7, bVII7; V7 sem resolução]),
    ([Mixolídio b6], [T 2 3 4 5 b6 7], [G A B C D Eb F], [9, b13], [V7 → menor, com 9ª natural]),
    ([Mixolídio b9 b13 (frígio dominante)], [T b2 3 4 5 b6 7], [G Ab B C D Eb F], [b9, b13], [V7 → menor (5º modo da menor harmônica)]),
    ([Dom-dim (semitom-tom)], [T b2 \#2 3 \#4 5 6 7], [G Ab Bb B C\# D E F], [b9, \#9, \#11, 13], [7(b9,13), 7(\#9,13)]),
    ([Alterado], [T b2 \#2 3 b5 \#5 7], [G Ab Bb B Db Eb F], [b9, \#9, \#11, b13], [7alt → maior ou menor]),
    ([Tons inteiros], [T 2 3 \#4 \#5 7], [G A B C\# D\# F], [9, \#11, \#5], [7(\#5), 7(9,\#5)]),
  ),
)


#block(breakable: false)[
  === Tabela de decisão: tensão → escala

  #tabela(
    columns: (2fr, 1.4fr, 2fr),
    ([Tensões pedidas (ou ouvidas)], [Escala], [De onde vem]),
    (
      ([nenhuma, 9 ou 13], [mixolídio], [modo V da escala maior]),
      ([\#11 (com 9 e 13)], [lídio dominante], [menor melódica uma 5ª acima]),
      ([9 + b13], [mixolídio b6], [menor melódica uma 4ª acima]),
      ([b9 + b13, com 5ª justa], [frígio dominante], [menor harmônica uma 4ª acima]),
      ([b9 ou \#9 *com 13 natural*], [dom-dim], [escala diminuta, semitom-tom]),
      ([b9 ou \#9 *com b13*; "alt"], [alterado], [menor melódica meio-tom acima]),
      ([\#5 sem outras alterações], [tons inteiros], [escala simétrica de tons]),
    ),
  )
]


#caixa(tipo: "resumo")[
  A 13ª decide: *13 natural* com b9/\#9 → dom-dim; *b13* com b9/\#9 → alterado (ou frígio dominante, se houver 5ª justa e nenhuma \#9). Para ler a tabela: a *menor melódica* é a escala maior com a 3ª abaixada (em Dó: C D Eb F G A B); as escalas *simétricas* repetem um padrão fixo — a dom-dim alterna semitom e tom, a de tons inteiros só tem tons.
]

== 5. Resolução das tensões

Uma tensão só soa bem se *for para algum lugar*. As tensões alteradas são vizinhas cromáticas das notas do acorde de chegada e resolvem, quase sempre, por semitom. Veja para onde vai cada voz de G7 em Dó maior e em Dó menor:


#tabela(
  columns: (0.55fr, 0.75fr, 2.6fr, 2.6fr),
  ([Voz], [Nota], [→ C7M (maior)], [→ Cm7 (menor)]),
  (
    ([3], [B], [↑ semitom para C (T) ou fica (7M)], [↑ semitom para C (T)]),
    ([7], [F], [↓ semitom para E (3)], [↓ tom para Eb (b3)]),
    ([9], [A], [↓ tom para G (5) ou fica (6)], [↓ tom para G (5)]),
    ([*b9*], [Ab], [↓ semitom para G (5)], [↓ semitom para G (5)]),
    ([*\#9*], [A\# / Bb], [↑ semitom para B (7M) ou ↓ semitom para A (6)], [fica: vira a 7ª de Cm7 (nota comum)]),
    ([*\#11*], [C\# / Db], [↓ semitom para C (T) ou ↑ semitom para D (9)], [↓ semitom para C (T) ou ↑ semitom para D (9)]),
    ([13], [E], [fica: vira a 3 de C7M (nota comum)], [— (evitar em menor)]),
    ([*b13*], [Eb], [↑ semitom para E (3) ou ↓ semitom para D (9)], [fica: vira a b3 de Cm7; ou ↓ semitom para D (9)]),
  ),
)


#caixa(tipo: "atencao", titulo: "Os erros mais comuns")[
  Deixar a b9 "pendurada" (Ab sem descer para G), ou subir a b13 em tom menor (Eb → E transforma Cm em C). Em tom maior, a \#9 escrita como Bb tende a descer; escrita como A\#, tende a subir para B — a grafia mostra a direção.
]

== 6. II-V-I com dominante alterado

=== Em Dó maior: Dm7(9) – G7(b9,b13) – C7M(9)

#grid-acordes(chord: chord, columns: (1fr,) * 3, (
  (tabs: "x,5,3,5,5,5", nome: "Dm7(9)", titulo: "IIm7(9)", detalhe: "T · b3 · 7 · 9 · 5"),
  (tabs: "3,x,3,4,4,4,*", nome: "G7(b9,b13)", titulo: "V7(b9,b13)", detalhe: "T · 7 · 3 · b13 · b9"),
  (tabs: "x,3,2,4,3,3", nome: "C7M(9)", titulo: "I7M(9)", detalhe: "T · 3 · 7M · 9 · 5"),
))

#tabela(
  columns: (0.6fr, 1.05fr, 1.25fr, 1.05fr, 2.5fr),
  ([Corda], [Dm7(9)], [G7(b9,b13)], [C7M(9)], [Movimento]),
  (
    ([4ª], [F (b3)], [F (7)], [E (3)], [nota comum; depois ↓ semitom]),
    ([3ª], [C (7)], [B (3)], [B (7M)], [↓ semitom; depois nota comum]),
    ([2ª], [E (9)], [Eb (b13)], [D (9)], [linha cromática descendente]),
    ([1ª], [A (5)], [Ab (b9)], [G (5)], [linha cromática descendente]),
  ),
)

#block(breakable: false)[
  === Em Dó menor: Dm7(b5) – G7(\#9,b13) – Cm7

  #grid-acordes(chord: chord, columns: (1fr,) * 3, (
    (tabs: "x,x,10,10,9,10", nome: "Dm7(b5)", titulo: "IIm7(b5)", detalhe: "7 · b3 · b5 · T"),
    (tabs: "x,10,9,10,11,11", nome: "G7(#9,b13)", titulo: "V7(#9,b13)", detalhe: "T · 3 · 7 · #9 · b13"),
    (tabs: "x,x,10,12,11,11", nome: "Cm7", titulo: "Im7", detalhe: "T · 5 · 7 · b3"),
  ))

  #tabela(
    columns: (0.6fr, 1.05fr, 1.25fr, 1.05fr, 2.5fr),
    ([Corda], [Dm7(b5)], [G7(\#9,b13)], [Cm7], [Movimento]),
    (
      ([4ª], [C (7)], [B (3)], [C (T)], [↓ semitom e volta: 3 → T]),
      ([3ª], [F (b3)], [F (7)], [G (5)], [nota comum, depois ↑ tom]),
      ([2ª], [Ab (b5)], [Bb (\#9)], [Bb (7)], [\#9 vira a 7ª de Cm7]),
      ([1ª], [D (T)], [Eb (b13)], [Eb (b3)], [b13 vira a b3 de Cm7]),
    ),
  )
]

#caixa(tipo: "dica")[
  No exemplo menor, *duas tensões resolvem por nota comum*: a \#9 (Bb) e a b13 (Eb) já são notas de Cm7. É por isso que o dominante alterado soa tão "inevitável" em tom menor — ele já contém a tônica que está por vir.
]

=== Uma linha melódica sobre o II-V-I maior

A linha abaixo percorre o G alterado no compasso 2 e termina na 7ª do G7 (F), que desce um semitom até a 3ª de C7M (E):

#tab(
  titulo: "Dm7(9) – G7alt – C7M(9) · colcheias; último compasso em semínimas",
  legenda: [Compasso 1: arpejo de Dm7(9) e D dórico · Compasso 2: G alterado, descendo do Ab (b9) · Compasso 3: arpejo de C7M(9) a partir da 3ª (E).],
  "  Dm7(9)                    G7alt                     C7M(9)\ne|-------------------3--5--|-4-----------------------|-------------------------|\nB|-------------5--6--------|----6--4-----------------|-------------------3-----|\nG|-------2--5--------------|----------6--4--3--------|-------------4-----------|\nD|----3--------------------|-------------------6--3--|-2-----5-----------------|\nA|-5-----------------------|-------------------------|-------------------------|\nE|-------------------------|-------------------------|-------------------------|",
)

== 7. Exercícios

#block(breakable: false)[#exercicio(titulo: "Tensões em outros tons", nivel: "Escrita")[
  Escreva a nota de cada tensão em D7 (V de Sol) e em A7 (V de Ré).

  #tabela-preencher(
    ([Acorde], [9], [b9], [\#9], [\#11], [13], [b13]),
    (
      ([D7], none, none, none, none, none, none),
      ([A7], none, none, none, none, none, none),
    ),
    columns: (1fr,) * 7,
  )
]]

#block(breakable: false)[#exercicio(titulo: "Da cifra às notas", nivel: "Escrita")[
  Escreva as notas de cada acorde, da fundamental às tensões.

  #tabela-preencher(
    ([Cifra], [Notas], [Cifra], [Notas]),
    (
      ([E7(\#9)], none, [D7(\#11)], none),
      ([Bb7(b9)], none, [A7(\#9,b13)], none),
      ([F7(b13)], none, [Eb7(b9,b13)], none),
    ),
    columns: (0.8fr, 1.6fr, 0.9fr, 1.6fr),
  )
]]

#block(breakable: false)[#exercicio(titulo: "Escolha a escala", nivel: "Análise")[
  Indique a escala mais adequada para o dominante em cada situação.

  #tabela-preencher(
    ([Situação], [Escala], [Situação], [Escala]),
    (
      ([a) G7(13) → C7M], none, [e) G7(b9,13) → C7M], none),
      ([b) G7(b9,b13) → Cm], none, [f) G7(9,b13) → Cm], none),
      ([c) Db7(\#11) → C7M], none, [g) G7(\#5) → C7M], none),
      ([d) G7(\#9,b13) → C7M], none, [h) Bb7(9,\#11) → C7M], none),
    ),
    columns: (1.4fr, 1fr, 1.4fr, 1fr),
  )
]]

#block(breakable: false)[#exercicio(titulo: "Para onde vai cada tensão?", nivel: "Condução de vozes")[
  O voicing G7alt tem as tensões Ab, A\#, C\# e Eb. Escreva a nota de resolução de cada uma (e o seu grau no acorde de chegada).

  #tabela-preencher(
    ([Tensão de G7alt], [→ C7M], [→ Cm7]),
    (
      ([b9 (Ab)], none, none),
      ([\#9 (A\#/Bb)], none, none),
      ([\#11 (C\#/Db)], none, none),
      ([b13 (Eb)], none, none),
    ),
    columns: (1.2fr, 1.5fr, 1.5fr),
  )
]]

#block(breakable: false)[#exercicio(titulo: "Transporte os shapes", nivel: "Braço")[
  Usando os shapes da seção 3, escreva as casas (da 6ª para a 1ª corda) de: A7(\#9) com fundamental na 5ª corda · F7(b9) com fundamental na 5ª corda · Bb7(b13) com fundamental na 6ª corda.

  #linhas-resposta(2)
]]

#block(breakable: false)[#exercicio(titulo: "II-V-I alterado em Ré maior", nivel: "Transposição")[
  Transporte o II-V-I maior da seção 6 para Ré maior: *Em7(9) – A7(b9,b13) – D7M(9)*. Escreva as casas (6ª → 1ª corda) e as notas de cada voicing, do grave para o agudo.

  #tabela-preencher(
    ([Acorde], [Casas], [Notas (grave → agudo)]),
    (
      ([Em7(9)], none, none),
      ([A7(b9,b13)], none, none),
      ([D7M(9)], none, none),
    ),
    columns: (1fr, 1.3fr, 2fr),
  )
]]

#block(breakable: false)[#exercicio(titulo: "II-V-I alterado em três tons", nivel: "Prática")[
  Toque o II-V-I maior da seção 6 em Dó, Fá e Sib, e o II-V-I menor em Dó, Fá e Sib menor, a 60 BPM (um acorde por compasso, I por dois compassos). Cante — ou toque na 1ª corda — a linha de resolução de cada tensão enquanto troca de acorde.
]]

#block(breakable: false)[#exercicio(titulo: "Escreva uma resolução", nivel: "Criação")[
  Escreva uma linha de dois compassos: | G7alt | C7M |. No primeiro, use apenas o G alterado (G Ab Bb B Db Eb F) e termine na b9 (Ab) ou na b13 (Eb); no segundo, resolva essa nota por semitom numa nota de C7M. Use a primeira pauta como rascunho.

  #tab-vazia(sistemas: 2, compassos: 2, altura-linha: 12pt)
]]

#block(breakable: false)[
  === Sugestão de prática

  #rotina-estudo((
    ([Os 12 voicings da seção 3 em C, depois em F e Bb], [10 min], [60]),
    ([Eº7 = C7(b9): o shape diminuto em quatro posições], [5 min], [60–80]),
    ([Escalas em G: mixolídio, lídio dom., frígio dom., dom-dim e alterado], [10 min], [70–90]),
    ([II-V-I maior e menor da seção 6 com metrônomo], [8 min], [60]),
    ([Improviso resolvendo b9 → 5 e b13 → 3/b3 sobre G7alt → C/Cm], [7 min], [70]),
  ))
]

#block(breakable: false, checklist(titulo: "Autoavaliação", (
  [Digo de cor as notas das seis tensões em qualquer dominante.],
  [Sei quando usar 13 natural e quando usar b13 (resolução para maior ou menor).],
  [Toco os voicings de 7(9), 7(13), 7(\#11), 7(b9), 7(\#9), 7(b13), 7(\#5) e 7alt sem consultar.],
  [Escolho a escala certa a partir das tensões da cifra.],
  [Resolvo cada tensão por semitom ou nota comum no acorde seguinte.],
)))

#gabarito[
  #resposta(1)[
    D7: 9 = E · b9 = Eb · \#9 = E\# (soa F) · \#11 = G\# · 13 = B · b13 = Bb. \
    A7: 9 = B · b9 = Bb · \#9 = B\# (soa C) · \#11 = D\# · 13 = F\# · b13 = F.
  ]
  #resposta(2)[
    E7(\#9): E G\# B D F\#\# (soa G) · Bb7(b9): Bb D F Ab Cb (soa B) · F7(b13): F A (C) Eb Db · D7(\#11): D F\# A C G\# · A7(\#9,b13): A C\# G B\# (soa C) F · Eb7(b9,b13): Eb G Db Fb (soa E) Cb (soa B).
  ]
  #resposta(3)[
    a) mixolídio · b) frígio dominante (mixolídio b9 b13) · c) lídio dominante · d) alterado · e) dom-dim (semitom-tom) · f) mixolídio b6 · g) tons inteiros · h) lídio dominante (Bb7 é o bVII7, empréstimo do tom menor).
  ]
  #resposta(4)[
    → C7M: Ab → G (5) · A\# → B (7M) ou Bb → A (6) · C\# → C (T) ou D (9) · Eb → E (3) ou D (9). \
    → Cm7: Ab → G (5) · Bb fica (7) · Db → C (T) · Eb fica (b3) ou → D (9).
  ]
  #resposta(5)[
    A7(\#9): x,12,11,12,13,x · F7(b9): x,8,7,8,7,x · Bb7(b13): 6,x,6,7,7,x.
  ]
  #resposta(6)[
    Em7(9): x,7,5,7,7,7 — E G D F\# B · A7(b9,b13): 5,x,5,6,6,6 — A G C\# F Bb · D7M(9): x,5,4,6,5,5 — D F\# C\# E A. (Tudo duas casas acima da versão em Dó.)
  ]
  #resposta(7)[
    Exercício prático — critério de sucesso: seis tonalidades tocadas sem parar, com todas as vozes de cada acorde soando. No II-V-I maior, a nota da 1ª corda desce por semitom (b9 → 5) na chegada à tônica; no menor, a \#9 e a b13 do V7 ficam paradas e viram a 7ª e a b3 de Im7.
  ]
  #resposta(8)[
    Resposta pessoal — critério de sucesso: o primeiro compasso usa só notas de G alterado e termina em Ab ou Eb; a primeira nota do segundo compasso é G (se terminou em Ab), E ou D (se terminou em Eb). Compare com a linha da seção 6.
  ]
]
