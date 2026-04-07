#import "../../../../templates/layout.typ": aula, explainer-component
#import "@preview/conchord:0.4.0": new-chordgen, overchord

#show: aula.with(
  instrumento: "Guitarra",
  nivel: "Iniciante",
)

#let chord = new-chordgen(number-to-left: true, use-shadow-barre: false, colors: (hold: black, barre: black))

#show <chord>: set text(fill: rgb("#ec7a0f"))
#let och = overchord

#let nota-box(nota, cor-fundo, cor-texto: white) = block(
  fill: cor-fundo,
  stroke: 0.5pt + cor-fundo.darken(20%),
  inset: (x: 7pt, y: 5pt),
  radius: 4pt,
  [#text(weight: "bold", fill: cor-texto, size: 10pt)[#nota]],
)

#let fret-cell(conteudo, highlight: false) = block(
  width: 38pt,
  height: 22pt,
  fill: if highlight { rgb("#1d4ed8") } else { luma(250) },
  stroke: 0.4pt + luma(190),
  inset: 3pt,
  align(center + horizon)[
    #text(
      size: 8pt,
      weight: if highlight { "bold" } else { "regular" },
      fill: if highlight { white } else { luma(60) },
    )[#conteudo]
  ],
)

= Fundamentos de Leitura Musical

Antes de tocar qualquer música ou estudar um acorde novo, você precisa dominar a *linguagem visual* da guitarra: como o instrumento está afinado, o nome das notas, o que significam os símbolos \# e b nas cifras, e como ler um diagrama de acorde.

== As Notas Musicais e a Cifra

A música ocidental usa *7 notas naturais*. No Brasil usamos os nomes em português (Dó, Ré, Mi...), mas a cifragem popular e a teoria internacional usam *letras em inglês*. Você precisa conhecer as duas formas.

#v(0.5em)

#align(center)[
  #block(
    stroke: 0.5pt + luma(200),
    radius: 6pt,
    clip: true,
    [
      #table(
        columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
        align: center + horizon,
        stroke: 0.5pt + luma(195),
        inset: (x: 6pt, y: 9pt),
        [*C*], [*D*], [*E*], [*F*], [*G*], [*A*], [*B*],
        [Dó], [Ré], [Mi], [Fá], [Sol], [Lá], [Si],
      )
    ],
  )
]

#v(0.5em)

A correspondência é simples, mas precisa ser memorizada. Na prática, quando você ver "Am" em uma cifra, o cérebro já deve ler "Lá menor" automaticamente.

#v(0.2em)

#align(center)[
  #block(
    fill: luma(248),
    stroke: 0.5pt + luma(210),
    inset: 10pt,
    radius: 5pt,
    width: 86%,
    [
      #set text(size: 8.5pt)
      *Observação*

      A cifra é uma linguagem simplificada: ela funciona como um guia simples de *localização harmônica*, indicando onde estamos na música. Já a *partitura* é completa, pois detalha a melodia exata, a duração das notas (tempo/ritmo) e a dinâmica da execução.
    ],
  )
]

