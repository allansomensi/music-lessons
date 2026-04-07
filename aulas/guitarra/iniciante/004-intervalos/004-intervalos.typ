#import "../../../../templates/layout.typ": aula, explainer-component
#import "@preview/conchord:0.4.0": new-chordgen
#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node

#show: aula.with(
  instrumento: "Guitarra",
  nivel: "Iniciante",
)

#let chord = new-chordgen(number-to-left: true, use-shadow-barre: false, colors: (hold: black, barre: black))

= Intervalos Musicais

Na música, os *intervalos* funcionam como a nossa régua de medição. Em termos simples, um intervalo é a distância exata entre duas notas musicais. São os intervalos que ditam a diferença entre acordes maiores e menores, e criam as regras de como todas as escalas são construídas ao longo do braço.

#v(0.4em)

#align(center)[
  #diagram(
    spacing: 14mm,
    node((0, -0.7), $"Dó"$, name: <C>, stroke: 0.4pt, shape: fletcher.shapes.rect),
    node((1, 0), $"Ré"$, name: <D>, stroke: 0.4pt, shape: fletcher.shapes.rect),
    node((2, 0), $"Mi"$, name: <E>, stroke: 0.4pt, shape: fletcher.shapes.rect),
    node((2.7, 0), $"Fá"$, name: <F>, stroke: 0.4pt, shape: fletcher.shapes.rect),
    node((3.7, 0), $"Sol"$, name: <G>, stroke: 0.4pt, shape: fletcher.shapes.rect),
    node((4.7, 0), $"Lá"$, name: <A>, stroke: 0.4pt, shape: fletcher.shapes.rect),
    node((5.7, 0), $"Si"$, name: <B>, stroke: 0.4pt, shape: fletcher.shapes.rect),
    node((6.5, -0.7), $"Dó"$, name: <CC>, stroke: 0.4pt, shape: fletcher.shapes.rect),

    edge(<C>, <D>, "->", label: "1 tom", bend: -30deg),
    edge(<D>, <E>, "->", label: "1 tom", bend: 30deg),
    edge(<E>, <F>, "->", label: $frac(1, 2, style: "skewed")$ + " tom", bend: -30deg),
    edge(<F>, <G>, "->", label: "1 tom", bend: 30deg),
    edge(<G>, <A>, "->", label: "1 tom", bend: 30deg),
    edge(<A>, <B>, "->", label: "1 tom", bend: 30deg),
    edge(<B>, <CC>, "->", label: $frac(1, 2, style: "skewed")$ + " tom", bend: -30deg),
    edge(<C>, <CC>, "->", label: "6 tons", bend: 12deg),
  )
]

== Classificação dos Intervalos

Os intervalos possuem "nomes" e "sobrenomes". O nome é a distância numérica partindo da nota principal (Segunda, Terça, Quarta...), e o sobrenome define sua qualidade (Maior, Menor, Justo, Aumentado, Diminuto).

#align(center)[
  #table(
    columns: (1.5fr, 0.8fr, 1.2fr, 2.5fr),
    align: center + horizon,
    stroke: 0.5pt + luma(190),
    fill: (col, row) => if row == 0 { luma(232) } else if calc.odd(row) { white } else { luma(248) },
    [*Intervalo*], [*Cifra*], [*Distância*], [*Sonoridade / Função*],
    [Segunda Menor], [b2], [1 semitom], [Tensa, gera muito atrito],
    [Segunda Maior], [2], [1 tom], [Alegre, usada em progressões de escala],
    [Terça Menor], [b3], [1,5 tom], [Triste, define acordes menores],
    [Terça Maior], [3], [2 tons], [Alegre, define acordes maiores],
    [Quarta Justa], [4], [2,5 tons], [Aberta e heroica],
    [Quarta Aumentada /\ Quinta Diminuta], [\#4 / b5], [3 tons], [Tensão extrema (Trítono)],
    [Quinta Justa], [5], [3,5 tons], [Poderosa e estável (Power Chords)],
    [Sexta Menor], [b6], [4 tons], [Dramática e melancólica],
    [Sexta Maior], [6], [4,5 tons], [Alegre e resoluta],
    [Sétima Menor], [7], [5 tons], [Bluesy, pede resolução (Acordes Dominantes)],
    [Sétima Maior], [7M], [5,5 tons], [Flutuante e jazzística],
    [Oitava], [8], [6 tons], [Conclusiva (A mesma nota, mais aguda)],
  )
]

