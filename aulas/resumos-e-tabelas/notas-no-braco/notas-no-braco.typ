#import "/templates/layout.typ": *
#import "/templates/components.typ": *

#show: aula.with(
  instrumento: "Notas no Braço",
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

// Grafia de notas: cada nota é (l: letra 0–6, a: acidentes).
#let LETRAS = ("C", "D", "E", "F", "G", "A", "B")
#let PC-NAT = (0, 2, 4, 5, 7, 9, 11)
#let nt(s) = {
  let resto = s.slice(1)
  let a = if resto.starts-with("#") { resto.len() } else { -resto.len() }
  (l: LETRAS.position(x => x == s.first()), a: a)
}
#let pc(n) = calc.rem(PC-NAT.at(n.l) + n.a + 24, 12)
#let nome(n) = LETRAS.at(n.l) + if n.a > 0 { "#" * n.a } else if n.a < 0 { "b" * (-n.a) } else { "" }
// intervalo → (passos de letra, semitons)
#let INTERVALOS = (
  "T": (0, 0), "b2": (1, 1), "2": (1, 2), "#2": (1, 3), "b3": (2, 3), "3": (2, 4),
  "4": (3, 5), "#4": (3, 6), "b5": (4, 6), "5": (4, 7), "#5": (4, 8), "b6": (5, 8),
  "6": (5, 9), "bb7": (6, 9), "b7": (6, 10), "7M": (6, 11),
  "b9": (1, 1), "9": (1, 2), "#9": (1, 3), "11": (3, 5), "#11": (3, 6), "b13": (5, 8), "13": (5, 9),
)
#let transp(n, iv) = {
  let (passos, semitons) = INTERVALOS.at(iv)
  let l = calc.rem(n.l + passos, 7)
  let alvo = calc.rem(pc(n) + semitons, 12)
  (l: l, a: calc.rem(alvo - PC-NAT.at(l) + 18, 12) - 6)
}
#let notas-de(raiz, formula) = formula.map(i => nome(transp(nt(raiz), i)))

// Registro para conferência automática (typst query "<chk>")
#let chk(raiz, formula, notas) = [#metadata((raiz: raiz, formula: formula, notas: notas)) <chk>]

// ============================================================
// MAPAS DO BRAÇO
// ============================================================

#let NOMES-PC = ("C", "C#/Db", "D", "D#/Eb", "E", "F", "F#/Gb", "G", "G#/Ab", "A", "A#/Bb", "B")
#let marca(c) = if c == 12 or c == 24 { "••" } else if c > 0 and calc.rem(c, 12) in (3, 5, 7, 9) { "•" } else { "" }

// Cordas: (rótulo, classe de altura da corda solta), da mais grave (topo) à mais aguda.
#let GUITARRA = (("6ª · E", 4), ("5ª · A", 9), ("4ª · D", 2), ("3ª · G", 7), ("2ª · B", 11), ("1ª · E", 4))
#let BAIXO-5 = (("5ª · B", 11), ("4ª · E", 4), ("3ª · A", 9), ("2ª · D", 2), ("1ª · G", 7))

#let mapa-braco(cordas, ini, fim, tam: 10.5pt, tam-acid: 7.5pt, inset-y: 0.42em, destaque-1a: false, instr: "guitarra") = {
  let casas = range(ini, fim + 1)
  let nc = cordas.len()
  let cel(rot, p, c) = {
    let n = NOMES-PC.at(calc.rem(p + c, 12))
    [#metadata((instr: instr, corda: rot, casa: c, nota: n)) <mapa>]
    if n.len() == 1 { text(size: tam, weight: "bold", n) } else { text(size: tam-acid, fill: luma(55), n) }
  }
  align(center, block(radius: 4pt, stroke: 0.75pt + black, clip: true, breakable: false, table(
    columns: (auto,) + (1fr,) * casas.len(),
    align: center + horizon,
    inset: (x: 0.2em, y: inset-y),
    fill: (x, y) => if y == 0 { luma(50) } else if y == nc + 1 { white } else if x == 0 { luma(240) } else if calc.even(y) { luma(240) } else { white },
    stroke: (x, y) => {
      let base = 0.5pt + black
      if y == nc + 1 { (top: 0.75pt + black, rest: none) } else if ini == 0 and x == 1 and y > 0 { (right: 2.2pt + black, rest: base) } else { base }
    },
    table.header(
      text(fill: white, weight: "bold", size: 8.5pt)[Corda],
      ..casas.map(c => text(fill: white, weight: "bold", size: 9pt)[#c]),
    ),
    ..cordas
      .map(cd => {
        let (rot, p) = cd
        (text(size: 8.5pt, weight: "bold", rot),) + casas.map(c => cel(rot, p, c))
      })
      .flatten(),
    text(size: 7.5pt, fill: color-muted)[marcadores],
    ..casas.map(c => text(size: 11pt, weight: "bold", marca(c))),
  )))
}

// Braço só com notas naturais (Dó destacado em cinza)
#let naturais(cordas-pc, ini, fim) = cordas-pc.map(p => range(ini, fim + 1).map(c => {
  let n = NOMES-PC.at(calc.rem(p + c, 12))
  if n.len() > 1 { "" } else if n == "C" { "*C" } else { n }
}))