== Sustenido (\#) e Bemol (b)

As 7 notas naturais não cobrem todos os sons. Entre a maioria delas há *notas intermediárias*, acessadas pelos acidentes: o *sustenido* (\#) *sobe* a nota meio tom, e o *bemol* (b) *desce* meio tom.

#v(0.5em)

#align(center)[
  #block(
    stroke: 0.5pt + luma(190),
    radius: 6pt,
    clip: true,
    [
      #let nat = luma(235)
      #let acc = rgb("#6398a8")
      #table(
        columns: 12,
        rows: (auto, auto),
        align: center + horizon,
        stroke: 0.5pt + luma(200),
        inset: (x: 5pt, y: 7pt),
        fill: (col, row) => {
          let blacks = (1, 3, 6, 8, 10)
          if blacks.contains(col) { acc } else { nat }
        },
        // Linha das notas
        ..{
          let notas = (
            [C],
            [C\#\ Db],
            [D],
            [D\#\ Eb],
            [E],
            [F],
            [F\#\ Gb],
            [G],
            [G\#\ Ab],
            [A],
            [A\#\ Bb],
            [B],
          )
          notas.map(n => {
            let blacks = (1, 3, 6, 8, 10)
            let col-idx = notas.position(x => x == n)
            text(
              weight: "bold",
              size: 8pt,
              fill: if blacks.contains(col-idx) { white } else { luma(40) },
            )[#n]
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
              fill: if blacks.contains(i) { white.transparentize(15%) } else { luma(80) },
            )[#n])
        },
      )
    ],
  )
]

#v(0.5em)

#align(center)[
  #grid(
    columns: (1fr, 1fr),
    gutter: 1em,
    block(
      width: 100%,
      fill: rgb("#eff6ff"),
      stroke: 0.6pt + rgb("#93c5fd"),
      inset: 10pt,
      radius: 5pt,
      [
        #align(center)[#text(weight: "bold", size: 10pt)[♯ Sustenido]]
        #v(0.4em)
        #set text(size: 9pt)
        Sobe a nota em *1 semitom* (1 casa para cima no braço). \
        Ex.: *F\#* = Fá Sustenido = a nota entre Fá e Sol.
      ],
    ),
    block(
      width: 100%,
      fill: rgb("#fdf4ff"),
      stroke: 0.6pt + rgb("#d8b4fe"),
      inset: 10pt,
      radius: 5pt,
      [
        #align(center)[#text(weight: "bold", size: 10pt)[♭ Bemol]]
        #v(0.4em)
        #set text(size: 9pt)
        Desce a nota em *1 semitom* (1 casa para baixo no braço). \
        Ex.: *Bb* = Si Bemol = a nota entre Lá e Si.
      ],
    ),
  )
]

#v(0.8em)

#align(center)[
  #block(
    fill: rgb("#fef9c3"),
    stroke: 0.5pt + rgb("#fde68a"),
    inset: 10pt,
    radius: 5pt,
    width: 86%,
    [
      #set text(size: 8.5pt)
      *Enarmonia:* a mesma nota pode ter dois nomes dependendo do contexto. *C\# e Db* soam identicamente, mas são escritos de formas diferentes conforme a tonalidade. Na guitarra, ocupam a mesma casa do braço — o nome correto depende da escala em que você está tocando.
    ],
  )
]

#pagebreak()
= Afinação Padrão da Guitarra

A guitarra de 6 cordas tem uma afinação padrão chamada de *Standard Tuning* ou *E Standard*. Cada corda solta corresponde a uma nota específica. Da mais grave para a mais aguda:

#v(1em)

#align(center)[
  #let cores = (
    rgb("#9c3c3c"), // 6ª — E2
    rgb("#9b6221"), // 5ª — A2
    rgb("#8d6f2e"), // 4ª — D3
    rgb("#1f6e3c"), // 3ª — G3
    rgb("#203768"), // 2ª — B3
    rgb("#402272"), // 1ª — E4
  )
  #let cordas = (
    ("6ª corda", "E2", "Mi grave", "A corda mais grossa"),
    ("5ª corda", "A2", "Lá", ""),
    ("4ª corda", "D3", "Ré", ""),
    ("3ª corda", "G3", "Sol", ""),
    ("2ª corda", "B3", "Si", ""),
    ("1ª corda", "E4", "Mi agudo", "A corda mais fina"),
  )
  #block(
    stroke: 0.5pt + luma(200),
    radius: 6pt,
    clip: true,
    [
      #table(
        columns: (1fr, 1.1fr, 1.2fr, 0.5fr, 1.8fr),
        align: (left + horizon, center + horizon, center + horizon, center + horizon, left + horizon),
        stroke: 0.5pt + luma(200),
        fill: (_, row) => if row == 0 { luma(232) } else if calc.odd(row) { white } else { luma(249) },
        inset: (x: 8pt, y: 7pt),
        [*Corda*], [*Nota (Cifra)*], [*Nota*], [*Oitava*], [*Referência*],
        ..cordas
          .enumerate()
          .map(((i, c)) => (
            text(weight: "bold", fill: cores.at(i))[#c.at(0)],
            text(weight: "bold", size: 12pt)[#c.at(1).slice(0, -1)],
            [#c.at(2)],
            text(size: 8pt, fill: luma(110))[#c.at(1).slice(-1)],
            text(size: 8.5pt)[#c.at(3)],
          ))
          .flatten(),
      )
    ],
  )
]

#v(1.2em)

#align(center)[
  #block(
    fill: luma(248),
    stroke: 0.5pt + luma(210),
    inset: 12pt,
    radius: 6pt,
    width: 82%,
    [
      #text(weight: "bold")[Frequências de Referência (Lá = 440Hz):]
      #v(0.6em)
      #align(center)[
        #grid(
          columns: 6,
          gutter: 0.5em,
          align: center,
          ..("E", "A", "D", "G", "B", "E")
            .enumerate()
            .map(((i, n)) => block(
              fill: (
                rgb("#fef2f2"), // Mi Grave
                rgb("#fff7ed"), // Lá
                rgb("#fefce8"), // Ré
                rgb("#f0fdf4"), // Sol
                rgb("#eff6ff"), // Si
                rgb("#faf5ff"), // Mi Agudo
              ).at(i),
              stroke: 0.5pt + luma(200),
              inset: 8pt,
              radius: 4pt,
              [
                #text(weight: "bold", size: 12pt)[#n]
                #v(0.2em)
                #text(size: 7pt, fill: luma(120))[
                  #("82.4", "110.0", "146.8", "196.0", "246.9", "329.6").at(i) Hz
                ]
              ],
            )),
        )
      ]
      #v(0.4em)
      #set text(size: 7.5pt, fill: luma(100))
      *Dica:* A nota da 12ª casa deve ter exatamente o dobro da frequência da corda solta. Se estiver diferente, a oitava do seu instrumento precisa de regulagem.
    ],
  )
]

