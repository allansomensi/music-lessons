#import "/templates/layout.typ": *
#import "/templates/components.typ": *
#import "@preview/conchord:0.4.0": new-chordgen

#show: aula.with(
  instrumento: "Guitarra",
  nivel: "Iniciante",
)

#let chord = new-chordgen(number-to-left: true, use-shadow-barre: false, colors: (hold: black, barre: black))

= Funções Harmônicas e Relativos

Dentro de um tom, cada acorde tem um *papel*: uns dão sensação de repouso, outros de movimento, outros de tensão que pede resolução. Esse papel se chama *função harmônica*. Entender funções é o que permite criar progressões coerentes, trocar um acorde por outro sem "estragar" a música e reconhecer de ouvido o que está acontecendo numa canção.

#objetivos((
  [Reconhecer as três funções harmônicas: tônica, subdominante e dominante],
  [Classificar cada acorde do campo harmônico maior pela sua função],
  [Identificar as cadências mais comuns, incluindo o II–V–I],
  [Encontrar o relativo menor de um tom maior (e vice-versa) e usar acordes relativos como substitutos],
))

== 1. O campo harmônico de Dó maior

O *campo harmônico* é o conjunto de acordes formados apenas com as notas de uma escala. Empilhando terças sobre cada nota da escala de Dó maior (Dó, Ré, Mi, Fá, Sol, Lá, Si), obtemos sete tétrades (acordes de quatro notas):

#tabela(
  columns: (0.9fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1.25fr),
  ([Grau], [I], [IIm7], [IIIm7], [IV7M], [V7], [VIm7], [VIIm7(b5)]),
  (
    ([*Acorde*], [C7M], [Dm7], [Em7], [F7M], [G7], [Am7], [Bm7(b5)]),
    ([*Notas*], [C E G B], [D F A C], [E G B D], [F A C E], [G B D F], [A C E G], [B D F A]),
  ),
)

Os números romanos indicam o *grau*: a posição do acorde dentro do tom. Como os graus valem para qualquer tonalidade, eles permitem descrever uma progressão sem depender do tom em que ela é tocada.

== 2. As três funções

#cartoes-info((
  (
    titulo: "TÔNICA (T)",
    corpo: [*Repouso.* É o "lar" do tom: a música costuma começar e terminar aqui. \ #v(0.3em) Principal: *I* (C7M).],
  ),
  (
    titulo: "SUBDOMINANTE (S)",
    corpo: [*Afastamento.* Tira a música do repouso e prepara a tensão. \ #v(0.3em) Principal: *IV* (F7M).],
  ),
  (
    titulo: "DOMINANTE (D)",
    corpo: [*Tensão.* Pede resolução na tônica. \ #v(0.3em) Principal: *V7* (G7).],
  ),
))

=== Por que o V7 pede resolução?

O G7 contém as notas *Si* e *Fá*, que estão a três tons de distância uma da outra. Esse intervalo, chamado *trítono*, é muito instável. Ao passar para o C, o Si sobe um semitom para Dó e o Fá desce um semitom para Mi: a tensão se desfaz e ouvimos a "chegada" na tônica.

=== Acordes substitutos

Os outros acordes do campo assumem a função do acorde principal com o qual *compartilham mais notas*:

#tabela(
  columns: (0.8fr, 0.9fr, 0.7fr, 2.6fr),
  ([Grau], [Acorde], [Função], [Por quê]),
  (
    ([I], [C7M], [*T*], [Tônica principal]),
    ([IIm7], [Dm7], [S], [Tem Fá, Lá e Dó, três das quatro notas do F7M]),
    ([IIIm7], [Em7], [T], [Tem Mi, Sol e Si, notas do C7M (às vezes soa como dominante, pois também tem o Si)]),
    ([IV7M], [F7M], [*S*], [Subdominante principal]),
    ([V7], [G7], [*D*], [Dominante principal: contém o trítono Si–Fá]),
    ([VIm7], [Am7], [T], [Tem Dó, Mi e Sol, notas do C7M; é o *relativo* da tônica]),
    ([VIIm7(b5)], [Bm7(b5)], [D], [Tem Si, Ré e Fá, notas do G7, incluindo o trítono]),
  ),
)

== 3. Cadências

Uma *cadência* é um encadeamento de acordes que cria a sensação de chegada ou de pausa, como a pontuação de uma frase. As mais comuns:

#cartoes-info(
  columns: (1fr, 1fr),
  (
    (
      titulo: "Autêntica: V7 → I",
      corpo: [G7 → C. A mais forte e conclusiva: a tensão do dominante resolve direto na tônica. É o "ponto final" da música tonal.],
    ),
    (
      titulo: "Plagal: IV → I",
      corpo: [F → C. Conclusão suave, sem trítono. Conhecida como cadência do "Amém", por encerrar muitos hinos religiosos.],
    ),
    (
      titulo: "Meia cadência: … → V",
      corpo: [C → G7 (e para). A frase termina no dominante e fica "em suspenso", como uma vírgula ou uma pergunta.],
    ),
    (
      titulo: "De engano: V7 → VIm",
      corpo: [G7 → Am. O ouvido espera o C, mas a música vai para o relativo menor: a resolução "engana" e a frase continua.],
    ),
  ),
)

== 4. A progressão II–V–I

O *II–V–I* encadeia as três funções em sequência — *subdominante → dominante → tônica* — e é a cadência mais usada no jazz, na bossa nova e em boa parte da música popular. Em Dó maior: *Dm7 → G7 → C7M*.

#grid-acordes(
  chord: chord,
  columns: 3,
  gutter: 2.5em,
  (
    (tabs: "x,x,0,2,1,1", nome: " ", titulo: "Dm7 (IIm7)", detalhe: "Subdominante"),
    (tabs: "3,2,0,0,0,1", nome: " ", titulo: "G7 (V7)", detalhe: "Dominante"),
    (tabs: "x,3,2,0,0,0", nome: " ", titulo: "C7M (I7M)", detalhe: "Tônica"),
  ),
)

#v(0.6em)

O padrão é o mesmo em qualquer tom: basta pegar o II, o V e o I do campo harmônico.

#tabela(
  columns: (1fr, 1fr, 1fr, 1fr),
  ([Tom], [IIm7], [V7], [I7M]),
  (
    ([Dó maior (C)], [Dm7], [G7], [C7M]),
    ([Sol maior (G)], [Am7], [D7], [G7M]),
    ([Ré maior (D)], [Em7], [A7], [D7M]),
    ([Fá maior (F)], [Gm7], [C7], [F7M]),
    ([Si bemol maior (Bb)], [Cm7], [F7], [Bb7M]),
  ),
)

== 5. Relativos

=== Tons relativos

Todo tom maior tem um *relativo menor*: um tom menor que usa *exatamente as mesmas notas*. Lá menor, por exemplo, usa as mesmas sete notas de Dó maior, só que começando do Lá. A tônica do relativo menor é o *VI grau* do tom maior.

#caixa(tipo: "resumo", titulo: "Como encontrar")[
  *Maior → relativo menor:* desça 1,5 tom (três semitons) a partir da tônica. Dó → Si → Si bemol → *Lá*: o relativo de C é *Am*. \
  *Menor → relativo maior:* suba 1,5 tom. Mi → Fá → Fá\# → *Sol*: o relativo de Em é *G*.
]

#v(0.4em)

#tabela(
  columns: (1.7fr,) + (1fr,) * 8,
  ([Maior], [C], [G], [D], [A], [E], [F], [Bb], [Eb]),
  (([*Rel. menor*], [Am], [Em], [Bm], [F\#m], [C\#m], [Dm], [Gm], [Cm]),),
)

=== Acordes relativos dentro do campo

Dentro do campo harmônico, cada acorde maior também tem um acorde relativo menor, uma terça menor abaixo. Os dois compartilham três notas e, por isso, um pode substituir o outro em muitos contextos:

#tabela(
  columns: (1fr, 1fr, 2fr),
  ([Acorde maior], [Relativo menor], [Notas em comum]),
  (
    ([C7M (I)], [Am7 (VIm7)], [Dó, Mi e Sol]),
    ([F7M (IV)], [Dm7 (IIm7)], [Fá, Lá e Dó]),
    ([G7 (V7)], [Em7 (IIIm7)], [Sol, Si e Ré]),
  ),
)

#caixa(tipo: "dica")[
  Experimente tocar C – Am – F – G e depois Am – C – Dm – G. A segunda versão troca cada acorde pelo relativo (ou começa pelo relativo) e mantém o mesmo "caminho" harmônico, com uma cor diferente.
]

== 6. Exercícios

#exercicio(titulo: "Funções no campo de Sol maior")[
  O campo harmônico de Sol maior é: G7M – Am7 – Bm7 – C7M – D7 – Em7 – F\#m7(b5). Escreva o grau e a função (T, S ou D) de cada acorde.

  #tabela-preencher(
    columns: (1fr,) * 8,
    ([Acorde], [G7M], [Am7], [Bm7], [C7M], [D7], [Em7], [F\#m7(b5)]),
    (
      ([Grau],) + (none,) * 7,
      ([Função],) + (none,) * 7,
    ),
  )
]

