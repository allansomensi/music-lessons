#import "/templates/layout.typ": *
#import "/templates/components.typ": *
#import "@preview/conchord:0.4.0": new-chordgen

#show: aula.with(
  instrumento: "Guitarra / Violão",
  nivel: "Exercícios — Iniciante",
)

// ------------------------------------------------------------
// Helpers locais
// ------------------------------------------------------------

#let chord = new-chordgen(
  number-to-left: true,
  use-shadow-barre: false,
  colors: (hold: black, barre: black),
)

// Quadro de abertura no mesmo estilo de `objetivos`.
#let quadro(titulo, body) = block(
  width: 100%,
  fill: color-subtle-bg,
  stroke: (left: 3pt + color-strong, rest: 0.5pt + color-rule-dark),
  inset: (x: 14pt, y: 11pt),
  radius: (right: 5pt),
  below: 1.2em,
  [
    #text(size: 9pt, weight: "bold", tracking: 1.2pt, fill: color-secondary)[#upper(titulo)]
    #v(0.2em)
    #set text(size: 9.5pt)
    #set par(justify: false, leading: 0.7em)
    #body
  ],
)

// Gabarito conferido por script (notas e intervalos de cada corda).

// Seis caixinhas (6ª → 1ª corda) para escrever notas ou intervalos.
// Cordas abafadas ("x") já vêm marcadas com ×.
#let linha-cordas(tabs, valores: none) = {
  let casas = tabs.split(",").slice(0, 6)
  let vals = if valores == none { ("",) * 6 } else { valores }
  grid(
    columns: (0.6cm,) * 6,
    rows: (auto, 0.72cm),
    align: center + horizon,
    ..range(6).map(i => text(size: 7.5pt, fill: color-secondary)[#(6 - i)]),
    ..casas.zip(vals).map(((c, v)) => box(
      width: 100%,
      height: 100%,
      stroke: 0.5pt + color-rule-dark,
      fill: if c == "x" { color-subtle-bg } else { white },
      align(center + horizon, if c == "x" { text(size: 8pt, fill: color-muted)[×] } else { text(size: 8.5pt, weight: "bold", v) }),
    )),
  )
}

// Um diagrama numerado por letra, com linha para o nome do acorde.
#let item(letra, tabs, escrever: false) = block(breakable: false, width: 100%, {
  place(top + left, text(size: 9.5pt, weight: "bold")[#letra)])
  align(center, box(chord(tabs, name: " ")))
  if escrever {
    v(-1.1em)
    align(center, linha-cordas(tabs))
  }
  v(if escrever { 0.15em } else { 0.4em })
  align(center, box(width: 2.8cm, height: 0.9em, stroke: (bottom: 0.7pt + color-strong)))
})

#let grade(escrever: false, ..itens) = grid(
  columns: (1fr,) * 4,
  row-gutter: if escrever { 1.1em } else { 2em },
  column-gutter: 0.6em,
  align: center + top,
  ..itens.pos().enumerate().map(p => item("abcdefghijklmnop".at(p.at(0)), p.at(1), escrever: escrever)),
)

= Nomeando Acordes

*Como usar este material.* Os exercícios estão organizados em três blocos de dificuldade crescente: primeiro você dá nome aos acordes mais comuns; depois descobre a nota de cada corda e, por fim, o intervalo de cada nota em relação à tônica. Use lápis e, sempre que possível, *monte cada acorde no instrumento* antes de responder: ouvir ajuda a confirmar o nome. As respostas completas estão no *gabarito*, ao final.

