#import "/templates/layout.typ": *
#import "/templates/components.typ": *

#show: aula.with(
  instrumento: "Ciclo das Quintas",
  nivel: "Teoria Musical",
)

// ============================================================
// HELPERS LOCAIS
// ============================================================

// Tabela no padrão dos resumos: cabeçalho luma(50) com texto
// branco, zebra luma(240) e moldura arredondada.
#let tabela-resumo(
  cabecalho,
  linhas,
  columns: auto,
  alinhar: center + horizon,
  inset: (x: 0.55em, y: 0.5em),
  tamanho: 10pt,
  negrito-1a: true,
  largura: 100%,
) = {
  let n = cabecalho.len()
  let cols = if columns == auto { (1fr,) * n } else { columns }
  let corpo = linhas.map(l => l.enumerate().map(p => {
    let (i, c) = p
    if i == 0 and negrito-1a { strong(c) } else { c }
  }))
  align(center, block(
    radius: 4pt,
    stroke: 0.75pt + black,
    clip: true,
    width: largura,
    breakable: false,
    {
      set text(size: tamanho)
      set par(justify: false, leading: 0.6em)
      table(
        columns: cols,
        align: alinhar,
        inset: inset,
        stroke: 0.5pt + black,
        fill: (_, row) => if row == 0 { luma(50) } else if calc.even(row) { luma(240) } else { white },
        table.header(..cabecalho.map(h => text(fill: white, weight: "bold", h))),
        ..corpo.flatten(),
      )
    },
  ))
}

#let intro(body) = block(sticky: true, below: 0.9em, body)
#let aviso(tipo, body) = {
  let rot = (dica: "Dica:", atencao: "Atenção:", resumo: "Resumo:", neutro: none).at(tipo)
  caixa(tipo: tipo, titulo: none, width: 100%)[#set align(left); #if rot != none [*#rot* ]#body]
}
#let nota-rodape(body) = block(above: 0.5em, text(size: 8.5pt, fill: color-muted, body))

// ============================================================
// DADOS DO CICLO (sentido horário a partir de Dó)
// ============================================================
// (maior, relativo menor, nº de acidentes, tipo, enarmônico maior, enarmônico menor)
#let CICLO = (
  ("C", "Am", 0, "", none, none),
  ("G", "Em", 1, "#", none, none),
  ("D", "Bm", 2, "#", none, none),
  ("A", "F#m", 3, "#", none, none),
  ("E", "C#m", 4, "#", none, none),
  ("B", "G#m", 5, "#", "Cb", "Abm"),
  ("F#", "D#m", 6, "#", "Gb", "Ebm"),
  ("Db", "Bbm", 5, "b", "C#", "A#m"),
  ("Ab", "Fm", 4, "b", none, none),
  ("Eb", "Cm", 3, "b", none, none),
  ("Bb", "Gm", 2, "b", none, none),
  ("F", "Dm", 1, "b", none, none),
)
#let SUST = ("F#", "C#", "G#", "D#", "A#", "E#", "B#")
#let BEM = ("Bb", "Eb", "Ab", "Db", "Gb", "Cb", "Fb")
#let acidentes(n, tipo) = if n == 0 { () } else if tipo == "#" { SUST.slice(0, n) } else { BEM.slice(0, n) }

// Registro para conferência automática (typst query "<ciclo>")
#for (i, k) in CICLO.enumerate() [#metadata((pos: i, maior: k.at(0), menor: k.at(1), n: k.at(2), tipo: k.at(3))) <ciclo>]

// ============================================================
// DESENHO DO CICLO
// ============================================================

#let R0 = 2.35cm   // centro
#let R1 = 3.85cm   // anel dos menores
#let R2 = 5.6cm    // anel dos maiores
#let R3 = 7.6cm   // anel das armaduras
#let LADO = 2 * R3 + 0.4cm
#let C0 = LADO / 2

#let ang(i) = -90deg + 30deg * i
#let px(r, a) = C0 + r * calc.cos(a)
#let py(r, a) = C0 + r * calc.sin(a)
// Coloca um conteúdo centralizado no ponto polar (r, a)
#let em-polar(r, a, corpo, w: 2.6cm, h: 1.4cm) = place(
  top + left,
  dx: px(r, a) - w / 2,
  dy: py(r, a) - h / 2,
  box(width: w, height: h, align(center + horizon, corpo)),
)
#let simb(t) = text(font: "DejaVu Sans", size: 0.9em, if t == "#" { "♯" } else { "♭" })
#let disco(r, fill) = place(top + left, dx: C0 - r, dy: C0 - r, circle(radius: r, fill: fill, stroke: 0.8pt + color-strong))

