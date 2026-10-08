#import "/templates/layout.typ": *
#import "/templates/components.typ": *
#import "@preview/conchord:0.4.0": new-chordgen

#show: aula.with(
  instrumento: "Violão",
  nivel: "Iniciante",
)

#let chord = new-chordgen(number-to-left: true, use-shadow-barre: false, colors: (hold: black, barre: black))
#show <chord>: set text(fill: color-strong, weight: "bold")

// Exercício que não se divide entre páginas (enunciado + área de resposta juntos)
#let ex(..args) = block(breakable: false, above: 1.5em, below: 0.9em, exercicio(..args))

// ============================================================
// HELPERS LOCAIS — notas do braço calculadas a partir da afinação
// ============================================================
#let nomes-notas = ("C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B")
#let afinacao = (4, 9, 2, 7, 11, 4) // 6ª … 1ª corda
#let mapa(cordas-idx, ini, fim) = cordas-idx.map(k => range(ini, fim + 1).map(c => nomes-notas.at(calc.rem(afinacao.at(k) + c, 12))))

= Fundamentos de Leitura Musical

Para tirar músicas, seguir uma cifra ou estudar com um professor, você precisa entender a *linguagem escrita* do violão: o nome das notas, o significado de \# e b, a afinação das cordas e como ler diagramas de acorde, cifras e tablaturas. Este material reúne essa base.

#objetivos((
  [Nomear as notas em português e em cifra e usar sustenido e bemol.],
  [Medir tons e semitons no braço e conhecer a afinação padrão.],
  [Ler diagramas de acorde, inclusive com pestana e com número de casa.],
  [Interpretar os símbolos de uma cifra e ler tablaturas de violão.],
))

== 1. As notas e a cifra

A música ocidental usa *sete notas naturais*. No Brasil falamos os nomes em português (Dó, Ré, Mi…), mas a *cifra* — usada em cifras de músicas, tablaturas e aplicativos — usa letras:

#tabela(
  ([*Cifra*], [*C*], [*D*], [*E*], [*F*], [*G*], [*A*], [*B*]),
  (([*Nome*], [Dó], [Ré], [Mi], [Fá], [Sol], [Lá], [Si]),),
  columns: (1.1fr,) + (1fr,) * 7,
  zebra: false,
)

Para memorizar, lembre que a cifra começa no Lá: *A* = Lá, *B* = Si, *C* = Dó, e assim por diante. A cifra mostra *quais acordes* tocar e quando trocar; a *partitura* é mais completa, pois também registra a melodia, o ritmo exato e a intensidade.

== 2. Sustenido, bemol, tom e semitom

No braço do violão, *cada casa equivale a um semitom* (ST), a menor distância entre duas notas. *Duas casas* formam *um tom* (T).

#cartoes-info((
  (titulo: [Sustenido (\#)], corpo: [*Sobe* a nota um semitom: uma casa em direção ao corpo do violão. \ Ex.: F\# (Fá sustenido) = uma casa acima do Fá.]),
  (titulo: [Bemol (b)], corpo: [*Desce* a nota um semitom: uma casa em direção à mão do violão. \ Ex.: Bb (Si bemol) = uma casa abaixo do Si.]),
))

Entre quase todas as notas naturais vizinhas há *um tom* — e, portanto, uma nota intermediária, que pode ter dois nomes (F\# = Gb). As exceções são *Mi–Fá* e *Si–Dó*, separadas por *um semitom* só.

#block(breakable: false)[
Veja na 6ª corda (Mi grave), casa a casa:

#align(center)[
  #braco-notas(mapa((0,), 0, 12), fs: 0, cordas: ("6",))
]
]

Repare: da corda solta (E) para a casa 1 (F) há só uma casa, porque entre Mi e Fá não existe nota intermediária. O mesmo acontece entre B (casa 7) e C (casa 8). Na casa 12 a nota Mi volta, uma *oitava* acima.

== 3. A afinação padrão

O violão, de nylon ou de aço, usa a mesma afinação padrão da guitarra. Da corda mais grave para a mais aguda:

#tabela(
  ([*Corda*], [*6ª*], [*5ª*], [*4ª*], [*3ª*], [*2ª*], [*1ª*]),
  (
    ([Nota], [Mi grave], [Lá], [Ré], [Sol], [Si], [Mi agudo]),
    ([Cifra], [E], [A], [D], [G], [B], [E]),
    ([Altura exata], [E2], [A2], [D3], [G3], [B3], [E4]),
  ),
  columns: (1.2fr,) + (1fr,) * 6,
)

O número ao lado da letra (E2, A2…) indica *em qual oitava* a nota está: quanto maior o número, mais aguda. A 6ª e a 1ª cordas são ambas Mi, mas a 1ª soa duas oitavas acima. A 6ª corda é a mais grossa; a 1ª, a mais fina.

