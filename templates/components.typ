#import "layout.typ": *

// ============================================================
// COMPONENTS.TYP
// ============================================================
// Biblioteca de widgets reutilizáveis para as aulas. O objetivo
// é você montar uma aula inteira combinando essas peças, sem
// reescrever `table`/`grid`/`block` com os mesmos parâmetros
// toda vez. Todos os componentes já usam a paleta de cores
// definida em layout.typ.
//
// Como importar num arquivo de aula:
//
//   #import "/templates/layout.typ": *
//   #import "/templates/components.typ": *
//   #import "@preview/conchord:0.4.0": new-chordgen
//
// ÍNDICE:
//   tabela           → tabela com cabeçalho + zebra-striping
//   caixa            → callout genérico (dica / atenção / resumo)
//   comparativo      → bloco ✓ / ✗ lado a lado
//   cartoes-info      → N cards de mesmo tamanho lado a lado
//   grid-acordes     → grid de diagramas de acorde com legenda
//   passos           → lista numerada com círculos (①②③...)
//   braco            → diagrama de braço/fretboard (unifica os
//                       helpers que estavam duplicados em 3 aulas)
// ============================================================


// ------------------------------------------------------------
// TABELA
// ------------------------------------------------------------
// Tabela com cabeçalho destacado e zebra-striping automático.
// Substitui o bloco repetido de table(..., fill: (col,row)=>...)
// que aparece em quase toda aula.
//
// Uso:
//   #tabela(
//     columns: (1.5fr, 0.8fr, 1.2fr),
//     headers: ([*Intervalo*], [*Cifra*], [*Distância*]),
//     rows: (
//       ([Segunda Menor], [b2], [1 semitom]),
//       ([Segunda Maior], [2], [1 tom]),
//     ),
//   )
//
// Parâmetros:
//   headers      — array de células do cabeçalho
//   rows         — array de arrays (uma por linha)
//   columns      — larguras das colunas (default: distribui igual)
//   alinhamento  — alinhamento das células (default: center + horizon)
//   zebra        — liga/desliga listras alternadas (default: true)
//   width        — largura do bloco (default: 100%)
//   moldura      — se true, envolve com borda arredondada (default: true)

#let tabela(
  headers,
  rows,
  columns: none,
  alinhamento: center + horizon,
  zebra: true,
  width: 100%,
  moldura: true,
) = {
  let ncols = headers.len()
  let cols = if columns == none { (1fr,) * ncols } else { columns }

  let conteudo = table(
    columns: cols,
    align: alinhamento,
    stroke: 0.5pt + color-rule-light,
    inset: (x: 8pt, y: 7pt),
    fill: (c, r) => {
      if r == 0 { color-subtle-bg-alt } else if zebra {
        if calc.odd(r) { white } else { color-subtle-bg }
      } else {
        white
      }
    },
    ..headers.map(h => text(weight: "bold", h)),
    ..rows.flatten(),
  )

  align(center)[
    #if moldura {
      block(stroke: 0.5pt + color-rule-dark, radius: 6pt, clip: true, width: width, conteudo)
    } else {
      block(width: width, conteudo)
    }
  ]
}


// ------------------------------------------------------------
// CAIXA
// ------------------------------------------------------------
// Callout genérico com barra de destaque à esquerda e rótulo
// opcional em negrito. Use para dicas, avisos e resumos sem
// precisar escrever "*Dica:*" manualmente toda vez.
// (Não substitui `caixa-destaque`, que continua existindo em
// layout.typ para as aulas já prontas — use `caixa` nas aulas novas.)
//
// Uso:
//   #caixa(tipo: "dica")[
//     Pressione a corda logo atrás do traste.
//   ]
//
//   #caixa(tipo: "atencao", titulo: "Cuidado")[
//     Nunca use cordas de aço num violão de nylon.
//   ]
//
// Tipos disponíveis: "neutro" (padrão), "dica", "atencao", "resumo"
// Cada tipo já vem com uma cor de barra e um rótulo padrão — passe
// `titulo: none` explicitamente se quiser omitir o rótulo.