#exercicio(titulo: "II–V–I em outros tons")[
  Escreva os acordes do II–V–I em cada tom.

  #tabela-preencher(
    columns: (1.2fr, 1fr, 1fr, 1fr),
    ([Tom], [IIm7], [V7], [I7M]),
    (
      ([Lá maior (A)], none, none, none),
      ([Mi maior (E)], none, none, none),
      ([Mi bemol maior (Eb)], none, none, none),
    ),
  )
]

#exercicio(titulo: "Relativos")[
  Escreva o relativo menor de cada tom maior (lado esquerdo) e o relativo maior de cada tom menor (lado direito).

  #tabela-preencher(
    columns: (1.3fr,) + (1fr,) * 12,
    ([Tom], [D], [F], [A], [Bb], [E], [Ab], [Em], [Dm], [F\#m], [Cm], [Bm], [Gm]),
    (([Relativo],) + (none,) * 12,),
  )
]

#exercicio(titulo: "Qual é a cadência?")[
  Todas as progressões estão em Dó maior. Escreva o nome da cadência: autêntica, plagal, meia cadência ou de engano.

  #grid(
    columns: (1fr, 1fr),
    row-gutter: 1.1em,
    column-gutter: 1.5em,
    [a) G7 → C #h(0.5em) #box(width: 4cm, stroke: (bottom: 0.6pt + color-rule-dark), height: 0.9em)],
    [b) F → C #h(0.5em) #box(width: 4cm, stroke: (bottom: 0.6pt + color-rule-dark), height: 0.9em)],

    [c) G7 → Am #h(0.5em) #box(width: 4cm, stroke: (bottom: 0.6pt + color-rule-dark), height: 0.9em)],
    [d) C → Dm → G7 (fim) #h(0.5em) #box(width: 3cm, stroke: (bottom: 0.6pt + color-rule-dark), height: 0.9em)],
  )
]

#exercicio(titulo: "Substituição por função")[
  Reescreva a progressão *C – F – G7 – C* trocando os três primeiros acordes por um substituto *de mesma função* (use a tabela da seção 2). Mantenha o C final. Depois toque as duas versões e compare.

  #linhas-resposta(2)
]

#exercicio(titulo: "Ouvindo a resolução")[
  No instrumento, toque *G7* e deixe soar. Em seguida, resolva em *C*. Repita, mas agora resolva em *Am*. Descreva com suas palavras a diferença entre as duas resoluções.

  #linhas-resposta(3)
]

=== Sugestão de prática

#rotina-estudo((
  ([II–V–I em Dó (Dm7 – G7 – C7M), 4 tempos por acorde], [5 min], [60–80]),
  ([II–V–I em Sol e em Fá, usando os acordes da tabela], [5 min], [60–80]),
  ([C – Am – F – G e Am – C – Dm – G, comparando a cor], [5 min], [70]),
  ([Cadências da seção 3: tocar e cantar a nota mais aguda de cada acorde], [5 min], [livre]),
))

=== Autoavaliação

#checklist((
  [Sei explicar o que fazem a tônica, a subdominante e a dominante],
  [Classifico qualquer acorde do campo maior pela função],
  [Reconheço de ouvido uma cadência autêntica e uma de engano],
  [Escrevo e toco o II–V–I em pelo menos três tons],
  [Encontro o relativo menor de qualquer tom maior],
))

#gabarito[
  #resposta(1)[
    G7M: I – T · Am7: IIm7 – S · Bm7: IIIm7 – T · C7M: IV7M – S · D7: V7 – D · Em7: VIm7 – T · F\#m7(b5): VIIm7(b5) – D.
  ]
  #resposta(2)[
    Lá maior: Bm7 – E7 – A7M · Mi maior: F\#m7 – B7 – E7M · Mi bemol maior: Fm7 – Bb7 – Eb7M.
  ]
  #resposta(3)[
    Relativos menores: D → Bm · F → Dm · A → F\#m · Bb → Gm · E → C\#m · Ab → Fm. \
    Relativos maiores: Em → G · Dm → F · F\#m → A · Cm → Eb · Bm → D · Gm → Bb.
  ]
  #resposta(4)[
    a) autêntica (V7 → I) · b) plagal (IV → I) · c) de engano (V7 → VIm) · d) meia cadência (termina no V).
  ]
  #resposta(5)[
    Uma possibilidade: *Am7 – Dm7 – Bm7(b5) – C* (Am7 substitui o C, Dm7 substitui o F e Bm7(b5) substitui o G7). Também valem Em7 no lugar do C.
  ]
  #resposta(6)[
    Resposta pessoal. Em geral, G7 → C soa como uma conclusão completa ("chegou em casa"); G7 → Am soa como uma surpresa, mais melancólica, e dá a sensação de que a música ainda vai continuar.
  ]
]
