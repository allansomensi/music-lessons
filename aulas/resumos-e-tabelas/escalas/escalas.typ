#import "/templates/layout.typ": *

#show: aula.with(
  instrumento: "Escalas",
  nivel: "Teoria Musical",
)

= Escala Maior Natural

#v(0.5em)

#block(
  fill: luma(248),
  stroke: 0.5pt + luma(200),
  radius: 6pt,
  inset: 1.5em,
  width: 100%,
)[
  #grid(
    columns: (40%, 60%),
    gutter: 1.5em,
    [
      *Estrutura de Intervalos:* \
      T - 2 - 3 - 4 - 5 - 6 - 7M

      #v(0.8em)
      *Distâncias:* \
      T - T - ST - T - T - T - ST
    ],
    [
      *Campo Harmônico (Tríades):* \
      I - IIm - IIIm - IV - V - VIm - VIIº

      #v(0.8em)
      *Campo Harmônico (Tétrades):* \
      I7M - IIm7 - IIIm7 - IV7M - V7 - VIm7 - VIIø
    ],
  )
]

#v(1.5em)

#align(center)[
  #block(
    radius: 4pt,
    stroke: 0.75pt + black,
    clip: true,
    [
      #table(
        columns: (0.5fr, 2fr),
        align: (col, row) => if col == 0 { center + horizon } else { left + horizon },
        inset: (x: 1.5em, y: 0.8em),

        stroke: 0.5pt + black,

        fill: (_, row) => if row == 0 { luma(50) } else if calc.even(row) { luma(240) } else { white },

        [#text(fill: white)[*Tom*]], [#text(fill: white)[*Notas*]],

        [*C*], [C - D - E - F - G - A - B],
        [*Db*], [Db - Eb - F - Gb - Ab - Bb - C],
        [*D*], [D - E - F\# - G - A - B - C\#],
        [*Eb*], [Eb - F - G - Ab - Bb - C - D],
        [*E*], [E - F\# - G\# - A - B - C\# - D\#],
        [*F*], [F - G - A - Bb - C - D - E],
        [*Gb*], [Gb - Ab - Bb - Cb - Db - Eb - F],
        [*G*], [G - A - B - C - D - E - F\#],
        [*Ab*], [Ab - Bb - C - Db - Eb - F - G],
        [*A*], [A - B - C\# - D - E - F\# - G\#],
        [*Bb*], [Bb - C - D - Eb - F - G - A],
        [*B*], [B - C\# - D\# - E - F\# - G\# - A\#],
      )
    ],
  )
]

#pagebreak()

= Escala Menor Natural

#v(0.5em)

#block(
  fill: luma(248),
  stroke: 0.5pt + luma(200),
  radius: 6pt,
  inset: 1.5em,
  width: 100%,
)[
  #grid(
    columns: (40%, 60%),
    gutter: 1.5em,
    [
      *Estrutura de Intervalos:* \
      T - 2 - b3 - 4 - 5 - b6 - 7

      #v(0.8em)
      *Distâncias:* \
      T - ST - T - T - ST - T - T
    ],
    [
      *Campo Harmônico (Tríades):* \
      Im - IIº - bIII - IVm - Vm - bVI - bVII

      #v(0.8em)
      *Campo Harmônico (Tétrades):* \
      Im7 - IIø - bIII7M - IVm7 - Vm7 - bVI7M - bVII7
    ],
  )
]

#v(1.5em)

#align(center)[
  #block(
    radius: 4pt,
    stroke: 0.75pt + black,
    clip: true,
    [
      #table(
        columns: (0.5fr, 2fr),
        align: (col, row) => if col == 0 { center + horizon } else { left + horizon },
        inset: (x: 1.5em, y: 0.8em),

        stroke: 0.5pt + black,

        fill: (_, row) => if row == 0 { luma(50) } else if calc.even(row) { luma(240) } else { white },

        [#text(fill: white)[*Tom*]], [#text(fill: white)[*Notas*]],

        [*C*], [C - D - Eb - F - G - Ab - Bb],
        [*C\#*], [C\# - D\# - E - F\# - G\# - A - B],
        [*D*], [D - E - F - G - A - Bb - C],
        [*Eb*], [Eb - F - Gb - Ab - Bb - Cb - Db],
        [*E*], [E - F\# - G - A - B - C - D],
        [*F*], [F - G - Ab - Bb - C - Db - Eb],
        [*F\#*], [F\# - G\# - A - B - C\# - D - E],
        [*G*], [G - A - Bb - C - D - Eb - F],
        [*G\#*], [G\# - A\# - B - C\# - D\# - E - F\#],
        [*A*], [A - B - C - D - E - F - G],
        [*Bb*], [Bb - C - Db - Eb - F - Gb - Ab],
        [*B*], [B - C\# - D - E - F\# - G - A],
      )
    ],
  )
]

#pagebreak()

= Escala Menor Harmônica

#v(0.5em)

#block(
  fill: luma(248),
  stroke: 0.5pt + luma(200),
  radius: 6pt,
  inset: 1.5em,
  width: 100%,
)[
  #grid(
    columns: (40%, 60%),
    gutter: 1.5em,
    [
      *Estrutura de Intervalos:* \
      T - 2 - b3 - 4 - 5 - b6 - 7M

      #v(0.8em)
      *Distâncias:* \
      T - ST - T - T - ST - 1,5T - ST
    ],
    [
      *Campo Harmônico (Tríades):* \
      Im - IIº - bIII+ - IVm - V - bVI - VIIº

      #v(0.8em)
      *Campo Harmônico (Tétrades):* \
      Im7M - IIø - bIII7M(\#5) - IVm7 - V7 - bVI7M - VIIº7
    ],
  )
]

#v(1.5em)

#align(center)[
  #block(
    radius: 4pt,
    stroke: 0.75pt + black,
    clip: true,
    [
      #table(
        columns: (0.5fr, 2fr),
        align: (col, row) => if col == 0 { center + horizon } else { left + horizon },
        inset: (x: 1.5em, y: 0.8em),

        stroke: 0.5pt + black,

        fill: (_, row) => if row == 0 { luma(50) } else if calc.even(row) { luma(240) } else { white },

        [#text(fill: white)[*Tom*]], [#text(fill: white)[*Notas*]],

        [*C*], [C - D - Eb - F - G - Ab - B],
        [*C\#*], [C\# - D\# - E - F\# - G\# - A - B\#],
        [*D*], [D - E - F - G - A - Bb - C\#],
        [*Eb*], [Eb - F - Gb - Ab - Bb - Cb - D],
        [*E*], [E - F\# - G - A - B - C - D\#],
        [*F*], [F - G - Ab - Bb - C - Db - E],
        [*F\#*], [F\# - G\# - A - B - C\# - D - E\#],
        [*G*], [G - A - Bb - C - D - Eb - F\#],
        [*G\#*], [G\# - A\# - B - C\# - D\# - E - F\#\#],
        [*A*], [A - B - C - D - E - F - G\#],
        [*Bb*], [Bb - C - Db - Eb - F - Gb - A],
        [*B*], [B - C\# - D - E - F\# - G - A\#],
      )
    ],
  )
]

#pagebreak()

= Escala Menor Melódica

#v(0.5em)

#block(
  fill: luma(248),
  stroke: 0.5pt + luma(200),
  radius: 6pt,
  inset: 1.5em,
  width: 100%,
)[
  #grid(
    columns: (40%, 60%),
    gutter: 1.5em,
    [
      *Estrutura de Intervalos:* \
      T - 2 - b3 - 4 - 5 - 6 - 7M

      #v(0.8em)
      *Distâncias:* \
      T - ST - T - T - T - T - ST
    ],
    [
      *Campo Harmônico (Tríades):* \
      Im - IIm - bIII+ - IV - V - VIº - VIIº

      #v(0.8em)
      *Campo Harmônico (Tétrades):* \
      Im7M - IIm7 - bIII7M(\#5) - IV7 - V7 - VIø - VIIø
    ],
  )
]

#v(1.5em)

#align(center)[
  #block(
    radius: 4pt,
    stroke: 0.75pt + black,
    clip: true,
    [
      #table(
        columns: (0.5fr, 2fr),
        align: (col, row) => if col == 0 { center + horizon } else { left + horizon },
        inset: (x: 1.5em, y: 0.8em),

        stroke: 0.5pt + black,

        fill: (_, row) => if row == 0 { luma(50) } else if calc.even(row) { luma(240) } else { white },

        [#text(fill: white)[*Tom*]], [#text(fill: white)[*Notas*]],

        [*C*], [C - D - Eb - F - G - A - B],
        [*C\#*], [C\# - D\# - E - F\# - G\# - A\# - B\#],
        [*D*], [D - E - F - G - A - B - C\#],
        [*Eb*], [Eb - F - Gb - Ab - Bb - C - D],
        [*E*], [E - F\# - G - A - B - C\# - D\#],
        [*F*], [F - G - Ab - Bb - C - D - E],
        [*F\#*], [F\# - G\# - A - B - C\# - D\# - E\#],
        [*G*], [G - A - Bb - C - D - E - F\#],
        [*Ab*], [Ab - Bb - Cb - Db - Eb - F - G],
        [*A*], [A - B - C - D - E - F\# - G\#],
        [*Bb*], [Bb - C - Db - Eb - F - G - A],
        [*B*], [B - C\# - D - E - F\# - G\# - A\#],
      )
    ],
  )
]

#pagebreak()

= Escala Maior Harmônica

#v(0.5em)

#block(
  fill: luma(248),
  stroke: 0.5pt + luma(200),
  radius: 6pt,
  inset: 1.5em,
  width: 100%,
)[
  #grid(
    columns: (40%, 60%),
    gutter: 1.5em,
    [
      *Estrutura de Intervalos:* \
      T - 2 - 3 - 4 - 5 - b6 - 7M

      #v(0.8em)
      *Distâncias:* \
      T - T - ST - T - ST - 1,5T - ST
    ],
    [
      *Campo Harmônico (Tríades):* \
      I - IIº - IIIm - IVm - V - bVI+ - VIIº

      #v(0.8em)
      *Campo Harmônico (Tétrades):* \
      I7M - IIø - IIIm7 - IVm(7M) - V7 - bVI7M(\#5) - VIIº7
    ],
  )
]

#v(1.5em)

#align(center)[
  #block(
    radius: 4pt,
    stroke: 0.75pt + black,
    clip: true,
    [
      #table(
        columns: (0.5fr, 2fr),
        align: (col, row) => if col == 0 { center + horizon } else { left + horizon },
        inset: (x: 1.5em, y: 0.8em),

        stroke: 0.5pt + black,

        fill: (_, row) => if row == 0 { luma(50) } else if calc.even(row) { luma(240) } else { white },

        [#text(fill: white)[*Tom*]], [#text(fill: white)[*Notas*]],

        [*C*], [C - D - E - F - G - Ab - B],
        [*C\#*], [C\# - D\# - E\# - F\# - G\# - A - B\#],
        [*D*], [D - E - F\# - G - A - Bb - C\#],
        [*Eb*], [Eb - F - G - Ab - Bb - Cb - D],
        [*E*], [E - F\# - G\# - A - B - C - D\#],
        [*F*], [F - G - A - Bb - C - Db - E],
        [*F\#*], [F\# - G\# - A\# - B - C\# - D - E\#],
        [*G*], [G - A - B - C - D - Eb - F\#],
        [*Ab*], [Ab - Bb - C - Db - Eb - Fb - G],
        [*A*], [A - B - C\# - D - E - F - G\#],
        [*Bb*], [Bb - C - D - Eb - F - Gb - A],
        [*B*], [B - C\# - D\# - E - F\# - G - A\#],
      )
    ],
  )
]

#pagebreak()

= Escala Diminuta

#v(0.5em)

#block(
  fill: luma(248),
  stroke: 0.5pt + luma(200),
  radius: 6pt,
  inset: 1.5em,
  width: 100%,
)[
  #grid(
    columns: (40%, 60%),
    gutter: 1.5em,
    [
      *Estrutura de Intervalos:* \
      T - 2 - b3 - 4 - b5 - b6 - b7 - 7M

      #v(0.8em)
      *Distâncias:* \
      T - ST - T - ST - T - ST - T - ST
    ],
    [
      *Campo Harmônico (Tríades):* \
      Iº - IIº - bIIIº - IVº - bVº - bVIº - bVIIº - VIIº

      #v(0.8em)
      *Campo Harmônico (Tétrades):* \
      Iº7 - IIº7 - bIIIº7 - IVº7 - bVº7 - bVIº7 - bVIIº7 - VIIº7
    ],
  )
]

#v(1.5em)

#align(center)[
  #block(
    radius: 4pt,
    stroke: 0.75pt + black,
    clip: true,
    [
      #table(
        columns: (0.5fr, 2fr),
        align: (col, row) => if col == 0 { center + horizon } else { left + horizon },
        inset: (x: 1.5em, y: 0.8em),

        stroke: 0.5pt + black,

        fill: (_, row) => if row == 0 { luma(50) } else if calc.even(row) { luma(240) } else { white },

        [#text(fill: white)[*Tom*]], [#text(fill: white)[*Notas*]],

        [*C*], [C - D - Eb - F - Gb - Ab - Bbb - B],
        [*C\#*], [C\# - D\# - E - F\# - G - A - Bb - B\#],
        [*D*], [D - E - F - G - Ab - Bb - Cb - C\#],
        [*Eb*], [Eb - F - Gb - Ab - Bbb - Cb - Dbb - D],
        [*E*], [E - F\# - G - A - Bb - C - Db - D\#],
        [*F*], [F - G - Ab - Bb - Cb - Db - Ebb - E],
        [*F\#*], [F\# - G\# - A - B - C - D - Eb - E\#],
        [*G*], [G - A - Bb - C - Db - Eb - Fb - F\#],
        [*Ab*], [Ab - Bb - Cb - Db - Ebb - Fb - Gbb - G],
        [*A*], [A - B - C - D - Eb - F - Gb - G\#],
        [*Bb*], [Bb - C - Db - Eb - Fb - Gb - Abb - A],
        [*B*], [B - C\# - D - E - F - G - Ab - A\#],
      )
    ],
  )
]

#pagebreak()

= Escala Dom-Dim

#v(0.5em)

#block(
  fill: luma(248),
  stroke: 0.5pt + luma(200),
  radius: 6pt,
  inset: 1.5em,
  width: 100%,
)[
  #grid(
    columns: (40%, 60%),
    gutter: 1.5em,
    [
      *Estrutura de Intervalos:* \
      T - b2 - \#2 - 3 - \#4 - 5 - 6 - 7

      #v(0.8em)
      *Distâncias:* \
      ST - T - ST - T - ST - T - ST - T
    ],
    [
      *Campo Harmônico (Tríades):* \
      I - bIIº - bIII - IIIº - bV - Vº - VI - bVIIº

      #v(0.8em)
      *Campo Harmônico (Tétrades):* \
      I7 - bIIº7 - bIII7 - IIIº7 - bV7 - Vº7 - VI7 - bVIIº7
    ],
  )
]

#v(1.5em)

#align(center)[
  #block(
    radius: 4pt,
    stroke: 0.75pt + black,
    clip: true,
    [
      #table(
        columns: (0.5fr, 2fr),
        align: (col, row) => if col == 0 { center + horizon } else { left + horizon },
        inset: (x: 1.5em, y: 0.8em),

        stroke: 0.5pt + black,

        fill: (_, row) => if row == 0 { luma(50) } else if calc.even(row) { luma(240) } else { white },

        [#text(fill: white)[*Tom*]], [#text(fill: white)[*Notas*]],

        [*C*], [C - Db - D\# - E - F\# - G - A - Bb],
        [*C\#*], [C\# - D - D\#\# - E\# - F\#\# - G\# - A\# - B],
        [*D*], [D - Eb - E\# - F\# - G\# - A - B - C],
        [*Eb*], [Eb - Fb - F\# - G - A - Bb - C - Db],
        [*E*], [E - F - F\#\# - G\# - A\# - B - C\# - D],
        [*F*], [F - Gb - G\# - A - B - C - D - Eb],
        [*F\#*], [F\# - G - G\#\# - A\# - B\# - C\# - D\# - E],
        [*G*], [G - Ab - A\# - B - C\# - D - E - F],
        [*Ab*], [Ab - Bbb - B - C - D - Eb - F - Gb],
        [*A*], [A - Bb - B\# - C\# - D\# - E - F\# - G],
        [*Bb*], [Bb - Cb - C\# - D - E - F - G - Ab],
        [*B*], [B - C - C\#\# - D\# - E\# - F\# - G\# - A],
      )
    ],
  )
]

#pagebreak()

= Escala Hexafônica

#v(0.5em)

#block(
  fill: luma(248),
  stroke: 0.5pt + luma(200),
  radius: 6pt,
  inset: 1.5em,
  width: 100%,
)[
  #grid(
    columns: (40%, 60%),
    gutter: 1.5em,
    [
      *Estrutura de Intervalos:* \
      T - 2 - 3 - \#4 - \#5 - 7

      #v(0.8em)
      *Distâncias:* \
      T - T - T - T - T - T
    ],
    [
      *Campo Harmônico (Tríades):* \
      I+ - II+ - III+ - \#IV+ - \#V+ - bVII+

      #v(0.8em)
      *Campo Harmônico (Tétrades):* \
      I7(\#5) - II7(\#5) - III7(\#5) - \#IV7(\#5) - \#V7(\#5) - bVII7(\#5)
    ],
  )
]

#v(1.5em)

#align(center)[
  #block(
    radius: 4pt,
    stroke: 0.75pt + black,
    clip: true,
    [
      #table(
        columns: (0.5fr, 2fr),
        align: (col, row) => if col == 0 { center + horizon } else { left + horizon },
        inset: (x: 1.5em, y: 0.8em),

        stroke: 0.5pt + black,

        fill: (_, row) => if row == 0 { luma(50) } else if calc.even(row) { luma(240) } else { white },

        [#text(fill: white)[*Tom*]], [#text(fill: white)[*Notas*]],

        [*C*], [C - D - E - F\# - G\# - Bb],
        [*Db*], [Db - Eb - F - G - A - Cb],
        [*D*], [D - E - F\# - G\# - A\# - C],
        [*Eb*], [Eb - F - G - A - B - Db],
        [*E*], [E - F\# - G\# - A\# - B\# - D],
        [*F*], [F - G - A - B - C\# - Eb],
        [*F\#*], [F\# - G\# - A\# - B\# - C\#\# - E],
        [*G*], [G - A - B - C\# - D\# - F],
        [*Ab*], [Ab - Bb - C - D - E - Gb],
        [*A*], [A - B - C\# - D\# - E\# - G],
        [*Bb*], [Bb - C - D - E - F\# - Ab],
        [*B*], [B - C\# - D\# - E\# - F\#\# - A],
      )
    ],
  )
]

#pagebreak()

= Escala Bebop

#v(0.5em)

#block(
  fill: luma(248),
  stroke: 0.5pt + luma(200),
  radius: 6pt,
  inset: 1.5em,
  width: 100%,
)[
  #grid(
    columns: (40%, 60%),
    gutter: 1.5em,
    [
      *Estrutura de Intervalos:* \
      T - 2 - 3 - 4 - 5 - b6 - 6 - 7M

      #v(0.8em)
      *Distâncias:* \
      T - T - ST - T - ST - ST - T - ST
    ],
    [
      *Campo Harmônico (Tríades):* \
      I - IIº - IIIm - IV - V - bVI+ - VIm - VIIº

      #v(0.8em)
      *Campo Harmônico (Tétrades):* \
      I7M - IIº7 - IIIm7 - IV7M - V7 - bVI7M(\#5) - VIm7 - VIIº7
    ],
  )
]

#v(1.5em)

#align(center)[
  #block(
    radius: 4pt,
    stroke: 0.75pt + black,
    clip: true,
    [
      #table(
        columns: (0.5fr, 2fr),
        align: (col, row) => if col == 0 { center + horizon } else { left + horizon },
        inset: (x: 1.5em, y: 0.8em),

        stroke: 0.5pt + black,

        fill: (_, row) => if row == 0 { luma(50) } else if calc.even(row) { luma(240) } else { white },

        [#text(fill: white)[*Tom*]], [#text(fill: white)[*Notas*]],

        [*C*], [C - D - E - F - G - Ab - A - B],
        [*Db*], [Db - Eb - F - Gb - Ab - Bbb - Bb - C],
        [*D*], [D - E - F\# - G - A - Bb - B - C\#],
        [*Eb*], [Eb - F - G - Ab - Bb - Cb - C - D],
        [*E*], [E - F\# - G\# - A - B - C - C\# - D\#],
        [*F*], [F - G - A - Bb - C - Db - D - E],
        [*F\#*], [F\# - G\# - A\# - B - C\# - D - D\# - E\#],
        [*G*], [G - A - B - C - D - Eb - E - F\#],
        [*Ab*], [Ab - Bb - C - Db - Eb - Fb - F - G],
        [*A*], [A - B - C\# - D - E - F - F\# - G\#],
        [*Bb*], [Bb - C - D - Eb - F - Gb - G - A],
        [*B*], [B - C\# - D\# - E - F\# - G - G\# - A\#],
      )
    ],
  )
]

#pagebreak()

= Escala Bebop Dominante

#v(0.5em)

#block(
  fill: luma(248),
  stroke: 0.5pt + luma(200),
  radius: 6pt,
  inset: 1.5em,
  width: 100%,
)[
  #grid(
    columns: (40%, 60%),
    gutter: 1.5em,
    [
      *Estrutura de Intervalos:* \
      T - 2 - 3 - 4 - 5 - 6 - 7 - 7M

      #v(0.8em)
      *Distâncias:* \
      T - T - ST - T - T - ST - ST - ST
    ],
    [
      *Campo Harmônico (Tríades):* \
      I - IIm - IIIº - IV - Vm - VIm - bVII - VIIº

      #v(0.8em)
      *Campo Harmônico (Tétrades):* \
      I7 - IIm7 - IIIø - IV7M - Vm7 - VIm7 - bVII7M - VIIø
    ],
  )
]

#v(1.5em)

#align(center)[
  #block(
    radius: 4pt,
    stroke: 0.75pt + black,
    clip: true,
    [
      #table(
        columns: (0.5fr, 2fr),
        align: (col, row) => if col == 0 { center + horizon } else { left + horizon },
        inset: (x: 1.5em, y: 0.8em),

        stroke: 0.5pt + black,

        fill: (_, row) => if row == 0 { luma(50) } else if calc.even(row) { luma(240) } else { white },

        [#text(fill: white)[*Tom*]], [#text(fill: white)[*Notas*]],

        [*C*], [C - D - E - F - G - A - Bb - B],
        [*Db*], [Db - Eb - F - Gb - Ab - Bb - Cb - C],
        [*D*], [D - E - F\# - G - A - B - C - C\#],
        [*Eb*], [Eb - F - G - Ab - Bb - C - Db - D],
        [*E*], [E - F\# - G\# - A - B - C\# - D - D\#],
        [*F*], [F - G - A - Bb - C - D - Eb - E],
        [*F\#*], [F\# - G\# - A\# - B - C\# - D\# - E - E\#],
        [*G*], [G - A - B - C - D - E - F - F\#],
        [*Ab*], [Ab - Bb - C - Db - Eb - F - Gb - G],
        [*A*], [A - B - C\# - D - E - F\# - G - G\#],
        [*Bb*], [Bb - C - D - Eb - F - G - Ab - A],
        [*B*], [B - C\# - D\# - E - F\# - G\# - A - A\#],
      )
    ],
  )
]
