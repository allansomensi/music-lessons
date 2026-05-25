#import "../../../../templates/layout.typ": *
#import "@preview/conchord:0.4.0": new-chordgen

#show: aula.with(
  instrumento: "Guitarra",
  nivel: "Intermediário",
)

#let chord = new-chordgen(number-to-left: true, use-shadow-barre: false, colors: (hold: black, barre: black))

// ─── fretboard helper ──────────────────────────────────────────────────────
#let nd(k) = box(
  width: 20pt,
  height: 20pt,
  align(center + horizon, if k == "R" { box(width: 14pt, height: 14pt, fill: color-brand, radius: 7pt) } else if k
    == "N" { box(width: 14pt, height: 14pt, fill: color-muted, radius: 7pt) } else if k == "G" {
    box(width: 14pt, height: 14pt, fill: rgb("#15803d"), radius: 7pt)
  } else { line(start: (0pt, 0pt), end: (20pt, 0pt), stroke: 0.5pt + color-rule-dark) }),
)
#let neck(data, fs: 1) = {
  let nf = data.at(0).len()
  let hdr = ([],) + range(nf).map(i => align(center, text(size: 7.5pt, weight: "bold")[#(fs + i)]))
  let bdy = data
    .enumerate()
    .map(p => {
      let i = p.at(0)
      let row = p.at(1)
      (align(center, text(size: 8pt, fill: luma(50))[#(6 - i)]),) + row.map(nd)
    })
    .flatten()
  table(
    columns: (13pt,) + range(nf).map(_ => 22pt),
    align: center + horizon,
    inset: (x: 0pt, y: 3pt),
    stroke: (x, y) => if x == 0 or y == 0 { 0.5pt + color-rule-dark } else { 0.4pt + luma(220) },
    fill: (c, r) => if r == 0 { color-subtle-bg } else if c == 0 { luma(242) } else { white },
    ..hdr, ..bdy,
  )
}

= Pentatônicas Avançadas

A pentatônica menor padrão é apenas uma entre dezenas de pentatônicas possíveis. Ao trocar *uma ou duas notas*, você obtém escalas de 5 notas com cores completamente diferentes — ferramentas essenciais para ir além do blues básico.

== Tabela Comparativa das Pentatônicas

#v(0.8em)

#align(center)[
  #table(
    columns: (1.4fr, 0.5fr, 0.5fr, 0.5fr, 0.5fr, 0.5fr, 1.8fr, 1.5fr),
    align: center + horizon,
    stroke: 0.5pt + color-rule-dark,
    fill: (col, row) => if row == 0 { color-subtle-bg } else if row == 1 { color-subtle-bg } else if row == 2 {
      color-brand-soft
    } else if row == 3 { color-accent-soft } else if row == 4 { rgb("#fef9c3") } else if row == 5 {
      rgb("#ede9fe")
    } else {
      rgb("#ffe4e6")
    },
    [*Nome*], [*1*], [*2*], [*3*], [*4*], [*5*], [*Em Am*], [*Som*],
    [Pentatônica Menor (m5)], [1], [b3], [4], [5], [b7], [A C D E G], [Blues, rock],
    [*Pentatônica m7*], [1], [b3], [4], [b7], [*2*], [A C D G *B*], [Jazz, funk moderno],
    [*Pentatônica m6*], [1], [b3], [5], [6], [*7M*], [A C E *F\#* *G\#*], [Jazz menor, flamenco],
    [*Pentatônica Lídia*], [1], [2], [*\#4*], [5], [7M], [A B *D\#* E G\#], [Etéreo, fusion],
    [*Pentatônica Sus*], [1], [2], [4], [5], [b7], [A B D E G], [Ambient, world],
    [*Pentatônica Maior*], [1], [2], [3], [5], [6], [A B C\# E F\#], [Country, pop, gospel],
  )
]

#pagebreak()

= Pentatônica m7 (Menor com Sétima Maior)

Substitui a quinta (5) pelo *2º grau* (9ª). Isso cria um som mais aberto e "jazzístico" do que a pentatônica menor padrão.

== Construção

#align(center)[
  #block(
    fill: color-subtle-bg,
    stroke: 0.5pt + color-rule-dark,
    inset: 11pt,
    radius: 5pt,
    width: 85%,
    [
      #grid(
        columns: (1fr, 1fr),
        gutter: 1.5em,
        block(fill: color-subtle-bg, inset: 8pt, radius: 4pt, [
          #align(center)[#text(weight: "bold")[Pentatônica Menor (Am)]]
          #v(0.3em)
          #set text(size: 9pt)
          A – C – D – E – G \
          1 – b3 – 4 – 5 – b7
        ]),
        block(fill: color-brand-soft, stroke: 0.5pt + color-brand-soft, inset: 8pt, radius: 4pt, [
          #align(center)[#text(weight: "bold")[Pentatônica m7 (Am)]]
          #v(0.3em)
          #set text(size: 9pt)
          A – C – D – G – *B* \
          1 – b3 – 4 – b7 – *2* \
          (Troca o E pela nota B)
        ]),
      )
    ],
  )
]

== Posição 1 (Am Pentatônica m7)

#align(center)[
  #grid(
    columns: (auto, 1fr),
    gutter: 2em,
    align: horizon,
    neck(
      (
        ("R", " ", " ", "N", "G", " "),
        ("N", " ", "R", " ", " ", " "),
        ("N", " ", "R", " ", " ", " "),
        ("N", " ", " ", "G", " ", " "),
        ("N", " ", "R", " ", " ", " "),
        ("R", " ", " ", "N", "G", " "),
      ),
      fs: 5,
    ),
    block(fill: color-brand-soft, stroke: 0.6pt + color-brand-soft, inset: 11pt, radius: 5pt, [
      #set text(size: 9pt)
      *●* azul = Tônica (A) \
      *●* cinza = notas da escala \
      *●* verde = B (2ª/9ª — nota característica)
      #v(0.5em)
      Use sobre: *Am7, Am9*, progressões de jazz funk. O B cria a cor "9ª" característica do jazz moderno.
    ]),
  )
]

#v(1em)

#align(center)[
  #block(
    fill: color-brand-soft,
    stroke: 0.5pt + color-brand-soft,
    inset: 10pt,
    radius: 5pt,
    width: 80%,
    [*Aplicação:* Excelente sobre *Im7* no jazz (Am7 no campo de C). A nota B (9ª) soa muito mais sofisticada do que a 5ª (E). Muito usada por guitarristas como John Scofield e Kurt Rosenwinkel.],
  )
]

