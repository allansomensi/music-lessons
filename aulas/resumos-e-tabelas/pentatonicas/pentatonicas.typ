#import "/templates/layout.typ": *

#show: aula.with(
  instrumento: "Guitarra / Violão",
  nivel: "Teoria Musical",
)

= Escalas pentatônicas

== Pentatônica m7
=== Estrutura: T - b3 - 4 - 5 - 7

#v(1em)

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

        [*C*], [C - Eb - F - G - Bb],
        [*C\#*], [C\# - E - F\# - G\# - B],
        [*D*], [D - F - G - A - C],
        [*D\#*], [D\# - F\# - G\# - A\# - C\#],
        [*E*], [E - G - A - B - D],
        [*F*], [F - Ab - Bb - C - Eb],
        [*F\#*], [F\# - A - B - C\# - E],
        [*G*], [G - Bb - C - D - F],
        [*G\#*], [G\# - B - C\# - D\# - F\#],
        [*A*], [A - C - D - E - G],
        [*Bb*], [Bb - Db - Eb - F - Ab],
        [*B*], [B - D - E - F\# - A],
      )
    ],
  )
]

#pagebreak()

== Pentatônica m7 Blues
=== Estrutura: T - b3 - 4 - \#4 - 5 - 7

#v(1em)

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

        [*C*], [C - Eb - F - F\# - G - Bb],
        [*C\#*], [C\# - E - F\# - F\#\# - G\# - B],
        [*D*], [D - F - G - G\# - A - C],
        [*D\#*], [D\# - F\# - G\# - G\#\# - A\# - C\#],
        [*E*], [E - G - A - A\# - B - D],
        [*F*], [F - Ab - Bb - B - C - Eb],
        [*F\#*], [F\# - A - B - B\# - C\# - E],
        [*G*], [G - Bb - C - C\# - D - F],
        [*G\#*], [G\# - B - C\# - C\#\# - D\# - F\#],
        [*A*], [A - C - D - D\# - E - G],
        [*Bb*], [Bb - Db - Eb - E - F - Ab],
        [*B*], [B - D - E - E\# - F\# - A],
      )
    ],
  )
]

#pagebreak()

== Pentatônica m6
=== Estrutura: T - b3 - 4 - 5 - 6

#v(1em)

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

        [*C*], [C - Eb - F - G - A],
        [*C\#*], [C\# - E - F\# - G\# - A\#],
        [*D*], [D - F - G - A - B],
        [*D\#*], [D\# - F\# - G\# - A\# - B\#],
        [*E*], [E - G - A - B - C\#],
        [*F*], [F - Ab - Bb - C - D],
        [*F\#*], [F\# - A - B - C\# - D\#],
        [*G*], [G - Bb - C - D - E],
        [*G\#*], [G\# - B - C\# - D\# - E\#],
        [*A*], [A - C - D - E - F\#],
        [*Bb*], [Bb - Db - Eb - F - G],
        [*B*], [B - D - E - F\# - G\#],
      )
    ],
  )
]

#pagebreak()

== Pentatônica m6 Blues
=== Estrutura: T - b3 - 4 - \#4 - 5 - 6

#v(1em)

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

        [*C*], [C - Eb - F - F\# - G - A],
        [*C\#*], [C\# - E - F\# - F\#\# - G\# - A\#],
        [*D*], [D - F - G - G\# - A - B],
        [*D\#*], [D\# - F\# - G\# - G\#\# - A\# - B\#],
        [*E*], [E - G - A - A\# - B - C\#],
        [*F*], [F - Ab - Bb - B - C - D],
        [*F\#*], [F\# - A - B - B\# - C\# - D\#],
        [*G*], [G - Bb - C - C\# - D - E],
        [*G\#*], [G\# - B - C\# - C\#\# - D\# - E\#],
        [*A*], [A - C - D - D\# - E - F\#],
        [*Bb*], [Bb - Db - Eb - E - F - G],
        [*B*], [B - D - E - E\# - F\# - G\#],
      )
    ],
  )
]

#pagebreak()

== Pentatônica Maior
=== Estrutura: T - 2 - 3 - 5 - 6

#v(1em)

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

        [*C*], [C - D - E - G - A],
        [*Db*], [Db - Eb - F - Ab - Bb],
        [*D*], [D - E - F\# - A - B],
        [*Eb*], [Eb - F - G - Bb - C],
        [*E*], [E - F\# - G\# - B - C\#],
        [*F*], [F - G - A - C - D],
        [*F\#*], [F\# - G\# - A\# - C\# - D\#],
        [*G*], [G - A - B - D - E],
        [*Ab*], [Ab - Bb - C - Eb - F],
        [*A*], [A - B - C\# - E - F\#],
        [*Bb*], [Bb - C - D - F - G],
        [*B*], [B - C\# - D\# - F\# - G\#],
      )
    ],
  )
]

#pagebreak()

== Pentatônica Maior Blues
=== Estrutura: T - 2 - \#2 - 3 - 5 - 6

#v(1em)

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

        [*C*], [C - D - D\# - E - G - A],
        [*Db*], [Db - Eb - E - F - Ab - Bb],
        [*D*], [D - E - E\# - F\# - A - B],
        [*Eb*], [Eb - F - F\# - G - Bb - C],
        [*E*], [E - F\# - F\#\# - G\# - B - C\#],
        [*F*], [F - G - G\# - A - C - D],
        [*F\#*], [F\# - G\# - G\#\# - A\# - C\# - D\#],
        [*G*], [G - A - A\# - B - D - E],
        [*Ab*], [Ab - Bb - B - C - Eb - F],
        [*A*], [A - B - B\# - C\# - E - F\#],
        [*Bb*], [Bb - C - C\# - D - F - G],
        [*B*], [B - C\# - C\#\# - D\# - F\# - G\#],
      )
    ],
  )
]