#let caixa(body, tipo: "neutro", titulo: auto, width: 85%) = {
  let cores = (
    neutro: color-rule-dark,
    dica: color-secondary,
    atencao: color-strong,
    resumo: color-brand-soft,
  )
  let rotulos = (
    neutro: none,
    dica: "Dica",
    atencao: "Atenção",
    resumo: "Resumo Rápido",
  )
  let cor-borda = cores.at(tipo, default: color-rule-dark)
  let rotulo = if titulo == auto { rotulos.at(tipo, default: none) } else { titulo }

  align(center)[
    #block(
      fill: color-subtle-bg,
      stroke: (left: 2.5pt + cor-borda, rest: 0.5pt + color-rule-dark),
      inset: 12pt,
      radius: 5pt,
      width: width,
      [
        #if rotulo != none [
          #text(weight: "bold", fill: cor-borda)[#rotulo:] #h(4pt)
        ]
        #body
      ],
    )
  ]
}


// ------------------------------------------------------------
// COMPARATIVO
// ------------------------------------------------------------
// Bloco lado a lado ✓ / ✗ — substitui o par de `block` repetido
// em aulas de técnica ("Correto" vs "Errado").
//
// Uso:
//   #comparativo(
//     titulo-esquerda: "Correto",
//     titulo-direita: "Errado",
//     [Polegar sobre indicador. Pulso relaxado.],
//     [Palheta presa com força. Pulso rígido.],
//   )

#let comparativo(
  esquerda,
  direita,
  titulo-esquerda: "Correto",
  titulo-direita: "Errado",
) = {
  grid(
    columns: (1fr, 1fr),
    gutter: 1em,
    block(
      width: 100%,
      fill: color-subtle-bg,
      stroke: 0.6pt + color-accent,
      inset: 10pt,
      radius: 5pt,
      [
        #align(center)[#text(weight: "bold", size: 10pt, fill: color-accent)[✓ #titulo-esquerda]]
        #v(0.4em)
        #set text(size: 9pt)
        #esquerda
      ],
    ),
    block(
      width: 100%,
      fill: none,
      stroke: 0.6pt + color-rule-dark,
      inset: 10pt,
      radius: 5pt,
      [
        #align(center)[#text(weight: "bold", size: 10pt, fill: color-strong)[✗ #titulo-direita]]
        #v(0.4em)
        #set text(size: 9pt)
        #direita
      ],
    ),
  )
}


// ------------------------------------------------------------
// CARTOES-INFO
// ------------------------------------------------------------
// N cards de largura igual lado a lado, cada um com título +
// corpo. Substitui os grids de blocos usados para TÔNICA /
// SUBDOMINANTE / DOMINANTE, os "4 tipos de tríade", etc.
//
// Uso:
//   #cartoes-info((
//     (titulo: "TÔNICA (T)", corpo: [Estabilidade e repouso...]),
//     (titulo: "SUBDOMINANTE (S)", corpo: [Movimento e preparação...]),
//     (titulo: "DOMINANTE (D)", corpo: [Tensão máxima...]),
//   ))

#let cartoes-info(items, columns: none, gutter: 1em) = {
  let cols = if columns == none { (1fr,) * items.len() } else { columns }
  grid(
    columns: cols,
    gutter: gutter,
    ..items.map(item => block(
      width: 100%,
      fill: color-subtle-bg,
      stroke: 0.5pt + color-rule-dark,
      inset: 12pt,
      radius: 5pt,
      [
        #align(center)[#text(weight: "bold", size: 11pt)[#item.titulo]]
        #v(0.5em)
        #set text(size: 9.5pt)
        #item.corpo
      ],
    )),
  )
}


// ------------------------------------------------------------
// GRID-ACORDES
// ------------------------------------------------------------
// Grid de diagramas de acorde com título e legenda opcional.
// Substitui o `grid(columns: N, block[#box(chord(...)) ...])`
// repetido em praticamente toda aula de guitarra/violão.
//
// Uso:
//   #let chord = new-chordgen(number-to-left: true, use-shadow-barre: false)
//
//   #grid-acordes(
//     chord: chord,
//     columns: 4,
//     items: (
//       (tabs: "x,0,2,2,1,0", titulo: "Am — Lá Menor", detalhe: "2: 4ª/2ª casa"),
//       (tabs: "0,2,2,0,0,0", titulo: "Em — Mi Menor"),
//     ),
//   )
//
// Campos de cada item:
//   tabs      — string de casas no formato do conchord (obrigatório)
//   titulo    — texto em negrito abaixo do diagrama (obrigatório)
//   detalhe   — texto pequeno e cinza abaixo do título (opcional)
//   nome      — nome interno passado ao chord() (opcional, default = titulo)

