#import "/templates/layout.typ": *
#import "/templates/components.typ": *
#import "/templates/components.typ": caixa as caixa-modelo, tabela as tabela-modelo
#import "@preview/conchord:0.4.0": new-chordgen
#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node

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

= Campo Harmônico Maior

O *campo harmônico* de um tom é o conjunto de acordes formados apenas com as notas da sua escala. Ele responde a uma pergunta essencial: *quais acordes combinam entre si numa música?* Conhecendo o campo harmônico, você entende por que certas sequências de acordes aparecem em tantas músicas, transporta progressões para qualquer tom e começa a "adivinhar" os acordes de uma música de ouvido.

#objetivos((
  [Montar a escala maior de qualquer tom pela fórmula de tons e semitons],
  [Construir o campo harmônico maior em tríades e em tétrades],
  [Nomear os acordes pelos graus (numerais romanos) e reconhecer o padrão de tipos],
  [Tocar o campo harmônico de Dó maior e transportar progressões para outros tons],
))

== 1. A escala maior e seus graus

A *escala maior* tem 7 notas, separadas sempre pela mesma sequência de distâncias: *T – T – ST – T – T – T – ST* (T = tom, 2 casas; ST = semitom, 1 casa). Em Dó maior, ela usa só as notas naturais:

#align(center, block(breakable: false, diagram(
  spacing: (11mm, 10mm),
  node-stroke: 0.5pt,
  node-corner-radius: 2pt,
  node-shape: fletcher.shapes.rect,
  node-inset: 6pt,
  node((0, 0), [Dó], name: <C>),
  node((1, 0), [Ré], name: <D>),
  node((2, 0), [Mi], name: <E>),
  node((3, 0), [Fá], name: <F>),
  node((4, 0), [Sol], name: <G>),
  node((5, 0), [Lá], name: <A>),
  node((6, 0), [Si], name: <B>),
  node((7, 0), [Dó], name: <CC>),
  edge(<C>, <D>, "->", label: text(size: 8.5pt)[T], bend: 40deg),
  edge(<D>, <E>, "->", label: text(size: 8.5pt)[T], bend: 40deg),
  edge(<E>, <F>, "->", label: text(size: 8.5pt, weight: "bold")[ST], bend: -40deg, label-side: right),
  edge(<F>, <G>, "->", label: text(size: 8.5pt)[T], bend: 40deg),
  edge(<G>, <A>, "->", label: text(size: 8.5pt)[T], bend: 40deg),
  edge(<A>, <B>, "->", label: text(size: 8.5pt)[T], bend: 40deg),
  edge(<B>, <CC>, "->", label: text(size: 8.5pt, weight: "bold")[ST], bend: -40deg, label-side: right),
)))

Cada nota da escala é um *grau*, numerado em algarismos romanos: Dó é o grau I, Ré o II, Mi o III, e assim por diante até Si, o VII. Em outro tom, a fórmula é a mesma: Sol maior, por exemplo, é Sol – Lá – Si – Dó – Ré – Mi – *Fá\#* (o Fá precisa subir para manter o semitom entre os graus VII e I).

== 2. O campo harmônico em tríades

Para formar o acorde de cada grau, empilhe terças *usando só as notas da escala*: a partir de cada nota, pule uma, duas vezes. Sobre Dó: Dó – Mi – Sol; sobre Ré: Ré – Fá – Lá; e assim por diante.

#caixa(tipo: "resumo", titulo: "O padrão de todo tom maior")[
  *I* maior · *IIm* menor · *IIIm* menor · *IV* maior · *V* maior · *VIm* menor · *VIIº* diminuto. \
  Como a escala maior tem sempre as mesmas distâncias, esse padrão se repete em *qualquer* tom.
]

#tabela(
  columns: (0.7fr, 0.8fr, 1.4fr, 2fr, 1.2fr),
  ([Grau], [Acorde], [Notas], [Intervalos], [Tipo]),
  (
    ([*I*], [C], [Dó – Mi – Sol], [T – 3 – 5], [Maior]),
    ([*IIm*], [Dm], [Ré – Fá – Lá], [T – b3 – 5], [Menor]),
    ([*IIIm*], [Em], [Mi – Sol – Si], [T – b3 – 5], [Menor]),
    ([*IV*], [F], [Fá – Lá – Dó], [T – 3 – 5], [Maior]),
    ([*V*], [G], [Sol – Si – Ré], [T – 3 – 5], [Maior]),
    ([*VIm*], [Am], [Lá – Dó – Mi], [T – b3 – 5], [Menor]),
    ([*VIIº*], [Bº], [Si – Ré – Fá], [T – b3 – b5], [Diminuta]),
  ),
)

== 3. O campo harmônico em tétrades

Empilhando mais uma terça (a sétima) sobre cada tríade, ainda só com notas da escala:

#tabela(
  columns: (0.95fr, 0.9fr, 1.5fr, 1.5fr, 1.35fr),
  ([Grau], [Acorde], [Notas], [Intervalos], [Tipo]),
  (
    ([*I7M*], [C7M], [Dó – Mi – Sol – Si], [T – 3 – 5 – 7M], [Maior com 7M]),
    ([*IIm7*], [Dm7], [Ré – Fá – Lá – Dó], [T – b3 – 5 – 7], [Menor com 7]),
    ([*IIIm7*], [Em7], [Mi – Sol – Si – Ré], [T – b3 – 5 – 7], [Menor com 7]),
    ([*IV7M*], [F7M], [Fá – Lá – Dó – Mi], [T – 3 – 5 – 7M], [Maior com 7M]),
    ([*V7*], [G7], [Sol – Si – Ré – Fá], [T – 3 – 5 – 7], [Dominante]),
    ([*VIm7*], [Am7], [Lá – Dó – Mi – Sol], [T – b3 – 5 – 7], [Menor com 7]),
    ([*VIIm7(b5)*], [Bm7(b5)], [Si – Ré – Fá – Lá], [T – b3 – b5 – 7], [Meio-diminuto]),
  ),
)

Repare que o *V7* é o único acorde dominante do campo (maior com sétima menor): é ele que cria a tensão que leva de volta ao I. O grau VII também é escrito *VIIø* (ø = meio-diminuto).

== 4. Tocando o campo de Dó maior

=== Em tríades

#acordes(
  columns: 7,
  gutter: 0.7em,
  (
    (tabs: "x,3,2,0,1,0", nome: "C", titulo: "I"),
    (tabs: "x,x,0,2,3,1", nome: "Dm", titulo: "IIm"),
    (tabs: "0,2,2,0,0,0", nome: "Em", titulo: "IIIm"),
    (tabs: "x,x,3,2,1,1", nome: "F", titulo: "IV"),
    (tabs: "3,2,0,0,0,3", nome: "G", titulo: "V"),
    (tabs: "x,0,2,2,1,0", nome: "Am", titulo: "VIm"),
    (tabs: "x,2,3,4,3,x", nome: "Bº", titulo: "VIIº"),
  ),
)

=== Em tétrades

#acordes(
  columns: 7,
  gutter: 0.7em,
  (
    (tabs: "x,3,2,0,0,0", nome: "C7M", titulo: "I7M"),
    (tabs: "x,x,0,2,1,1", nome: "Dm7", titulo: "IIm7"),
    (tabs: "0,2,0,0,0,0", nome: "Em7", titulo: "IIIm7"),
    (tabs: "x,x,3,2,1,0", nome: "F7M", titulo: "IV7M"),
    (tabs: "3,2,0,0,0,1", nome: "G7", titulo: "V7"),
    (tabs: "x,0,2,0,1,0", nome: "Am7", titulo: "VIm7"),
    (tabs: "x,2,3,2,3,x,*", nome: "Bm7(b5)", titulo: "VIIm7(b5)"),
  ),
)

#caixa(tipo: "dica")[
  O F acima é uma versão sem pestana completa: o dedo 1 prende a 1ª e a 2ª corda na casa 1 (mini-pestana) e você toca só da 4ª corda para baixo. Toque o campo subindo e descendo (I → VII → I) e ouça como o Bº e o G7 "pedem" para voltar ao C.
]

== 5. Pensando em graus

Músicos falam de progressões em *graus*, e não em acordes, porque os graus valem para qualquer tom. Veja a progressão *I – VIm – IV – V* em três tons:

#tabela(
  columns: (1.1fr, 1fr, 1fr, 1fr, 1fr),
  ([Tom], [I], [VIm], [IV], [V]),
  (
    ([Dó maior], [C], [Am], [F], [G]),
    ([Sol maior], [G], [Em], [C], [D]),
    ([Ré maior], [D], [Bm], [G], [A]),
  ),
)

Essa sequência é uma das mais usadas da música pop. Se você sabe que uma música segue essa estrutura, consegue tocá-la em qualquer tom — basta trocar o campo harmônico. E o caminho inverso também funciona: se uma música usa D, G, A e Bm, ela provavelmente está em Ré maior, porque todos esses acordes pertencem a esse campo.

== 6. Campos harmônicos em outros tons

#block(breakable: false)[
Os tons abaixo são os mais usados na guitarra. Em todos, o padrão de tipos é o mesmo:

#tabela(
  columns: (0.95fr,) + (1fr,) * 7,
  ([Tom], [I], [IIm], [IIIm], [IV], [V], [VIm], [VIIº]),
  (
    ([*C*], [C], [Dm], [Em], [F], [G], [Am], [Bº]),
    ([*G*], [G], [Am], [Bm], [C], [D], [Em], [F\#º]),
    ([*D*], [D], [Em], [F\#m], [G], [A], [Bm], [C\#º]),
    ([*A*], [A], [Bm], [C\#m], [D], [E], [F\#m], [G\#º]),
    ([*E*], [E], [F\#m], [G\#m], [A], [B], [C\#m], [D\#º]),
    ([*F*], [F], [Gm], [Am], [Bb], [C], [Dm], [Eº]),
  ),
)
]

Para as tétrades, basta aplicar o padrão I7M – IIm7 – IIIm7 – IV7M – V7 – VIm7 – VIIm7(b5) às mesmas tônicas: em Sol, por exemplo, G7M – Am7 – Bm7 – C7M – D7 – Em7 – F\#m7(b5).

== 7. Exercícios

#ex(titulo: "Escalas maiores")[
  Escreva as notas das escalas usando a fórmula T – T – ST – T – T – T – ST (uma nota de cada letra).

  #tabela-preencher(
    columns: (1fr,) * 8,
    ([Tom], [I], [II], [III], [IV], [V], [VI], [VII]),
    (
      ([G], none, none, none, none, none, none, none),
      ([D], none, none, none, none, none, none, none),
    ),
  )
]

#ex(titulo: "Monte os campos")[
  Escreva o campo harmônico de *Sol maior* em tríades e o de *Ré maior* em tétrades.

  #tabela-preencher(
    columns: (1.1fr,) + (1fr,) * 7,
    ([Tom], [I], [II], [III], [IV], [V], [VI], [VII]),
    (
      ([G (tríades)], none, none, none, none, none, none, none),
      ([D (tétrades)], none, none, none, none, none, none, none),
    ),
  )
]

#ex(titulo: "Qual é o grau?")[
  Escreva o grau (com o tipo, ex.: IIm, V7) de cada acorde no tom indicado.

  #tabela-preencher(
    columns: (1.3fr,) + (1fr,) * 4,
    ([Tom], [Acorde], [Acorde], [Acorde], [Acorde]),
    (
      ([Dó maior], [Am], [F], [G7], [Bm7(b5)]),
      ([Grau], none, none, none, none),
      ([Sol maior], [Em], [D7], [C7M], [Am7]),
      ([Grau], none, none, none, none),
    ),
  )
]

#ex(titulo: "Transponha a progressão")[
  A progressão *I – VIm – IV – V* em Dó maior é C – Am – F – G. Escreva-a nos tons pedidos.

  #tabela-preencher(
    columns: (1.3fr,) + (1fr,) * 4,
    ([Tom], [I], [VIm], [IV], [V]),
    (
      ([Sol maior], none, none, none, none),
      ([Ré maior], none, none, none, none),
      ([Lá maior], none, none, none, none),
    ),
  )
]

#ex(titulo: "Descubra o tom")[
  Em que tom maior estão estas progressões? Justifique.

  a) D – G – A – Bm #linhas-resposta(1)

  b) F – Bb – C – Dm #linhas-resposta(1)
]

#ex(titulo: "O campo na guitarra", nivel: "Prática")[
  Toque o campo de Dó maior em tríades (seção 4), um acorde por compasso, subindo e descendo, a 60 BPM. Depois faça o mesmo com as tétrades. Em seguida, toque I – VIm – IV – V em Dó e em Sol. Anote quais trocas ainda travam:

  #linhas-resposta(1)
]

=== Sugestão de prática

#block(breakable: false, rotina-estudo((
  ([Dizer em voz alta o campo de C, G e D (tríades e tétrades)], [5 min], [—]),
  ([Campo de Dó em tríades, subindo e descendo], [5 min], [60]),
  ([Campo de Dó em tétrades, subindo e descendo], [5 min], [60]),
  ([I – VIm – IV – V em Dó, Sol e Ré, sem parar entre os tons], [5 min], [60–80]),
)))

#block(breakable: false, checklist(
  titulo: "Autoavaliação",
  (
    [Monto a escala maior de qualquer tom pela fórmula T – T – ST – T – T – T – ST.],
    [Sei o padrão do campo maior: I, IIm, IIIm, IV, V, VIm, VIIº (e as tétrades).],
    [Dou o grau de qualquer acorde do campo de C, G e D.],
    [Transponho uma progressão escrita em graus para outro tom.],
    [Toco o campo de Dó em tríades e em tétrades.],
  ),
))

#gabarito[
  #resposta(1)[G: G – A – B – C – D – E – F\# · D: D – E – F\# – G – A – B – C\#.]
  #resposta(2)[Sol (tríades): G – Am – Bm – C – D – Em – F\#º · Ré (tétrades): D7M – Em7 – F\#m7 – G7M – A7 – Bm7 – C\#m7(b5).]
  #resposta(3)[Dó maior: Am = VIm · F = IV · G7 = V7 · Bm7(b5) = VIIm7(b5). Sol maior: Em = VIm · D7 = V7 · C7M = IV7M · Am7 = IIm7.]
  #resposta(4)[Sol: G – Em – C – D · Ré: D – Bm – G – A · Lá: A – F\#m – D – E.]
  #resposta(5)[a) Ré maior: D (I), G (IV), A (V) e Bm (VIm) pertencem ao campo de Ré. b) Fá maior: F (I), Bb (IV), C (V) e Dm (VIm). O Bb mostra que não é Dó maior (que não tem Sib).]
  #resposta(6)[Exercício prático — critério de sucesso: tocar os sete acordes do campo em cada sentido sem parar o tempo, e a progressão nos dois tons sem consultar os diagramas.]
]
