#import "/templates/layout.typ": *

#show: aula.with(
  instrumento: "Guitarra / Violão",
  nivel: "Teoria Musical",
)

= Exercícios Cadência II-V-I

Este material apresenta dois exercícios práticos fundamentais para o domínio harmônico. O objetivo é interiorizar a sonoridade e a mecânica de uma das cadências mais comuns e famosas que existem, conectando todas as 12 tonalidades de forma contínua através do ciclo das quartas. O primeiro exercício foca nas resoluções em acordes maiores, enquanto o segundo expande o conceito introduzindo preparações secundárias para acordes menores.

#align(center + horizon)[
  = Ciclo das quintas

  #image("/aulas/resumos-e-tabelas/ciclo-das-quintas/attachments/ciclo-das-quintas.png", width: 100%)

  #text(size: 8pt, fill: color-muted)[Disponível em: https://www.musicca.com/circle-of-fifths]
]

#pagebreak()

= Exercício 1
#v(1em)
== Cadência II-V-I para Acorde Maior

#v(1em)
A cadência II-V-I é a estrutura harmônica mais comum no jazz e na música popular. O objetivo deste primeiro exercício é praticar essa cadência passando por todas as 12 tonalidades, desenvolvendo a agilidade mental e técnica para conseguir preparar qualquer acorde maior utilizando a cadência II-V-I.

Para conectar os tons de forma contínua, você transformará o acorde de resolução (`I7M`) no segundo grau menor com sétima (`IIm7`) do próximo tom. Esse encadeamento faz com que a harmonia avance seguindo a ordem do ciclo das quintas (andando em quartas).

#v(1.5em)
#block(
  stroke: (left: 2pt + luma(150)),
  inset: (left: 1em, top: 0.5em, bottom: 0.5em),
)[
  *Exemplo de transição:* \
  Ao resolver a primeira cadência em `C7M`, você transforma a fundamental no acorde `Gm7`. Esse novo acorde passa a ser o `IIm7` da tonalidade de Fá Maior.
]
#v(1.5em)

#align(center)[
  #table(
    columns: (auto, auto, auto),
    align: center,
    [*II (m7)*], [*V (7)*], [*I (7M)*],
    [Dm7], [G7], [C7M],
    [Gm7], [C7], [F7M],
    [Cm7], [F7], [Bb7M],
    [Fm7], [Bb7], [Eb7M],
    [Bbm7], [Eb7], [Ab7M],
    [Ebm7], [Ab7], [Db7M],
    [Abm7], [Db7], [Gb7M],
    [C\#m7], [F\#7], [B7M],
    [F\#m7], [B7], [E7M],
    [Bm7], [E7], [A7M],
    [Em7], [A7], [D7M],
    [Am7], [D7], [G7M],
  )
]

#v(1em)
#text(
  style: "italic",
)[*Dica:* Quando chegar em `Gb7M`, a tabela faz a transição enarmônica para os sustenidos (`C#m7`), facilitando a leitura até voltar ao tom de Dó.]

#pagebreak()

= Exercício 2
#v(1em)
== Cadência ii-V-i para Acorde Menor

#v(1em)
Nesta variação, adicionaremos uma passagem mais sofisticada entre as tonalidades. O objetivo deste segundo exercício é expandir seu domínio harmônico para conseguir preparar também qualquer acorde menor com a cadência ii-V-i.

Como o acorde alvo da transição é um acorde menor (`IIm7` do próximo tom), a harmonia pede uma preparação de cadência menor. Para isso, utilizaremos um acorde meio diminuto (`m7(b5)`) como o segundo grau preparatório e um acorde dominante com alterações implícitas (`7`) no quinto grau.

#v(1.5em)
#block(
  stroke: (left: 2pt + luma(150)),
  inset: (left: 1em, top: 0.5em, bottom: 0.5em),
)[
  *Exemplo de transição:* \
  Após resolver a primeira cadência maior em `C7M`, o seu próximo alvo será a cadência em Fá Maior, que se inicia pelo acorde menor `Gm7`. A preparação para chegar neste `Gm7` é o seu próprio ii-V menor secundário: `Am7(b5) - D7`.
]
#v(1.5em)

#align(center)[
  #table(
    columns: (auto, auto, auto, auto, auto),
    align: center,
    [*II (m7)*], [*V (7)*], [*I (7M)*], [*Prep. ii (m7b5)*], [*Prep. V (7)*],
    [Dm7], [G7], [C7M], [Am7(b5)], [D7],
    [Gm7], [C7], [F7M], [Dm7(b5)], [G7],
    [Cm7], [F7], [Bb7M], [Gm7(b5)], [C7],
    [Fm7], [Bb7], [Eb7M], [Cm7(b5)], [F7],
    [Bbm7], [Eb7], [Ab7M], [Fm7(b5)], [Bb7],
    [Ebm7], [Ab7], [Db7M], [Bbm7(b5)], [Eb7],
    [Abm7], [Db7], [Gb7M], [D\#m7(b5)], [G\#7],
    [C\#m7], [F\#7], [B7M], [G\#m7(b5)], [C\#7],
    [F\#m7], [B7], [E7M], [C\#m7(b5)], [F\#7],
    [Bm7], [E7], [A7M], [F\#m7(b5)], [B7],
    [Em7], [A7], [D7M], [Bm7(b5)], [E7],
    [Am7], [D7], [G7M], [Em7(b5)], [A7],
  )
]
