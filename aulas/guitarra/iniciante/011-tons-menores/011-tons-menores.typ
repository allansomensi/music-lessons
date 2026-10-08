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

= Tons Menores

A escala maior soa luminosa e estável. A *escala menor natural* usa um desenho diferente de tons e semitons e, por isso, soa mais escura e melancólica. Ela é a base de inúmeras músicas de rock, pop, MPB e música erudita. Nesta aula você vai conhecer essa escala, o seu campo harmônico e as progressões mais comuns em tom menor.

#objetivos((
  [Construir a escala menor natural a partir da fórmula de tons e semitons],
  [Comparar os graus da escala menor com os da escala maior (b3, b6 e 7)],
  [Montar o campo harmônico menor e nomear os graus],
  [Usar o V7 (E7 em Lá menor) para reforçar a resolução na tônica],
  [Tocar progressões típicas em Lá menor],
))

== 1. A escala menor natural

A escala menor natural segue esta sequência de distâncias entre notas vizinhas (T = tom, ST = semitom):

#align(center)[
  #text(size: 12pt, weight: "bold")[T – ST – T – T – ST – T – T]
]

Começando em Lá, essa fórmula produz *Lá, Si, Dó, Ré, Mi, Fá, Sol* — exatamente as notas de Dó maior, sem nenhum acidente. Por isso Lá menor é o *relativo menor* de Dó maior: as duas escalas têm as mesmas notas, mas cada uma gira em torno de uma tônica diferente.

#tabela(
  columns: (1.7fr,) + (1fr,) * 8,
  ([Nota], [Lá], [Si], [Dó], [Ré], [Mi], [Fá], [Sol], [Lá]),
  (
    ([*Grau*], [T], [2], [b3], [4], [5], [b6], [7], [8]),
    ([*T / ST*], [T], [ST], [T], [T], [ST], [T], [T], [—]),
  ),
)

== 2. Maior × menor: o que muda

Compare as duas escalas a partir da mesma tônica (Lá maior e Lá menor). Três graus são diferentes: na escala menor, a *3ª*, a *6ª* e a *7ª* ficam um semitom abaixo.

#tabela(
  columns: (1.6fr,) + (1fr,) * 7,
  ([Grau], [T], [2], [3 / b3], [4], [5], [6 / b6], [7M / 7]),
  (
    ([*Lá maior*], [Lá], [Si], [*Dó\#*], [Ré], [Mi], [*Fá\#*], [*Sol\#*]),
    ([*Lá menor*], [Lá], [Si], [*Dó*], [Ré], [Mi], [*Fá*], [*Sol*]),
  ),
)

#caixa(tipo: "resumo", titulo: "Fórmula em graus")[
  Escala maior: T – 2 – 3 – 4 – 5 – 6 – 7M \
  Escala menor natural: T – 2 – *b3* – 4 – 5 – *b6* – *7* #h(0.5em) (lembre: *7* = sétima menor)
]

A *b3* é a nota mais importante: é ela que faz o acorde da tônica ser menor e dá à escala o seu caráter escuro.

== 3. O campo harmônico de Lá menor

Empilhando terças sobre cada nota da escala de Lá menor natural, obtemos as tétrades do campo:

#tabela(
  columns: (1fr, 1fr, 1.6fr, 1.4fr),
  ([Grau], [Acorde], [Notas], [Tipo]),
  (
    ([Im7], [Am7], [Lá – Dó – Mi – Sol], [menor com 7]),
    ([IIm7(b5)], [Bm7(b5)], [Si – Ré – Fá – Lá], [meio-diminuto]),
    ([bIII7M], [C7M], [Dó – Mi – Sol – Si], [maior com 7M]),
    ([IVm7], [Dm7], [Ré – Fá – Lá – Dó], [menor com 7]),
    ([Vm7], [Em7], [Mi – Sol – Si – Ré], [menor com 7]),
    ([bVI7M], [F7M], [Fá – Lá – Dó – Mi], [maior com 7M]),
    ([bVII7], [G7], [Sol – Si – Ré – Fá], [dominante]),
  ),
)