#quadro("Conteúdos cobertos")[
  #grid(
    columns: (1.4fr, 2.6fr, auto),
    column-gutter: 1em,
    row-gutter: 0.85em,
    align: (left + top, left + top, right + top),
    text(size: 8.5pt, weight: "bold", fill: color-secondary)[BLOCO],
    text(size: 8.5pt, weight: "bold", fill: color-secondary)[TEMAS],
    text(size: 8.5pt, weight: "bold", fill: color-secondary)[EXERCÍCIO],
    [*1.* Nomeie os acordes], [Tríades maiores e menores · tétrades · sus2 e sus4 · inversões · m7(b5), º7, aumentado, acordes com 9ª], [1],
    [*2.* Identifique as notas], [Nota de cada corda e casa · acordes com 7M, 9, b9, \#9, \#11 e 13 · suspensos · inversões], [2],
    [*3.* Identifique os intervalos], [Intervalos em relação à tônica · dominantes alterados · inversões com a 7ª no baixo · º7, m(7M), 7M(\#5)], [3],
  )
  #v(0.3em)
  #line(length: 100%, stroke: 0.4pt + color-rule-light)
  #v(-0.2em)
  #text(size: 8.5pt, fill: color-secondary)[*Como ler os diagramas:* as linhas verticais são as cordas (a 6ª, Mi grave, à esquerda); os pontos são as casas presas; ○ = corda solta; × = corda abafada; o número ao lado indica a casa da primeira linha. \
  *Convenções:* intervalos `T` `b2` `2` `b3` `3` `4` `#4`/`b5` `5` `#5`/`b6` `6` `7` (sétima menor) `7M` (sétima maior), e as tensões `b9` `9` `#9` `11` `#11` `b13` `13`; `bb7` = sétima diminuta (soa igual à 6ª). Cifras: `7M` = sétima maior, `m7(b5)` = meio-diminuto, `º7` = diminuto, `+` = aumentado, `/` = inversão (nota do baixo depois da barra).]
]

=== Exemplo resolvido

#grid(
  columns: (auto, 1fr),
  column-gutter: 1.5em,
  align: (center + horizon, left + horizon),
  [
    #box(chord("x,3,2,0,1,0", name: " "))
    #v(-1.1em)
    #linha-cordas("x,3,2,0,1,0", valores: ("", "C", "E", "G", "C", "E"))
    #v(0.3em)
    #linha-cordas("x,3,2,0,1,0", valores: ("", "T", "3", "5", "T", "3"))
    #v(0.3em)
    #text(weight: "bold")[C]
  ],
  [
    + *Notas* (bloco 2): conte as casas a partir de cada corda solta. 5ª corda (Lá) casa 3 = Dó; 4ª corda (Ré) casa 2 = Mi; 3ª corda solta = Sol; 2ª corda (Si) casa 1 = Dó; 1ª corda solta = Mi. A 6ª corda está abafada (×).
    + *Intervalos* (bloco 3): escolha a tônica e meça cada nota a partir dela. Com tônica Dó: Dó = T, Mi = 3, Sol = 5.
    + *Nome* (todos os blocos): as notas Dó, Mi e Sol formam T, 3 e 5, ou seja, uma tríade maior. A cifra é *C*.
  ],
)

=== Autoavaliação (marque ao terminar)

#checklist((
  [Reconheço tríades maiores e menores e as tétrades 7, 7M e m7 sem pensar muito],
  [Encontro a nota de qualquer corda e casa contando a partir da corda solta],
  [Identifico a tônica mesmo quando ela não está no baixo (inversões)],
  [Dou nome a acordes com tensões (9, 11, 13) e alterações (b9, \#9, b13)],
))

#pagebreak()

// ============================================================
== 1. Nomeie os acordes
// ============================================================

#exercicio(titulo: "Qual é a cifra?")[
  Escreva na linha abaixo de cada diagrama a cifra completa do acorde. Os acordes vão das tríades simples (a–d) às tétrades (e–h), suspensos e inversões (i–l) e, por fim, acordes diminutos, aumentados e com 9ª (m–p).

  #v(0.6em)
  #grade(
    // a) C · b) Am · c) G · d) D
    "x,3,2,0,1,0", "x,0,2,2,1,0", "3,2,0,0,0,3", "x,x,0,2,3,2",
    // e) E7 · f) F7M · g) Dm7 · h) B7
    "0,2,0,1,0,0", "x,x,3,2,1,0", "x,x,0,2,1,1", "x,2,4,2,4,2",
    // i) Dsus4 · j) Asus2 · k) G/B · l) C/G
    "x,x,0,2,3,3", "x,0,2,2,0,0", "x,2,0,0,3,3", "3,3,2,0,1,0",
    // m) Bm7(b5) · n) Cº7 (C Eb Gb A — não é Cm7(b5)) · o) A+ · p) C7(9)
    "x,2,3,2,3,x,*", "x,3,4,2,4,x,*", "x,0,3,2,2,1", "x,3,2,3,3,x,*",
  )
]

