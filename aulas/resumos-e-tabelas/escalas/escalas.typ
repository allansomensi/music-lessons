#import "/templates/layout.typ": *

#show: aula.with(
  instrumento: "Escalas",
  nivel: "Teoria Musical",
)

// ============================================================
// HELPER LOCAL: uma escala por página
// ============================================================
// Quadro com estrutura, distâncias, acordes e uso, seguido da
// tabela de notas nos 12 tons (mesmo estilo dos resumos de
// pentatônicas e modos).

#let escala(
  numero,
  nome,
  sub: "",
  formula: "",
  distancias: "",
  triades: [],
  tetrades: [],
  rotulo: "Campo harmônico",
  uso: [],
  notas: (),
  linha: 0.8em,
) = [
  == #numero. #nome

  #block(sticky: true, above: -0.3em, below: 0.8em)[
    #text(size: 11.5pt, style: "italic", fill: color-secondary)[#sub]
  ]

  #block(
    fill: luma(248),
    stroke: 0.5pt + luma(200),
    radius: 6pt,
    inset: (x: 1.2em, y: 1em),
    width: 100%,
    breakable: false,
  )[
    #set par(justify: false)
    #grid(
      columns: (40%, 60%),
      gutter: 1.5em,
      [
        *Estrutura de intervalos:* \
        #formula

        #v(0.6em)
        *Distâncias:* \
        #distancias
      ],
      [
        *#rotulo (tríades):* \
        #triades

        #v(0.6em)
        *#rotulo (tétrades):* \
        #tetrades
      ],
    )
    #v(0.2em)
    #line(length: 100%, stroke: 0.5pt + luma(200))
    #v(0.2em)
    #text(size: 10pt)[*Uso:* #uso]
  ]

  #v(0.7em)

  #align(center)[
    #block(
      radius: 4pt,
      stroke: 0.75pt + black,
      clip: true,
      [
        #table(
          columns: (0.5fr, 2fr),
          align: (col, row) => if col == 0 { center + horizon } else { left + horizon },
          inset: (x: 1.5em, y: linha),
          stroke: 0.5pt + black,
          fill: (_, row) => if row == 0 { luma(50) } else if calc.even(row) { luma(240) } else { white },
          table.header([#text(fill: white)[*Tom*]], [#text(fill: white)[*Notas*]]),
          ..notas.flatten(),
        )
      ],
    )
  ]
]

// ============================================================
// CONTEÚDO
// ============================================================

= Escalas

Uma página para cada escala: estrutura de intervalos, distâncias, acordes formados, uso típico e notas nos 12 tons. *Como usar:* escolha a escala pelo acorde ou pelo som que você procura (linha *Uso*) e leia as notas na linha do tom desejado. A grafia usa uma letra para cada grau; por isso aparecem notas como Cb, E\# ou F\#\#.

#[
  #set text(size: 9.5pt)
  #set par(justify: false, leading: 0.6em)
  #grid(
    columns: (1fr, 1fr),
    gutter: 1em,
    [*Intervalos:* T = tônica · b = abaixado meio tom · \# = elevado meio tom · *7* = 7ª menor · *7M* = 7ª maior · *bb7* = 7ª diminuta (soa igual à 6ª).],
    [*Distâncias:* T = tom · ST = semitom · 1,5T = um tom e meio. *Acordes:* ø = meio-diminuto, m7(b5) · º = diminuto · + = aumentado.],
  )
]

