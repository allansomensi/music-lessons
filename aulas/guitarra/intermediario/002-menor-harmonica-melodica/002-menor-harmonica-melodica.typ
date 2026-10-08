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

// ficha de uma escala: diagrama à esquerda, informações à direita
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

= Escalas Menor Harmônica e Menor Melódica

No tom menor, a escala menor natural tem uma limitação: o acorde formado sobre o seu V grau é *menor* (Em, no tom de Lá menor), e um acorde menor no V grau "puxa" pouco para a tônica. Para obter uma cadência tão forte quanto a do tom maior, a música tonal criou duas variações da escala menor que *elevam o 7º grau*. Neste material você vai conhecer essas duas escalas, os acordes que elas geram e um desenho de cada uma no braço.

#objetivos((
  [Comparar as escalas menor natural, menor harmônica e menor melódica pela fórmula e pelas notas],
  [Entender por que a sensível (o 7º grau elevado) fortalece a cadência V7 → Im],
  [Montar os campos harmônicos das escalas menor harmônica e menor melódica],
  [Tocar um desenho de cada escala com tônica na 6ª corda],
  [Escolher a escala menor adequada a cada situação musical],
))

== 1. As três escalas menores

As três escalas compartilham os cinco primeiros graus (T 2 b3 4 5); a diferença está nos graus 6 e 7. Nas fórmulas, *7* indica a sétima menor e *7M*, a sétima maior.

