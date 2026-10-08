#import "/templates/layout.typ": *
#import "/templates/components.typ": *
#import "@preview/conchord:0.4.0": new-chordgen, render-chord

#show: aula.with(
  instrumento: "Guitarra",
  nivel: "Exercícios — Avançado",
)

#let chord = new-chordgen(number-to-left: true, use-shadow-barre: false, colors: (hold: black, barre: black))
#let chord-vazio = new-chordgen(
  number-to-left: true,
  use-shadow-barre: false,
  colors: (hold: gray, barre: gray),
  scale-length: 1.25pt,
)
#show <chord>: set text(fill: color-strong, weight: "bold")

// ------------------------------------------------------------
// Ajustes locais
// ------------------------------------------------------------

#show table: set par(justify: false)

// Resposta do gabarito que não se divide entre páginas.
#let resp(n, body) = block(breakable: false, width: 100%, resposta(n, body))

// Exercício que não se divide entre páginas.
#let ex(titulo: none, nivel: none, body) = block(
  breakable: false,
  width: 100%,
  exercicio(titulo: titulo, nivel: nivel, body),
)

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

// Linha curta rotulada para resposta abaixo de diagramas.
#let campo(rotulo, largura: 2.4cm) = box[
  #text(size: 8.5pt, fill: color-secondary, rotulo)
  #box(width: largura, line(length: 100%, stroke: 0.6pt + color-rule-dark))
]

// Diagrama com pontos cinza para o aluno identificar.
#let diag-preencher(tabs, campos: ("Acorde:", "Inversão:", "Topo:")) = align(center)[
  #box(chord-vazio(if tabs.ends-with("*") { tabs } else { tabs + ",*" }))
  #v(0.2em)
  #set par(leading: 1.1em)
  #for c in campos [
    #campo(c) \
  ]
]

// Diagrama totalmente vazio (casa inicial escrita pelo aluno).
#let diag-vazio(titulo) = align(center)[
  #text(size: 9.5pt, weight: "bold", titulo)
  #v(-0.2em)
  #box(render-chord(
    (),
    (),
    (),
    0,
    "",
    colors: (grid: luma(110)),
    number-to-left: true,
    thick-nut: false,
    scale-length: 1.35pt,
  ))
  #v(-0.3em)
  #campo("casa:", largura: 1.2cm)
]

// Diagrama de resposta com legenda curta.
#let diag-resp(tabs, nome, legenda) = align(center)[
  #box(chord(tabs, name: nome))
  #v(-0.2em)
  #text(size: 8pt, legenda)
]

= Voicings e Tensões

No nível avançado, saber *quais notas* tem um acorde é só o começo: o que define o som é *como* elas são distribuídas no braço e *quais tensões* entram no lugar das notas básicas. Este material treina a construção de voicings drop 2 e drop 3, as tensões disponíveis e alteradas, as estruturas superiores e os voicings quartais.

== Como usar este material

#[
  #set text(size: 10pt)
  #passos((
    [Resolva *na ordem*: cada bloco vai do nível *Médio* (aplicação direta) ao *Desafio* (construção no braço, condução de vozes).],
    [Escreva as vozes sempre *do grave para o agudo*. Em cada voicing, identifique a nota do baixo (inversão) e a do topo (melodia).],
    [*Toque* cada voicing e cada tensão sobre o baixo correspondente: o objetivo é ouvir a cor, não só acertar o nome.],
    [Confira no *Gabarito*. Onde há várias respostas válidas, ele traz uma resposta-modelo e o critério de correção.],
  ))
]

== Conteúdos cobertos

#[
  #set text(size: 9.5pt)
  #tabela(
    columns: (1.5fr, 3.6fr, 0.7fr),
    alinhamento: (left + horizon, left + horizon, center + horizon),
    ([Bloco], [O que você pratica], [Exerc.]),
    (
      ([*1. Drop 2 e drop 3*], [Construção a partir da posição fechada, inversão, voz do topo, formas no braço, condução no II-V-I], [1–5]),
      ([*2. Tensões*], [Tensões disponíveis, tensões dos dominantes secundários, acordes alterados, identificação no braço, II-V-I com tensões], [6–11]),
      ([*3. Estruturas superiores*], [Tríade sobre dominante, tensões geradas, aplicação no II-V-I], [12–14]),
      ([*4. Voicings quartais*], [Empilhamento em 4ªs, contexto harmônico, os voicings de "So What"], [15–17]),
    ),
  )
]

#v(0.4em)

