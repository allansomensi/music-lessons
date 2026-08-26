#import "../../../../templates/layout.typ": *
#import "@preview/conchord:0.4.0": new-chordgen

#show: aula.with(
  instrumento: "Violão",
  nivel: "Iniciante",
)

#let chord = new-chordgen(number-to-left: true, use-shadow-barre: false, colors: (hold: black, barre: black))

= Fundamentos de Leitura Musical

Antes de avançar para tópicos como intervalos e escalas, você precisa dominar a *linguagem visual* do violão: os nomes das notas, o significado de \# e b nas cifras, a afinação do instrumento e como ler um diagrama de acorde.

== 1. As Notas Musicais e a Cifra

A música ocidental usa 7 notas naturais. No Brasil usamos os nomes em português (Dó, Ré, Mi...), mas a cifragem popular e a teoria internacional usam letras em inglês.

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

#align(center)[
  #block(
    fill: color-subtle-bg,
    stroke: 0.5pt + color-rule-dark,
    inset: 10pt,
    radius: 5pt,
    width: 86%,
    [
      #set text(size: 8.5pt)
      *Observação:* a cifra funciona como um guia simples de *localização harmônica*. Já a *partitura* é completa, pois detalha a melodia exata, o tempo e a dinâmica.
    ],
  )
]

== 2. Sustenido (\#) e Bemol (b)

Entre a maioria das notas naturais há *notas intermediárias*, acessadas pelos acidentes: o *sustenido* (\#) sobe a nota meio tom, e o *bemol* (b) desce meio tom.

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
        Sobe a nota em *1 semitom* (1 casa no braço). \
        Ex.: F\# = Fá Sustenido.
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
        Desce a nota em *1 semitom* (1 casa no braço). \
        Ex.: Bb = Si Bemol.
      ],
    ),
  )
]

== 3. Tom e Semitom no Braço do Violão

O braço do violão é a régua perfeita para visualizar tons e semitons: *cada casa equivale a 1 semitom*.

#caixa-destaque(width: 85%)[
  *1 Semitom* = andar *1 casa*. \
  *1 Tom* = andar *2 casas*. \
  #v(0.3em)
  #text(
    size: 9pt,
    fill: color-muted,
  )[Essa é a matemática espacial que você vai usar para mapear escalas, intervalos e acordes pelo braço.]
]

== 4. Afinação Padrão do Violão

O violão de 6 cordas (nylon ou aço) usa a mesma afinação padrão da guitarra, chamada *Standard Tuning* ou *E Standard*. Da mais grave para a mais aguda:

#align(center)[
  #let cordas = (
    ("6ª corda", "E2", "Mi grave", "A corda mais grossa"),
    ("5ª corda", "A2", "Lá", ""),
    ("4ª corda", "D3", "Ré", ""),
    ("3ª corda", "G3", "Sol", ""),
    ("2ª corda", "B3", "Si", ""),
    ("1ª corda", "E4", "Mi agudo", "A corda mais fina"),
  )
  #block(
    stroke: 0.5pt + color-rule-dark,
    radius: 6pt,
    clip: true,
    [
      #table(
        columns: (1fr, 1.1fr, 1.2fr, 0.5fr, 1.8fr),
        align: (left + horizon, center + horizon, center + horizon, center + horizon, left + horizon),
        stroke: 0.5pt + color-rule-dark,
        fill: (_, row) => if row == 0 { color-subtle-bg } else if calc.odd(row) { white } else { luma(245) },
        inset: (x: 8pt, y: 6pt),
        [*Corda*], [*Nota (Cifra)*], [*Nota*], [*Oitava*], [*Referência*],
        ..cordas
          .enumerate()
          .map(((i, c)) => (
            text(weight: "bold", fill: color-strong)[#c.at(0)],
            text(weight: "bold", size: 12pt)[#c.at(1).slice(0, -1)],
            [#c.at(2)],
            text(size: 8pt, fill: color-muted)[#c.at(1).slice(-1)],
            text(size: 8.5pt)[#c.at(3)],
          ))
          .flatten(),
      )
    ],
  )
]

== 5. Como Ler um Diagrama de Acordes

O diagrama de acorde representa o braço do violão visto de frente. Decodificá-lo é fundamental para montar qualquer acorde sem depender de vídeos.

#align(center)[
  #block(
    fill: color-subtle-bg,
    stroke: 0.5pt + color-rule-dark,
    inset: 14pt,
    radius: 6pt,
    width: 92%,
    [
      #grid(
        columns: (auto, 1fr),
        gutter: 2em,
        align: (center + top, left + top),
        box(stroke: none, [#box(chord("x,0,2,2,1,0", name: "Am"))]),
        [
          #set text(size: 9pt)
          #v(0.5em)
          #table(
            columns: (auto, 1fr),
            stroke: none,
            inset: (x: 4pt, y: 4pt),
            align: (center + horizon, left + horizon),
            [#block(width: 14pt, height: 14pt, fill: black, radius: 7pt)],
            [*Ponto preto* — pressione esta corda nesta casa],

            [#align(center)[#text(weight: "bold", size: 11pt)[○]]], [*Círculo aberto* — corda solta],

            [#align(center)[#text(weight: "bold", size: 11pt)[✕]]], [*X* — corda mutada],

            [#align(center)[
              #block(height: 10pt, width: 24pt, fill: black, radius: 2pt)
            ]],
            [*Barra no topo* — traste-zero (pestana) ou número da casa],
          )
        ],
      )
    ],
  )
]

== 6. Como Ler uma Cifra

A cifra indica os *acordes* usando letras e símbolos acima da letra da música.

#align(center)[
  #block(
    stroke: 0.5pt + color-rule-dark,
    radius: 6pt,
    clip: true,
    [
      #table(
        columns: (0.9fr, 2fr, 2fr),
        align: (center + horizon, left + horizon, left + horizon),
        stroke: 0.5pt + color-rule-light,
        fill: (_, row) => if row == 0 { color-subtle-bg } else if calc.odd(row) { white } else { luma(245) },
        inset: (x: 8pt, y: 7pt),
        [*Símbolo*], [*Significado*], [*Exemplo*],
        [A–G], [Nota raiz do acorde], [C = Dó Maior],
        [m ou -], [Menor], [Am = Lá menor],
        [\#], [Sustenido], [F\# = Fá Sustenido Maior],
        [b], [Bemol], [Bb = Si Bemol Maior],
        [7], [Sétima menor], [G7],
        [7M ou maj7], [Sétima maior], [C7M],
        [sus2 / sus4], [Suspensão], [Dsus4],
        [/], [Inversão — nota após a barra = baixo], [G/B],
      )
    ],
  )
]