== 4. Como ler um diagrama de acorde

O diagrama mostra o braço *de frente, na vertical*: as linhas verticais são as cordas (6ª à esquerda, 1ª à direita) e as horizontais, os trastes.

#grid(
  columns: (auto, 1fr),
  column-gutter: 2em,
  align: (center + horizon, left + horizon),
  box(chord("x,0,2,2,1,0", name: "Am")),
  [
    #set text(size: 10pt)
    - *Bolinha preta:* pressione a corda nessa casa.
    - *○ acima da corda:* corda solta — toque sem pressionar.
    - *× acima da corda:* corda que não deve soar.
    - *Linha grossa no topo:* a pestana do violão (o início do braço). Se ela não aparece, o desenho está mais acima no braço.
  ],
)

=== Pestana e número de casa

Quando um dedo pressiona várias cordas ao mesmo tempo, o diagrama mostra uma *barra* atravessando as cordas: é a *pestana* (técnica). Quando o acorde fica longe do início do braço, um *número* ao lado indica a casa em que o desenho começa.

#grid-acordes(
  chord: chord,
  columns: 2,
  gutter: 4em,
  (
    (tabs: "1,3,3,2,1,1", nome: " ", titulo: "F — Fá maior", detalhe: [pestana com o dedo 1 na casa 1]),
    (tabs: "x,5,7,7,7,5", nome: " ", titulo: "D — Ré maior (casa 5)", detalhe: [o número 5 indica a casa da pestana]),
  ),
)

== 5. Como ler uma cifra

A cifra coloca o nome dos acordes *acima da letra da música*, exatamente sobre a sílaba em que a troca acontece. A *letra* inicial é a *tônica* (a nota que dá nome ao acorde); o que vem depois indica o tipo de acorde:

#tabela(
  ([*Símbolo*], [*Significado*], [*Exemplo*]),
  (
    ([só a letra], [Acorde maior], [C = Dó maior]),
    ([m], [Acorde menor], [Am = Lá menor]),
    ([\# ou b], [Sustenido ou bemol na tônica], [F\# = Fá sustenido maior · Bb = Si bemol maior]),
    ([7], [Com sétima menor], [G7 = Sol com sétima]),
    ([7M], [Com sétima maior], [C7M = Dó com sétima maior]),
    ([m7], [Menor com sétima menor], [Am7 = Lá menor com sétima]),
    ([sus4 / sus2], [A terça é trocada pela 4ª ou pela 2ª], [Dsus4 = Ré com quarta suspensa]),
    ([\/ (barra)], [Inversão: a nota após a barra é o baixo], [G/B = Sol com baixo em Si]),
  ),
  columns: (0.9fr, 1.8fr, 2.3fr),
  alinhamento: (center + horizon, left + horizon, left + horizon),
)

#tab("C            G/B        Am\nCan-to a can-ção do meu lu-gar", titulo: "Exemplo de cifra (letra fictícia)", legenda: [Troque para G/B na sílaba "ção" e para Am na sílaba "lu".])

== 6. Como ler uma tablatura

A *tablatura* (tab) mostra *onde* tocar cada nota. Ela tem seis linhas, uma por corda, e os números indicam as casas:

- A linha de *cima* é a *1ª corda (Mi agudo)*; a de *baixo*, a *6ª corda (Mi grave)* — o contrário do diagrama de acorde.
- O número é a *casa*; *0* é corda solta.
- Leia *da esquerda para a direita*. Números na *mesma coluna* soam *juntos*.

#align(center, grid(
  columns: (auto, auto),
  column-gutter: 2.5em,
  align: center + horizon,
  tab("e|-------------------------|\nB|-------------------0--1--|\nG|-------------0--2--------|\nD|----0--2--3--------------|\nA|-3-----------------------|\nE|-------------------------|", titulo: "Escala de Dó maior (notas separadas)", legenda: [C – D – E – F – G – A – B – C]),
  tab("e|-0-|\nB|-1-|\nG|-0-|\nD|-2-|\nA|-3-|\nE|---|", titulo: "Acorde C", legenda: [notas juntas]),
))

A tab básica não mostra a duração das notas. Para o ritmo, ouça a gravação ou use a partitura, quando houver.

== 7. Exercícios