#v(1em)

#align(center)[
  #block(
    fill: luma(248),
    stroke: 0.5pt + luma(200),
    inset: 12pt,
    radius: 6pt,
    width: 100%,
    [
      #text(weight: "bold", size: 9.5pt)[As 12 notas cromáticas ao longo do braço]
      #v(0.8em)
      #set text(size: 7.8pt)
      #let col-header = luma(220)
      #let nat-fill = luma(252)
      #let acc-fill = rgb("#374151")
      #let acc-text = white
      // notas por corda
      #let seqs = (
        ("E", "F", "F#", "G", "G#", "A", "A#", "B", "C", "C#", "D", "D#", "E"),
        ("A", "A#", "B", "C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A"),
        ("D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B", "C", "C#", "D"),
        ("G", "G#", "A", "A#", "B", "C", "C#", "D", "D#", "E", "F", "F#", "G"),
        ("B", "C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"),
        ("E", "F", "F#", "G", "G#", "A", "A#", "B", "C", "C#", "D", "D#", "E"),
      )
      #let accs = ("F#", "G#", "A#", "C#", "D#", "F#", "G#", "A#", "C#", "D#")
      #let is-acc(n) = n.ends-with("#") or n.ends-with("b")
      #let corda-labels = ("6ª (E)", "5ª (A)", "4ª (D)", "3ª (G)", "2ª (B)", "1ª (E)")
      #let corda-cores = (
        rgb("#9c3c3c"),
        rgb("#9b6221"),
        rgb("#8d6f2e"),
        rgb("#1f6e3c"),
        rgb("#203768"),
        rgb("#402272"),
      )

      #table(
        columns: (50pt,) + (32pt,) * 13,
        align: center + horizon,
        stroke: 0.3pt + luma(210),
        fill: (col, row) => {
          if col == 0 { col-header } else if row > 0 {
            let nota = seqs.at(row - 1).at(col - 1)
            if is-acc(nota) { acc-fill } else { nat-fill }
          } else { col-header }
        },
        inset: (x: 3pt, y: 5pt),
        // header
        [*Corda*],
        ..range(0, 13).map(i => text(weight: "bold", fill: luma(60))[
          #if i == 0 [S] else [#i]
        ]),
        // linhas por corda
        ..seqs
          .enumerate()
          .map(((ci, seq)) => (
            text(weight: "bold", fill: corda-cores.at(ci))[#corda-labels.at(ci)],
            ..seq.map(n => text(
              fill: if is-acc(n) { white } else { luma(40) },
              weight: if is-acc(n) { "bold" } else { "regular" },
            )[#n]),
          ))
          .flatten(),
      )
      #v(0.4em)
      #text(size: 7.5pt, fill: luma(120))[S = Solta · células escuras = notas com acidente (\#)]
    ],
  )
]