São os mesmos sete acordes do campo de Dó maior, mas agora a tônica é o Am7. Os graus III, VI e VII levam *b* porque ficam um semitom abaixo dos graus correspondentes da escala maior de Lá.

=== O V7 "emprestado"

No campo menor natural, o V grau é *menor* (Em7) e não tem trítono: a resolução no Am fica fraca. Por isso, na prática, quase sempre se troca o Em7 por *E7* (Mi – Sol\# – Si – Ré). O Sol\# fica um semitom abaixo do Lá e "puxa" a música de volta para a tônica, como acontece com o G7 em Dó maior. Essa nota vem da *escala menor harmônica* (a menor natural com a 7ª elevada).

== 4. Acordes no braço

#let linha-acordes(items) = block(breakable: false, width: 100%, below: 1.4em, grid-acordes(chord: chord, columns: 4, gutter: 1.6em, items))

#linha-acordes((
  (tabs: "x,0,2,0,1,0", nome: " ", titulo: "Am7", detalhe: "Im7"),
  (tabs: "x,2,3,2,3,x,*", nome: " ", titulo: "Bm7(b5)", detalhe: "IIm7(b5)"),
  (tabs: "x,3,2,0,0,0", nome: " ", titulo: "C7M", detalhe: "bIII7M"),
  (tabs: "x,x,0,2,1,1", nome: " ", titulo: "Dm7", detalhe: "IVm7"),
))
#linha-acordes((
  (tabs: "0,2,0,0,0,0", nome: " ", titulo: "Em7", detalhe: "Vm7"),
  (tabs: "x,x,3,2,1,0", nome: " ", titulo: "F7M", detalhe: "bVI7M"),
  (tabs: "3,2,0,0,0,1", nome: " ", titulo: "G7", detalhe: "bVII7"),
  (tabs: "0,2,0,1,0,0", nome: " ", titulo: "E7", detalhe: "V7 (emprestado)"),
))

== 5. Progressões típicas em tom menor

#tabela(
  columns: (1.35fr, 1.5fr, 2.45fr),
  ([Progressão], [Graus], [Característica]),
  (
    ([Am – F – C – G], [Im – bVI – bIII – bVII], [Pop e rock; soa épica e circular]),
    ([Am – G – F – E7], [Im – bVII – bVI – V7], [Baixo descendo Lá – Sol – Fá – Mi]),
    ([Am – Dm – E7 – Am], [Im – IVm – V7 – Im], [Cadência completa; E7 → Am resolve forte]),
    ([Bm7(b5) – E7 – Am], [IIm7(b5) – V7 – Im], [II–V–I menor (jazz, bossa nova)]),
  ),
)

#caixa(tipo: "dica")[
  Compare *Am – Dm – Em – Am* com *Am – Dm – E7 – Am*: com o Sol\# do E7, a volta para o Am soa muito mais conclusiva.
]

== 6. Exercícios

#ex(titulo: "Escreva as escalas")[
  Aplique a fórmula T – ST – T – T – ST – T – T e escreva a escala menor natural de cada tom.

  #tabela-preencher(
    columns: (1.1fr,) + (1fr,) * 7,
    ([Tom], [T], [2], [b3], [4], [5], [b6], [7]),
    (
      ([Mi menor], none, none, none, none, none, none, none),
      ([Ré menor], none, none, none, none, none, none, none),
      ([Si menor], none, none, none, none, none, none, none),
    ),
  )
]

#ex(titulo: "Relativos")[
  Escreva o relativo menor (tônica 1,5 tom abaixo) ou o relativo maior (tônica 1,5 tom acima).

  #tabela-preencher(
    columns: (1.3fr,) + (1fr,) * 6,
    ([Tom], [G], [F], [D], [Bb], [Cm], [F\#m]),
    (([Relativo],) + (none,) * 6,),
  )
]