#pagebreak()

= Pentatônica m6 (Menor com Sexta Maior)

Também chamada de *Pentatônica de Zeuhl* ou *Pentatônica Menor da Menor Harmônica*. Contém a tônica, terça menor, quinta, sexta maior e sétima maior — as notas mais características da escala menor harmônica.

== Construção

#align(center)[
  #block(
    fill: color-subtle-bg,
    stroke: 0.5pt + color-rule-dark,
    inset: 11pt,
    radius: 5pt,
    width: 85%,
    [
      #grid(
        columns: (1fr, 1fr),
        gutter: 1.5em,
        block(fill: color-subtle-bg, inset: 8pt, radius: 4pt, [
          #align(center)[#text(weight: "bold")[Penta Menor (Am)]]
          #v(0.3em)
          #set text(size: 9pt)
          A – C – D – E – G
        ]),
        block(fill: color-accent-soft, stroke: 0.5pt + rgb("#86efac"), inset: 8pt, radius: 4pt, [
          #align(center)[#text(weight: "bold")[Penta m6 (Am)]]
          #v(0.3em)
          #set text(size: 9pt)
          A – C – E – *F\#* – *G\#* \
          1 – b3 – 5 – *6* – *7M* \
          (Tira D e G, adiciona F\# e G\#)
        ]),
      )
    ],
  )
]

== Posição 1 (Am Pentatônica m6)

#align(center)[
  #grid(
    columns: (auto, 1fr),
    gutter: 2em,
    align: horizon,
    neck(
      (
        ("R", " ", " ", "G", "G", " "),
        (" ", "N", " ", "R", " ", " "),
        (" ", "N", " ", "N", " ", " "),
        (" ", "N", " ", "G", " ", " "),
        (" ", "R", " ", "G", " ", " "),
        ("R", " ", " ", "G", "G", " "),
      ),
      fs: 5,
    ),
    block(fill: color-accent-soft, stroke: 0.6pt + rgb("#86efac"), inset: 11pt, radius: 5pt, [
      #set text(size: 9pt)
      *●* azul = Tônica (A) \
      *●* cinza = Dó (b3) e Mi (5) \
      *●* verde = F\# (6ª) e G\# (7M — sensível)
      #v(0.5em)
      O G\# é a *sensível* da Menor Harmônica. Som muito característico: jazz, flamenco, neoclássico.
    ]),
  )
]

#v(1em)

#align(center)[
  #block(
    fill: color-accent-soft,
    stroke: 0.5pt + rgb("#86efac"),
    inset: 10pt,
    radius: 5pt,
    width: 80%,
    [*Aplicação:* Sobre *Im, Im(maj7), V7 do tom menor*. É o vocabulário do flamenco moderno e do jazz de Django Reinhardt. O F\# e G\# criam o sabor "espanhol/exótico" imediatamente reconhecível.],
  )
]

#pagebreak()

= Pentatônica Lídia

Derivada do *modo Lídio* (IV grau maior). Contém a *\#4 (trítono)* que cria o som etéreo, flutuante e "espacial" característico do fusion e do jazz modal.

== Construção