#pagebreak()

// ============================================================
== 2. Identifique as notas
// ============================================================

#exercicio(titulo: "Nota por nota")[
  Nas caixinhas abaixo de cada diagrama, escreva a *nota* que soa em cada corda (da 6ª à 1ª). Depois escreva a cifra do acorde na linha. As cordas abafadas já estão marcadas com ×.

  #v(0.4em)
  #grade(
    escrever: true,
    // a) C7M · b) Am(add9) (sem 7ª — não é Am9) · c) Dm7(9) · d) G7
    "x,3,2,0,0,0", "x,0,2,4,1,0", "x,5,3,5,5,x,*", "3,2,0,0,0,1",
    // e) E7(b9) · f) F7M(#11) · g) Bb7(13) · h) B7(#9)
    "0,2,0,1,0,1", "1,3,3,2,0,0", "6,x,6,7,8,x,*", "x,2,1,2,3,x,*",
    // i) D7sus4(9) · j) A7sus4 · k) Csus2 · l) Gsus4
    "x,5,5,5,5,x,*", "x,0,2,0,3,0", "x,3,0,0,3,3", "3,x,0,0,1,3",
    // m) C/E · n) G/D · o) Am/C · p) D/A
    "0,3,2,0,1,0", "x,x,0,0,0,3", "x,3,2,2,1,0", "x,0,0,2,3,2",
  )
]

#pagebreak()

// ============================================================
== 3. Identifique os intervalos
// ============================================================

#exercicio(titulo: "Intervalo por intervalo")[
  Nas caixinhas, escreva o *intervalo* de cada nota em relação à tônica do acorde (T, 3, b3, 5, b5, 7, 7M, 9, b13…). Depois escreva a cifra na linha. Dica: comece encontrando a tônica — nem sempre ela está no baixo.

  #v(0.4em)
  #grade(
    escrever: true,
    // a) G7(b13) · b) C7(#9,b13) · c) A7(b9,b13) · d) E7(#9)
    "3,x,3,4,4,x,*", "x,3,2,3,4,4", "5,x,5,6,6,6,*", "x,7,6,7,8,x,*",
    // e) E/G# · f) C7M/G · g) Dm7/C · h) G7/F
    "4,x,2,1,0,0", "3,3,2,0,0,0", "x,3,x,2,3,1,*", "1,2,0,0,0,3",
    // i) C7M(9) · j) F#m7(b5) · k) Fº7 · l) Em7(11)
    "x,3,2,4,3,x,*", "2,x,2,2,1,x,*", "x,8,9,7,9,x,*", "0,x,0,2,3,3",
    // m) Am(7M) · n) D7(b9,13) · o) G7M(#5) · p) C(add9)
    "x,0,2,1,1,0", "x,5,4,5,4,7,*", "3,x,4,4,4,x,*", "x,3,2,0,3,0",
  )
]