// ============================================================
// CONTEÚDO
// ============================================================

= Notas no Braço

Saber o nome de cada nota em qualquer casa permite montar acordes, escalas e arpejos a partir de qualquer tônica. Aqui estão o mapa completo da guitarra/violão em afinação padrão, uma versão só com naturais, o mapa do baixo e os atalhos de oitavas e uníssonos. *Como usar:* comece memorizando as notas naturais das cordas 6 e 5; depois use as oitavas para encontrar a mesma nota nas outras cordas.

== 1. Afinação padrão

#tabela-resumo(
  ([Corda], [6ª (grave)], [5ª], [4ª], [3ª], [2ª], [1ª (aguda)]),
  (
    ([Nota], [*E* (Mi)], [*A* (Lá)], [*D* (Ré)], [*G* (Sol)], [*B* (Si)], [*E* (Mi)]),
    ([Altura], [E2], [A2], [D3], [G3], [B3], [E4]),
    ([Frequência], [82,4 Hz], [110,0 Hz], [146,8 Hz], [196,0 Hz], [246,9 Hz], [329,6 Hz]),
  ),
  columns: (1.1fr,) + (1fr,) * 6,
  inset: (x: 0.4em, y: 0.38em),
  tamanho: 9.5pt,
)

#nota-rodape[Altura em índice científico (Dó central = C4). Entre cordas vizinhas há uma 4ª justa (5 semitons), exceto G → B: 3ª maior (4 semitons).]

== 2. Notas naturais (para memorizar)

#intro[Entre duas naturais há sempre uma casa vazia, exceto em *Mi–Fá* e *Si–Dó* (casas vizinhas). Dó em cinza, para você enxergar o desenho das oitavas. A 6ª corda (Mi grave) fica no topo; à esquerda, as cordas soltas (casa 0).]

#align(center, braco-notas(
  naturais(GUITARRA.map(c => c.at(1)), 1, 12),
  fs: 1,
  cordas: ("E", "A", "D", "G", "B", "E"),
  casa-largura: 35pt,
  tamanho-rotulo: 8pt,
))

== 3. Casas das notas naturais em cada corda

#tabela-resumo(
  ([Corda], [C], [D], [E], [F], [G], [A], [B]),
  GUITARRA.map(cd => {
    let (rot, p) = cd
    (rot,) + (0, 2, 4, 5, 7, 9, 11).map(alvo => {
      let c = calc.rem(alvo - p + 12, 12)
      if c == 0 { [0 / 12] } else { [#c] }
    })
  }),
  columns: (1.2fr,) + (1fr,) * 7,
  inset: (x: 0.4em, y: 0.32em),
  tamanho: 9.5pt,
)

#page(flipped: true)[
  == 4. Mapa cromático completo — guitarra e violão (casas 0 a 24)

  #intro[Cada casa sobe um semitom. As notas naturais estão em negrito; as demais aparecem com os dois nomes (sustenido/bemol). A linha grossa após a casa 0 representa a pestana (nut).]

  #mapa-braco(GUITARRA, 0, 12)

  #v(0.9em)

  #mapa-braco(GUITARRA, 12, 24)

  #nota-rodape[Casas 12 a 24: mesmas notas das casas 0 a 12, uma oitava acima (a casa 12 + n repete a casa n). Violões clássicos costumam ter 19 casas; guitarras, de 21 a 24.]
]

