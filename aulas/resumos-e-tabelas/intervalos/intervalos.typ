#import "/templates/layout.typ": *
#import "/templates/components.typ": *

#show: aula.with(
  instrumento: "Intervalos",
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

// Parágrafo "grudado" no bloco seguinte (evita título órfão)
#let intro(body) = block(sticky: true, below: 0.9em, body)
// Caixa com texto alinhado à esquerda
#let aviso(tipo, body) = {
  let rot = (dica: "Dica:", atencao: "Atenção:", resumo: "Resumo:", neutro: none).at(tipo)
  caixa(tipo: tipo, titulo: none, width: 100%)[#set align(left); #if rot != none [*#rot* ]#body]
}
#let nota-rodape(body) = block(above: 0.5em, text(size: 8.5pt, fill: color-muted, body))

// Registro para conferência automática (typst query "<iv>")
#let iv(raiz, intervalo, nota) = [#metadata((raiz: raiz, iv: intervalo, nota: nota)) <iv>]

// ============================================================
// CONTEÚDO
// ============================================================

= Intervalos

Intervalo é a distância entre duas notas, medida em *semitons* (meio tom). Na guitarra, um semitom é *uma casa*. Os intervalos são a base de tudo: escalas, acordes, tensões e mapas do braço são descritos por eles. *Como usar:* consulte a tabela da seção 2 para o nome e a cifra de cada distância e use as seções seguintes para tensões, inversões e desenhos no braço.

== 1. A escala cromática

#intro[As 12 notas da música ocidental, separadas por semitons. Entre Mi–Fá e Si–Dó não há nota intermediária: elas já estão a um semitom de distância. As notas com acidente têm dois nomes (enarmonia).]

#align(center, block(
  fill: color-subtle-bg,
  stroke: 0.5pt + color-rule-dark,
  inset: (x: 14pt, y: 10pt),
  radius: 4pt,
  {
    set text(size: 11pt, weight: "bold")
    let ns = ("C", "C#/Db", "D", "D#/Eb", "E", "F", "F#/Gb", "G", "G#/Ab", "A", "A#/Bb", "B", "C")
    ns.map(n => if n.len() > 1 { text(size: 9pt, weight: "regular", n) } else { n }).join(h(3pt) + text(fill: color-muted, weight: "regular")[→] + h(3pt))
  },
))

== 2. Intervalos simples (até uma oitava)