#caixa(tipo: "resumo", titulo: none, width: 100%)[
  #set text(size: 9.5pt)
  #align(left)[*Convenções:* #h(4pt) vozes numeradas *do agudo para o grave* (voz 1 = topo). *Drop 2*: a 2ª voz da posição fechada desce uma oitava; *drop 3*: a 3ª voz desce uma oitava. Intervalos: *b7* = 7ª menor, *7M* = 7ª maior; tensões 9, b9, \#9, 11, \#11, 13, b13. Cifras: C7(b9), C7(\#9), C7(b13), C7alt, C7(9,13), C7M(\#11).]
]

#pagebreak()

// ============================================================
// BLOCO 1 — DROP 2 E DROP 3
// ============================================================

#block(sticky: true)[
  == 1. Voicings Drop 2 e Drop 3

  Uma tétrade em *posição fechada* (as quatro notas dentro de uma oitava) é difícil de tocar na guitarra. Abaixando uma voz uma oitava, o acorde se "abre" e cabe em quatro cordas vizinhas (drop 2) ou em cordas com um salto (drop 3).
]

#ex(titulo: "Do fechado ao drop 2 e ao drop 3", nivel: "Médio")[
  Para cada posição fechada de *C7M* (escrita do grave para o agudo), escreva o drop 2 e o drop 3 e indique a nota do baixo de cada um. A primeira linha é um exemplo.

  #v(0.4em)
  #tabela-preencher(
    columns: (1.3fr, 1.3fr, 0.8fr, 1.3fr, 0.8fr),
    altura: 1cm,
    ([Posição fechada], [Drop 2], [Baixo], [Drop 3], [Baixo]),
    (
      ([C – E – G – B], [G – C – E – B], [G (5ª)], [E – C – G – B], [E (3ª)]),
      ([E – G – B – C], none, none, none, none),
      ([G – B – C – E], none, none, none, none),
      ([B – C – E – G], none, none, none, none),
    ),
  )

  #v(0.3em)
  Que voz da posição fechada vira o baixo no drop 2? E no drop 3?
  #linhas-resposta(1)
]

#ex(titulo: "Drop 2 e drop 3 em outros acordes", nivel: "Médio")[
  Escreva o drop 2 e o drop 3 de cada posição fechada e dê o nome da inversão resultante (fundamental, 1ª, 2ª ou 3ª — conforme o baixo).

  #v(0.4em)
  #tabela-preencher(
    columns: (0.7fr, 1.25fr, 1.25fr, 0.9fr, 1.25fr, 0.9fr),
    altura: 0.95cm,
    ([Acorde], [Fechada], [Drop 2], [Inversão], [Drop 3], [Inversão]),
    (
      ([G7], [G – B – D – F], none, none, none, none),
      ([G7], [D – F – G – B], none, none, none, none),
      ([Fm7], [Ab – C – Eb – F], none, none, none, none),
      ([Fm7], [Eb – F – Ab – C], none, none, none, none),
      ([Am7], [A – C – E – G], none, none, none, none),
      ([Am7], [C – E – G – A], none, none, none, none),
    ),
  )
]

#ex(titulo: "Identifique o voicing", nivel: "Médio")[
  Escreva o nome da nota em cada ponto cinza. Depois dê a cifra, o tipo (drop 2 ou drop 3) com a inversão e a nota do topo com o intervalo.

  #v(0.5em)
  #grid(
    columns: (1fr,) * 4,
    row-gutter: 1.3em,
    diag-preencher("x,x,10,12,12,12", campos: ("Acorde:", "Tipo/inv.:", "Topo:")),
    diag-preencher("x,10,12,10,12,x", campos: ("Acorde:", "Tipo/inv.:", "Topo:")),
    diag-preencher("3,x,3,4,3,x,*", campos: ("Acorde:", "Tipo/inv.:", "Topo:")),
    diag-preencher("x,3,x,4,5,3", campos: ("Acorde:", "Tipo/inv.:", "Topo:")),
    diag-preencher("x,x,3,5,3,5", campos: ("Acorde:", "Tipo/inv.:", "Topo:")),
    diag-preencher("x,12,12,10,11,x", campos: ("Acorde:", "Tipo/inv.:", "Topo:")),
    diag-preencher("11,x,10,12,11,x", campos: ("Acorde:", "Tipo/inv.:", "Topo:")),
    diag-preencher("x,x,10,10,10,11", campos: ("Acorde:", "Tipo/inv.:", "Topo:")),
  )
]

