#import "/templates/layout.typ": *
#import "/templates/components.typ": *
#import "@preview/conchord:0.4.0": new-chordgen

#show: aula.with(
  instrumento: "Guitarra",
  nivel: "Iniciante",
)

#let chord = new-chordgen(number-to-left: true, use-shadow-barre: false, colors: (hold: black, barre: black))

// Exercício curto que não se divide entre páginas.
#let ex(..args, body) = block(breakable: false, width: 100%, exercicio(..args, body))

= Tensões Harmônicas

Uma tétrade tem quatro notas: tônica, 3ª, 5ª e 7ª (T, 3, 5, 7). Acima delas ainda cabem outras notas que *enriquecem a cor* do acorde sem mudar a sua função. Essas notas se chamam *tensões*: são a *9ª*, a *11ª* e a *13ª* — as mesmas notas da 2ª, da 4ª e da 6ª, só que contadas uma oitava acima.

#objetivos((
  [Relacionar cada tensão (9, 11, 13) com o intervalo simples correspondente (2, 4, 6)],
  [Encontrar as tensões de um acorde em qualquer tom],
  [Saber quais tensões soam bem em cada acorde do campo harmônico maior],
  [Montar e reconhecer acordes com 9ª, 11ª e 13ª no braço],
))

== 1. De intervalos a tensões

Conte as notas da escala a partir da tônica e continue depois da oitava: a 2ª vira 9ª (2 + 7), a 4ª vira 11ª (4 + 7) e a 6ª vira 13ª (6 + 7). A nota é a mesma; muda só o nome, que indica que ela está *acima* da tétrade.