#tabela(
  columns: (1.3fr, 1.6fr, 1.7fr, 1.9fr),
  ([Escala], [Fórmula], [Em Lá], [Tons e semitons]),
  (
    ([Menor natural], [T 2 b3 4 5 b6 7], [A B C D E F G], [T ST T T ST T T]),
    ([Menor harmônica], [T 2 b3 4 5 b6 *7M*], [A B C D E F *G\#*], [T ST T T ST *1½T* ST]),
    ([Menor melódica], [T 2 b3 4 5 *6* *7M*], [A B C D E *F\#* *G\#*], [T ST T T T T ST]),
  ),
)

#v(0.4em)

- A *menor harmônica* eleva o 7º grau (G → G\#).
- A *menor melódica* eleva o 7º e também o 6º grau (F → F\#, G → G\#). Repare que ela é igual à escala *maior* com a 3ª abaixada: só o C a diferencia de Lá maior.

== 2. Menor harmônica

=== A sensível e a cadência V7 → Im

Com o G\#, o acorde do V grau passa de *Em* (E G B) para *E7* (E G\# B D). O G\# está meio tom abaixo da tônica Lá e "pede" para subir até ela: é a *sensível*. Ao mesmo tempo, o trítono G\#–D do E7 resolve em A–C, as notas do acorde de Am.

#comparativo(
  titulo-esquerda: "Cadência forte",
  titulo-direita: "Cadência fraca",
  [*E7 → Am* (menor harmônica). O G\# sobe meio tom para Lá e o D desce meio tom para Dó: sensação clara de chegada.],
  [*Em7 → Am* (menor natural). O G está um tom abaixo de Lá; o acorde do V grau não tem sensível e a resolução soa "morna".],
)

#v(0.6em)

O preço dessa sensível é um salto de *1½ tom* (uma 2ª aumentada) entre o F e o G\#. Esse intervalo, ausente das escalas maior e menor natural, dá à menor harmônica o seu som "árabe" ou "espanhol", muito explorado no flamenco e no metal neoclássico.

=== O campo harmônico menor harmônico (em Lá)

Empilhando terças só com notas da escala sobre cada grau, obtêm-se as tétrades abaixo. O V7 é o acorde que motivou a escala, mas o campo traz também acordes menos comuns, como o Im(7M) e o bIII7M(\#5).

#tabela(
  columns: (0.9fr, 1fr, 1.3fr, 1.7fr),
  ([Grau], [Acorde], [Notas], [Tipo]),
  (
    ([Im(7M)], [Am(7M)], [A C E G\#], [Menor com 7ª maior]),
    ([IIm7(b5)], [Bm7(b5)], [B D F A], [Meio-diminuto]),
    ([bIII7M(\#5)], [C7M(\#5)], [C E G\# B], [Maior com 7M e 5ª aumentada]),
    ([IVm7], [Dm7], [D F A C], [Menor com 7]),
    ([*V7*], [*E7*], [E G\# B D], [*Dominante*]),
    ([bVI7M], [F7M], [F A C E], [Maior com 7M]),
    ([VIIº7], [G\#º7], [G\# B D F], [Diminuto]),
  ),
)

=== Um desenho da menor harmônica

#ficha(
  mapa(raiz: "A", fs: 4, (
    (6, 4, "*7M"), (6, 5, "T"), (6, 7, "2"), (6, 8, "b3"),
    (5, 5, "4"), (5, 7, "5"), (5, 8, "b6"),
    (4, 6, "*7M"), (4, 7, "T"),
    (3, 4, "2"), (3, 5, "b3"), (3, 7, "4"),
    (2, 5, "5"), (2, 6, "b6"),
    (1, 4, "*7M"), (1, 5, "T"), (1, 7, "2"), (1, 8, "b3"),
  )),
  [Lá menor harmônica — casas 4 a 8],
  [
    *Fórmula:* T 2 b3 4 5 b6 *7M* \
    *Em Lá:* A B C D E F *G\#* \
    *Nota característica:* G\# (7M), em cinza. É a mesma nota da 3ª do E7. \
    *Digitação:* um dedo por casa, com o indicador na casa 4. \
    *Dica:* toque F → G\# → A devagar e ouça o salto de 1½ tom resolvendo na tônica.
  ],
)

#pagebreak()

== 3. Menor melódica

A menor melódica eleva também o 6º grau (F → F\#). Assim, o caminho até a sensível deixa de ter o salto de 1½ tom: E – F\# – G\# – A sobe só por tons e semitons, o que torna a escala mais "cantável".

#cartoes-info((
  (titulo: "Uso tradicional", corpo: [
    Na música erudita, a escala muda conforme a direção: *sobe* com F\# e G\# e *desce* como menor natural (G e F naturais). \
    Subida: A B C D E F\# G\# A \
    Descida: A G F E D C B A
  ]),
  (titulo: "Uso moderno", corpo: [
    No jazz e na guitarra moderna, a forma ascendente é usada nos dois sentidos — por isso também é chamada de *menor melódica do jazz*. \
    Sempre: A B C D E F\# G\# A
  ]),
))

#v(0.6em)

Neste material, "menor melódica" significa sempre a forma moderna, igual na subida e na descida.

=== O campo harmônico menor melódico (em Lá)

Cada grau da menor melódica também gera um modo. Os mais usados no jazz estão destacados na última coluna:

#tabela(
  columns: (1fr, 1fr, 1.4fr, 2.2fr),
  ([Grau], [Acorde], [Modo gerado], [Uso típico]),
  (
    ([Im(7M)], [Am(7M)], [Menor melódica], [Acorde de tônica menor com 7M]),
    ([IIm7], [Bm7], [Dórico b2], [Menor que mistura a b2 do Frígio com a 6ª maior do Dórico]),
    ([bIII7M(\#5)], [C7M(\#5)], [Lídio aumentado], [Sobre o acorde 7M(\#5)]),
    ([IV7], [D7], [Lídio dominante], [Sobre dominantes com a \#11: D7(\#11)]),
    ([V7], [E7], [Mixolídio b6], [Sobre o V7 de um tom menor]),
    ([VIm7(b5)], [F\#m7(b5)], [Lócrio 2], [Sobre o IIm7(b5) de um tom menor]),
    ([VIIm7(b5)], [G\#m7(b5)], [Alterada], [Sobre dominantes alterados: G\#7alt]),
  ),
)

#v(0.4em)

#caixa(tipo: "resumo", titulo: "Escala alterada")[
  O VII grau da menor melódica gera a *escala alterada* (G\# A B C D E F\#), que contém todas as tensões alteradas de um dominante: b9, \#9, b5 (\#11) e b13. Ela é tocada sobre um *acorde dominante* com a mesma tônica — G\#7alt — e não sobre o G\#m7(b5) do campo. Regra prática: a escala alterada de um dominante tem as mesmas notas da menor melódica *meio tom acima* dele (E7alt → Fá menor melódica).
]

=== Um desenho da menor melódica

#ficha(
  mapa(raiz: "A", fs: 4, (
    (6, 4, "*7M"), (6, 5, "T"), (6, 7, "2"), (6, 8, "b3"),
    (5, 5, "4"), (5, 7, "5"),
    (4, 4, "*6"), (4, 6, "*7M"), (4, 7, "T"),
    (3, 4, "2"), (3, 5, "b3"), (3, 7, "4"),
    (2, 5, "5"), (2, 7, "*6"),
    (1, 4, "*7M"), (1, 5, "T"), (1, 7, "2"), (1, 8, "b3"),
  )),
  [Lá menor melódica — casas 4 a 8],
  [
    *Fórmula:* T 2 b3 4 5 *6* *7M* \
    *Em Lá:* A B C D E *F\#* *G\#* \
    *Notas características:* F\# (6) e G\# (7M), em cinza. \
    *Comparação:* é o desenho da menor harmônica com o F (b6) uma casa acima. Da 5ª para cima (E F\# G\# A), a escala soa como Lá maior; a b3 (C) é a única "cor menor".
  ],
)

== 4. Qual escala menor usar?

Na prática, as três escalas se misturam na mesma música e até na mesma frase. Use a harmonia como guia:

#tabela(
  columns: (1.6fr, 1.4fr, 2.4fr),
  ([Situação], [Escala], [Por quê]),
  (
    ([Sobre Im ou Im7 em geral], [Menor natural], [Soa "aberta" e combina com a pentatônica menor.]),
    ([Sobre o V7 de um tom menor (E7 → Am)], [Menor harmônica], [Contém a sensível G\#, a 3ª do E7.]),
    ([Linha melódica subindo para a tônica], [Menor melódica], [Chega à sensível sem o salto de 1½ tom.]),
    ([Sobre Im(7M) ou Im6], [Menor melódica], [Contém a 7M e a 6ª maior do acorde.]),
    ([Sobre um dominante alterado (E7alt)], [Menor melódica meio tom acima (Fá)], [Gera a escala alterada, com b9, \#9, b5 e b13.]),
  ),
)

== 5. Exercícios

#exercicio(titulo: "As três escalas menores", nivel: "Escrita")[
  Escreva as notas de cada escala.

  #tabela-preencher(
    ([Tônica], [Menor natural], [Menor harmônica], [Menor melódica]),
    (
      ([Mi (E)], none, none, none),
      ([Ré (D)], none, none, none),
    ),
    columns: (0.8fr, 1.5fr, 1.5fr, 1.5fr),
    altura: 1cm,
  )
]

#exercicio(titulo: "Campo harmônico de Mi menor harmônico", nivel: "Escrita")[
  Escreva o acorde (tétrade) e as notas de cada grau do campo de Mi menor harmônico.

  #tabela-preencher(
    ([Grau], [Acorde], [Notas]),
    (
      ([Im(7M)], none, none),
      ([IIm7(b5)], none, none),
      ([bIII7M(\#5)], none, none),
      ([IVm7], none, none),
      ([V7], none, none),
      ([bVI7M], none, none),
      ([VIIº7], none, none),
    ),
    columns: (1fr, 1.2fr, 2fr),
  )
]

#exercicio(titulo: "Qual é a escala?", nivel: "Escrita")[
  Diga o nome de cada escala (tônica e tipo de menor). A primeira nota é a tônica.

  #grid(
    columns: (auto, 1fr, auto, 1fr),
    column-gutter: 0.8em,
    row-gutter: 1.3em,
    [a) D E F G A Bb C\#], box(width: 100%, line(length: 100%, stroke: 0.5pt + color-rule-light)),
    [b) G A Bb C D E F\#], box(width: 100%, line(length: 100%, stroke: 0.5pt + color-rule-light)),
    [c) B C\# D E F\# G A], box(width: 100%, line(length: 100%, stroke: 0.5pt + color-rule-light)),
    [d) C D Eb F G Ab B], box(width: 100%, line(length: 100%, stroke: 0.5pt + color-rule-light)),
  )
]

#exercicio(titulo: "Transponha o desenho", nivel: "Braço")[
  Desenhe a *Ré menor harmônica* com tônica na 6ª corda, casa 10, usando o mesmo desenho da Lá menor harmônica. Escreva o intervalo dentro de cada nota.

  #v(0.3em)
  #align(center, braco-vazio(casas: 5, fs: 9))
]

#exercicio(titulo: "Por que elevar a 6ª?", nivel: "Escrita")[
  Explique, com suas palavras, por que a menor melódica eleva também o 6º grau. Cite as notas envolvidas em Lá menor.

  #linhas-resposta(2)
]

#exercicio(titulo: "A sensível na cadência", nivel: "Prática")[
  Grave um vamp de *Am – Dm – E7 – Am* (um compasso cada, 80 BPM). Improvise com a menor natural sobre Am e Dm e com a menor harmônica sobre o E7, resolvendo a frase do E7 sempre com G\# → A no início do compasso seguinte.
]

#v(0.6em)

#block(breakable: false)[
  === Sugestão de prática

  #rotina-estudo((
    ([Desenhos da menor harmônica e da melódica, subindo e descendo], [8 min], [60–80]),
    ([Frase F → G\# → A e E → F\# → G\# → A nas três oitavas do desenho], [5 min], [60]),
    ([Vamp Am – E7: menor natural no Am, harmônica no E7], [8 min], [70–90]),
    ([Transposição dos desenhos para Ré e Mi], [5 min], [60–80]),
  ))
]

#v(0.6em)

#block(breakable: false)[
  #checklist(titulo: "Autoavaliação", (
    [Escrevo as três escalas menores de qualquer tônica.],
    [Explico o que é a sensível e por que ela fortalece a cadência V7 → Im.],
    [Reconheço o som da 2ª aumentada da menor harmônica.],
    [Monto os campos harmônicos menor harmônico e menor melódico.],
    [Toco os dois desenhos dizendo os intervalos e troco G por G\# sobre o E7.],
  ))
]

#gabarito[
  #resposta(1)[
    Mi: natural E F\# G A B C D · harmônica E F\# G A B C D\# · melódica E F\# G A B C\# D\#. \
    Ré: natural D E F G A Bb C · harmônica D E F G A Bb C\# · melódica D E F G A B C\#.
  ]
  #resposta(2)[
    #grid(
      columns: (1fr, 1fr),
      row-gutter: 0.55em,
      [Im(7M): Em(7M) — E G B D\#], [IIm7(b5): F\#m7(b5) — F\# A C E],
      [bIII7M(\#5): G7M(\#5) — G B D\# F\#], [IVm7: Am7 — A C E G],
      [V7: B7 — B D\# F\# A], [bVI7M: C7M — C E G B],
      [VIIº7: D\#º7 — D\# F\# A C], [],
    )
  ]
  #resposta(3)[
    a) Ré menor harmônica · b) Sol menor melódica · c) Si menor natural · d) Dó menor harmônica.
  ]
  #resposta(4)[
    #align(center, mapa(raiz: "D", fs: 9, (
      (6, 9, "*7M"), (6, 10, "T"), (6, 12, "2"), (6, 13, "b3"),
      (5, 10, "4"), (5, 12, "5"), (5, 13, "b6"),
      (4, 11, "*7M"), (4, 12, "T"),
      (3, 9, "2"), (3, 10, "b3"), (3, 12, "4"),
      (2, 10, "5"), (2, 11, "b6"),
      (1, 9, "*7M"), (1, 10, "T"), (1, 12, "2"), (1, 13, "b3"),
    )))
    Ré menor harmônica: D E F G A Bb C\# — o desenho em Lá deslocado 5 casas para cima.
  ]
  #resposta(5)[
    Na menor harmônica, entre o 6º grau (F) e a sensível (G\#) há um salto de 1½ tom (2ª aumentada), difícil de cantar. Elevando o 6º grau para F\#, a escala chega à sensível só por tons e semitons (E – F\# – G\# – A).
  ]
  #resposta(6)[
    Exercício prático — critério de sucesso: em todas as passagens do E7 para o Am, o G\# soa no fim do compasso do E7 e resolve em Lá no tempo 1 seguinte.
  ]
]
