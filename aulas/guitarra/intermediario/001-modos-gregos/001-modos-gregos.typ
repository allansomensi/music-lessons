#import "/templates/layout.typ": *
#import "/templates/components.typ": *

#show: aula.with(
  instrumento: "Guitarra",
  nivel: "Intermediário",
)

// ─── Helpers locais ──────────────────────────────────────────
// exercícios curtos não se dividem entre páginas (enunciado e área de resposta juntos)
#let exercicio-base = exercicio
#let exercicio(..args) = block(breakable: false, width: 100%, exercicio-base(..args))

// mapa: braco-notas a partir de uma lista (corda, casa, rótulo).
// `raiz` documenta a tônica usada nos rótulos (intervalos).
#let mapa(raiz: none, fs: 1, casas: 5, largura: 22pt, notas) = {
  let dados = range(6).map(_ => range(casas).map(_ => ""))
  for n in notas {
    let (corda, casa, rotulo) = n
    dados.at(6 - corda).at(casa - fs) = rotulo
  }
  braco-notas(dados, fs: fs, casa-largura: largura)
}

// ficha de um modo: diagrama à esquerda, informações à direita
#let ficha(diagrama, legenda, info) = block(breakable: false, width: 100%, grid(
  columns: (auto, 1fr),
  column-gutter: 1.4em,
  align: (center + horizon, left + horizon),
  [
    #diagrama
    #v(0.2em)
    #text(size: 8pt, fill: color-muted)[#legenda]
  ],
  block(
    width: 100%,
    fill: color-subtle-bg,
    stroke: 0.5pt + color-rule-dark,
    inset: 11pt,
    radius: 5pt,
    [
      #set text(size: 9.5pt)
      #set par(justify: false, leading: 0.8em)
      #info
    ],
  ),
))

= Modos Gregos

Os *modos gregos* são sete escalas que nascem da escala maior. Cada modo usa as mesmas sete notas, mas toma um grau diferente como tônica — o "centro" onde a música repousa. Ao mudar o centro, muda a sequência de tons e semitons e, com ela, o *caráter sonoro* da escala. Neste material você vai entender como os modos são formados, reconhecer a nota que dá cor a cada um e tocar no braço os quatro modos mais usados na guitarra.

#objetivos((
  [Entender como os sete modos são gerados a partir da escala maior],
  [Escrever a fórmula de cada modo em intervalos e identificar sua nota característica],
  [Pensar os modos de forma paralela, comparando-os com a escala maior ou com a menor natural],
  [Tocar um desenho dos modos Dórico, Frígio, Lídio e Mixolídio com tônica na 6ª corda],
  [Escolher o modo adequado a partir do acorde ou do vamp que está soando],
))

== 1. Uma escala, sete pontos de partida

Tome a escala de *Dó maior* (C D E F G A B). Se você tocar essas mesmas notas começando e terminando em Ré, em Mi, em Fá e assim por diante — e fizer o ouvido sentir *essa* nota como repouso —, obtém sete escalas diferentes. Cada uma recebeu um nome grego:

#tabela(
  columns: (0.6fr, 1.1fr, 1.6fr, 1.9fr, 0.9fr, 1fr),
  ([Grau], [Modo], [Notas (a partir de Dó maior)], [Tons e semitons], [Tipo], [Acorde]),
  (
    ([I], [Jônico], [C D E F G A B], [T T ST T T T ST], [Maior], [C7M]),
    ([II], [Dórico], [D E F G A B C], [T ST T T T ST T], [Menor], [Dm7]),
    ([III], [Frígio], [E F G A B C D], [ST T T T ST T T], [Menor], [Em7]),
    ([IV], [Lídio], [F G A B C D E], [T T T ST T T ST], [Maior], [F7M]),
    ([V], [Mixolídio], [G A B C D E F], [T T ST T T ST T], [Maior], [G7]),
    ([VI], [Eólio], [A B C D E F G], [T ST T T ST T T], [Menor], [Am7]),
    ([VII], [Lócrio], [B C D E F G A], [ST T T ST T T T], [Diminuto], [Bm7(b5)]),
  ),
)

#v(0.4em)