#pagebreak()
= Como Ler um Diagrama de Acordes

O diagrama de acorde é uma representação visual do braço da guitarra visto de frente. Aprender a decodificá-lo é fundamental para montar qualquer acorde sem depender de vídeos ou explicações verbais.

#v(1em)

#align(center)[
  #block(
    fill: luma(248),
    stroke: 0.5pt + luma(210),
    inset: 14pt,
    radius: 6pt,
    width: 92%,
    [
      #grid(
        columns: (auto, 1fr),
        gutter: 2em,
        align: (center + top, left + top),
        // Diagrama anotado
        box(
          stroke: none,
          [
            #box(chord("x,0,2,2,1,0", name: "Am"))
          ],
        ),
        // Legenda
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

            [#align(center)[#text(weight: "bold", size: 11pt)[○]]],
            [*Círculo aberto* — corda solta (toca sem pressionar)],

            [#align(center)[#text(weight: "bold", size: 11pt)[✕]]], [*X* — corda mutada (não deve soar)],
            [#align(center)[
              #block(height: 10pt, width: 24pt, fill: rgb("#111827"), radius: 2pt)
            ]],
            [*Barra grossa no topo* — indica o traste-zero (pestana) ou número da casa],

            [#align(center)[#text(size: 9pt, fill: luma(100))[1  2  3]],],
            [*Números* nos pontos — qual dedo usar (veja abaixo)],
          )
        ],
      )
    ],
  )
]

#v(1em)

#align(center)[
  #block(
    fill: luma(252),
    stroke: 0.5pt + luma(200),
    inset: 12pt,
    radius: 6pt,
    width: 86%,
    [
      #text(weight: "bold")[Numeração dos Dedos da Mão Esquerda]
      #v(0.8em)
      #grid(
        columns: 4,
        gutter: 1em,
        align: center,
        ..{
          let dedos = (
            ("1", "Indicador", rgb("#dbeafe"), rgb("#3252a8")),
            ("2", "Médio", rgb("#dcfce7"), rgb("#15803d")),
            ("3", "Anelar", rgb("#fef9c3"), rgb("#a16207")),
            ("4", "Mínimo", rgb("#fce7f3"), rgb("#be185d")),
          )
          dedos.map(d => block(
            fill: d.at(2),
            stroke: 0.5pt + d.at(3),
            inset: 10pt,
            radius: 5pt,
            [
              #text(weight: "bold", size: 18pt, fill: d.at(3))[#d.at(0)] \
              #v(0.2em)
              #text(size: 8.5pt)[#d.at(1)]
            ],
          ))
        },
      )
      #v(0.5em)
      #text(size: 8pt, fill: luma(110))[O polegar fica apoiado na parte traseira do braço e não aparece nos diagramas.]
    ],
  )
]

#v(1.2em)