#ex(titulo: "Campo harmônico de Mi menor")[
  Escreva os sete acordes (tétrades) do campo harmônico de Mi menor natural.

  #tabela-preencher(
    columns: (1.1fr,) + (1fr,) * 7,
    ([Grau], [Im7], [IIm7(b5)], [bIII7M], [IVm7], [Vm7], [bVI7M], [bVII7]),
    (([Acorde],) + (none,) * 7,),
  )
]

#ex(titulo: "Quais são os graus?")[
  Escreva os graus de cada progressão em Lá menor.

  #grid(
    columns: (1fr, 1fr),
    row-gutter: 1.1em,
    column-gutter: 1.5em,
    [a) Am – G – F – G #h(0.4em) #box(width: 3.6cm, height: 0.9em, stroke: (bottom: 0.6pt + color-rule-dark))],
    [b) Dm – E7 – Am #h(0.4em) #box(width: 3.6cm, height: 0.9em, stroke: (bottom: 0.6pt + color-rule-dark))],

    [c) Am – C – Dm – F #h(0.4em) #box(width: 3.6cm, height: 0.9em, stroke: (bottom: 0.6pt + color-rule-dark))],
    [d) F – G – Am #h(0.4em) #box(width: 3.6cm, height: 0.9em, stroke: (bottom: 0.6pt + color-rule-dark))],
  )
]

#ex(titulo: "Por que E7?")[
  Explique por que, em Lá menor, o E7 resolve no Am com mais força do que o Em7. Cite a nota responsável.

  #linhas-resposta(2)
]

#ex(titulo: "No instrumento")[
  Toque a progressão *Am – F – C – G* (quatro tempos por acorde) e depois *C – G – Am – F*. Os acordes são os mesmos: qual delas soa "menor" e qual soa "maior"? Por quê?

  #linhas-resposta(2)
]

=== Sugestão de prática

#rotina-estudo((
  ([Escala de Lá menor natural em uma oitava, cantando os nomes das notas], [5 min], [60–80]),
  ([Acordes da seção 4, trocando na ordem dos graus], [5 min], [60]),
  ([Progressões da seção 5, quatro tempos por acorde], [10 min], [70–90]),
))

=== Autoavaliação

#checklist((
  [Sei a fórmula T – ST – T – T – ST – T – T de cor],
  [Escrevo a escala menor natural de qualquer tom],
  [Sei quais graus mudam da escala maior para a menor],
  [Monto o campo harmônico menor e uso o V7 para resolver],
))

#gabarito[
  #resposta(1)[
    Mi menor: Mi – Fá\# – Sol – Lá – Si – Dó – Ré · Ré menor: Ré – Mi – Fá – Sol – Lá – Sib – Dó · Si menor: Si – Dó\# – Ré – Mi – Fá\# – Sol – Lá.
  ]
  #resposta(2)[
    G → Em · F → Dm · D → Bm · Bb → Gm · Cm → Eb · F\#m → A.
  ]
  #resposta(3)[
    Em7 – F\#m7(b5) – G7M – Am7 – Bm7 – C7M – D7.
  ]
  #resposta(4)[
    a) Im – bVII – bVI – bVII · b) IVm – V7 – Im · c) Im – bIII – IVm – bVI · d) bVI – bVII – Im.
  ]
  #resposta(5)[
    O E7 tem o *Sol\#*, que fica um semitom abaixo do Lá e tende a subir para ele; além disso, Sol\# e Ré formam um trítono, que pede resolução. O Em7 tem Sol natural, a um tom do Lá, e não tem trítono, por isso a resolução é mais fraca.
  ]
  #resposta(6)[
    *Am – F – C – G* soa menor, porque começa (e "mora") no Am; *C – G – Am – F* soa maior, porque o C ocupa a posição de tônica. O ouvido toma como centro o acorde que inicia e encerra o ciclo.
  ]
]