O *Jônico* é a própria escala maior, e o *Eólio* é a escala menor natural. O "tipo" de cada modo depende da 3ª a partir da tônica: 3ª maior (2 tons) gera um modo maior; 3ª menor (1½ tom), um modo menor. O Lócrio, além da 3ª menor, tem a 5ª diminuta — por isso é o único modo "diminuto". A última coluna mostra a tétrade (acorde de quatro notas) que cada modo forma sobre a sua tônica.

#caixa(tipo: "atencao")[
  Tocar as notas de Dó maior "começando em Ré" *não basta* para soar Dórico. Se a harmonia por trás continuar sendo C maior, o ouvido continua ouvindo Dó maior. O modo só aparece quando a *tônica* muda — por exemplo, quando a banda sustenta um acorde de Dm7 e a sua frase repousa em Ré.
]

== 2. Pensamento paralelo: fórmulas e nota característica

Para improvisar, é muito mais útil comparar todos os modos *a partir da mesma tônica*. Assim você enxerga exatamente quais notas mudam. A tabela usa Lá (A) como tônica para todos. Nas fórmulas, *7* indica a sétima menor e *7M*, a sétima maior.

#tabela(
  columns: (1fr, 1.9fr, 1.6fr, 2.2fr),
  ([Modo], [Fórmula], [Em Lá], [Comparação]),
  (
    ([Jônico], [T 2 3 4 5 6 7M], [A B C\# D E F\# G\#], [É a escala maior (referência)]),
    ([Lídio], [T 2 3 *\#4* 5 6 7M], [A B C\# *D\#* E F\# G\#], [Maior com a *4ª aumentada*]),
    ([Mixolídio], [T 2 3 4 5 6 *7*], [A B C\# D E F\# *G*], [Maior com a *7ª menor*]),
    ([Eólio], [T 2 b3 4 5 b6 7], [A B C D E F G], [É a menor natural (referência)]),
    ([Dórico], [T 2 b3 4 5 *6* 7], [A B C D E *F\#* G], [Menor natural com a *6ª maior*]),
    ([Frígio], [T *b2* b3 4 5 b6 7], [A *Bb* C D E F G], [Menor natural com a *2ª menor*]),
    ([Lócrio], [T b2 b3 4 *b5* b6 7], [A Bb C D *Eb* F G], [Frígio com a *5ª diminuta*]),
  ),
)

#v(0.4em)

A nota em negrito é a *nota característica*: a única diferença entre o modo e a escala de referência (maior ou menor natural). É ela que você precisa destacar — tocando-a em tempos fortes ou sustentando-a — para que o ouvinte perceba a cor do modo. Sem ela, o Dórico soa como menor natural e o Mixolídio soa como escala maior.

#caixa(tipo: "resumo")[
  *Modos maiores:* Jônico, Lídio (\#4) e Mixolídio (7). *Modos menores:* Eólio, Dórico (6) e Frígio (b2). *Modo diminuto:* Lócrio (b2 e b5).
]

== 3. Os quatro modos mais usados na guitarra

Os desenhos abaixo usam sempre a tônica Lá na 6ª corda, casa 5, para que você compare os modos *pelo som*, sem mudar de região. O círculo preto é a tônica, cada círculo traz o intervalo em relação a ela e o círculo cinza marca a nota característica. Como todos os desenhos são móveis, basta deslocá-los para mudar de tom.

=== Dórico — menor com a 6ª maior

#ficha(
  mapa(raiz: "A", fs: 4, (
    (6, 5, "T"), (6, 7, "2"), (6, 8, "b3"),
    (5, 5, "4"), (5, 7, "5"),
    (4, 4, "*6"), (4, 5, "7"), (4, 7, "T"),
    (3, 4, "2"), (3, 5, "b3"), (3, 7, "4"),
    (2, 5, "5"), (2, 7, "*6"), (2, 8, "7"),
    (1, 5, "T"), (1, 7, "2"), (1, 8, "b3"),
  )),
  [Lá Dórico — casas 4 a 8],
  [
    *Fórmula:* T 2 b3 4 5 *6* 7 \
    *Em Lá:* A B C D E *F\#* G \
    *Acorde típico:* Im7 (Am7), muitas vezes alternando com IV7 (D7). \
    *Som:* menor, mas "aberto" e luminoso; muito usado em jazz, funk, soul e rock. \
    *Onde ouvir:* "So What" (Miles Davis); "Oye Como Va" (Santana).
  ],
)

=== Frígio — menor com a 2ª menor

#ficha(
  mapa(raiz: "A", fs: 4, (
    (6, 5, "T"), (6, 6, "*b2"), (6, 8, "b3"),
    (5, 5, "4"), (5, 7, "5"), (5, 8, "b6"),
    (4, 5, "7"), (4, 7, "T"), (4, 8, "*b2"),
    (3, 5, "b3"), (3, 7, "4"),
    (2, 5, "5"), (2, 6, "b6"), (2, 8, "7"),
    (1, 5, "T"), (1, 6, "*b2"), (1, 8, "b3"),
  )),
  [Lá Frígio — casas 5 a 8],
  [
    *Fórmula:* T *b2* b3 4 5 b6 7 \
    *Em Lá:* A *Bb* C D E F G \
    *Acorde típico:* Im (Am), alternando com bII (Bb), um semitom acima. \
    *Som:* escuro e tenso; o semitom entre a b2 e a tônica lembra o flamenco e é muito usado em riffs de metal.
  ],
)

=== Lídio — maior com a 4ª aumentada

#ficha(
  mapa(raiz: "A", fs: 4, (
    (6, 4, "7M"), (6, 5, "T"), (6, 7, "2"),
    (5, 4, "3"), (5, 6, "*#4"), (5, 7, "5"),
    (4, 4, "6"), (4, 6, "7M"), (4, 7, "T"),
    (3, 4, "2"), (3, 6, "3"),
    (2, 4, "*#4"), (2, 5, "5"), (2, 7, "6"),
    (1, 4, "7M"), (1, 5, "T"), (1, 7, "2"),
  )),
  [Lá Lídio — casas 4 a 7],
  [
    *Fórmula:* T 2 3 *\#4* 5 6 7M \
    *Em Lá:* A B C\# *D\#* E F\# G\# \
    *Acorde típico:* I7M (A7M), alternando com II (B/A, um tom acima, com a tônica no baixo). \
    *Som:* maior, "flutuante" e sonhador; comum em trilhas de cinema. \
    *Onde ouvir:* "Flying in a Blue Dream" (Joe Satriani).
  ],
)

=== Mixolídio — maior com a 7ª menor

#ficha(
  mapa(raiz: "A", fs: 4, (
    (6, 5, "T"), (6, 7, "2"),
    (5, 4, "3"), (5, 5, "4"), (5, 7, "5"),
    (4, 4, "6"), (4, 5, "*7"), (4, 7, "T"),
    (3, 4, "2"), (3, 6, "3"), (3, 7, "4"),
    (2, 5, "5"), (2, 7, "6"), (2, 8, "*7"),
    (1, 5, "T"), (1, 7, "2"),
  )),
  [Lá Mixolídio — casas 4 a 8],
  [
    *Fórmula:* T 2 3 4 5 6 *7* \
    *Em Lá:* A B C\# D E F\# *G* \
    *Acorde típico:* I7 (A7), ou o vamp I – bVII (A – G). \
    *Som:* maior com "sotaque" de blues; base do rock clássico, do blues e do country. \
    *Onde ouvir:* "Norwegian Wood" (The Beatles); "Sweet Child O' Mine" (Guns N' Roses).
  ],
)

#v(0.4em)

#caixa(tipo: "dica")[
  Compare os desenhos dois a dois: Dórico e Mixolídio diferem só na 3ª (b3 ou 3); Dórico e Frígio, na 2ª e na 6ª. Toque um modo depois do outro sobre a 5ª corda solta (Lá) e ouça como a mesma tônica ganha cores diferentes.
]

== 4. Como escolher o modo na prática

O ponto de partida é sempre o *acorde* (ou o vamp — dois acordes que se repetem) sobre o qual você vai tocar. Primeiro descubra qual nota é a tônica; depois veja que tipo de acorde ela forma e quais notas aparecem na harmonia:

#tabela(
  columns: (1.4fr, 1.6fr, 2.6fr),
  ([Acorde na tônica], [Modos possíveis], [Como decidir]),
  (
    ([Maior com 7M (A7M)], [Jônico ou Lídio], [Se a harmonia tiver a \#4 (D\#, ou o acorde B), use o Lídio.]),
    ([Dominante (A7)], [Mixolídio], [É o modo que já contém a 7ª menor do acorde.]),
    ([Menor com 7 (Am7)], [Eólio, Dórico ou Frígio], [D7 ou F\# na harmonia → Dórico; F → Eólio; Bb → Frígio.]),
    ([Meio-diminuto (Am7(b5))], [Lócrio], [É o modo que contém a b5 do acorde.]),
  ),
)

#v(0.4em)

#passos((
  [*Encontre a tônica e o tipo de acorde.* Num vamp Am7 – D7, a tônica é Lá e o acorde é menor com 7: o Dórico é o candidato natural, porque o D7 traz o F\#, a 6ª maior de Lá.],
  [*Toque o desenho do modo e destaque a nota característica.* Comece e termine as frases na tônica ou na 3ª; use a nota característica em tempos fortes ou sustentada.],
  [*Compare com o modo vizinho.* Toque a mesma frase trocando apenas a nota característica (F\# ↔ F no exemplo). Se o seu ouvido "reclamar" de uma delas, a outra é a escolha certa.],
))

== 5. Exercícios

#exercicio(titulo: "Escreva os modos", nivel: "Escrita")[
  Escreva as sete notas de cada modo e indique a sua nota característica (o intervalo que o diferencia da escala maior ou da menor natural).

  #tabela-preencher(
    ([Modo], [Notas], [Nota característica]),
    (
      ([Mi Dórico], none, none),
      ([Si Frígio], none, none),
      ([Sol Lídio], none, none),
      ([Ré Mixolídio], none, none),
    ),
    columns: (1fr, 2.4fr, 1.4fr),
  )
]

#exercicio(titulo: "Os modos de Sol maior", nivel: "Escrita")[
  A escala de Sol maior é G A B C D E F\#. Escreva o nome do modo que se obtém tomando cada nota abaixo como tônica.

  #grid(
    columns: (1fr, 1fr, 1fr),
    column-gutter: 2em,
    row-gutter: 1.2em,
    [a) A #h(1fr) #box(width: 2.6cm, line(length: 100%, stroke: 0.5pt + color-rule-light))],
    [b) B #h(1fr) #box(width: 2.6cm, line(length: 100%, stroke: 0.5pt + color-rule-light))],
    [c) C #h(1fr) #box(width: 2.6cm, line(length: 100%, stroke: 0.5pt + color-rule-light))],
    [d) D #h(1fr) #box(width: 2.6cm, line(length: 100%, stroke: 0.5pt + color-rule-light))],
    [e) E #h(1fr) #box(width: 2.6cm, line(length: 100%, stroke: 0.5pt + color-rule-light))],
    [f) F\# #h(1fr) #box(width: 2.6cm, line(length: 100%, stroke: 0.5pt + color-rule-light))],
  )
]

#exercicio(titulo: "Qual modo usar?", nivel: "Escrita")[
  Para cada vamp, a tônica é o primeiro acorde. Escreva o modo mais adequado e a nota característica que você deve destacar.

  #tabela-preencher(
    ([Vamp], [Modo], [Nota característica]),
    (
      ([Dm7 – G7], none, none),
      ([Em – F], none, none),
      ([C7M – D/C], none, none),
      ([G – F], none, none),
    ),
    columns: (1.2fr, 1.4fr, 1.4fr),
  )
]

#exercicio(titulo: "Dórico ou Eólio?", nivel: "Prática")[
  Grave (ou peça a alguém que toque) um vamp de *Am7 – D7*, dois tempos para cada acorde, a 80 BPM. Improvise com o Lá Dórico, destacando o F\#. Depois grave *Am7 – Dm7* e improvise com o Lá Eólio (troque o F\# por F). Descreva com suas palavras a diferença de caráter.

  #linhas-resposta(2)
]

