#import "/templates/layout.typ": *
#import "/templates/components.typ": *
#import "/templates/components.typ": caixa as caixa-modelo, tabela as tabela-modelo
#import "@preview/conchord:0.4.0": new-chordgen

#show: aula.with(
  instrumento: "Guitarra",
  nivel: "Iniciante",
)

#let chord = new-chordgen(number-to-left: true, use-shadow-barre: false, colors: (hold: black, barre: black))
#show <chord>: set text(fill: color-strong, weight: "bold")

// Texto de tabelas em 9,5pt (corpo do texto continua em 11pt)
#show table: set text(size: 9.5pt)

// Caixas com texto em 10pt (rótulo e corpo no mesmo tamanho)
#let caixa(..args) = {
  set text(size: 10pt)
  caixa-modelo(..args)
}

// Tabelas curtas que não se dividem entre páginas
#let tabela(..args) = block(breakable: false, tabela-modelo(..args))

// Exercício que não se divide entre páginas (enunciado + área de resposta juntos)
#let ex(..args) = block(breakable: false, exercicio(..args))

// Grade de diagramas que não se divide entre páginas
#let acordes(..args) = block(breakable: false, grid-acordes(chord: chord, ..args))

= Tríades

A *tríade* é o acorde mais simples que existe: *três notas* empilhadas em terças — a *tônica* (T), a *terça* (3) e a *quinta* (5). Quase todo acorde que você vai tocar, do mais simples ao mais sofisticado, tem uma tríade como base. Neste material você vai conhecer os quatro tipos de tríade, montá-las no braço, transportá-las para qualquer tom e usar suas inversões.

#objetivos((
  [Construir tríades maiores, menores, diminutas e aumentadas a partir de qualquer tônica],
  [Reconhecer cada tipo pela fórmula de intervalos e pelo som],
  [Transportar um shape de acorde pelo braço para mudar de tom],
  [Entender e tocar as inversões de uma tríade, inclusive nas três primeiras cordas],
))

== 1. Empilhando terças

Para formar uma tríade, parta da tônica e pule uma nota da sequência natural, duas vezes: Dó (Ré) *Mi* (Fá) *Sol*. O resultado, *Dó – Mi – Sol*, é o acorde de Dó maior (C). Cada nota fica uma *terça* acima da anterior.

O que muda de um tipo de tríade para outro é o *tamanho* dessas terças: uma terça pode ser *maior* (4 semitons, ou 2 tons) ou *menor* (3 semitons, ou 1 tom e meio). Combinando as duas, chegamos aos quatro tipos.

== 2. Os quatro tipos de tríade

#tabela(
  columns: (1fr, 0.7fr, 1.05fr, 1.45fr, 1.35fr, 1.5fr),
  ([Tipo], [Cifra], [Fórmula], [Terças (de baixo para cima)], [Notas em Dó], [Sonoridade]),
  (
    ([*Maior*], [C], [T – 3 – 5], [maior + menor], [Dó – Mi – Sol], [Alegre, estável]),
    ([*Menor*], [Cm], [T – b3 – 5], [menor + maior], [Dó – Mib – Sol], [Melancólica, estável]),
    ([*Diminuta*], [Cº], [T – b3 – b5], [menor + menor], [Dó – Mib – Solb], [Tensa, instável]),
    ([*Aumentada*], [C+], [T – 3 – \#5], [maior + maior], [Dó – Mi – Sol\#], [Suspensa, misteriosa]),
  ),
)

#caixa(tipo: "resumo")[
  Da *maior* para a *menor*, só a terça desce 1 semitom (3 → b3). Baixando também a quinta (5 → b5), chega-se à *diminuta*. Subindo a quinta da maior (5 → \#5), chega-se à *aumentada*. A tríade aumentada também pode ser cifrada como C(\#5).
]

== 3. As quatro tríades de Dó no braço

As quatro formas abaixo partem da mesma tônica — Dó, na 5ª corda, 3ª casa — e só mudam a terça e a quinta. Toque uma depois da outra e ouça a diferença.

#acordes(
  columns: 4,
  gutter: 2em,
  (
    (tabs: "x,3,2,0,1,0", nome: "C", titulo: "Maior", detalhe: "Dó · Mi · Sol"),
    (tabs: "x,3,5,5,4,3", nome: "Cm", titulo: "Menor", detalhe: "Dó · Mib · Sol"),
    (tabs: "x,3,4,5,4,x", nome: "Cº", titulo: "Diminuta", detalhe: "Dó · Solb · Dó · Mib"),
    (tabs: "x,3,2,1,1,0", nome: "C+", titulo: "Aumentada", detalhe: "Dó · Mi · Sol\# · Dó · Mi"),
  ),
)