#ex(titulo: "Am7 drop 2 nas quatro inversões", nivel: "Desafio")[
  Desenhe o *Am7 drop 2* nas cordas *4-3-2-1* nas quatro inversões, subindo pelo braço a partir da casa 5. Escreva os intervalos em cada ponto e a casa inicial.

  #v(0.5em)
  #grid(
    columns: (1fr,) * 4,
    diag-vazio[Am7/G], diag-vazio[Am7], diag-vazio[Am7/C], diag-vazio[Am7/E],
  )

  #v(0.3em)
  Qual inversão tem a fundamental no topo? E a 5ª?
  #linhas-resposta(1)
]

#ex(titulo: "II-V-I em drop 2 com condução de vozes", nivel: "Desafio")[
  Toque *Dm7 – G7 – C7M* em drop 2 nas cordas 4-3-2-1, começando com o Dm7 em posição fundamental na casa 12. Em cada troca, mova cada voz para a nota mais próxima do acorde seguinte (no máximo 1 tom). Desenhe as três formas e escreva as vozes do grave para o agudo.

  #v(0.5em)
  #grid(
    columns: (1fr,) * 3,
    diag-vazio[Dm7], diag-vazio[G7], diag-vazio[C7M],
  )

  #v(0.3em)
  Vozes (grave → agudo):
  #linhas-resposta(2)
]

// ============================================================
// BLOCO 2 — TENSÕES
// ============================================================

#block(sticky: true)[
  == 2. Tensões Disponíveis e Alteradas

  Tensões são as notas da escala acima da 7ª (9, 11, 13 e suas alterações). Uma tensão é *disponível* quando enriquece o acorde sem destruir sua função; *nota evitada* é a que fica ½ tom acima de uma nota do acorde e cria choque (como a 11 sobre um acorde maior).
]

#ex(titulo: "Tensões disponíveis por tipo de acorde", nivel: "Médio")[
  Complete a tabela considerando a escala mais comum para cada acorde.

  #v(0.4em)
  #tabela-preencher(
    columns: (0.8fr, 1.2fr, 2fr, 1.4fr),
    altura: 1.15cm,
    ([Acorde], [Escala de base], [Tensões disponíveis], [Nota evitada]),
    (
      ([X7M], [jônico], none, none),
      ([Xm7], [dórico], none, none),
      ([X7], [mixolídio], none, none),
      ([Xø], [lócrio], none, none),
      ([Xº7], [diminuta (T-ST)], none, none),
    ),
  )
]

#ex(titulo: "As tensões que o tom oferece", nivel: "Médio")[
  No tom de *Dó maior*, use só as notas diatônicas para decidir qual 9ª (9 ou b9) e qual 13ª (13 ou b13) cada dominante recebe. Depois dê o nome da escala resultante (mixolídio, mixolídio b13 ou mixolídio b9 b13 = frígio dominante).

  #v(0.4em)
  #tabela-preencher(
    columns: (0.8fr, 0.9fr, 0.9fr, 0.9fr, 2fr),
    altura: 1.1cm,
    ([Dominante], [Alvo], [9ª], [13ª], [Escala resultante]),
    (
      ([G7], [C7M], none, none, none),
      ([A7], [Dm7], none, none, none),
      ([B7], [Em7], none, none, none),
      ([C7], [F7M], none, none, none),
      ([D7], [G7], none, none, none),
      ([E7], [Am7], none, none, none),
    ),
  )

  #v(0.3em)
  Qual a regra: quando o dominante recebe b9 e b13?
  #linhas-resposta(1)
]