#exercicio(titulo: "Transponha o desenho", nivel: "Braço")[
  Desenhe o *Ré Dórico* com tônica na 6ª corda, casa 10, usando o mesmo desenho do Lá Dórico. Escreva o intervalo dentro de cada nota e destaque a nota característica.

  #v(0.3em)
  #align(center, braco-vazio(casas: 5, fs: 9))
]

#exercicio(titulo: "A cor de cada modo", nivel: "Prática")[
  Com a 5ª corda solta (Lá) soando como bordão, toque lentamente os quatro desenhos da seção 3, subindo e descendo. Escreva uma palavra que descreva o caráter de cada um.

  #grid(
    columns: (1fr, 1fr),
    column-gutter: 2em,
    row-gutter: 1.2em,
    [Dórico: #h(1fr) #box(width: 4.5cm, line(length: 100%, stroke: 0.5pt + color-rule-light))],
    [Frígio: #h(1fr) #box(width: 4.5cm, line(length: 100%, stroke: 0.5pt + color-rule-light))],
    [Lídio: #h(1fr) #box(width: 4.5cm, line(length: 100%, stroke: 0.5pt + color-rule-light))],
    [Mixolídio: #h(1fr) #box(width: 4.5cm, line(length: 100%, stroke: 0.5pt + color-rule-light))],
  )
]

#v(0.6em)

#block(breakable: false)[
  === Sugestão de prática

  #rotina-estudo((
    ([Os quatro desenhos em Lá, subindo e descendo, dizendo os intervalos], [8 min], [60–80]),
    ([Cada modo sobre o bordão de Lá, destacando a nota característica], [5 min], [livre]),
    ([Improviso sobre Am7 – D7 (Dórico) e Am7 – Dm7 (Eólio)], [7 min], [70–90]),
    ([Improviso sobre A – G (Mixolídio) e A7M – B/A (Lídio)], [7 min], [70–90]),
    ([Transposição: os quatro desenhos com tônica em Sol e em Ré], [5 min], [60–80]),
  ))
]

