#import "../../../../templates/layout.typ": *

#show: aula.with(
  instrumento: "Baixo",
  nivel: "Iniciante",
)

= Fundamentos de Leitura para o Baixo

Assim como na guitarra e no violão, tocar baixo de ouvido ou de cifra exige conhecer a *linguagem visual* do instrumento: os nomes das notas, a afinação das 4 cordas e como ler uma tablatura. Esta é a base para qualquer estudo no baixo.

== 1. As Notas e a Cifra

A música ocidental usa 7 notas naturais. No Brasil usamos os nomes em português (Dó, Ré, Mi...), mas a cifra usa letras em inglês.

#v(0.5em)

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

== 2. Sustenido (\#) e Bemol (b)

O *sustenido* (\#) sobe a nota em 1 semitom (1 casa), e o *bemol* (b) desce a nota em 1 semitom (1 casa). As únicas notas naturais que não têm uma nota intermediária entre elas são *Mi–Fá* e *Si–Dó*.

#v(0.5em)

#align(center)[
  #block(
    fill: color-subtle-bg,
    stroke: 0.5pt + color-rule-dark,
    inset: 10pt,
    radius: 5pt,
    width: 86%,
    [
      #set text(size: 8.5pt)
      *Tom e Semitom no braço:* no baixo (assim como na guitarra), *1 casa = 1 semitom* e *2 casas = 1 tom*. Essa é a régua que você vai usar para medir qualquer intervalo ou escala no braço do instrumento.
    ],
  )
]

== 3. Afinação Padrão do Baixo (4 cordas)

O baixo de 4 cordas tem uma afinação padrão chamada *E Standard*, idêntica às 4 cordas mais graves da guitarra, porém uma oitava abaixo. Da mais grave para a mais aguda:

#v(1em)

#align(center)[
  #let cordas = (
    ("4ª corda", "E1", "Mi grave", "A corda mais grossa"),
    ("3ª corda", "A1", "Lá", ""),
    ("2ª corda", "D2", "Ré", ""),
    ("1ª corda", "G2", "Sol", "A corda mais fina"),
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
        inset: (x: 8pt, y: 7pt),
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

#v(1em)

#align(center)[
  #block(
    fill: color-subtle-bg,
    stroke: 0.5pt + color-rule-dark,
    inset: 12pt,
    radius: 6pt,
    width: 82%,
    [
      #text(weight: "bold")[Frequências de Referência (Lá = 440Hz):]
      #v(0.6em)
      #align(center)[
        #grid(
          columns: 4,
          gutter: 0.5em,
          align: center,
          ..("E", "A", "D", "G")
            .enumerate()
            .map(((i, n)) => block(
              fill: white,
              stroke: 0.5pt + color-rule-dark,
              inset: 8pt,
              radius: 4pt,
              [
                #text(weight: "bold", size: 12pt)[#n]
                #v(0.2em)
                #text(size: 7pt, fill: color-muted)[
                  #("41.2", "55.0", "73.4", "98.0").at(i) Hz
                ]
              ],
            )),
        )
      ]
    ],
  )
]

== 4. As Notas ao Longo do Braço

#v(0.5em)

#align(center)[
  #block(
    fill: color-subtle-bg,
    stroke: 0.5pt + color-rule-dark,
    inset: 12pt,
    radius: 6pt,
    width: 100%,
    [
      #text(weight: "bold", size: 9.5pt)[As 12 notas cromáticas ao longo do braço]
      #v(0.8em)
      #set text(size: 7.8pt)
      #let nat-fill = white
      #let acc-fill = color-strong
      #let seqs = (
        ("E", "F", "F#", "G", "G#", "A", "A#", "B", "C", "C#", "D", "D#", "E"),
        ("A", "A#", "B", "C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A"),
        ("D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B", "C", "C#", "D"),
        ("G", "G#", "A", "A#", "B", "C", "C#", "D", "D#", "E", "F", "F#", "G"),
      )
      #let is-acc(n) = n.ends-with("#") or n.ends-with("b")
      #let corda-labels = ("4ª (E)", "3ª (A)", "2ª (D)", "1ª (G)")
      #let col-header = luma(230)

      #table(
        columns: (50pt,) + (32pt,) * 13,
        align: center + horizon,
        stroke: 0.3pt + color-rule-dark,
        fill: (col, row) => {
          if col == 0 { col-header } else if row > 0 {
            let nota = seqs.at(row - 1).at(col - 1)
            if is-acc(nota) { acc-fill } else { nat-fill }
          } else { col-header }
        },
        inset: (x: 3pt, y: 5pt),
        [*Corda*],
        ..range(0, 13).map(i => text(weight: "bold", fill: luma(60))[
          #if i == 0 [S] else [#i]
        ]),
        ..seqs
          .enumerate()
          .map(((ci, seq)) => (
            text(weight: "bold", fill: color-strong)[#corda-labels.at(ci)],
            ..seq.map(n => text(
              fill: if is-acc(n) { white } else { color-strong },
              weight: if is-acc(n) { "bold" } else { "regular" },
            )[#n]),
          ))
          .flatten(),
      )
      #v(0.4em)
      #text(size: 7.5pt, fill: color-muted)[S = Solta · células escuras = notas com acidente (\#)]
    ],
  )
]

== 5. Como Ler uma Tablatura (Tab) de Baixo

A tablatura é a forma mais prática de escrever música para instrumentos de corda com trastes. Diferente da partitura, ela não representa o tempo das notas — mostra *exatamente onde colocar os dedos*.

#v(0.8em)

#align(center)[
  #block(
    fill: color-subtle-bg,
    stroke: 0.5pt + color-rule-dark,
    inset: 14pt,
    radius: 6pt,
    width: 90%,
    [
      #grid(
        columns: (auto, 1fr),
        gutter: 2em,
        align: (center + top, left + top),
        box(
          stroke: none,
          [
            #set text(font: "Courier New", size: 10pt)
            #raw(
              lang: "text",
              block: true,
              "G|-----------------|
D|-----------------|
A|--------3--------|
E|--0--2-----------|",
            )
          ],
        ),
        [
          #set text(size: 9pt)
          - Cada linha representa uma *corda* (de cima/aguda para baixo/grave: G, D, A, E).
          - Os *números* indicam a *casa* a ser pressionada. "0" significa corda solta.
          - A leitura acontece *da esquerda para a direita*, no tempo da música.
        ],
      )
    ],
  )
]

#v(1em)

#caixa-destaque(width: 88%)[
  *Próximo passo:* Com as notas do braço, a afinação e a leitura de tablatura dominadas, você já tem tudo o que precisa para estudar *Intervalos Musicais* e começar a construir suas próprias linhas de baixo com intenção.
]