== 5. Baixo elétrico (4 e 5 cordas)

#intro[O baixo de 4 cordas é afinado *E – A – D – G*, como as quatro cordas graves da guitarra, uma oitava abaixo (E1, A1, D2, G2). O baixo de 5 cordas acrescenta um *Si grave* (B0) abaixo do Mi, mostrado na primeira linha. As casas e os nomes das notas seguem exatamente a mesma lógica da guitarra.]

#mapa-braco(BAIXO-5, 0, 12, tam: 10pt, tam-acid: 6.8pt, instr: "baixo")

#nota-rodape[No baixo de 4 cordas, ignore a primeira linha (5ª corda · B). Baixos de 6 cordas acrescentam ainda um Dó agudo (C) acima do Sol.]

== 6. Uníssonos e oitavas

#grid(
  columns: (1fr, 1.25fr),
  gutter: 1em,
  [
    #tabela-resumo(
      ([Mesma nota (uníssono)], [Corda solta]),
      (
        ([6ª corda, casa 5], [5ª (A)]),
        ([5ª corda, casa 5], [4ª (D)]),
        ([4ª corda, casa 5], [3ª (G)]),
        ([3ª corda, casa 4], [2ª (B)]),
        ([2ª corda, casa 5], [1ª (E)]),
      ),
      columns: (1.4fr, 1fr),
      inset: (x: 0.5em, y: 0.45em),
      tamanho: 9.5pt,
    )
    #nota-rodape[Regra geral: a nota da casa *n* aparece na corda vizinha mais aguda na casa *n − 5*; da 3ª para a 2ª, na casa *n − 4*. É assim que se afina “pela 5ª casa”.]
  ],
  [
    #tabela-resumo(
      ([Oitava acima], [Desloc.], [Exemplo]),
      (
        ([6ª → 4ª], [+2 casas], [C: 6ª c8 → 4ª c10]),
        ([5ª → 3ª], [+2 casas], [C: 5ª c3 → 3ª c5]),
        ([4ª → 2ª], [+3 casas], [F: 4ª c3 → 2ª c6]),
        ([3ª → 1ª], [+3 casas], [C: 3ª c5 → 1ª c8]),
        ([6ª → 3ª], [−3 casas], [C: 6ª c8 → 3ª c5]),
        ([5ª → 2ª], [−2 casas], [C: 5ª c3 → 2ª c1]),
        ([4ª → 1ª], [−2 casas], [C: 4ª c10 → 1ª c8]),
        ([mesma corda], [+12 casas], [C: 5ª c3 → 5ª c15]),
        ([6ª → 1ª (2 oitavas)], [mesma casa], [C: 6ª c8 → 1ª c8]),
      ),
      columns: (1.25fr, 0.9fr, 1.45fr),
      inset: (x: 0.45em, y: 0.45em),
      tamanho: 9.5pt,
    )
  ],
)

#v(0.6em)
#aviso("dica")[Sempre que o desenho de oitava atravessa a corda Si (2ª), acrescente uma casa ao deslocamento: é o mesmo motivo pelo qual a afinação “pela 5ª casa” vira “pela 4ª casa” entre a 3ª e a 2ª corda.]

== 7. Marcadores de casas

#tabela-resumo(
  ([Casas com marcador], [Tipo], [Notas na 6ª corda], [Notas na 5ª corda]),
  (
    ([3 · 5 · 7 · 9], [ponto simples], [G · A · B · C\#/Db], [C · D · E · F\#/Gb]),
    ([12], [ponto duplo (oitava)], [E (oitava da corda solta)], [A (oitava da corda solta)]),
    ([15 · 17 · 19 · 21], [ponto simples], [G · A · B · C\#/Db], [C · D · E · F\#/Gb]),
    ([24], [ponto duplo (2 oitavas)], [E], [A]),
  ),
  columns: (1.2fr, 1.2fr, 1.5fr, 1.5fr),
  inset: (x: 0.45em, y: 0.45em),
  tamanho: 9.5pt,
)

#nota-rodape[Violões clássicos normalmente não têm marcadores na escala, apenas pontos na lateral do braço (em geral nas casas 5, 7, 9 e 12). Em algumas guitarras há também marcação na casa 1.]