#align(center)[
  #block(
    fill: color-subtle-bg,
    stroke: 0.5pt + color-rule-dark,
    inset: 11pt,
    radius: 5pt,
    width: 85%,
    [
      #grid(
        columns: (1fr, 1fr),
        gutter: 1.5em,
        block(fill: color-subtle-bg, inset: 8pt, radius: 4pt, [
          #align(center)[#text(weight: "bold")[Penta Maior (A)]]
          #v(0.3em)
          #set text(size: 9pt)
          A – B – C\# – E – F\# \
          1 – 2 – 3 – 5 – 6
        ]),
        block(fill: rgb("#fef9c3"), stroke: 0.5pt + rgb("#eab308"), inset: 8pt, radius: 4pt, [
          #align(center)[#text(weight: "bold")[Penta Lídia (A)]]
          #v(0.3em)
          #set text(size: 9pt)
          A – B – *D\#* – E – G\# \
          1 – 2 – *\#4* – 5 – 7M \
          (Tróca C\# e F\# por D\# e G\#)
        ]),
      )
    ],
  )
]

== Posição 1 (A Pentatônica Lídia)

#align(center)[
  #grid(
    columns: (auto, 1fr),
    gutter: 2em,
    align: horizon,
    neck(
      (
        ("R", " ", "N", " ", " ", "G"),
        ("G", " ", "N", " ", "R", " "),
        ("G", " ", "R", " ", "N", " "),
        (" ", "N", " ", "R", " ", "G"),
        ("G", " ", "N", " ", "R", " "),
        ("R", " ", "N", " ", " ", "G"),
      ),
      fs: 5,
    ),
    block(fill: rgb("#fef9c3"), stroke: 0.6pt + rgb("#eab308"), inset: 11pt, radius: 5pt, [
      #set text(size: 9pt)
      *●* azul = Tônica (A) \
      *●* cinza = B (2ª) e E (5ª) \
      *●* verde = D\# (\#4) e G\# (7M)
      #v(0.5em)
      O D\# (trítono!) é o coração do som Lídio — cria a "levitação" característica do modo.
    ]),
  )
]

#v(1em)

#align(center)[
  #block(
    fill: rgb("#fef9c3"),
    stroke: 0.5pt + rgb("#eab308"),
    inset: 10pt,
    radius: 5pt,
    width: 80%,
    [*Aplicação:* Sobre *Imaj7, Imaj7\#11*. Som de Joe Satriani ("Flying in a Blue Dream"), Steve Vai, Shawn Lane. A \#4 cria o som "Lydian" imediatamente.],
  )
]

#pagebreak()

= Como Usar as Pentatônicas Avançadas na Prática

#explainer-component(
  align(center)[
    #table(
      columns: (1.5fr, 1fr, 1.5fr),
      align: center + horizon,
      stroke: 0.5pt + color-rule-dark,
      fill: (col, row) => if row == 0 { color-subtle-bg } else if calc.odd(row) { white } else { color-subtle-bg },
      [*Acorde no contexto*], [*Pentatônica*], [*Por quê*],
      [Im7 (jazz/bossa)], [m7], [Adiciona a 9ª, soa sofisticado],
      [Im, V7 (tom menor)], [m6], [Sensível + 6ª = sabor harmônico],
      [Imaj7\#11 (Lídio)], [Lídia], [Trítono do Lídio],
      [Isus2, Isus4], [Sus], [Som aberto e modal],
      [I (pop/country)], [Maior], [Soa "americano", limpo],
    )
  ],
  [
    *Técnica de superimposição:* Você não precisa necessariamente estar no tom "certo" da pentatônica. Guitarristas de jazz tocam pentatônicas *de outros graus* sobre um acorde para criar tensão intencional.

    #v(0.4em)
    Exemplo: sobre Am7, toque a *pentatônica de C maior* — você estará tocando as notas da extensão superior do Am7 (9ª, 11ª, 13ª).

    #v(0.4em)
    Sobre G7, toque a *pentatônica de Db* (o SubV!) — todas as tensões alteradas de uma vez.
  ],
)

#v(1.5em)

#align(center)[
  #block(
    fill: color-brand-soft,
    stroke: 0.5pt + color-brand-soft,
    inset: 12pt,
    radius: 5pt,
    width: 88%,
    [
      #text(weight: "bold")[Plano de estudo das pentatônicas avançadas:]
      #v(0.6em)
      #set text(size: 9pt)
      + Domine as 5 posições da pentatônica menor padrão. (Se ainda não dominou, volte para a aula 13.)
      + Aprenda a *Penta Maior* — ela é a pentatônica menor tocada 3 semitons acima (Am penta = C penta maior).
      + Introduza a *m7* como variante da menor: apenas mude a nota E para B numa posição.
      + Experimente a *m6* sobre progressões flamenco (Am – E7 – Am).
      + Reserve a *Lídia* para contextos específicos de fusion/modal.
    ],
  )
]
