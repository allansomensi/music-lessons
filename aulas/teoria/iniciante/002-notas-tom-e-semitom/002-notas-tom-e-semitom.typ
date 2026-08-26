#import "/templates/layout.typ": *
#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node

#show: aula.with(
  instrumento: "Teoria Musical",
  nivel: "Fundamentos",
)

= Notas Musicais, Tom e Semitom

Antes de avançar para tópicos como intervalos, escalas e acordes, é essencial dominar o "alfabeto" da música: como as notas são nomeadas, como elas se organizam e qual é a menor distância possível entre duas notas. Esses três conceitos — *nota*, *tom* e *semitom* — são a base sobre a qual toda a teoria musical é construída, independente do instrumento que você toca.

== 1. O Alfabeto Musical

A música ocidental usa *7 notas naturais*, que se repetem em ciclos (oitavas) do grave ao agudo. Elas podem ser nomeadas de duas formas equivalentes:

#align(center)[
  #block(
    stroke: 0.5pt + color-rule-dark,
    radius: 6pt,
    clip: true,
    [
      #table(
        columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
        align: center + horizon,
        stroke: 0.5pt + color-rule-light,
        inset: (x: 6pt, y: 9pt),
        [*C*], [*D*], [*E*], [*F*], [*G*], [*A*], [*B*],
        [Dó], [Ré], [Mi], [Fá], [Sol], [Lá], [Si],
      )
    ],
  )
]

No Brasil e em países latinos usamos o *dó-ré-mi* (solfejo). Já a cifragem popular, usada em partituras, tablaturas e no repertório internacional, usa as *letras em inglês* (C-D-E...). Um bom músico precisa transitar livremente entre as duas nomenclaturas.

== 2. Organizando as Notas: o Piano como Mapa

O teclado do piano é o "mapa" mais didático para visualizar a música, porque suas teclas brancas e pretas deixam visível *onde existem notas intermediárias e onde não existem*. As 7 notas naturais (teclas brancas) não cobrem todos os sons possíveis: entre a maioria delas existe uma nota intermediária (tecla preta), acessada pelos *acidentes*.