#explainer-component(
  align(center)[
    #block(
      fill: luma(240),
      stroke: 0.5pt + luma(200),
      inset: 14pt,
      radius: 5pt,
      width: 88%,
      [
        #set text(size: 9pt)
        #table(
          columns: (auto, auto),
          stroke: 0.4pt + luma(200),
          align: center + horizon,
          inset: 7pt,
          fill: (col, row) => if row == 0 { luma(228) } else { white },
          [*No diagrama*], [*Na guitarra*],
          [Coluna da esquerda], [6ª corda (Mi grave)],
          [Coluna da direita], [1ª corda (Mi agudo)],
          [Linha do topo], [1ª casa (próxima ao cravelhal)],
          [Linhas para baixo], [Casas progressivamente mais agudas],
        )
      ],
    )
  ],
  [
    O diagrama representa o braço como se você o visse *de frente*, com a guitarra em pé. A corda mais grossa (6ª) está sempre à esquerda e a mais fina (1ª) à direita.

    Quando o diagrama tiver um *número no canto superior* (ex.: 5fr), significa que o diagrama está posicionado na 5ª casa em vez da 1ª.
  ],
)

#pagebreak()
= Como Ler uma Cifra

A cifra é a forma mais simples de representar uma música para violão ou guitarra. Ela indica os *acordes* usando letras e símbolos logo acima da letra da música (ou do compasso), indicando quando ocorre a troca de acorde.

#v(0.8em)

#align(center)[
  #block(
    fill: luma(248),
    stroke: 0.5pt + luma(210),
    inset: 16pt,
    radius: 6pt,
    width: 90%,
    [
      #text(weight: "bold", size: 9.5pt)[Exemplo de trecho cifrado:]
      #block(
        fill: white,
        stroke: 0.4pt + luma(200),
        inset: 12pt,
        radius: 4pt,
        [
          #set text(font: "Courier New", size: 10pt)
          #och[Em] Hoje eu quero #och[C] ver o #och[G] sol de manhã #och[D] nascer...
        ],
      )
      #v(0.8em)
      #set text(size: 8.5pt)
      #table(
        columns: (auto, 1fr),
        stroke: none,
        inset: (x: 6pt, y: 3pt),
        align: (right + top, left + top),
        text(weight: "bold", fill: rgb("#ec7a0f"))[Em], [Acorde de Mi menor — toque-o na sílaba "Ho-"],
        text(weight: "bold", fill: rgb("#ec7a0f"))[C], [Acorde de Dó Maior — toque na sílaba "ver"],
        text(weight: "bold", fill: rgb("#ec7a0f"))[G], [Acorde de Sol Maior — na palavra "sol"],
        text(weight: "bold", fill: rgb("#ec7a0f"))[D], [Acorde de Ré Maior — na palavra "nascer"],
      )
    ],
  )
]

#v(2em)

#align(center)[
  #block(
    stroke: 0.5pt + luma(200),
    radius: 6pt,
    clip: true,
    [
      #table(
        columns: (0.9fr, 2fr, 2fr),
        align: (center + horizon, left + horizon, left + horizon),
        stroke: 0.5pt + luma(195),
        fill: (_, row) => if row == 0 { luma(232) } else if calc.odd(row) { white } else { luma(249) },
        inset: (x: 8pt, y: 7pt),
        [*Símbolo*], [*Significado*], [*Exemplo*],
        [A–G], [Nota raiz do acorde], [C = Dó Maior],
        [m ou -], [Menor], [Am ou A- = Lá menor],
        [\#], [Sustenido — acorde baseado em nota \#], [F\# = Fá Sustenido Maior],
        [b], [Bemol — acorde baseado em nota b], [Bb = Si Bemol Maior],
        [7], [Sétima menor], [G7 = Sol com sétima],
        [7M ou maj7], [Sétima maior], [C7M = Dó com sétima maior],
        [5], [Power Chord (só tônica + quinta)], [E5 = Mi5],
        [sus2 / sus4], [Suspensão — terça substituída por 2ª ou 4ª], [Dsus4],
        [add], [Adiciona nota extra sem remover nenhuma], [Cadd9],
        [/], [Inversão — nota após a barra = baixo], [G/B = Sol com baixo em Si],
        [dim ou °], [Acorde diminuto], [Bdim = Si diminuto],
        [aug ou +], [Acorde aumentado], [E+ = Mi aumentado],
      )
    ],
  )
]