#tabela(
  columns: (1.4fr, 0.8fr, 0.8fr, 2fr),
  ([Intervalo simples], [Grau], [Tensão], [Exemplo a partir de Dó]),
  (
    ([2ª menor], [b2], [b9], [Réb (9ª menor)]),
    ([2ª maior], [2], [9], [Ré (9ª maior)]),
    ([2ª aumentada], [\#2], [\#9], [Ré\# (9ª aumentada)]),
    ([4ª justa], [4], [11], [Fá (11ª justa)]),
    ([4ª aumentada], [\#4], [\#11], [Fá\# (11ª aumentada)]),
    ([6ª menor], [b6], [b13], [Láb (13ª menor)]),
    ([6ª maior], [6], [13], [Lá (13ª maior)]),
  ),
)

#caixa(tipo: "resumo", titulo: "Regra")[
  Tensão = intervalo simples + 7. Assim: 2ª → 9ª, 4ª → 11ª, 6ª → 13ª.
]

Na cifra, a tensão aparece entre parênteses depois do tipo do acorde: *C7M(9)*, *Dm7(11)*, *G7(13)*. Já o *C(add9)* é uma tríade com 9ª acrescentada, *sem* a 7ª.

== 2. Tensões disponíveis no campo de Dó maior

Usando apenas as notas da escala de Dó maior, cada acorde do campo recebe a sua 9ª, 11ª e 13ª "naturais". Nem todas soam bem: quando uma tensão fica *um semitom acima de uma nota do acorde* (por exemplo, Fá sobre o Mi do C7M), ela cria um choque forte e é chamada de *nota evitada*. As demais são as *tensões disponíveis*.

#tabela(
  columns: (1.75fr, 1fr, 1.15fr, 1.15fr, 1.1fr),
  ([Acorde], [9ª], [11ª], [13ª], [Disponíveis]),
  (
    ([C7M (I)], [9 (Ré)], [11 (Fá) evitar], [13 (Lá)], [*9, 13*]),
    ([Dm7 (IIm7)], [9 (Mi)], [11 (Sol)], [13 (Si)], [*9, 11, 13*]),
    ([Em7 (IIIm7)], [b9 (Fá) evitar], [11 (Lá)], [b13 (Dó) evitar], [*11*]),
    ([F7M (IV7M)], [9 (Sol)], [\#11 (Si)], [13 (Ré)], [*9, \#11, 13*]),
    ([G7 (V7)], [9 (Lá)], [11 (Dó) evitar], [13 (Mi)], [*9, 13*]),
    ([Am7 (VIm7)], [9 (Si)], [11 (Ré)], [b13 (Fá) evitar], [*9, 11*]),
    ([Bm7(b5) (VIIm7(b5))], [b9 (Dó) evitar], [11 (Mi)], [b13 (Sol)], [*11, b13*]),
  ),
)

#caixa(tipo: "atencao", titulo: "Repare")[
  O 11 do *G7* é o Dó, que fica um semitom acima do Si (a 3ª do acorde) e "apaga" o caráter dominante. Por isso o G7 quase nunca leva 11ª justa. Fora do campo, porém, é comum usar *\#11* (Dó\#), *b9* (Láb) ou *\#9* (Lá\#) no dominante — tensões *alteradas*, que aumentam a vontade de resolver.
]

== 3. Acordes com tensões no braço

Os desenhos abaixo mostram acordes do campo de Dó com tensões. Abaixo de cada um estão as notas, da corda mais grave para a mais aguda.

Repare que vários desses desenhos *não têm a 5ª*. Quando um acorde recebe tensões, a 5ª é a primeira nota a ser retirada: ela pouco contribui para a cor e deixa o acorde "cheio" demais. A tônica, a 3ª e a 7ª, que definem o tipo do acorde, são mantidas.

#let linha-acordes(items) = block(breakable: false, width: 100%, below: 1.4em, grid-acordes(chord: chord, columns: 3, gutter: 2.2em, items))

#linha-acordes((
  (tabs: "x,3,2,4,3,x", nome: " ", titulo: "C7M(9)", detalhe: "Dó · Mi · Si · Ré (9)"),
  (tabs: "x,5,3,5,5,x", nome: " ", titulo: "Dm7(9)", detalhe: "Ré · Fá · Dó · Mi (9)"),
  (tabs: "x,5,5,5,6,5", nome: " ", titulo: "Dm7(11)", detalhe: "Ré · Sol (11) · Dó · Fá · Lá"),
))
#linha-acordes((
  (tabs: "x,8,7,9,8,x", nome: " ", titulo: "F7M(9)", detalhe: "Fá · Lá · Mi · Sol (9)"),
  (tabs: "x,10,9,10,10,x", nome: " ", titulo: "G7(9)", detalhe: "Sol · Si · Fá · Lá (9)"),
  (tabs: "3,x,3,4,5,x,*", nome: " ", titulo: "G7(13)", detalhe: "Sol · Fá · Si · Mi (13)"),
))

== 4. Como cada tensão soa

Na prática, as tensões são mais *ouvidas* do que calculadas. Toque um *G7* e acrescente, uma de cada vez, as notas da tabela: cada uma muda a cor do acorde.