#let grid-acordes(items, chord: none, columns: 4, gutter: 1.8em) = {
  assert(chord != none, message: "grid-acordes precisa de chord: <função gerada por new-chordgen>")
  align(center)[
    #grid(
      columns: columns,
      gutter: gutter,
      align: center,
      ..items.map(item => block[
        #box(chord(item.tabs, name: item.at("nome", default: item.titulo)))
        #v(0.4em)
        #text(size: 10pt, weight: "bold")[#item.titulo]
        #if "detalhe" in item [
          \
          #text(size: 8.5pt, fill: color-muted)[#item.detalhe]
        ]
      ]),
    )
  ]
}


// ------------------------------------------------------------
// PASSOS
// ------------------------------------------------------------
// Lista numerada com círculos (①②③...), usada em tutoriais
// passo-a-passo (ex: como afinar, como montar um pedalboard).
//
// Uso:
//   #passos((
//     [Prenda o afinador no headstock ou abra o app.],
//     [Toque uma corda solta de cada vez.],
//     [Gire a tarraxa até a corda afinar.],
//   ))

#let passos(items, simbolos: ("①", "②", "③", "④", "⑤", "⑥", "⑦", "⑧", "⑨", "⑩")) = {
  grid(
    columns: (auto, 1fr),
    gutter: 0.8em,
    align: (center + top, left + top),
    ..items
      .enumerate()
      .map(p => {
        let (i, texto) = p
        (
          text(weight: "bold", fill: color-strong, size: 12pt)[#simbolos.at(i, default: [#(i + 1)])],
          texto,
        )
      })
      .flatten(),
  )
}


// ------------------------------------------------------------
// BRAÇO (fretboard)
// ------------------------------------------------------------
// Diagrama de braço/escala, usado para mapear posições de
// escalas e arpejos casa a casa. Unifica os helpers `nd`/`neck`
// que antes estavam copiados (com pequenas divergências) em
// 013-pentatonica-menor, 002-menor-harmonica-melodica e
// 003-cadencias-avancadas.
//
// Uso:
//   #braco(
//     fs: 5,
//     (
//       ("R", " ", " ", "N"),
//       ("N", " ", "N", " "),
//       ("N", " ", "R", " "),
//       ("N", " ", "N", " "),
//       ("N", " ", " ", "N"),
//       ("R", " ", " ", "N"),
//     ),
//   )
//
// Marcadores padrão:
//   "R" → tônica (círculo preto sólido)
//   "N" → nota da escala (círculo com contorno)
//   "X" → nota de destaque/característica (círculo cinza)
//   " " → corda solta / vazia (linha)
//
// Para adicionar marcadores próprios, passe `marcadores: (...)`
// com as mesmas chaves usadas nos seus dados.

#let marcadores-padrao-braco = (
  "R": box(width: 14pt, height: 14pt, fill: color-strong, radius: 7pt),
  "N": box(width: 14pt, height: 14pt, fill: white, stroke: 1pt + color-strong, radius: 7pt),
  "X": box(width: 14pt, height: 14pt, fill: luma(150), stroke: 1pt + color-strong, radius: 7pt),
)

#let braco(dados, fs: 1, marcadores: marcadores-padrao-braco) = {
  let nd(k) = box(
    width: 20pt,
    height: 20pt,
    align(
      center + horizon,
      if k == " " {
        line(start: (0pt, 0pt), end: (20pt, 0pt), stroke: 0.5pt + color-rule-dark)
      } else {
        marcadores.at(k, default: [])
      },
    ),
  )

  let nf = dados.at(0).len()
  let hdr = ([],) + range(nf).map(i => align(center, text(size: 8pt, weight: "bold")[#(fs + i)]))
  let bdy = dados
    .enumerate()
    .map(p => {
      let (i, row) = p
      (align(center, text(size: 8pt, fill: color-strong)[#(6 - i)]),) + row.map(nd)
    })
    .flatten()

  table(
    columns: (15pt,) + range(nf).map(_ => 24pt),
    align: center + horizon,
    inset: (x: 0pt, y: 3pt),
    stroke: (x, y) => if x == 0 or y == 0 { 0.5pt + color-strong } else { 0.4pt + color-rule-dark },
    fill: (c, r) => if r == 0 { color-subtle-bg } else if c == 0 { color-subtle-bg } else { white },
    ..hdr, ..bdy,
  )
}