#pagebreak()
= Afinando a Guitarra

Manter o instrumento afinado é não-negociável. Uma guitarra desafinada prejudica o ouvido musical, confunde a memória das notas e desmotiva o estudo. Use um afinador cromático (aplicativo ou físico) sempre antes de tocar.

#v(0.8em)

#align(center)[
  #block(
    fill: luma(248),
    stroke: 0.5pt + luma(210),
    inset: 12pt,
    radius: 6pt,
    width: 90%,
    [
      #text(weight: "bold")[Método 1 — Afinador Cromático (Recomendado)]
      #v(0.6em)
      #set text(size: 9pt)
      #grid(
        columns: (auto, 1fr),
        gutter: 0.8em,
        align: (center + top, left + top),
        ..{
          let passos = (
            ("①", "Prenda o afinador no headstock da guitarra ou abra o app (GuitarTuna, Fender Tune etc.)."),
            ("②", "Toque uma corda solta de cada vez. O display mostrará a nota mais próxima detectada."),
            (
              "③",
              "Gire a tarraxa: para cima aumenta a tensão (afina para cima); para baixo diminui (afina para baixo).",
            ),
            ("④", "Quando o ponteiro central ficar verde e centrado, a corda está na nota correta."),
            ("⑤", "Após afinar todas, volte e confira novamente — afinar uma corda pode alterar levemente as outras."),
          )
          passos
            .map(p => (
              text(weight: "bold", fill: rgb("#1d4ed8"), size: 12pt)[#p.at(0)],
              p.at(1),
            ))
            .flatten()
        },
      )
    ],
  )
]

#v(1em)

#align(center)[
  #block(
    fill: luma(248),
    stroke: 0.5pt + luma(210),
    inset: 12pt,
    radius: 6pt,
    width: 90%,
    [
      #text(weight: "bold")[Método 2 — Afinação Relativa (por referência entre cordas)]
      #v(0.4em)
      #set text(size: 8.5pt)
      Útil quando não há afinador. Pressione a casa indicada e compare com a corda solta seguinte:
      #v(0.6em)
      #table(
        columns: (1.5fr, 2fr, 1.5fr, 2fr),
        align: center + horizon,
        stroke: 0.5pt + luma(200),
        fill: (_, row) => if row == 0 { luma(228) } else if calc.odd(row) { white } else { luma(249) },
        inset: (x: 6pt, y: 6pt),
        [*Corda pressionada*], [*Casa*], [*Deve soar igual a…*], [*Observação*],
        [6ª corda (E)], [5ª casa], [5ª corda solta (A)], [],
        [5ª corda (A)], [5ª casa], [4ª corda solta (D)], [],
        [4ª corda (D)], [5ª casa], [3ª corda solta (G)], [],
        [3ª corda (G)], [*4ª casa*], [2ª corda solta (B)], [Atenção: 4ª casa, não 5ª!],
        [2ª corda (B)], [5ª casa], [1ª corda solta (E)], [],
      )
    ],
  )
]

#v(1em)

#align(center)[
  #block(
    fill: rgb("#fef2f2"),
    stroke: 0.5pt + rgb("#fca5a5"),
    inset: 10pt,
    radius: 5pt,
    width: 86%,
    [
      #set text(size: 8.5pt)
      *Atenção:* a transição da 3ª para a 2ª corda usa a *4ª casa* (não a 5ª como as demais). Isso existe porque o intervalo entre Sol e Si é uma *Terça Maior* e não uma Quarta, diferente do restante das cordas.
    ],
  )
]