#escala(
  1,
  linha: 0.5em,
  "Escala Maior Natural",
  sub: "Modo jônico",
  formula: "T - 2 - 3 - 4 - 5 - 6 - 7M",
  distancias: "T - T - ST - T - T - T - ST",
  triades: [I - IIm - IIIm - IV - V - VIm - VIIº],
  tetrades: [I7M - IIm7 - IIIm7 - IV7M - V7 - VIm7 - VIIø],
  rotulo: "Campo harmônico",
  uso: [Base do sistema tonal. Usada sobre o acorde I7M do tom maior e como referência para todos os modos.],
  notas: (
    ([*C*], [C - D - E - F - G - A - B]),
    ([*Db*], [Db - Eb - F - Gb - Ab - Bb - C]),
    ([*D*], [D - E - F\# - G - A - B - C\#]),
    ([*Eb*], [Eb - F - G - Ab - Bb - C - D]),
    ([*E*], [E - F\# - G\# - A - B - C\# - D\#]),
    ([*F*], [F - G - A - Bb - C - D - E]),
    ([*Gb*], [Gb - Ab - Bb - Cb - Db - Eb - F]),
    ([*G*], [G - A - B - C - D - E - F\#]),
    ([*Ab*], [Ab - Bb - C - Db - Eb - F - G]),
    ([*A*], [A - B - C\# - D - E - F\# - G\#]),
    ([*Bb*], [Bb - C - D - Eb - F - G - A]),
    ([*B*], [B - C\# - D\# - E - F\# - G\# - A\#]),
  ),
)

#pagebreak()

#escala(
  2,
  "Escala Menor Natural",
  sub: "Modo eólio",
  formula: "T - 2 - b3 - 4 - 5 - b6 - 7",
  distancias: "T - ST - T - T - ST - T - T",
  triades: [Im - IIº - bIII - IVm - Vm - bVI - bVII],
  tetrades: [Im7 - IIø - bIII7M - IVm7 - Vm7 - bVI7M - bVII7],
  rotulo: "Campo harmônico",
  uso: [Base do tom menor; tem as mesmas notas da escala maior relativa (Lá menor = Dó maior a partir do Lá). Usada sobre Im7 e VIm7.],
  notas: (
    ([*C*], [C - D - Eb - F - G - Ab - Bb]),
    ([*C\#*], [C\# - D\# - E - F\# - G\# - A - B]),
    ([*D*], [D - E - F - G - A - Bb - C]),
    ([*Eb*], [Eb - F - Gb - Ab - Bb - Cb - Db]),
    ([*E*], [E - F\# - G - A - B - C - D]),
    ([*F*], [F - G - Ab - Bb - C - Db - Eb]),
    ([*F\#*], [F\# - G\# - A - B - C\# - D - E]),
    ([*G*], [G - A - Bb - C - D - Eb - F]),
    ([*G\#*], [G\# - A\# - B - C\# - D\# - E - F\#]),
    ([*A*], [A - B - C - D - E - F - G]),
    ([*Bb*], [Bb - C - Db - Eb - F - Gb - Ab]),
    ([*B*], [B - C\# - D - E - F\# - G - A]),
  ),
)

#pagebreak()

#escala(
  3,
  "Escala Menor Harmônica",
  sub: "Menor natural com 7ª maior",
  formula: "T - 2 - b3 - 4 - 5 - b6 - 7M",
  distancias: "T - ST - T - T - ST - 1,5T - ST",
  triades: [Im - IIº - bIII+ - IVm - V - bVI - VIIº],
  tetrades: [Im(7M) - IIø - bIII7M(\#5) - IVm7 - V7 - bVI7M - VIIº7],
  rotulo: "Campo harmônico",
  uso: [A 7ª maior (sensível) transforma o Vm7 em V7, criando a cadência V7 → Im do tom menor. O salto de 1,5 tom entre b6 e 7M é o seu som característico.],
  notas: (
    ([*C*], [C - D - Eb - F - G - Ab - B]),
    ([*C\#*], [C\# - D\# - E - F\# - G\# - A - B\#]),
    ([*D*], [D - E - F - G - A - Bb - C\#]),
    ([*Eb*], [Eb - F - Gb - Ab - Bb - Cb - D]),
    ([*E*], [E - F\# - G - A - B - C - D\#]),
    ([*F*], [F - G - Ab - Bb - C - Db - E]),
    ([*F\#*], [F\# - G\# - A - B - C\# - D - E\#]),
    ([*G*], [G - A - Bb - C - D - Eb - F\#]),
    ([*G\#*], [G\# - A\# - B - C\# - D\# - E - F\#\#]),
    ([*A*], [A - B - C - D - E - F - G\#]),
    ([*Bb*], [Bb - C - Db - Eb - F - Gb - A]),
    ([*B*], [B - C\# - D - E - F\# - G - A\#]),
  ),
)

#pagebreak()

#escala(
  4,
  "Escala Menor Melódica",
  sub: "Forma usada na música popular e no jazz",
  formula: "T - 2 - b3 - 4 - 5 - 6 - 7M",
  distancias: "T - ST - T - T - T - T - ST",
  triades: [Im - IIm - bIII+ - IV - V - VIº - VIIº],
  tetrades: [Im(7M) - IIm7 - bIII7M(\#5) - IV7 - V7 - VIø - VIIø],
  rotulo: "Campo harmônico",
  uso: [Menor com 6ª e 7ª maiores, igual na subida e na descida (na música erudita, a descida usa a menor natural). Usada sobre Im6 e Im(7M); seus modos geram a lídio dominante e a escala alterada.],
  notas: (
    ([*C*], [C - D - Eb - F - G - A - B]),
    ([*C\#*], [C\# - D\# - E - F\# - G\# - A\# - B\#]),
    ([*D*], [D - E - F - G - A - B - C\#]),
    ([*Eb*], [Eb - F - Gb - Ab - Bb - C - D]),
    ([*E*], [E - F\# - G - A - B - C\# - D\#]),
    ([*F*], [F - G - Ab - Bb - C - D - E]),
    ([*F\#*], [F\# - G\# - A - B - C\# - D\# - E\#]),
    ([*G*], [G - A - Bb - C - D - E - F\#]),
    ([*G\#*], [G\# - A\# - B - C\# - D\# - E\# - F\#\#]),
    ([*A*], [A - B - C - D - E - F\# - G\#]),
    ([*Bb*], [Bb - C - Db - Eb - F - G - A]),
    ([*B*], [B - C\# - D - E - F\# - G\# - A\#]),
  ),
)

#pagebreak()

#escala(
  5,
  "Escala Maior Harmônica",
  sub: "Maior com 6ª menor",
  formula: "T - 2 - 3 - 4 - 5 - b6 - 7M",
  distancias: "T - T - ST - T - ST - 1,5T - ST",
  triades: [I - IIº - IIIm - IVm - V - bVI+ - VIIº],
  tetrades: [I7M - IIø - IIIm7 - IVm(7M) - V7 - bVI7M(\#5) - VIIº7],
  rotulo: "Campo harmônico",
  uso: [Escala maior com a 6ª abaixada. Reúne num só tom o I7M maior, o IVm (de empréstimo) e o VIIº7 (dominante sem tônica).],
  notas: (
    ([*C*], [C - D - E - F - G - Ab - B]),
    ([*Db*], [Db - Eb - F - Gb - Ab - Bbb - C]),
    ([*D*], [D - E - F\# - G - A - Bb - C\#]),
    ([*Eb*], [Eb - F - G - Ab - Bb - Cb - D]),
    ([*E*], [E - F\# - G\# - A - B - C - D\#]),
    ([*F*], [F - G - A - Bb - C - Db - E]),
    ([*F\#*], [F\# - G\# - A\# - B - C\# - D - E\#]),
    ([*G*], [G - A - B - C - D - Eb - F\#]),
    ([*Ab*], [Ab - Bb - C - Db - Eb - Fb - G]),
    ([*A*], [A - B - C\# - D - E - F - G\#]),
    ([*Bb*], [Bb - C - D - Eb - F - Gb - A]),
    ([*B*], [B - C\# - D\# - E - F\# - G - A\#]),
  ),
)

#pagebreak()

#escala(
  6,
  "Escala Diminuta",
  sub: "Tom – semitom (8 notas)",
  formula: "T - 2 - b3 - 4 - b5 - b6 - bb7 - 7M",
  distancias: "T - ST - T - ST - T - ST - T - ST",
  triades: [Iº - IIº - bIIIº - IVº - bVº - bVIº - bbVIIº - VIIº],
  tetrades: [Iº7 - IIº7 - bIIIº7 - IVº7 - bVº7 - bVIº7 - bbVIIº7 - VIIº7],
  rotulo: "Acordes da escala",
  uso: [Simétrica: alterna tom e semitom. Usada sobre acordes º7. Repete-se a cada 3 semitons, por isso só existem três diminutas diferentes (Dó, Mib, Fá\# e Lá têm as mesmas notas). bb7 soa igual à 6ª.],
  notas: (
    ([*C*], [C - D - Eb - F - Gb - Ab - Bbb - B]),
    ([*C\#*], [C\# - D\# - E - F\# - G - A - Bb - B\#]),
    ([*D*], [D - E - F - G - Ab - Bb - Cb - C\#]),
    ([*Eb*], [Eb - F - Gb - Ab - Bbb - Cb - Dbb - D]),
    ([*E*], [E - F\# - G - A - Bb - C - Db - D\#]),
    ([*F*], [F - G - Ab - Bb - Cb - Db - Ebb - E]),
    ([*F\#*], [F\# - G\# - A - B - C - D - Eb - E\#]),
    ([*G*], [G - A - Bb - C - Db - Eb - Fb - F\#]),
    ([*Ab*], [Ab - Bb - Cb - Db - Ebb - Fb - Gbb - G]),
    ([*A*], [A - B - C - D - Eb - F - Gb - G\#]),
    ([*Bb*], [Bb - C - Db - Eb - Fb - Gb - Abb - A]),
    ([*B*], [B - C\# - D - E - F - G - Ab - A\#]),
  ),
)

#pagebreak()

#escala(
  7,
  "Escala Dominante-Diminuta",
  sub: "Semitom – tom (8 notas)",
  formula: "T - b2 - #2 - 3 - #4 - 5 - 6 - 7",
  distancias: "ST - T - ST - T - ST - T - ST - T",
  triades: [I - bIIº - bIII - IIIº - bV - Vº - VI - bVIIº],
  tetrades: [I7 - bIIº7 - bIII7 - IIIº7 - bV7 - Vº7 - VI7 - bVIIº7],
  rotulo: "Acordes da escala",
  uso: [Simétrica: alterna semitom e tom. Usada sobre dominantes com b9, \#9, \#11 e 13, como C7(b9,13). Tem as mesmas notas da diminuta (tom – semitom) que começa meio tom acima. Os acordes sobre \#2 e \#4 são cifrados como bIII7 e bV7 (em Dó: Eb7 e Gb7).],
  notas: (
    ([*C*], [C - Db - D\# - E - F\# - G - A - Bb]),
    ([*C\#*], [C\# - D - D\#\# - E\# - F\#\# - G\# - A\# - B]),
    ([*D*], [D - Eb - E\# - F\# - G\# - A - B - C]),
    ([*Eb*], [Eb - Fb - F\# - G - A - Bb - C - Db]),
    ([*E*], [E - F - F\#\# - G\# - A\# - B - C\# - D]),
    ([*F*], [F - Gb - G\# - A - B - C - D - Eb]),
    ([*F\#*], [F\# - G - G\#\# - A\# - B\# - C\# - D\# - E]),
    ([*G*], [G - Ab - A\# - B - C\# - D - E - F]),
    ([*Ab*], [Ab - Bbb - B - C - D - Eb - F - Gb]),
    ([*A*], [A - Bb - B\# - C\# - D\# - E - F\# - G]),
    ([*Bb*], [Bb - Cb - C\# - D - E - F - G - Ab]),
    ([*B*], [B - C - C\#\# - D\# - E\# - F\# - G\# - A]),
  ),
)

#pagebreak()

#escala(
  8,
  "Escala de Tons Inteiros",
  sub: "Hexafônica (6 notas)",
  formula: "T - 2 - 3 - #4 - #5 - 7",
  distancias: "T - T - T - T - T - T",
  triades: [I+ - II+ - III+ - \#IV+ - \#V+ - bVII+],
  tetrades: [I7(\#5) - II7(\#5) - III7(\#5) - \#IV7(\#5) - \#V7(\#5) - bVII7(\#5)],
  rotulo: "Acordes da escala",
  uso: [Simétrica: só tons inteiros. Usada sobre dominantes com 5ª aumentada, como C7(\#5) e C7(9,\#11,\#5). Só existem duas escalas diferentes (a partir de Dó e de Réb).],
  notas: (
    ([*C*], [C - D - E - F\# - G\# - Bb]),
    ([*Db*], [Db - Eb - F - G - A - Cb]),
    ([*D*], [D - E - F\# - G\# - A\# - C]),
    ([*Eb*], [Eb - F - G - A - B - Db]),
    ([*E*], [E - F\# - G\# - A\# - B\# - D]),
    ([*F*], [F - G - A - B - C\# - Eb]),
    ([*F\#*], [F\# - G\# - A\# - B\# - C\#\# - E]),
    ([*G*], [G - A - B - C\# - D\# - F]),
    ([*Ab*], [Ab - Bb - C - D - E - Gb]),
    ([*A*], [A - B - C\# - D\# - E\# - G]),
    ([*Bb*], [Bb - C - D - E - F\# - Ab]),
    ([*B*], [B - C\# - D\# - E\# - F\#\# - A]),
  ),
)

#pagebreak()

#escala(
  9,
  "Escala Bebop Maior",
  sub: "Maior com nota de passagem entre 5 e 6",
  formula: "T - 2 - 3 - 4 - 5 - b6 - 6 - 7M",
  distancias: "T - T - ST - T - ST - ST - T - ST",
  triades: [I - IIº - IIIm - IV - V - bVI+ - VIm - VIIº],
  tetrades: [I7M - IIº7 - IIIm7 - IV7M - V7 - bVI7M(\#5) - VIm7 - VIIº7],
  rotulo: "Acordes da escala",
  uso: [A b6 cromática faz as notas do acorde (T, 3, 5 e 6) caírem nos tempos quando a escala é tocada em colcheias a partir da tônica. Usada sobre I7M e I6.],
  notas: (
    ([*C*], [C - D - E - F - G - Ab - A - B]),
    ([*Db*], [Db - Eb - F - Gb - Ab - Bbb - Bb - C]),
    ([*D*], [D - E - F\# - G - A - Bb - B - C\#]),
    ([*Eb*], [Eb - F - G - Ab - Bb - Cb - C - D]),
    ([*E*], [E - F\# - G\# - A - B - C - C\# - D\#]),
    ([*F*], [F - G - A - Bb - C - Db - D - E]),
    ([*F\#*], [F\# - G\# - A\# - B - C\# - D - D\# - E\#]),
    ([*G*], [G - A - B - C - D - Eb - E - F\#]),
    ([*Ab*], [Ab - Bb - C - Db - Eb - Fb - F - G]),
    ([*A*], [A - B - C\# - D - E - F - F\# - G\#]),
    ([*Bb*], [Bb - C - D - Eb - F - Gb - G - A]),
    ([*B*], [B - C\# - D\# - E - F\# - G - G\# - A\#]),
  ),
)

#pagebreak()

#escala(
  10,
  "Escala Bebop Dominante",
  sub: "Mixolídio com nota de passagem entre 7 e T",
  formula: "T - 2 - 3 - 4 - 5 - 6 - 7 - 7M",
  distancias: "T - T - ST - T - T - ST - ST - ST",
  triades: [I - IIm - IIIº - IV - Vm - VIm - bVII - VIIº],
  tetrades: [I7 - IIm7 - IIIø - IV7M - Vm7 - VIm7 - bVII7M - VIIø],
  rotulo: "Acordes da escala",
  uso: [A 7M cromática faz as notas do acorde (T, 3, 5 e 7) caírem nos tempos em colcheias. Usada sobre dominantes (V7) e na linguagem do jazz.],
  notas: (
    ([*C*], [C - D - E - F - G - A - Bb - B]),
    ([*Db*], [Db - Eb - F - Gb - Ab - Bb - Cb - C]),
    ([*D*], [D - E - F\# - G - A - B - C - C\#]),
    ([*Eb*], [Eb - F - G - Ab - Bb - C - Db - D]),
    ([*E*], [E - F\# - G\# - A - B - C\# - D - D\#]),
    ([*F*], [F - G - A - Bb - C - D - Eb - E]),
    ([*F\#*], [F\# - G\# - A\# - B - C\# - D\# - E - E\#]),
    ([*G*], [G - A - B - C - D - E - F - F\#]),
    ([*Ab*], [Ab - Bb - C - Db - Eb - F - Gb - G]),
    ([*A*], [A - B - C\# - D - E - F\# - G - G\#]),
    ([*Bb*], [Bb - C - D - Eb - F - G - Ab - A]),
    ([*B*], [B - C\# - D\# - E - F\# - G\# - A - A\#]),
  ),
)