#ex(titulo: "Notas de acordes com tensões", nivel: "Médio")[
  Escreva a tétrade básica e as notas das tensões de cada cifra. Em 7alt, escreva as quatro alterações (b9, \#9, \#11, b13); a 5ª justa costuma ser omitida.

  #v(0.4em)
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1em,
    tabela-preencher(
      columns: (1fr, 1.4fr, 1.3fr),
      altura: 1.1cm,
      ([Cifra], [Tétrade], [Tensões]),
      (
        ([G7(b9)], none, none),
        ([C7(\#9)], none, none),
        ([A7(b13)], none, none),
        ([Bb7alt], none, none),
        ([F7(9,13)], none, none),
        ([D7M(\#11)], none, none),
      ),
    ),
    tabela-preencher(
      columns: (1fr, 1.4fr, 1.3fr),
      altura: 1.1cm,
      ([Cifra], [Tétrade], [Tensões]),
      (
        ([E7(b9)], none, none),
        ([Eb7(\#9)], none, none),
        ([Ab7(13)], none, none),
        ([B7(b13)], none, none),
        ([F7alt], none, none),
        ([Bb7M(\#11)], none, none),
      ),
    ),
  )
]

#ex(titulo: "Que acorde é este?", nivel: "Desafio")[
  As notas estão escritas do grave para o agudo, como num voicing real. Dê a cifra completa (com tensões) e o intervalo de cada nota.

  #v(0.4em)
  #tabela-preencher(
    columns: (1.6fr, 1.2fr, 2fr),
    altura: 1.05cm,
    ([Notas (grave → agudo)], [Cifra], [Intervalos]),
    (
      ([a) E – G\# – D – F], none, none),
      ([b) A – C\# – G – C], none, none),
      ([c) D – F\# – C – Bb], none, none),
      ([d) C – E – Bb – Db – D\# – Ab], none, none),
      ([e) F – A – C – E – B], none, none),
      ([f) G – B – F – E], none, none),
      ([g) Bb – D – Ab – C – G], none, none),
      ([h) A – G – C\# – F], none, none),
    ),
  )
]

#ex(titulo: "Dominantes com tensões no braço", nivel: "Desafio")[
  Escreva o intervalo (T, 3, 5, b7 ou a tensão) em cada ponto cinza e dê a cifra completa.

  #v(0.5em)
  #grid(
    columns: (1fr,) * 4,
    row-gutter: 1.3em,
    diag-preencher("3,x,3,4,5,x", campos: ("Acorde:", "Tensão:")),
    diag-preencher("5,x,5,6,5,6", campos: ("Acorde:", "Tensão:")),
    diag-preencher("x,3,2,3,4,x", campos: ("Acorde:", "Tensão:")),
    diag-preencher("x,5,4,5,6,x", campos: ("Acorde:", "Tensão:")),
    diag-preencher("3,x,3,4,4,x", campos: ("Acorde:", "Tensão:")),
    diag-preencher("x,3,x,3,5,5", campos: ("Acorde:", "Tensão:")),
    diag-preencher("x,2,1,2,1,x", campos: ("Acorde:", "Tensão:")),
    diag-preencher("1,x,2,2,0,x", campos: ("Acorde:", "Tensão:")),
  )
]

#ex(titulo: "II-V-I com tensões em drop 2", nivel: "Desafio")[
  Transforme o II-V-I do Exercício 5 (Dm7 – G7 – C7M, drop 2, cordas 4-3-2-1) em *Dm7(9) – G7(b13) – C7M(9)*: troque a fundamental de Dm7 pela 9ª, a 5ª de G7 pela b13 e a fundamental de C7M pela 9ª. Desenhe as formas e descreva a linha da voz mais grave. Depois transponha o resultado para o tom de *Fá maior*, abaixo da casa 8.

  #v(0.5em)
  #grid(
    columns: (1fr,) * 3,
    row-gutter: 0.8em,
    diag-vazio[a) Dm7(9)], diag-vazio[G7(b13)], diag-vazio[C7M(9)],
    diag-vazio[b) Gm7(9)], diag-vazio[C7(b13)], diag-vazio[F7M(9)],
  )

  #v(0.3em)
  Linha da voz mais grave e movimento das outras vozes:
  #linhas-resposta(3)

  Toque as duas versões (Exercício 5 e esta). Em qual acorde a troca por tensão muda mais a cor? Por quê?
  #linhas-resposta(3)
]

// ============================================================
// BLOCO 3 — ESTRUTURAS SUPERIORES
// ============================================================

#block(sticky: true)[
  == 3. Estruturas Superiores

  Uma *estrutura superior* é uma tríade tocada sobre o trítono (3ª e b7) de um dominante. As três notas da tríade viram tensões: é a forma mais rápida de "ouvir" e tocar um 7(9,\#11,13) ou um 7alt.
]

#ex(titulo: "Tríades sobre C7", nivel: "Médio")[
  Para cada tríade maior tocada sobre o trítono de *C7* (Mi e Sib), escreva as notas, os intervalos em relação a Dó e a cifra resultante.

  #v(0.4em)
  #tabela-preencher(
    columns: (0.8fr, 1.3fr, 1.6fr, 1.9fr),
    altura: 0.95cm,
    ([Tríade], [Notas], [Intervalos sobre C], [Cifra resultante]),
    (
      ([D], none, none, none),
      ([Eb], none, none, none),
      ([F\#], none, none, none),
      ([Ab], none, none, none),
      ([A], none, none, none),
      ([Bb], none, none, none),
      ([Db], none, none, none),
    ),
  )
]

#ex(titulo: "Escolha a tríade certa", nivel: "Médio")[
  Que tríade maior você toca sobre *G7* para obter cada som?

  #v(0.4em)
  #tabela-preencher(
    columns: (1.7fr, 0.9fr, 1.7fr, 0.9fr),
    altura: 1.5cm,
    ([Som desejado], [Tríade], [Som desejado], [Tríade]),
    (
      ([a) G7(9,\#11,13)], none, [d) G7(\#9)], none),
      ([b) G7(b9,13)], none, [e) G7(b9,\#11)], none),
      ([c) G7(\#9,b13)], none, [f) G7sus4(9)], none),
    ),
  )
]

#ex(titulo: "Estruturas superiores no II-V-I", nivel: "Desafio")[
  Harmonize *Dm7 – G7 – C7M* em Dó usando uma tríade em cada acorde, de modo que a voz do topo desça cromaticamente *Mi – Mib – Ré*. Sobre Dm7 a tríade deve gerar Dm7(9); sobre G7, G7(\#9,b13); sobre C7M, C7M(9).

  #v(0.4em)
  #tabela-preencher(
    columns: (0.9fr, 0.9fr, 1.6fr, 1.6fr),
    altura: 1.3cm,
    ([Acorde], [Tríade], [Notas (grave → agudo, topo indicado)], [Intervalos sobre a fundamental]),
    (
      ([Dm7], none, none, none),
      ([G7], none, none, none),
      ([C7M], none, none, none),
    ),
  )

  #v(0.3em)
  Descreva o movimento de cada voz da tríade de um acorde para o outro e toque o II-V-I com o baixo (ou a fundamental na 6ª/5ª corda) sustentando a harmonia:
  #linhas-resposta(3)
]

// ============================================================
// BLOCO 4 — VOICINGS QUARTAIS
// ============================================================

#block(sticky: true)[
  == 4. Voicings Quartais

  Empilhar *quartas* em vez de terças produz acordes ambíguos e modernos, típicos do jazz modal. O mesmo voicing quartal muda de nome conforme o baixo.
]

#ex(titulo: "Quartas diatônicas em Ré dórico", nivel: "Médio")[
  A partir de cada nota de Ré dórico, empilhe quatro notas em *quartas diatônicas* (de quatro em quatro notas da escala). Marque as pilhas com trítono (4ª aumentada) e escreva os intervalos sobre Ré.

  #v(0.4em)
  #let q(bases) = tabela-preencher(
    columns: (0.55fr, 1.5fr, 0.8fr, 1.6fr),
    altura: 0.95cm,
    ([Base], [Notas], [Trít.?], [Sobre D]),
    bases.map(b => ([#b], none, none, none)),
  )
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 0.8em,
    q(([D], [E], [F], [G])), q(([A], [B], [C])),
  )
]

#ex(titulo: "Um voicing, vários baixos", nivel: "Médio")[
  a) Escreva as notas dos voicings quartais abaixo (nos pontos cinza).

  #v(0.4em)
  #grid(
    columns: (1fr,) * 4,
    diag-preencher("x,5,5,5,6,x", campos: ("Notas:",)),
    diag-preencher("x,x,7,7,8,8", campos: ("Notas:",)),
    diag-preencher("x,x,5,5,6,5", campos: ("Notas:",)),
    diag-preencher("10,10,10,10,10,x", campos: ("Notas:",)),
  )

  #v(0.4em)
  b) O primeiro voicing (D – G – C – F) muda de função conforme o baixo. Escreva os intervalos e a cifra para cada baixo.

  #v(0.2em)
  #tabela-preencher(
    columns: (0.6fr, 1.6fr, 1.4fr),
    altura: 1.05cm,
    ([Baixo], [Intervalos de D – G – C – F], [Cifra]),
    (
      ([D], none, none),
      ([Bb], none, none),
      ([G], none, none),
      ([Eb], none, none),
    ),
  )

  #v(0.4em)
  c) Faça o mesmo com o segundo voicing (A – D – G – C).

  #v(0.2em)
  #tabela-preencher(
    columns: (0.6fr, 1.6fr, 1.4fr),
    altura: 1.05cm,
    ([Baixo], [Intervalos de A – D – G – C], [Cifra]),
    (
      ([A], none, none),
      ([F], none, none),
      ([Bb], none, none),
      ([D], none, none),
    ),
  )
]