#align(center)[
  #block(
    stroke: 0.5pt + color-rule-dark,
    radius: 6pt,
    clip: true,
    [
      #let nat = white
      #let acc = color-rule-dark
      #table(
        columns: 12,
        rows: (auto, auto),
        align: center + horizon,
        stroke: 0.5pt + color-rule-dark,
        inset: (x: 5pt, y: 7pt),
        fill: (col, row) => {
          let blacks = (1, 3, 6, 8, 10)
          if blacks.contains(col) { acc } else { nat }
        },
        ..{
          let notas = ([C], [C\#\ Db], [D], [D\#\ Eb], [E], [F], [F\#\ Gb], [G], [G\#\ Ab], [A], [A\#\ Bb], [B])
          notas.map(n => {
            let blacks = (1, 3, 6, 8, 10)
            let col-idx = notas.position(x => x == n)
            text(weight: "bold", size: 8pt, fill: if blacks.contains(col-idx) { white } else { color-strong })[#n]
          })
        },
        ..{
          let nomes = (
            [Dó],
            [Dó\#\ Réb],
            [Ré],
            [Ré\#\ Mib],
            [Mi],
            [Fá],
            [Fá\#\ Solb],
            [Sol],
            [Sol\#\ Láb],
            [Lá],
            [Lá\#\ Sib],
            [Si],
          )
          let blacks = (1, 3, 6, 8, 10)
          nomes
            .enumerate()
            .map(((i, n)) => text(
              size: 7.5pt,
              fill: if blacks.contains(i) { white.transparentize(15%) } else { luma(40) },
            )[#n])
        },
      )
    ],
  )
]

#align(center)[
  #text(
    size: 8.5pt,
    fill: color-muted,
  )[Células escuras = notas com acidente (sustenido/bemol). Repare que não existe tecla preta entre Mi-Fá e entre Si-Dó.]
]


== 3. Semitom: a Menor Distância

O *semitom* (ou meio-tom) é a menor distância possível entre duas notas na música ocidental. No piano, é a distância entre uma tecla e a tecla vizinha imediata (branca ou preta). No violão, guitarra, baixo e outros instrumentos é a "unidade mínima" de afinação, correspondente a andar *1 casa* no braço.

== 4. Tom: Dois Semitons Juntos

O *tom* é simplesmente a soma de *dois semitons* (2 casas no braço). A maioria das notas naturais está separada por um tom inteiro — com duas exceções importantes.

#v(0.8em)

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
  )
]

#caixa-destaque(width: 88%)[
  *As duas exceções:* entre *Mi–Fá* e entre *Si–Dó* a distância é de apenas *1 semitom* — não existe nota intermediária (tecla preta) entre elas. Todas as outras notas naturais vizinhas estão a *1 tom* de distância.
]

== 5. Sustenido (\#) e Bemol (b)

Os *acidentes* alteram uma nota natural em meio tom:

#align(center)[
  #grid(
    columns: (1fr, 1fr),
    gutter: 1em,
    block(
      width: 100%,
      fill: color-subtle-bg,
      stroke: 0.5pt + color-rule-dark,
      inset: 10pt,
      radius: 5pt,
      [
        #align(center)[#text(weight: "bold", size: 10pt)[♯ Sustenido]]
        #v(0.4em)
        #set text(size: 9pt)
        *Sobe* a nota em 1 semitom. \
        Ex.: F\# = Fá Sustenido = a nota entre Fá e Sol.
      ],
    ),
    block(
      width: 100%,
      fill: color-subtle-bg,
      stroke: 0.5pt + color-rule-dark,
      inset: 10pt,
      radius: 5pt,
      [
        #align(center)[#text(weight: "bold", size: 10pt)[♭ Bemol]]
        #v(0.4em)
        #set text(size: 9pt)
        *Desce* a nota em 1 semitom. \
        Ex.: Bb = Si Bemol = a nota entre Lá e Si.
      ],
    ),
  )
]

#v(0.8em)

#align(center)[
  #block(
    fill: color-subtle-bg,
    stroke: 0.5pt + color-rule-dark,
    inset: 10pt,
    radius: 5pt,
    width: 86%,
    [
      #set text(size: 8.5pt)
      *Enarmonia:* a mesma nota pode ter dois nomes diferentes dependendo do contexto — C\# e Db soam exatamente igual, mas são escritos de formas diferentes. Você vai entender por que essa escolha de nome importa quando estudar escalas e armaduras de clave.
    ],
  )
]

#pagebreak()

== 6. Construindo uma Escala Maior

Toda *escala maior* segue exatamente a mesma "receita" de tons e semitons, não importa em qual nota você comece:

#v(0.5em)

#align(center)[
  #block(
    fill: color-subtle-bg,
    stroke: 1pt + color-brand-soft,
    inset: 15pt,
    radius: 6pt,
    width: 90%,
    align(center)[
      #text(size: 14pt, weight: "bold")[T — T — ½T — T — T — T — ½T]
    ],
  )
]

#v(0.8em)

Aplicando essa fórmula a partir de Dó, obtemos a Escala de Dó Maior — que, por não ter nenhum acidente, é a mais fácil de visualizar:

#v(0.5em)

#align(center)[
  #table(
    columns: (0.6fr,) + (1fr,) * 7,
    align: center + horizon,
    stroke: 0.5pt + color-rule-dark,
    fill: (col, row) => if row == 0 { color-subtle-bg } else { white },
    [*Grau*], [1], [2], [3], [4], [5], [6], [7],
    [*Nota*], [Dó], [Ré], [Mi], [Fá], [Sol], [Lá], [Si],
  )
]

#v(1em)

#caixa-destaque(width: 90%)[
  *Por que isso importa?* Se você souber a fórmula T-T-½T-T-T-T-½T, pode construir a escala maior a partir de *qualquer* nota — basta contar os tons e semitons corretamente e escolher o nome de nota adequado a cada passo. É exatamente essa lógica que você vai aplicar ao braço do seu instrumento na próxima aula, sobre *Intervalos Musicais*.
]