#let INT = (
  (0, [Uníssono (tônica)], [justo], "T", "C"),
  (1, [2ª menor], [menor], "b2", "Db"),
  (2, [2ª maior], [maior], "2", "D"),
  (3, [3ª menor #text(size: 8.5pt, fill: color-secondary)[(ou 2ª aumentada)]], [menor], "b3", "Eb"),
  (4, [3ª maior], [maior], "3", "E"),
  (5, [4ª justa], [justo], "4", "F"),
  (6, [4ª aumentada / 5ª diminuta #text(size: 8.5pt, fill: color-secondary)[(trítono)]], [aum. / dim.], "#4 / b5", "F# / Gb"),
  (7, [5ª justa], [justo], "5", "G"),
  (8, [5ª aumentada / 6ª menor], [aum. / menor], "#5 / b6", "G# / Ab"),
  (9, [6ª maior #text(size: 8.5pt, fill: color-secondary)[(ou 7ª diminuta)]], [maior], "6", "A"),
  (10, [7ª menor], [menor], "7", "Bb"),
  (11, [7ª maior], [maior], "7M", "B"),
  (12, [8ª justa (oitava)], [justo], "8", "C"),
)

#tabela-resumo(
  ([Semitons], [Nome], [Tipo], [Cifra], [A partir de Dó], [Casas]),
  INT.map(r => {
    let (st, nome, tipo, cifra, nota) = r
    let pares = cifra.split(" / ").zip(nota.split(" / "))
    (
      [#for (c, n) in pares { iv("C", c, n) }#st],
      align(left, nome),
      text(size: 9pt, tipo),
      [*#cifra*],
      [#nota],
      [#(if st == 0 { "mesma casa" } else if st == 1 { "1 casa" } else { str(st) + " casas" })],
    )
  }),
  columns: (0.8fr, 2.6fr, 1fr, 0.85fr, 1.05fr, 0.95fr),
  inset: (x: 0.45em, y: 0.56em),
  tamanho: 9.5pt,
)

#nota-rodape[Convenção de cifra usada aqui: *7* = 7ª menor e *7M* = 7ª maior. A 2ª aumentada aparece como *\#2* (Dó → Ré\#) e a 7ª diminuta como *bb7* (Dó → Sibb, soa igual à 6ª, usada no acorde º7). Em songbooks, a 7ª maior também aparece como maj7, 7+ ou Δ.]

== 3. Como os intervalos recebem nome

#grid(
  columns: (1.35fr, 1fr),
  gutter: 1em,
  [
    #set par(justify: false, leading: 0.75em)
    O *número* conta as *letras*, incluindo a primeira e a última: Dó → Mi passa por C, D, E, logo é uma *3ª*. O *tipo* vem dos semitons. Por isso Dó → Mib (3 semitons) é uma *3ª menor*, mas Dó → Ré\# (também 3 semitons) é uma *2ª aumentada*: mesmo som, outra escrita. São *justos* o uníssono, a 4ª, a 5ª e a 8ª; *maiores ou menores*, a 2ª, a 3ª, a 6ª e a 7ª.
  ],
  tabela-resumo(
    ([Alteração], [Resultado]),
    (
      ([maior − 1 semitom], [menor]),
      ([menor − 1 semitom], [diminuto]),
      ([maior + 1 semitom], [aumentado]),
      ([justo ± 1 semitom], [aumentado / diminuto]),
    ),
    columns: (1.2fr, 1fr),
    tamanho: 9pt,
    inset: (x: 0.4em, y: 0.36em),
  ),
)

== 4. Intervalos compostos: as tensões

#intro[Acima da oitava, os intervalos são *compostos*. Em acordes, os mais usados são a 9ª, a 11ª e a 13ª, chamadas *tensões* ou *extensões*. Para achar o intervalo simples correspondente, some 7 ao número: 2 + 7 = 9, 4 + 7 = 11, 6 + 7 = 13. A nota é a mesma, uma oitava acima.]

#let TENS = (
  ("b9", [2ª menor + 8ª], 13, "Db", "C7(b9)"),
  ("9", [2ª maior + 8ª], 14, "D", "C7M(9)"),
  ("#9", [2ª aumentada + 8ª], 15, "D#", "C7(#9)"),
  ("11", [4ª justa + 8ª], 17, "F", "Cm7(11)"),
  ("#11", [4ª aumentada + 8ª], 18, "F#", "C7M(#11)"),
  ("b13", [6ª menor + 8ª], 20, "Ab", "C7(b13)"),
  ("13", [6ª maior + 8ª], 21, "A", "C7(13)"),
)

#tabela-resumo(
  ([Tensão], [Corresponde a], [Semitons], [A partir de Dó], [Exemplo de cifra]),
  TENS.map(t => {
    let (c, desc, st, n, ex) = t
    (
      [#iv("C", c, n)*#c*],
      desc,
      [#st],
      [#n],
      [#ex],
    )
  }),
  columns: (0.8fr, 1.6fr, 0.8fr, 1fr, 1.2fr),
  inset: (x: 0.45em, y: 0.42em),
  tamanho: 9.5pt,
)

#nota-rodape[Escreve-se 9 (e não 2) quando a nota é acrescentada a um acorde que já tem a 7ª: é a tensão que fica acima da tétrade. Na prática, a nota pode ser tocada em qualquer oitava do voicing; o nome indica a função, não a altura exata.]

== 5. Inversão de intervalos

#intro[Inverter um intervalo é passar a nota de baixo para cima (uma oitava acima). Os números somam *9* e os semitons somam *12*; maior vira menor, aumentado vira diminuto, e justo continua justo.]

#tabela-resumo(
  ([Intervalo], [Inversão], [Exemplo], [Semitons]),
  (
    ([2ª menor], [7ª maior], [C–Db → Db–C], [1 + 11]),
    ([2ª maior], [7ª menor], [C–D → D–C], [2 + 10]),
    ([3ª menor], [6ª maior], [C–Eb → Eb–C], [3 + 9]),
    ([3ª maior], [6ª menor], [C–E → E–C], [4 + 8]),
    ([4ª justa], [5ª justa], [C–F → F–C], [5 + 7]),
    ([4ª aumentada], [5ª diminuta], [C–F\# → F\#–C], [6 + 6]),
  ),
  columns: (1fr, 1fr, 1.3fr, 0.8fr),
  inset: (x: 0.45em, y: 0.42em),
  tamanho: 9.5pt,
)

#v(0.5em)
#aviso("dica")[A inversão explica por que *subir uma 4ª* e *descer uma 5ª* levam à mesma nota (Sol → Dó). É esse o movimento do baixo nas cadências V7 – I.]

== 6. Intervalos no braço

#intro[Com a tônica na 6ª corda (aqui Lá, casa 5), cada intervalo ocupa sempre a mesma posição relativa. O desenho vale para qualquer tônica na 6ª corda: basta deslocá-lo pelo braço. Nas cordas 2 e 1, o desenho anda uma casa para a direita por causa da afinação Sol → Si (3ª maior).]

#align(center, braco-notas(
  fs: 4,
  casa-largura: 34pt,
  tamanho-rotulo: 7.5pt,
  (
    ("7M", "T", "b2", "2", "b3", "3"),
    ("3", "4", "b5", "5", "b6", "6"),
    ("6", "7", "7M", "T", "b2", "2"),
    ("2", "b3", "3", "4", "b5", "5"),
    ("b5", "5", "b6", "6", "7", "7M"),
    ("7M", "T", "b2", "2", "b3", "3"),
  ),
))

#v(0.6em)
#tabela-resumo(
  ([A partir da tônica na 6ª corda], [Onde está]),
  (
    ([3ª maior / 3ª menor], [5ª corda, 1 casa atrás / 2 casas atrás]),
    ([4ª justa], [5ª corda, mesma casa]),
    ([5ª justa], [5ª corda, 2 casas à frente]),
    ([7ª menor / 7ª maior], [4ª corda, mesma casa / 1 casa à frente]),
    ([oitava], [4ª corda, 2 casas à frente (ou 1ª corda, mesma casa: duas oitavas)]),
    ([9ª (2ª uma oitava acima)], [4ª corda, 4 casas à frente, ou 3ª corda, 1 casa atrás]),
  ),
  columns: (1.3fr, 2fr),
  alinhar: (c, r) => if c == 0 { center + horizon } else { left + horizon },
  inset: (x: 0.5em, y: 0.42em),
  tamanho: 9.5pt,
)

== 7. Exemplos: acordes analisados

#tabela-resumo(
  ([Cifra], [Leitura], [Notas], [Intervalos]),
  (
    ([C7M(9)], [Dó com 7ª maior e 9ª], [C – E – G – B – D], [T – 3 – 5 – 7M – 9]),
    ([Am7(11)], [Lá menor com 7ª e 11ª], [A – C – E – G – D], [T – b3 – 5 – 7 – 11]),
    ([G7(b13)], [Sol com 7ª menor e 13ª menor], [G – B – D – F – Eb], [T – 3 – 5 – 7 – b13]),
    ([Em7(b5)], [Mi meio-diminuto], [E – G – Bb – D], [T – b3 – b5 – 7]),
  ),
  columns: (0.9fr, 1.7fr, 1.4fr, 1.5fr),
  inset: (x: 0.45em, y: 0.5em),
  tamanho: 9.5pt,
)