// Arco (aproximação cúbica) com ponta de seta no final
#let seta-arco(r, a, b) = {
  let k = 4 / 3 * calc.tan((b - a) / 4)
  let p0 = (px(r, a), py(r, a))
  let p3 = (px(r, b), py(r, b))
  let p1 = (p0.at(0) - k * r * calc.sin(a), p0.at(1) + k * r * calc.cos(a))
  let p2 = (p3.at(0) + k * r * calc.sin(b), p3.at(1) - k * r * calc.cos(b))
  place(top + left, curve(
    stroke: 1pt + color-secondary,
    curve.move(p0),
    curve.cubic(p1, p2, p3),
  ))
  // ponta: direção tangente no ponto final
  let s = if b > a { 1 } else { -1 }
  let tx = -s * calc.sin(b)
  let ty = s * calc.cos(b)
  let l = 5pt
  let w = 2.8pt
  let (x, y) = p3
  place(top + left, polygon(
    fill: color-secondary,
    (x + tx * l, y + ty * l),
    (x - ty * w, y + tx * w),
    (x + ty * w, y - tx * w),
  ))
}

#let ciclo-desenho = box(width: LADO, height: LADO, {
  disco(R3, white)
  disco(R2, color-subtle-bg-alt)
  disco(R1, color-subtle-bg)
  disco(R0, white)
  // divisões entre as fatias
  for i in range(12) {
    let a = ang(i) + 15deg
    place(top + left, line(start: (px(R0, a), py(R0, a)), end: (px(R3, a), py(R3, a)), stroke: 0.6pt + color-rule-dark))
  }
  for (i, k) in CICLO.enumerate() {
    let (maior, menor, n, tipo, enm, enr) = k
    let a = ang(i)
    // tom maior
    em-polar((R1 + R2) / 2, a, {
      text(size: 19pt, weight: "bold", fill: color-strong, maior)
      if enm != none { linebreak(); text(size: 9pt, fill: color-secondary)[(#enm)] }
    })
    // relativo menor
    em-polar((R0 + R1) / 2, a, w: 1.9cm, h: 1.2cm, {
      text(size: 11.5pt, weight: "bold", fill: color-ink, menor)
      if enr != none { linebreak(); text(size: 7.5pt, fill: color-secondary)[(#enr)] }
    })
    // armadura
    let ac = acidentes(n, tipo)
    em-polar((R2 + R3) / 2, a, w: 2.1cm, h: 1.5cm, {
      set par(leading: 0.42em, justify: false)
      if n == 0 { text(size: 12pt, weight: "bold")[0] } else if i == 6 {
        text(size: 12pt, weight: "bold")[6#simb("#") = 6#simb("b")]
      } else {
        text(size: 12pt, weight: "bold")[#n#simb(tipo)]
      }
      linebreak()
      text(size: 7.5pt, fill: color-secondary, if n == 0 { [sem acidentes] } else if i == 6 { [F\# ou Gb] } else if n <= 3 { ac.join(" ") } else { ac.slice(0, 3).join(" ") + "\n" + ac.slice(3).join(" ") })
    })
  }
  // setas e legendas do centro
  seta-arco(R0 - 0.45cm, -150deg, -30deg)
  seta-arco(R0 - 0.45cm, 150deg, 30deg)
  place(top + left, dx: C0 - 1.6cm, dy: C0 - 1.05cm, box(width: 3.2cm, align(center, {
    set par(leading: 0.4em)
    text(size: 8.5pt, weight: "bold")[5ªs justas]
    linebreak()
    text(size: 7.5pt, fill: color-secondary)[sentido horário]
  })))
  place(top + left, dx: C0 - 1.6cm, dy: C0 + 0.25cm, box(width: 3.2cm, align(center, {
    set par(leading: 0.4em)
    text(size: 7.5pt, fill: color-secondary)[sentido anti-horário]
    linebreak()
    text(size: 8.5pt, weight: "bold")[4ªs justas]
  })))
})

// ============================================================
// CONTEÚDO
// ============================================================

= Ciclo das Quintas

O ciclo das quintas organiza os 12 tons em um círculo: andando no sentido horário, cada tom fica uma *5ª justa acima* do anterior e ganha um sustenido na armadura; no sentido anti-horário, cada tom fica uma *4ª justa acima* e ganha um bemol. *Como usar:* no anel externo está a armadura; no anel do meio, o tom maior; no anel interno, o relativo menor (mesma armadura). Os tons vizinhos no círculo são os mais próximos entre si.

#align(center, ciclo-desenho)

#nota-rodape[Na parte de baixo do círculo, os tons se sobrepõem por enarmonia: Si maior = Dób maior, Fá\# maior = Solb maior e Réb maior = Dó\# maior soam iguais. Entre parênteses está a grafia alternativa; usa-se, em geral, a que tem menos acidentes.]

#pagebreak()

== 1. Os tons na ordem do ciclo

#intro[Leia a tabela de cima para baixo para andar no sentido horário (quintas). A posição é a das horas de um relógio: Dó maior fica no "meio-dia".]

#tabela-resumo(
  ([Posição], [Tom maior], [Relativo menor], [Armadura], [Acidentes], [5ª acima \ #text(size: 8pt, weight: "regular")[horário]], [4ª acima \ #text(size: 8pt, weight: "regular")[anti-horário]]),
  CICLO.enumerate().map(p => {
    let (i, k) = p
    let (maior, menor, n, tipo, enm, enr) = k
    let prox = CICLO.at(calc.rem(i + 1, 12)).at(0)
    let ant = CICLO.at(calc.rem(i + 11, 12)).at(0)
    (
      [#(if i == 0 { 12 } else { i })h],
      [*#maior*#if enm != none [ #text(size: 8.5pt, fill: color-secondary)[(#enm)]]],
      [#menor#if enr != none [ #text(size: 8.5pt, fill: color-secondary)[(#enr)]]],
      if n == 0 { [—] } else { [#n #tipo] },
      text(size: 9pt, if n == 0 { [—] } else { acidentes(n, tipo).join(" ") }),
      if i == 6 { [C\# #text(size: 8.5pt, fill: color-secondary)[(Db)]] } else { [#prox] },
      if i == 7 { [Gb #text(size: 8.5pt, fill: color-secondary)[(F\#)]] } else { [#ant] },
    )
  }),
  columns: (0.75fr, 1fr, 1.15fr, 0.85fr, 1.75fr, 1fr, 1.15fr),
  inset: (x: 0.35em, y: 0.45em),
  tamanho: 10pt,
  negrito-1a: false,
)

#nota-rodape[Ordem dos sustenidos: F\# C\# G\# D\# A\# E\# B\# (é a própria sequência horária, a partir de Fá). Ordem dos bemóis: Bb Eb Ab Db Gb Cb Fb (sequência anti-horária, a partir de Si). Nos tons enarmônicos, Dób maior tem 7 bemóis e Dó\# maior, 7 sustenidos.]

== 2. Como usar o ciclo

#tabela-resumo(
  ([Para…], [Faça no ciclo], [Exemplo]),
  (
    ([achar a *dominante* (V) de um tom], [ande *uma casa no sentido horário*], [V de Dó = Sol (G7); V de Mib = Sib (Bb7)]),
    ([achar a *subdominante* (IV)], [ande *uma casa no sentido anti-horário*], [IV de Dó = Fá; IV de Lá = Ré]),
    ([achar o *relativo menor*], [olhe o anel interno da mesma fatia], [Dó maior → Lá menor; Mib maior → Dó menor]),
    ([descobrir a *armadura*], [conte as casas a partir de Dó: horário = sustenidos, anti-horário = bemóis], [Ré: 2 casas no horário = 2 sustenidos]),
    ([achar os *tons vizinhos*], [pegue a fatia do tom e as duas fatias ao lado (6 tons)], [Dó: C, G, F, Am, Em, Dm]),
    ([seguir uma *progressão em quartas*], [ande no sentido anti-horário (o baixo sobe uma 4ª a cada acorde)], [Dm7 – G7 – C7M (II – V – I)]),
  ),
  columns: (1.35fr, 2fr, 1.75fr),
  alinhar: (c, r) => if c == 0 { left + horizon } else { left + horizon },
  inset: (x: 0.5em, y: 0.5em),
  tamanho: 9.5pt,
)

#v(0.6em)
#aviso("dica")[As três fatias vizinhas guardam o *campo harmônico* do tom central: em Dó, as fatias de Fá, Dó e Sol mostram F, C, G (maiores) e Dm, Am, Em (menores) — seis dos sete acordes de Dó maior. Só falta o diminuto (Bº).]

== 3. Progressões em quartas

#intro[A maior parte das cadências da música tonal leva o baixo uma 4ª justa acima (ou uma 5ª abaixo, que dá a mesma nota). No ciclo, isso é andar no *sentido anti-horário*, uma fatia por acorde.]

#tabela-resumo(
  ([Progressão], [Movimento no ciclo], [Exemplo em Dó]),
  (
    ([V7 – I (cadência perfeita)], [1 passo], [G7 – C7M]),
    ([IIm7 – V7 – I], [2 passos], [Dm7 – G7 – C7M]),
    ([VIm7 – IIm7 – V7 – I], [3 passos], [Am7 – Dm7 – G7 – C7M]),
    ([Ciclo de dominantes], [cada dominante resolve no seguinte], [E7 – A7 – D7 – G7 – C7M]),
    ([Ciclo diatônico completo], [as 7 notas do tom em quartas], [C7M – F7M – Bm7(b5) – E7 – Am7 – Dm7 – G7 – C7M]),
  ),
  columns: (1.35fr, 1.25fr, 2.8fr),
  inset: (x: 0.5em, y: 0.5em),
  tamanho: 9.5pt,
)

#nota-rodape[No ciclo diatônico, todas as quartas são justas exceto Fá → Si (4ª aumentada), porque o percurso fica dentro das notas do tom. O E7 é um dominante secundário (V7 de Lá menor) muito comum nesse encadeamento; o acorde diatônico seria Em7.]

== 4. O ciclo no braço da guitarra

#intro[Como as cordas soltas da guitarra são afinadas em 4ªs justas (exceto Sol → Si, uma 3ª maior), o ciclo aparece em desenhos fixos no braço. Isso ajuda a achar rapidamente a próxima tônica de uma progressão em quartas.]

#grid(
  columns: (1fr, 1fr),
  gutter: 1.2em,
  align(center)[
    #text(size: 10pt, weight: "bold")[Quartas (anti-horário): mesma casa, corda vizinha]
    #v(0.2em)
    #braco-notas(fs: 1, (
      ("", "", "*G", "", "", ""),
      ("", "", "C", "", "", ""),
      ("", "", "F", "", "", ""),
      ("", "", "Bb", "", "", ""),
      ("", "", "", "Eb", "", ""),
      ("", "", "", "Ab", "", ""),
    ))
    #v(0.2em)
    #text(size: 8.5pt, fill: color-secondary)[G – C – F – Bb – Eb – Ab: seis tons seguidos do ciclo numa única região (da 3ª para a 2ª corda, uma casa adiante).]
  ],
  align(center)[
    #text(size: 10pt, weight: "bold")[Quintas (horário): corda vizinha, 2 casas acima]
    #v(0.2em)
    #braco-notas(fs: 3, casa-largura: 19pt, (
      ("", "", "", "", "", "", "", "", "", ""),
      ("*C", "", "", "", "", "", "", "", "", ""),
      ("", "", "G", "", "", "", "", "", "", ""),
      ("", "", "", "", "D", "", "", "", "", ""),
      ("", "", "", "", "", "", "", "A", "", ""),
      ("", "", "", "", "", "", "", "", "", "E"),
    ))
    #v(0.2em)
    #text(size: 8.5pt, fill: color-secondary)[C – G – D – A – E: ao passar da 3ª para a 2ª corda, o desenho anda uma casa a mais.]
  ],
)

#v(0.6em)
#aviso("resumo")[*Horário* = 5ª acima = um sustenido a mais (ou um bemol a menos) = caminho para a dominante. *Anti-horário* = 4ª acima = um bemol a mais (ou um sustenido a menos) = caminho das resoluções. Praticar escalas, acordes e progressões nos 12 tons *na ordem do ciclo* (C – F – Bb – Eb…) é a forma mais musical de estudar todos os tons.]