#caixa(tipo: "neutro", titulo: "Notas repetidas")[
  Um acorde de guitarra costuma ter 4, 5 ou 6 notas, mas continua sendo uma tríade: as notas extras são *repetições* (em outra oitava) da tônica, da terça ou da quinta. No C aberto, por exemplo, soam Dó – Mi – Sol – Dó – Mi.
]

== 4. Shapes móveis: mudando de tom

Um acorde *sem cordas soltas* pode ser arrastado pelo braço sem mudar o desenho da mão: cada casa sobe o acorde 1 semitom. A ideia é usar a *pestana* (o dedo 1 pressionando várias cordas) no lugar do capotraste, que é o que "segura" as cordas soltas.

#acordes(
  columns: 4,
  gutter: 2em,
  (
    (tabs: "x,0,2,2,2,0", nome: "A", titulo: "A aberto", detalhe: "Shape de Lá"),
    (tabs: "x,3,5,5,5,3", nome: "C", titulo: "Shape de Lá na casa 3", detalhe: "Tônica na 5ª corda"),
    (tabs: "0,2,2,1,0,0", nome: "E", titulo: "E aberto", detalhe: "Shape de Mi"),
    (tabs: "3,5,5,4,3,3", nome: "G", titulo: "Shape de Mi na casa 3", detalhe: "Tônica na 6ª corda"),
  ),
)

Com o shape de Lá, a tônica está na *5ª corda*, sob a pestana: na casa 3 ela é Dó (C), na casa 5 é Ré (D), na casa 7 é Mi (E). Com o shape de Mi, a tônica está na *6ª corda*: casa 3 = Sol (G), casa 5 = Lá (A), casa 8 = Dó (C). Essa ideia é a base do sistema *CAGED*, que organiza o braço inteiro a partir de cinco desenhos abertos (C, A, G, E e D).

== 5. Inversões

A nota mais grave de um acorde é o *baixo*. Quando o baixo é a tônica, o acorde está no *estado fundamental*. Quando outra nota da tríade vai para o baixo, temos uma *inversão*:

#tabela(
  columns: (1.1fr, 0.9fr, 1.3fr, 0.9fr, 1.9fr),
  alinhamento: (left + horizon, center + horizon, center + horizon, center + horizon, left + horizon),
  ([Posição], [Baixo], [Ordem das notas], [Cifra (em C)], [Sonoridade e uso]),
  (
    ([Estado fundamental], [Tônica], [T – 3 – 5], [C], [Firme, conclusiva]),
    ([1ª inversão], [Terça], [3 – 5 – T], [C/E], [Mais leve; ótima para linhas de baixo que andam por graus]),
    ([2ª inversão], [Quinta], [5 – T – 3], [C/G], [Menos estável; pede continuação]),
  ),
)

Na cifra, a inversão aparece com uma *barra*: *C/E* significa "acorde de Dó com Mi no baixo".

=== Inversões com o C aberto

#acordes(
  columns: 3,
  gutter: 3em,
  (
    (tabs: "x,3,2,0,1,0", nome: "C", titulo: "Estado fundamental", detalhe: "Baixo: Dó (tônica), 5ª corda"),
    (tabs: "0,3,2,0,1,0", nome: "C/E", titulo: "1ª inversão", detalhe: "Baixo: Mi (terça), 6ª corda solta"),
    (tabs: "3,3,2,0,1,0", nome: "C/G", titulo: "2ª inversão", detalhe: "Baixo: Sol (quinta), 6ª corda, casa 3"),
  ),
)

=== Tríades nas três primeiras cordas

Nas cordas 3, 2 e 1, cada tríade tem exatamente três notas, sem repetições — e as três posições aparecem uma depois da outra, subindo pelo braço. Veja a tríade de Dó (Dó – Mi – Sol):

#acordes(
  columns: 4,
  gutter: 2em,
  (
    (tabs: "x,x,x,0,1,0", nome: "C/G", titulo: "2ª inversão", detalhe: "Sol – Dó – Mi"),
    (tabs: "x,x,x,5,5,3", nome: "C", titulo: "Estado fundamental", detalhe: "Dó – Mi – Sol"),
    (tabs: "x,x,x,9,8,8", nome: "C/E", titulo: "1ª inversão", detalhe: "Mi – Sol – Dó"),
    (tabs: "x,x,x,12,13,12", nome: "C/G", titulo: "2ª inversão (oitava)", detalhe: "Sol – Dó – Mi"),
  ),
)

#caixa(tipo: "dica")[
  Essas formas pequenas são muito usadas na guitarra para acompanhar sem "embolar" com o baixo e o teclado. Para mudar de tom, desloque as três formas juntas: duas casas acima, elas viram a tríade de Ré (D).
]

== 6. Exercícios