#v(2em)

#align(center)[
  #block(
    fill: luma(248),
    stroke: 0.5pt + luma(210),
    inset: 12pt,
    radius: 5pt,
    width: 80%,
    [
      #text(weight: "bold")[Resumo Rápido:] *1 Semitom* equivale a andar *1 casa* na guitarra. *1 Tom* equivale a andar *2 casas*. Compreender essa matemática espacial e respeitar a ortografia musical (enarmonia) é o primeiro passo para mapear o braço do instrumento.
    ],
  )
]


== Movimentação no Braço

#explainer-component(
  align(center)[
    #grid(
      columns: 3,
      gutter: 1.5em,
      block[#box(chord("1,3,x,x,x,x", name: "F5"))],
      block[#box(chord("3,5,x,x,x,x", name: "G5"))],
      block[#box(chord("5,7,x,x,x,x", name: "A5"))],
    )
  ],
  [
    O *Power Chord* (Tônica + Quinta Justa) mantendo sua geometria exata pelo braço.

    Da 1ª para a 3ª casa, subimos *1 Tom* (Fá para Sol). Da 3ª para a 5ª casa, subimos mais *1 Tom* (Sol para Lá). O shape da Quinta Justa nunca se altera.
  ],
)

== Formatos com Tônica na Corda 5

Se posicionarmos nossa Tônica Dó na 5ª corda (3ª casa), os intervalos vizinhos assumem sempre os mesmos shapes.

#align(center)[
  #grid(
    columns: 4,
    gutter: 2em,
    align: center,
    block[
      #box(chord("x,3,1,x,x,x", name: "b3")) \
      #text(size: 9.5pt, weight: "bold")[Terça Menor] \
      #text(size: 8.5pt, fill: luma(110))[1 casa para trás, corda abaixo]
    ],
    block[
      #box(chord("x,3,2,x,x,x", name: "3")) \
      #text(size: 9.5pt, weight: "bold")[Terça Maior] \
      #text(size: 8.5pt, fill: luma(110))[Mesma casa, corda abaixo]
    ],
    block[
      #box(chord("x,3,5,x,x,x", name: "5")) \
      #text(size: 9.5pt, weight: "bold")[Quinta Justa] \
      #text(size: 8.5pt, fill: luma(110))[2 casas à frente, corda abaixo]
    ],
    block[
      #box(chord("x,3,x,5,x,x", name: "8")) \
      #text(size: 9.5pt, weight: "bold")[Oitava] \
      #text(size: 8.5pt, fill: luma(110))[Pula uma corda, 2 casas à frente]
    ],
  )
]



== Enarmonia

Na guitarra, a 4ª casa da corda Ré pode ser chamada de Fá sustenido (F\#) ou Sol bemol (Gb). Ambas soam exatamente iguais e ocupam o mesmo espaço físico no braço. Esse fenômeno é chamado de *enarmonia*.

No entanto, a forma como *escrevemos* ou nomeamos essa nota muda completamente o seu intervalo em relação à Tônica, funcionando como a *ortografia* da música.

#v(0.8em)

#align(center)[
  #table(
    columns: (0.8fr, 1.5fr, 1.5fr, 2fr),
    align: center + horizon,
    stroke: 0.5pt + luma(190),
    fill: (col, row) => if row == 0 { luma(232) } else if calc.odd(row) { white } else { luma(248) },
    [*Tônica*], [*Nota Alvo*], [*Lógica da Distância*], [*Intervalo Correto*],
    [C], [F\# (Fá sustenido)], [Dó(1) - Ré(2) - Mi(3) - *Fá(4)*], [Quarta Aumentada (\#4)],
    [C], [Gb (Sol bemol)], [Dó(1) - Ré(2) - Mi(3) - Fá(4) - *Sol(5)*], [Quinta Diminuta (b5)],
  )
]

*Por que isso é tão importante?*

Chamar um Gb de F\# pode parecer inofensivo quando olhamos apenas para as casas da guitarra, no entanto, mais tarde, ao estudar as *armaduras de clave* e a formação das escalas, existe uma regra de ouro: uma escala de 7 notas deve conter obrigatoriamente *uma nota de cada letra*.

Se você montar uma escala e repetir uma letra (usando Fá e Fá\#, em vez de Fá e Solb), a matemática das partituras e das armaduras de clave vai quebrar. Seguir rigidamente os nomes dos intervalos agora evitará problemas estruturais no seu aprendizado futuro.