#ex(titulo: "Nome e cifra", nivel: "Escrita")[
  Complete a tabela: escreva o nome das cifras e a cifra dos nomes.

  #v(0.3em)
  #tabela-preencher(
    ([*Cifra*], [*G*], [*E*], [*B*], [*F\#*], [*Bb*], [*D\#*]),
    (([Nome], none, none, none, none, none, none),),
    columns: (1.2fr,) + (1fr,) * 6,
  )
  #v(0.4em)
  #tabela-preencher(
    ([*Nome*], [*Lá*], [*Ré*], [*Fá*], [*Dó\#*], [*Mib*], [*Láb*]),
    (([Cifra], none, none, none, none, none, none),),
    columns: (1.2fr,) + (1fr,) * 6,
  )
]

#ex(titulo: "Qual é a nota?", nivel: "Escrita")[
  Escreva a nota de cada posição. Para notas com sustenido/bemol, escreva os dois nomes (ex.: C\# / Db).

  #v(0.3em)
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1.2em,
    tabela-preencher(
      ([*Corda*], [*Casa*], [*Nota*]),
      (
        ([a) 6ª (E)], [3], none),
        ([b) 6ª (E)], [5], none),
        ([c) 6ª (E)], [8], none),
        ([d) 6ª (E)], [6], none),
      ),
      columns: (1.2fr, 0.8fr, 1.4fr),
    ),
    tabela-preencher(
      ([*Corda*], [*Casa*], [*Nota*]),
      (
        ([e) 5ª (A)], [2], none),
        ([f) 5ª (A)], [3], none),
        ([g) 5ª (A)], [7], none),
        ([h) 5ª (A)], [4], none),
      ),
      columns: (1.2fr, 0.8fr, 1.4fr),
    ),
  )
]

#ex(titulo: "Lendo cifras", nivel: "Escrita")[
  Escreva o nome completo de cada acorde, como no exemplo: *Am7* = Lá menor com sétima.

  #v(0.3em)
  #tabela-preencher(
    ([*Cifra*], [*Nome do acorde*]),
    (
      ([a) Em], none),
      ([b) D7], none),
      ([c) F\#m], none),
      ([d) Bb7M], none),
      ([e) Asus4], none),
      ([f) C/E], none),
    ),
    columns: (1fr, 4fr),
    alinhamento: (center + horizon, left + horizon),
  )
]

#ex(titulo: "Lendo uma tablatura", nivel: "Escrita + prática")[
  Escreva, na ordem, o nome (em cifra) de cada nota da tab. Depois, toque a melodia.

  #tab("e|-------0--1--0--------|\nB|-1--3-----------3--1--|\nG|----------------------|\nD|----------------------|\nA|----------------------|\nE|----------------------|")
  #linhas-resposta(1)
]

#ex(titulo: "Diagrama, cifra e tab", nivel: "Escrita")[
  a) No diagrama de acorde, qual corda fica à esquerda? E na tablatura, qual corda fica na linha de cima? \
  b) O que significa um × acima de uma corda no diagrama? \
  c) Na cifra *G/B*, qual nota o baixo (a corda mais grave) deve tocar? \
  d) Quantas casas há entre Mi e Fá? E entre Fá e Sol?

  #linhas-resposta(3)
]

=== Sugestão de prática

#block(breakable: false, rotina-estudo((
  ([Dizer as notas da 6ª e da 5ª cordas, casa por casa (0 → 12 → 0)], [4 min], [—]),
  ([Traduzir cifras sorteadas para o nome completo do acorde], [3 min], [—]),
  ([Tocar a escala de Dó maior da tab da seção 6, subindo e descendo], [4 min], [60]),
  ([Montar acordes a partir de diagramas, conferindo ○ e ×], [4 min], [—]),
)))

#v(0.6em)

#checklist(
  (
    [Traduzo nomes de notas para cifra e vice-versa.],
    [Sei que 1 casa = 1 semitom e que entre Mi–Fá e Si–Dó não há nota intermediária.],
    [Sei a afinação padrão: Mi, Lá, Ré, Sol, Si, Mi (6ª à 1ª).],
    [Leio diagramas de acorde (inclusive com pestana) e tablaturas.],
    [Entendo os símbolos m, 7, 7M, sus4 e a barra (/) de uma cifra.],
  ),
  titulo: "Autoavaliação",
)

#gabarito[
  #resposta(1)[G = Sol · E = Mi · B = Si · F\# = Fá sustenido · Bb = Si bemol · D\# = Ré sustenido. \ Lá = A · Ré = D · Fá = F · Dó\# = C\# · Mib = Eb · Láb = Ab.]
  #resposta(2)[a) G · b) A · c) C · d) A\# / Bb · e) B · f) C · g) E · h) C\# / Db.]
  #resposta(3)[a) Mi menor · b) Ré com sétima · c) Fá sustenido menor · d) Si bemol com sétima maior · e) Lá com quarta suspensa · f) Dó maior com baixo em Mi.]
  #resposta(4)[C – D – E – F – E – D – C.]
  #resposta(5)[
    a) No diagrama, a 6ª corda (Mi grave) fica à esquerda; na tab, a linha de cima é a 1ª corda (Mi agudo). \
    b) Que a corda não deve ser tocada. \
    c) Si (B). \
    d) Entre Mi e Fá, uma casa (1 semitom); entre Fá e Sol, duas casas (1 tom).
  ]
]