#ex(titulo: "Monte as tríades")[
  Escreva as notas de cada tríade. Lembre-se: uma nota de cada letra, pulando uma (Dó – Mi – Sol, Ré – Fá – Lá…).

  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1.5em,
    tabela-preencher(
      ([Acorde], [T], [3ª], [5ª]),
      (([D], none, none, none), ([Dm], none, none, none), ([F], none, none, none), ([Eb], none, none, none)),
    ),
    tabela-preencher(
      ([Acorde], [T], [3ª], [5ª]),
      (([Gm], none, none, none), ([Bº], none, none, none), ([C+], none, none, none), ([Am], none, none, none)),
    ),
  )
]

#ex(titulo: "Qual é a tríade?")[
  Dê o nome (cifra) de cada tríade. A primeira nota é a tônica.

  #tabela-preencher(
    columns: (1.4fr, 1fr, 1.4fr, 1fr),
    ([Notas], [Cifra], [Notas], [Cifra]),
    (
      ([A – C – E], none, [E – G – B], none),
      ([G – B – D], none, [D – F\# – A], none),
      ([B – D – F], none, [F – A – C\#], none),
    ),
  )
]

#ex(titulo: "Inversões")[
  a) Indique a posição de cada acorde (estado fundamental, 1ª ou 2ª inversão):

  #tabela-preencher(
    columns: (1fr,) * 6,
    ([Acorde], [C/E], [G/D], [Am/C], [D/F\#], [F/C]),
    (([Posição], none, none, none, none, none),),
  )

  b) Escreva a cifra de: Sol maior com Si no baixo #box(width: 2cm, repeat[\_]) · Lá menor com Mi no baixo #box(width: 2cm, repeat[\_])
]

#ex(titulo: "Transportando no braço")[
  a) Com o shape de Lá (tônica na 5ª corda, sob a pestana), em que casa você faz a pestana para tocar *D*? E para *E*?

  #linhas-resposta(1)

  b) Desloque as três formas de C nas cordas 3, 2 e 1 (seção 5) para formar a tríade de *D*. Escreva as casas de cada uma (3ª, 2ª e 1ª corda):

  #tabela-preencher(
    columns: (1.6fr, 1fr, 1fr, 1fr),
    ([Forma], [3ª corda], [2ª corda], [1ª corda]),
    (
      ([2ª inversão (D/A)], none, none, none),
      ([Estado fundamental (D)], none, none, none),
      ([1ª inversão (D/F\#)], none, none, none),
    ),
  )
]

#ex(titulo: "Ouça a diferença", nivel: "Prática")[
  Toque C, Cm, Cº e C+ (seção 3), devagar, várias vezes. Depois toque um deles sem olhar qual é e peça a alguém (ou grave e ouça depois) para adivinhar o tipo. Descreva com suas palavras o som de cada um:

  #linhas-resposta(2)
]

=== Sugestão de prática

#block(breakable: false, rotina-estudo((
  ([Dizer em voz alta as notas de tríades maiores e menores de várias tônicas], [5 min], [—]),
  ([Tocar C → Cm → Cº → C+ ouvindo a diferença], [3 min], [60]),
  ([Shape de Lá e de Mi subindo casa por casa, dizendo o nome do acorde], [5 min], [60]),
  ([Inversões nas cordas 3-2-1: C e depois D, subindo e descendo], [5 min], [60–80]),
)))

#block(breakable: false, checklist(
  titulo: "Autoavaliação",
  (
    [Monto as quatro tríades de qualquer tônica (T – 3 – 5, T – b3 – 5, T – b3 – b5, T – 3 – \#5).],
    [Reconheço de ouvido a diferença entre maior, menor, diminuta e aumentada.],
    [Transporto os shapes de Lá e de Mi para qualquer tom.],
    [Sei o que é uma inversão e leio cifras com barra (C/E, C/G).],
    [Toco as três posições da tríade nas cordas 3, 2 e 1.],
  ),
))

#gabarito[
  #resposta(1)[D: D – F\# – A · Dm: D – F – A · F: F – A – C · Eb: Eb – G – Bb · Gm: G – Bb – D · Bº: B – D – F · C+: C – E – G\# · Am: A – C – E.]
  #resposta(2)[A – C – E = Am · G – B – D = G · B – D – F = Bº · E – G – B = Em · D – F\# – A = D · F – A – C\# = F+.]
  #resposta(3)[a) C/E: 1ª inversão · G/D: 2ª inversão · Am/C: 1ª inversão · D/F\#: 1ª inversão · F/C: 2ª inversão. b) G/B · Am/E.]
  #resposta(4)[a) D: pestana na casa 5 · E: pestana na casa 7. b) D/A: 2 – 3 – 2 · D: 7 – 7 – 5 · D/F\#: 11 – 10 – 10.]
  #resposta(5)[Exercício prático — critério de sucesso: identificar o tipo de tríade de ouvido na maioria das tentativas. Em geral: maior = alegre e estável; menor = melancólica; diminuta = tensa, "apertada"; aumentada = suspensa, sem repouso.]
]