#ex(titulo: "Os acordes de “So What”", nivel: "Desafio")[
  Em Ré dórico, os dois voicings que ficaram famosos em "So What" (Miles Davis) são, do grave para o agudo, *E – A – D – G – B* e *D – G – C – F – A*. Escreva-os na tablatura (cordas 6 a 2), um por compasso, e depois transponha o par ½ tom acima, para Mib dórico.

  #tab-vazia(sistemas: 2, compassos: 2, altura-linha: 11pt)

  Por que, na guitarra, cada um desses voicings fica numa única casa? Que intervalo os separa em cada par de cordas?
  #linhas-resposta(3)
]

#v(0.8em)

#block(breakable: false)[
  == Autoavaliação

  Antes de conferir o gabarito, marque o que você já consegue fazer *sem consultar* tabelas ou anotações:

  #checklist((
    [Transformo qualquer tétrade em posição fechada em drop 2 e drop 3 e sei qual voz vai para o baixo.],
    [Toco drop 2 nas cordas 4-3-2-1 e 5-4-3-2 e drop 3 com baixo na 6ª e na 5ª corda, nas quatro inversões.],
    [Escolho a 9ª e a 13ª de cada dominante (naturais ou alteradas) de acordo com o tom e o acorde-alvo.],
    [Escrevo as notas de 7(b9), 7(\#9), 7(b13), 7alt, 7(9,13) e 7M(\#11) em qualquer tom.],
    [Sei qual tríade tocar sobre um dominante para obter 7(9,\#11,13), 7(b9,13) ou 7(\#9,b13).],
    [Monto voicings quartais e reconheço como o mesmo voicing muda de nome conforme o baixo.],
  ))
]

// ============================================================
// GABARITO
// ============================================================

#gabarito[
  #resp(1)[
    E–G–B–C → drop 2: B – E – G – C (baixo B, 7M) · drop 3: G – E – B – C (baixo G, 5ª). \
    G–B–C–E → drop 2: C – G – B – E (baixo C, fundamental) · drop 3: B – G – C – E (baixo B, 7M). \
    B–C–E–G → drop 2: E – B – C – G (baixo E, 3ª) · drop 3: C – B – E – G (baixo C, fundamental). \
    No drop 2, o baixo é a 2ª voz de cima da posição fechada; no drop 3, a 3ª voz de cima.
  ]

  #resp(2)[
    #tabela-gab(
      ([Fechada], [Drop 2], [Inversão], [Drop 3], [Inversão]),
      (
        ([G B D F], [D G B F], [2ª (5ª no baixo)], [B G D F], [1ª (3ª no baixo)]),
        ([D F G B], [G D F B], [fundamental], [F D G B], [3ª (b7 no baixo)]),
        ([Ab C Eb F], [Eb Ab C F], [3ª (b7 no baixo)], [C Ab Eb F], [2ª (5ª no baixo)]),
        ([Eb F Ab C], [Ab Eb F C], [1ª (b3 no baixo)], [F Eb Ab C], [fundamental]),
        ([A C E G], [E A C G], [2ª (5ª no baixo)], [C A E G], [1ª (b3 no baixo)]),
        ([C E G A], [G C E A], [3ª (b7 no baixo)], [E C G A], [2ª (5ª no baixo)]),
      ),
    )
  ]

  #resp(3)[
    1) C G B E — C7M drop 2, fundamental, topo E (3) · 2) G D F B — G7 drop 2, fundamental, topo B (3) · 3) G F B D — G7 drop 3, fundamental, topo D (5) · 4) C B E G — C7M drop 3, fundamental, topo G (5) · 5) F C D A — Dm7 drop 2, 1ª inversão, topo A (5) · 6) A D F Bb — Bb7M drop 2, 3ª inversão (7M no baixo), topo Bb (T) · 7) Eb C G Bb — Cm7 drop 3, 1ª inversão, topo Bb (b7) · 8) C F A Eb — F7 drop 2, 2ª inversão, topo Eb (b7).
  ]

  #resp(4)[
    #grid(
      columns: (1fr,) * 4,
      diag-resp("x,x,5,5,5,5", "Am7/G", [b7 · b3 · 5 · T]),
      diag-resp("x,x,7,9,8,8", "Am7", [T · 5 · b7 · b3]),
      diag-resp("x,x,10,12,10,12", "Am7/C", [b3 · b7 · T · 5]),
      diag-resp("x,x,14,14,13,15", "Am7/E", [5 · T · b3 · b7]),
    )
    Fundamental no topo: Am7/G (3ª inversão). 5ª no topo: Am7/C (1ª inversão).
  ]

  #resp(5)[
    #grid(
      columns: (1fr,) * 3,
      diag-resp("x,x,12,14,13,13", "Dm7", [D · A · C · F]),
      diag-resp("x,x,12,12,12,13", "G7", [D · G · B · F]),
      diag-resp("x,x,10,12,12,12", "C7M", [C · G · B · E]),
    )
    Movimentos: D → D → C · A → G → G · C → B → B · F → F → E. O G7 sai em 2ª inversão (5ª no baixo) e o C7M em fundamental. Critério: cada voz move no máximo 1 tom; as notas-guia (Dó → Si; Fá → Mi) andam por ½ tom.
  ]

  #resp(6)[
    #tabela-gab(
      columns: (0.7fr, 2.2fr, 1.6fr),
      ([Acorde], [Tensões disponíveis], [Nota evitada]),
      (
        ([X7M], [9, 13 (e \#11 se lídio)], [11 (½ tom acima da 3)]),
        ([Xm7], [9, 11, 13], [— (no dórico)]),
        ([X7], [9, 13 (naturais); b9, \#9, \#11, b13 (alteradas, conforme a escala)], [11 (exceto em sus4)]),
        ([Xø], [11, b13 (e 9 com lócrio 9)], [b9 (no lócrio)]),
        ([Xº7], [9, 11, b13, 7M (um tom acima de cada nota do acorde)], [—]),
      ),
    )
    Critério: no Xm7, aceite a observação de que a 13 é evitada se o acorde for VIm7 (eólio) e a b9/b13 no IIIm7 (frígio).
  ]

  #resp(7)[
    G7: 9, 13 · mixolídio — A7: 9, b13 · mixolídio b13 — B7: b9, b13 · frígio dominante — C7: 9, 13 · mixolídio — D7: 9, 13 · mixolídio — E7: b9, b13 · frígio dominante. \
    Regra: usando as notas do tom, todo dominante que resolve num acorde *menor* recebe b13; o V7/III e o V7/VI recebem também b9, enquanto o V7/II fica com 9 natural (Si). Os que resolvem em acordes maiores (V7, V7/IV, V7/V) recebem 9 e 13.
  ]

  #resp(8)[
    G7(b9): G B D F + Ab · C7(\#9): C E G Bb + D\# · A7(b13): A C\# E G + F · Bb7alt: Bb D (F) Ab + Cb, C\#, E, Gb · F7(9,13): F A C Eb + G, D · D7M(\#11): D F\# A C\# + G\# · E7(b9): E G\# B D + F · Eb7(\#9): Eb G Bb Db + F\# · Ab7(13): Ab C Eb Gb + F · B7(b13): B D\# F\# A + G · F7alt: F A (C) Eb + Gb, G\#, B, Db · Bb7M(\#11): Bb D F A + E. \
    Critério: aceite enarmonias nas alterações (Cb = B, Gb = F\#, Db = C\#).
  ]

  #resp(9)[
    a) E7(b9): T 3 b7 b9 · b) A7(\#9): T 3 b7 \#9 · c) D7(b13): T 3 b7 b13 · d) C7alt = C7(b9,\#9,b13): T 3 b7 b9 \#9 b13 · e) F7M(\#11): T 3 5 7M \#11 · f) G7(13): T 3 b7 13 · g) Bb7(9,13): T 3 b7 9 13 · h) A7(b13): T b7 3 b13.
  ]

  #resp(10)[
    1) G F B E — G7(13) · 2) A G C\# E Bb — A7(b9) · 3) C E Bb D\# — C7(\#9) · 4) D F\# C F — D7(\#9) (F = Mi\#) · 5) G F B Eb — G7(b13) · 6) C Bb E A — C7(13) · 7) B D\# A C — B7(b9) · 8) F E A B — F7M(\#11) (Si solto).
  ]

  #resp(11)[
    #grid(
      columns: (1fr,) * 3,
      diag-resp("x,x,14,14,13,13", "Dm7(9)", [E · A · C · F]),
      diag-resp("x,x,13,12,12,13", "G7(b13)", [Eb · G · B · F]),
      diag-resp("x,x,12,12,12,12", "C7M(9)", [D · G · B · E]),
      diag-resp("x,x,7,7,6,6", "Gm7(9)", [A · D · F · Bb]),
      diag-resp("x,x,6,5,5,6", "C7(b13)", [Ab · C · E · Bb]),
      diag-resp("x,x,5,5,5,5", "F7M(9)", [G · C · E · A]),
    )
    Em Dó, a voz mais grave desce cromaticamente Mi – Mib – Ré (9 → b13 → 9). As outras: Lá → Sol → Sol; Dó → Si → Si; Fá → Fá → Mi. Em Fá, as mesmas formas descem 7 casas (a b13 de C7 é Láb). Pergunta final: resposta pessoal; critério — perceber que o G7(b13) é o que mais muda (a b13 cria tensão que resolve na 9ª do C7M).
  ]

  #resp(12)[
    #tabela-gab(
      columns: (0.6fr, 1fr, 1.4fr, 2fr),
      ([Tríade], [Notas], [Sobre C], [Cifra]),
      (
        ([D], [D F\# A], [9 · \#11 · 13], [C7(9,\#11,13)]),
        ([Eb], [Eb G Bb], [\#9 · 5 · b7], [C7(\#9)]),
        ([F\# (= Gb)], [F\# A\# C\#], [\#11 · b7 · b9], [C7(b9,\#11)]),
        ([Ab], [Ab C Eb], [b13 · T · \#9], [C7(\#9,b13) — som alterado]),
        ([A], [A C\# E], [13 · b9 · 3], [C7(b9,13)]),
        ([Bb], [Bb D F], [b7 · 9 · 11], [C7sus4(9) — pede omitir a 3ª]),
        ([Db], [Db F Ab], [b9 · 11 · b13], [C7sus4(b9) com b13 — som frígio; a 11 pede omitir a 3ª]),
      ),
    )
  ]

  #resp(13)[
    a) A · b) E · c) Eb · d) Bb · e) Db · f) F.
  ]

  #resp(14)[
    Dm7: tríade *Am* (A C E) → 5 · b7 · 9 → Dm7(9), topo Mi. \
    G7: tríade *Eb* na 1ª inversão (G Bb Eb) → T · \#9 · b13 → G7(\#9,b13), topo Mib. \
    C7M: tríade *G* (G B D) → 5 · 7M · 9 → C7M(9), topo Ré. \
    Vozes: Lá → Sol → Sol; Dó → Sib → Si; Mi → Mib → Ré. Critério: aceite outras tríades se gerarem as tensões pedidas e o topo Mi – Mib – Ré.
  ]

  #resp(15)[
    #tabela-gab(
      columns: (0.5fr, 1.3fr, 0.8fr, 1.6fr),
      ([Base], [Notas], [Trítono?], [Sobre D]),
      (
        ([D], [D G C F], [não], [T · 11 · b7 · b3]),
        ([E], [E A D G], [não], [9 · 5 · T · 11]),
        ([F], [F B E A], [sim (F–B)], [b3 · 13 · 9 · 5]),
        ([G], [G C F B], [sim (F–B)], [11 · b7 · b3 · 13]),
        ([A], [A D G C], [não], [5 · T · 11 · b7]),
        ([B], [B E A D], [não], [13 · 9 · 5 · T]),
        ([C], [C F B E], [sim (F–B)], [b7 · b3 · 13 · 9]),
      ),
    )
  ]

  #resp(16)[
    a) D G C F · A D G C · G C F A · D G C F A. \
    b) Baixo D: T · 11 · b7 · b3 → Dm7(11) · baixo Bb: 3 · 13 · 9 · 5 → Bb6(9) · baixo G: 5 · T · 11 · b7 → G7sus4 · baixo Eb: 7M · 3 · 13 · 9 → Eb7M(9,13). \
    c) Baixo A: T · 11 · b7 · b3 → Am7(11) · baixo F: 3 · 13 · 9 · 5 → F6(9) · baixo Bb: 7M · 3 · 13 · 9 → Bb7M(9,13) · baixo D: 5 · T · 11 · b7 → D7sus4.
  ]

  #resp(17)[
    #tab(
      "   Ré dórico      Mib dórico\ne|-------------|-------------|\nB|-12----10----|-13----11----|\nG|-12----10----|-13----11----|\nD|-12----10----|-13----11----|\nA|-12----10----|-13----11----|\nE|-12----10----|-13----11----|",
    )
    Ré dórico: E A D G B (casa 12) e D G C F A (casa 10); Mib dórico: F Bb Eb Ab C (casa 13) e Eb Ab Db Gb Bb (casa 11). \
    A guitarra é afinada em 4ªs justas da 6ª à 3ª corda e em 3ª maior entre a 3ª e a 2ª — exatamente a estrutura desses voicings (4ª–4ª–4ª–3ª maior).
  ]
]