// ============================================================
#gabarito[
  #resposta(1)[
    #tabela(
      columns: (1fr,) * 4,
      ([a–d], [e–h], [i–l], [m–p]),
      (
        ([a) C], [e) E7], [i) Dsus4], [m) Bm7(b5)]),
        ([b) Am], [f) F7M], [j) Asus2], [n) Cº7]),
        ([c) G], [g) Dm7], [k) G/B], [o) A+ (ou A(\#5))]),
        ([d) D], [h) B7], [l) C/G], [p) C7(9)]),
      ),
    )
    #v(0.3em)
    *Atenção:* o (n) tem Dó, Mib, Solb e Lá (T, b3, b5, bb7): é *Cº7* (diminuto), e não Cm7(b5), que teria Sib. O (o) tem Lá, Dó\# e Mi\# (escrito Fá no braço): tríade aumentada.
  ]

  #resposta(2)[
    Notas da 6ª à 1ª corda (× = corda abafada).
    #v(0.2em)
    #set text(size: 9pt)
    #tabela(
      columns: (0.5fr, 1.5fr) + (0.75fr,) * 6,
      ([], [Acorde], [6ª], [5ª], [4ª], [3ª], [2ª], [1ª]),
      (
        ([a)], [C7M], [×], [C], [E], [G], [B], [E]),
        ([b)], [Am(add9)], [×], [A], [E], [B], [C], [E]),
        ([c)], [Dm7(9)], [×], [D], [F], [C], [E], [×]),
        ([d)], [G7], [G], [B], [D], [G], [B], [F]),
        ([e)], [E7(b9)], [E], [B], [D], [G\#], [B], [F]),
        ([f)], [F7M(\#11)], [F], [C], [F], [A], [B], [E]),
        ([g)], [Bb7(13)], [Bb], [×], [Ab], [D], [G], [×]),
        ([h)], [B7(\#9)], [×], [B], [D\#], [A], [D], [×]),
        ([i)], [D7sus4(9)], [×], [D], [G], [C], [E], [×]),
        ([j)], [A7sus4], [×], [A], [E], [G], [D], [E]),
        ([k)], [Csus2], [×], [C], [D], [G], [D], [G]),
        ([l)], [Gsus4], [G], [×], [D], [G], [C], [G]),
        ([m)], [C/E], [E], [C], [E], [G], [C], [E]),
        ([n)], [G/D], [×], [×], [D], [G], [B], [G]),
        ([o)], [Am/C], [×], [C], [E], [A], [C], [E]),
        ([p)], [D/A], [×], [A], [D], [A], [D], [F\#]),
      ),
    )
    #v(0.2em)
    *Atenção:* o (b) tem Si (9ª), mas *não tem 7ª* (Sol): é *Am(add9)*, e não "Am9". No (h), o Ré da 2ª corda é a \#9 do B7 (grafia teórica: Dó dobrado sustenido); no braço, escreve-se pelo nome mais simples.
  ]

  #pagebreak()

  #resposta(3)[
    Intervalos da 6ª à 1ª corda, em relação à tônica (× = corda abafada).
    #v(0.2em)
    #set text(size: 9pt)
    #tabela(
      columns: (0.5fr, 1.7fr) + (0.72fr,) * 6,
      ([], [Acorde], [6ª], [5ª], [4ª], [3ª], [2ª], [1ª]),
      (
        ([a)], [G7(b13)], [T], [×], [7], [3], [b13], [×]),
        ([b)], [C7(\#9,b13)], [×], [T], [3], [7], [\#9], [b13]),
        ([c)], [A7(b9,b13)], [T], [×], [7], [3], [b13], [b9]),
        ([d)], [E7(\#9)], [×], [T], [3], [7], [\#9], [×]),
        ([e)], [E/G\#], [3], [×], [T], [3], [5], [T]),
        ([f)], [C7M/G], [5], [T], [3], [5], [7M], [3]),
        ([g)], [Dm7/C], [×], [7], [×], [5], [T], [b3]),
        ([h)], [G7/F], [7], [3], [5], [T], [3], [T]),
        ([i)], [C7M(9)], [×], [T], [3], [7M], [9], [×]),
        ([j)], [F\#m7(b5)], [T], [×], [7], [b3], [b5], [×]),
        ([k)], [Fº7], [×], [T], [b5], [bb7], [b3], [×]),
        ([l)], [Em7(11)], [T], [×], [7], [11], [7], [b3]),
        ([m)], [Am(7M)], [×], [T], [5], [7M], [b3], [5]),
        ([n)], [D7(b9,13)], [×], [T], [3], [7], [b9], [13]),
        ([o)], [G7M(\#5)], [T], [×], [7M], [3], [\#5], [×]),
        ([p)], [C(add9)], [×], [T], [3], [5], [9], [3]),
      ),
    )
    #v(0.2em)
    *Observações:* em (a), sem a 5ª natural, a nota Mib pode ser lida como b13 ou como \#5: G7(b13) e G7(\#5) são nomes equivalentes aqui; o mesmo vale para a b13 de (b) e (c). Em (b), o acorde também é chamado de *C7alt*. Em (e), (f), (g) e (h), a nota do baixo não é a tônica: são inversões (1ª, 2ª e 3ª, com a 7ª no baixo).
  ]
]