#tabela(
  columns: (0.7fr, 1fr, 3fr),
  ([Tensão], [Nota (em G7)], [Sonoridade]),
  (
    ([9], [Lá], [aberta, "macia", muito usada no pop e na bossa nova]),
    ([13], [Mi], [doce, típica do jazz e do soul]),
    ([b9], [Láb], [tensa, dramática; pede resolução]),
    ([\#9], [Lá\# (Sib)], [áspera, típica do blues e do rock]),
    ([\#11], [Dó\#], [flutuante, "suspensa"]),
  ),
)

Com o tempo, você passa a ouvir qual tensão a música "pede" em cada momento.

== 5. Exercícios

#ex(titulo: "Intervalo ou tensão?")[
  Complete a tabela convertendo o intervalo simples na tensão correspondente (e vice-versa).

  #tabela-preencher(
    columns: (1.2fr,) + (1fr,) * 7,
    ([], [a)], [b)], [c)], [d)], [e)], [f)], [g)]),
    (
      ([*Intervalo*], [2], [b2], [4], none, [6], none, [\#2]),
      ([*Tensão*], none, none, none, [\#11], none, [b13], none),
    ),
  )
]

#ex(titulo: "Encontre as tensões")[
  Escreva a nota de cada tensão, contando a partir da tônica (deixe em branco as casas com "—").

  #tabela-preencher(
    columns: (1.5fr, 1fr, 1fr, 1fr),
    ([Acorde (tensões)], [9], [11 ou \#11], [13]),
    (
      ([D7 (9, 13)], none, [—], none),
      ([Am7 (9, 11)], none, none, [—]),
      ([F7M (9, \#11, 13)], none, none, none),
    ),
  )
]

#ex(titulo: "Dê o nome")[
  Cada linha mostra as notas de um acorde, da mais grave para a mais aguda. Escreva a cifra completa.

  #grid(
    columns: (1fr, 1fr),
    row-gutter: 1.1em,
    column-gutter: 1.5em,
    [a) Dó – Mi – Si – Ré #h(0.4em) #box(width: 3cm, height: 0.9em, stroke: (bottom: 0.6pt + color-rule-dark))],
    [b) Sol – Fá – Si – Mi #h(0.4em) #box(width: 3cm, height: 0.9em, stroke: (bottom: 0.6pt + color-rule-dark))],

    [c) Lá – Ré – Sol – Dó – Mi #h(0.4em) #box(width: 2.4cm, height: 0.9em, stroke: (bottom: 0.6pt + color-rule-dark))],
    [d) Dó – Mi – Sol – Ré #h(0.4em) #box(width: 3cm, height: 0.9em, stroke: (bottom: 0.6pt + color-rule-dark))],
  )
]

#ex(titulo: "Nota evitada")[
  Em Dó maior, qual tensão natural você deve evitar sobre o *C7M*? E sobre o *G7*? Explique em uma frase por que ela soa mal.

  #linhas-resposta(3)
]

#ex(titulo: "Ouvindo as cores")[
  Toque *Dm7 – G7 – C7M* (II–V–I em Dó) com os acordes simples. Depois toque *Dm7(9) – G7(13) – C7M(9)* usando os desenhos da seção 3. Descreva a diferença de sonoridade.

  #linhas-resposta(3)
]

=== Sugestão de prática

#rotina-estudo((
  ([Montar os seis acordes da seção 3, dizendo o nome de cada nota], [5 min], [—]),
  ([G7 + uma tensão de cada vez (9, 13, b9, \#9), ouvindo a diferença], [5 min], [—]),
  ([II–V–I com tensões: Dm7(9) – G7(13) – C7M(9)], [5 min], [60–70]),
  ([Encontrar 9 e 13 de acordes dominantes em outros tons], [5 min], [—]),
))

=== Autoavaliação

#checklist((
  [Sei converter 2, 4 e 6 em 9, 11 e 13],
  [Encontro a 9ª e a 13ª de qualquer acorde],
  [Sei o que é uma nota evitada e dou um exemplo],
  [Toco pelo menos três acordes com tensão sem consultar o desenho],
))

#gabarito[
  #resposta(1)[
    2 → 9 · b2 → b9 · 4 → 11 · \#4 → \#11 · 6 → 13 · b6 → b13 · \#2 → \#9.
  ]
  #resposta(2)[
    D7: 9 = Mi, 13 = Si · Am7: 9 = Si, 11 = Ré · F7M: 9 = Sol, \#11 = Si, 13 = Ré.
  ]
  #resposta(3)[
    a) C7M(9) · b) G7(13) · c) Am7(11) · d) C(add9) — não há 7ª, por isso não é "C9".
  ]
  #resposta(4)[
    No C7M, o 11 (Fá); no G7, o 11 (Dó). Nos dois casos a tensão fica um semitom acima da 3ª do acorde (Mi e Si), cria um choque forte e enfraquece o caráter maior/dominante do acorde.
  ]
  #resposta(5)[
    Resposta pessoal. Em geral, a versão com tensões soa mais suave, "jazzística" e sofisticada, com a mesma direção harmônica (tensão no G7, repouso no C7M).
  ]
]