#v(0.6em)

#block(breakable: false)[
  #checklist(titulo: "Autoavaliação", (
    [Sei explicar por que os modos usam as mesmas notas, mas soam diferentes.],
    [Escrevo a fórmula de qualquer modo e aponto a sua nota característica.],
    [Toco os desenhos de Dórico, Frígio, Lídio e Mixolídio em Lá dizendo os intervalos.],
    [Transponho os desenhos para outra tônica usando a 6ª corda como referência.],
    [Escolho o modo a partir do acorde ou do vamp que está soando.],
  ))
]

#gabarito[
  #resposta(1)[
    Mi Dórico: E F\# G A B C\# D (6ª maior, C\#) · Si Frígio: B C D E F\# G A (2ª menor, C) · Sol Lídio: G A B C\# D E F\# (4ª aumentada, C\#) · Ré Mixolídio: D E F\# G A B C (7ª menor, C).
  ]
  #resposta(2)[
    a) Lá Dórico · b) Si Frígio · c) Dó Lídio · d) Ré Mixolídio · e) Mi Eólio · f) Fá\# Lócrio.
  ]
  #resposta(3)[
    Dm7 – G7: Ré Dórico, nota característica B (6ª maior, que está no G7) · Em – F: Mi Frígio, F (b2) · C7M – D/C: Dó Lídio, F\# (\#4, que está no acorde D) · G – F: Sol Mixolídio, F (7ª menor).
  ]
  #resposta(4)[
    Resposta pessoal. Espera-se perceber o Dórico como um menor mais claro e "aberto" (o F\# soa luminoso sobre o Am7) e o Eólio como um menor mais melancólico (o F soa mais escuro e pesado).
  ]
  #resposta(5)[
    #align(center, mapa(raiz: "D", fs: 9, (
      (6, 10, "T"), (6, 12, "2"), (6, 13, "b3"),
      (5, 10, "4"), (5, 12, "5"),
      (4, 9, "*6"), (4, 10, "7"), (4, 12, "T"),
      (3, 9, "2"), (3, 10, "b3"), (3, 12, "4"),
      (2, 10, "5"), (2, 12, "*6"), (2, 13, "7"),
      (1, 10, "T"), (1, 12, "2"), (1, 13, "b3"),
    )))
    Ré Dórico: D E F G A B C — o desenho do Lá Dórico deslocado 5 casas para cima. A nota característica é o B (6ª maior).
  ]
  #resposta(6)[
    Resposta pessoal. Descrições comuns: Dórico — menor e luminoso; Frígio — sombrio, "espanhol"; Lídio — sonhador, flutuante; Mixolídio — maior com sotaque de blues/rock.
  ]
]
