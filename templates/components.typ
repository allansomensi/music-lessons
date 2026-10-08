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
    table.header(..headers.map(h => text(weight: "bold", h))),
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
        #set align(left)
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


// ============================================================
// COMPONENTES DIDÁTICOS — EXERCÍCIOS, GABARITO E PRÁTICA
// ============================================================
// Peças pensadas para aulas com exercícios impressos: tudo em
// tons de cinza, com áreas de resposta generosas para escrita à
// mão e gabarito separado no final do documento.
//
// ÍNDICE:
//   objetivos        → caixa "Nesta aula você vai…" no início da aula
//   exercicio        → cabeçalho numerado automaticamente (Exercício 1, 2…)
//   linhas-resposta  → linhas pautadas para resposta escrita
//   tabela-preencher → tabela com células vazias para completar
//   tab              → bloco de tablatura em fonte monoespaçada
//   tab-vazia        → pauta de tablatura em branco (6 ou 4 cordas)
//   braco-notas      → braço com rótulos dentro dos círculos (notas,
//                       graus, intervalos), também para baixo
//   braco-vazio      → braço em branco para o aluno preencher
//   rotina-estudo    → tabela de sugestão de prática (atividade / tempo / BPM)
//   checklist        → lista de verificação com caixas ☐
//   gabarito         → abre a seção de respostas em página própria
//   resposta         → item do gabarito (número + resposta)
// ============================================================


// ------------------------------------------------------------
// OBJETIVOS
// ------------------------------------------------------------
// Uso:
//   #objetivos((
//     [Entender o que é uma pestana],
//     [Montar acordes maiores e menores em qualquer tom],
//   ))

#let objetivos(items, titulo: "Nesta aula você vai") = {
  block(
    width: 100%,
    fill: color-subtle-bg,
    stroke: (left: 3pt + color-strong, rest: 0.5pt + color-rule-dark),
    inset: (x: 14pt, y: 11pt),
    radius: (right: 5pt),
    below: 1.4em,
    [
      #text(size: 9pt, weight: "bold", tracking: 1.2pt, fill: color-secondary)[#upper(titulo)]
      #v(0.35em)
      #set text(size: 10pt)
      #grid(
        columns: (auto, 1fr),
        column-gutter: 0.6em,
        row-gutter: 0.55em,
        ..items.map(i => (text(fill: color-strong, size: 9pt)[▸], i)).flatten(),
      )
    ],
  )
}




// ------------------------------------------------------------
// EXERCÍCIO
// ------------------------------------------------------------
// Cabeçalho numerado automaticamente. A numeração reinicia a
// cada documento. Use `pontos` ou `nivel` para metadados opcionais.
//
// Uso:
//   #exercicio(titulo: "Monte as tríades")[
//     Escreva as notas de cada tríade pedida.
//   ]

#let contador-exercicio = counter("exercicio")

#let exercicio(body, titulo: none, nivel: none) = {
  contador-exercicio.step()
  block(
    width: 100%,
    above: 1.5em,
    below: 0.9em,
    breakable: true,
    [
      #block(
        width: 100%,
        below: 0.7em,
        stroke: (bottom: 0.6pt + color-rule-dark),
        inset: (bottom: 4pt),
        grid(
          columns: (auto, 1fr, auto),
          column-gutter: 8pt,
          align: (left + horizon, left + horizon, right + horizon),
          box(
            fill: color-strong,
            inset: (x: 6pt, y: 3.5pt),
            radius: 2pt,
            text(fill: white, weight: "bold", size: 9.5pt)[
              EXERCÍCIO #context contador-exercicio.display()
            ],
          ),
          if titulo != none { text(weight: "bold", size: 11pt, fill: color-strong, titulo) },
          if nivel != none { text(size: 8.5pt, fill: color-muted, style: "italic", nivel) },
        ),
      )
      #body
    ],
  )
}


// ------------------------------------------------------------
// LINHAS DE RESPOSTA
// ------------------------------------------------------------
// Uso:
//   #linhas-resposta(3)

#let linhas-resposta(n, espaco: 0.95cm) = {
  block(width: 100%, above: 0.4em, below: 0.8em)[
    #for _ in range(n) {
      v(espaco - 0.5pt)
      line(length: 100%, stroke: 0.5pt + color-rule-light)
    }
  ]
}


// ------------------------------------------------------------
// TABELA PARA PREENCHER
// ------------------------------------------------------------
// Igual à `tabela`, mas aceita `none` nas células para deixar o
// espaço em branco (com altura mínima confortável para escrita).
//
// Uso:
//   #tabela-preencher(
//     ([*Acorde*], [*T*], [*3*], [*5*]),
//     (
//       ([C], none, none, none),
//       ([D], none, none, none),
//     ),
//   )

#let tabela-preencher(
  headers,
  rows,
  columns: none,
  altura: 0.85cm,
  alinhamento: center + horizon,
  width: 100%,
) = {
  let ncols = headers.len()
  let cols = if columns == none { (1fr,) * ncols } else { columns }
  let celula(c) = if c == none { box(height: altura - 14pt, width: 100%) } else { c }

  align(center, block(
    stroke: 0.5pt + color-rule-dark,
    radius: 6pt,
    clip: true,
    width: width,
    table(
      columns: cols,
      align: alinhamento,
      stroke: 0.5pt + color-rule-light,
      inset: (x: 7pt, y: 7pt),
      fill: (c, r) => if r == 0 { color-subtle-bg-alt } else if c == 0 { color-subtle-bg } else { white },
      table.header(..headers.map(h => text(weight: "bold", h))),
      ..rows.flatten().map(celula),
    ),
  ))
}


// ------------------------------------------------------------
// TAB (tablatura em texto)
// ------------------------------------------------------------
// Bloco de tablatura em fonte monoespaçada. Prefira escrever a
// tab com o mesmo número de caracteres por linha.
//
// Uso:
//   #tab(titulo: "Riff 1", "e|-----0-----|\nB|---1---1---|")

#let tab(conteudo, titulo: none, legenda: none, tamanho: 8.8pt) = {
  align(center, block(
    fill: color-subtle-bg,
    stroke: 0.5pt + color-rule-dark,
    inset: (x: 14pt, y: 10pt),
    radius: 5pt,
    breakable: false,
    [
      #if titulo != none [
        #align(left, text(size: 9pt, weight: "bold", fill: color-strong, titulo))
        #v(-0.2em)
      ]
      #align(left, text(size: tamanho, raw(conteudo, block: true, lang: none)))
      #if legenda != none [
        #v(-0.2em)
        #align(left, text(size: 8pt, fill: color-muted, legenda))
      ]
    ],
  ))
}


// ------------------------------------------------------------
// TAB VAZIA (pauta em branco)
// ------------------------------------------------------------
// Pauta de tablatura em branco para o aluno escrever. Use
// `cordas: 4` para baixo e `compassos` para dividir em barras.
//
// Uso:
//   #tab-vazia(sistemas: 2, compassos: 4)

#let tab-vazia(sistemas: 1, compassos: 4, cordas: 6, altura-linha: 7pt) = {
  let nomes = if cordas == 6 { ("e", "B", "G", "D", "A", "E") } else if cordas == 5 {
    ("G", "D", "A", "E", "B")
  } else { ("G", "D", "A", "E") }
  let alt = altura-linha * (cordas - 1)
  for _ in range(sistemas) {
    block(width: 100%, above: 1.1em, below: 1.1em, breakable: false)[
      #grid(
        columns: (12pt, 1fr),
        align: (right + top, left + top),
        column-gutter: 3pt,
        stack(dir: ttb, ..nomes.map(n => box(height: altura-linha, align(horizon, text(size: 6.5pt, fill: color-secondary, raw(n)))))),
        box(width: 100%, height: altura-linha * cordas, {
          for i in range(cordas) {
            place(top + left, dy: altura-linha * i + altura-linha / 2, line(length: 100%, stroke: 0.45pt + color-rule-dark))
          }
          for c in range(compassos + 1) {
            place(
              top + left,
              dx: 100% * (c / compassos),
              dy: altura-linha / 2,
              line(angle: 90deg, length: alt, stroke: (if c == 0 or c == compassos { 1pt } else { 0.6pt }) + color-strong),
            )
          }
        }),
      )
    ]
  }
}


// ------------------------------------------------------------
// BRAÇO COM RÓTULOS (notas, graus ou intervalos)
// ------------------------------------------------------------
// Cada célula é uma string:
//   ""          → casa vazia
//   "T" ou "R"  → tônica (círculo preto, rótulo branco)
//   "*" + texto → nota de destaque (círculo cinza), ex.: "*3"
//   outro texto → círculo com contorno e o rótulo dentro, ex.: "b3"
//
// A primeira linha de `dados` é a corda mais grave (6ª na
// guitarra, 4ª no baixo), igual ao componente `braco`.
//
// Uso:
//   #braco-notas(fs: 5, (
//     ("T", "", "", "b3"),
//     ("4", "", "5", ""),
//     ...
//   ))
//
// Parâmetros:
//   fs          — número da primeira casa exibida
//   cordas      — rótulos das cordas (default: 6..1); passe
//                 ("4","3","2","1") ou ("E","A","D","G") para baixo
//   casa-largura — largura de cada casa
//   marcar-casas — casas com bolinha de referência (3,5,7,9,12…)

#let braco-notas(
  dados,
  fs: 1,
  cordas: auto,
  casa-largura: 24pt,
  marcar-casas: (3, 5, 7, 9, 12, 15, 17, 19, 21),
  tamanho-rotulo: 7pt,
) = {
  let nlin = dados.len()
  let nomes = if cordas == auto { range(nlin).map(i => str(nlin - i)) } else { cordas }
  let d = 15pt

  let nd(k) = box(
    width: casa-largura,
    height: 19pt,
    align(center + horizon, {
      place(center + horizon, line(length: casa-largura, stroke: 0.6pt + color-rule-dark))
      if k == "" or k == " " { } else if k == "T" or k == "R" {
        box(width: d, height: d, fill: color-strong, radius: d / 2, align(
          center + horizon,
          text(size: tamanho-rotulo, weight: "bold", fill: white, k),
        ))
      } else if k.starts-with("*") {
        box(width: d, height: d, fill: luma(175), stroke: 1pt + color-strong, radius: d / 2, align(
          center + horizon,
          text(size: tamanho-rotulo, weight: "bold", fill: color-strong, k.slice(1)),
        ))
      } else {
        box(width: d, height: d, fill: white, stroke: 1pt + color-strong, radius: d / 2, align(
          center + horizon,
          text(size: tamanho-rotulo, weight: "bold", fill: color-strong, k),
        ))
      }
    }),
  )

  let nf = dados.at(0).len()
  let hdr = ([],) + range(nf).map(i => {
    let casa = fs + i
    align(center, text(
      size: 7.5pt,
      weight: if casa in marcar-casas { "bold" } else { "regular" },
      fill: if casa in marcar-casas { color-strong } else { color-muted },
    )[#casa])
  })
  let bdy = dados
    .enumerate()
    .map(p => {
      let (i, row) = p
      (align(center, text(size: 7.5pt, fill: color-strong, weight: "bold", nomes.at(i))),) + row.map(nd)
    })
    .flatten()

  table(
    columns: (15pt,) + range(nf).map(_ => casa-largura),
    align: center + horizon,
    inset: (x: 0pt, y: 2.5pt),
    stroke: (x, y) => {
      if y == 0 { (bottom: 0.6pt + color-strong) } else if x == 0 {
        (right: if fs == 1 { 2.5pt + color-strong } else { 0.6pt + color-strong })
      } else { (right: 0.6pt + color-rule-dark) }
    },
    fill: (c, r) => if r == 0 or c == 0 { color-subtle-bg } else { white },
    ..hdr, ..bdy,
  )
}


// ------------------------------------------------------------
// BRAÇO VAZIO
// ------------------------------------------------------------
// Uso:
//   #braco-vazio(casas: 12)          // guitarra, casas 1–12
//   #braco-vazio(casas: 5, fs: 5, cordas: ("4","3","2","1"))

#let braco-vazio(casas: 12, fs: 1, num-cordas: 6, cordas: auto, casa-largura: 24pt) = {
  braco-notas(
    range(num-cordas).map(_ => range(casas).map(_ => "")),
    fs: fs,
    cordas: cordas,
    casa-largura: casa-largura,
  )
}


// ------------------------------------------------------------
// ROTINA DE ESTUDO
// ------------------------------------------------------------
// Tabela de sugestão de prática. Cada item: (atividade, tempo, bpm).
// Sem controle por dia por padrão (dias: 0); passe `dias: N` para
// acrescentar N colunas de caixas de verificação.
//
// Uso:
//   #rotina-estudo((
//     ([Aquecimento cromático 1-2-3-4], [5 min], [60–80]),
//     ([Troca C → G → Am → F], [10 min], [70]),
//   ))

#let rotina-estudo(items, dias: 0) = {
  let caixa-check = box(width: 9pt, height: 9pt, stroke: 0.6pt + color-strong, radius: 1.5pt)
  align(center, block(
    stroke: 0.5pt + color-rule-dark,
    radius: 6pt,
    clip: true,
    width: 100%,
    table(
      columns: (1fr, auto, auto) + (16pt,) * dias,
      align: (c, r) => if c == 0 { left + horizon } else { center + horizon },
      stroke: 0.5pt + color-rule-light,
      inset: (x: 7pt, y: 6.5pt),
      fill: (c, r) => if r == 0 { color-subtle-bg-alt } else if calc.even(r) { color-subtle-bg } else { white },
      text(weight: "bold")[Atividade],
      text(weight: "bold")[Tempo],
      text(weight: "bold")[BPM],
      ..range(dias).map(i => text(size: 8pt, weight: "bold")[D#(i + 1)]),
      ..items.map(it => (it.at(0), it.at(1), it.at(2)) + (caixa-check,) * dias).flatten(),
    ),
  ))
}


// ------------------------------------------------------------
// CHECKLIST
// ------------------------------------------------------------
// Uso:
//   #checklist(([Toco a escala sem olhar], [Mantenho o tempo a 80 BPM]))

#let checklist(items, titulo: none) = {
  block(width: 100%, inset: (y: 4pt))[
    #if titulo != none [
      #text(weight: "bold", size: 10pt, fill: color-strong, titulo)
      #v(0.3em)
    ]
    #grid(
      columns: (auto, 1fr),
      column-gutter: 0.7em,
      row-gutter: 0.7em,
      align: (center + top, left + top),
      ..items
        .map(i => (box(width: 10pt, height: 10pt, stroke: 0.7pt + color-strong, radius: 1.5pt, baseline: 1pt), i))
        .flatten(),
    )
  ]
}


// ------------------------------------------------------------
// GABARITO
// ------------------------------------------------------------
// Abre uma página de respostas. Coloque no final do documento.
// `resposta` formata cada item com o número do exercício.
//
// Uso:
//   #gabarito[
//     #resposta(1)[C – E – G]
//     #resposta(2)[Am7: A – C – E – G]
//   ]

#let gabarito(body, titulo: "Gabarito") = {
  pagebreak(weak: true)
  align(center, block(below: 1.4em)[
    #text(size: 9pt, weight: "bold", tracking: 2pt, fill: color-secondary)[RESPOSTAS]
    #v(-0.3em)
    #text(size: 18pt, weight: "bold", fill: color-strong, titulo)
    #v(-0.2em)
    #box(width: 2.4cm, line(length: 100%, stroke: 0.8pt + color-rule-dark))
  ])
  set text(size: 9.5pt)
  body
}

#let resposta(numero, body) = {
  block(
    width: 100%,
    breakable: true,
    above: 0.8em,
    below: 0.8em,
    grid(
      columns: (auto, 1fr),
      column-gutter: 9pt,
      align: (left + top, left + top),
      box(
        stroke: 0.7pt + color-strong,
        inset: (x: 4.5pt, y: 2.5pt),
        radius: 2pt,
        text(size: 8.5pt, weight: "bold", fill: color-strong)[Ex. #numero],
      ),
      body,
    ),
  )
}


// ------------------------------------------------------------
// FIGURAS RÍTMICAS (notas e pausas desenhadas)
// ------------------------------------------------------------
// Desenhadas com formas nativas do Typst, sem depender de fontes
// musicais — imprimem igual em qualquer máquina.
//
// Uso:
//   #nota("seminima")                  // ♩
//   #nota("colcheia", ponto: true)     // colcheia pontuada
//   #pausa("minima")
//   #grupo-notas(2)                    // 2 colcheias ligadas por barra
//   #grupo-notas(4, barras: 2)         // 4 semicolcheias
//
// Tipos: "semibreve", "minima", "seminima", "colcheia", "semicolcheia"

#let _cabeca(cheia, escala: 1) = {
  let w = 7.4pt * escala
  let h = 5.2pt * escala
  box(width: w, height: h, rotate(-22deg, ellipse(
    width: w,
    height: h,
    fill: if cheia { color-strong } else { white },
    stroke: (if cheia { 0.6pt } else { 1.15pt * escala }) + color-strong,
  )))
}

#let nota(tipo, ponto: false, escala: 1) = {
  let s = escala
  let haste = 19pt * s
  let w = 7.4pt * s
  let h = 5.2pt * s
  let cheia = tipo not in ("semibreve", "minima")
  let com-haste = tipo != "semibreve"
  let bandeiras = if tipo == "colcheia" { 1 } else if tipo == "semicolcheia" { 2 } else { 0 }
  box(width: w + 8pt * s + (if ponto { 4pt * s } else { 0pt }), height: haste + h / 2, baseline: 0pt, {
    place(bottom + left, _cabeca(cheia, escala: s))
    if com-haste {
      place(bottom + left, dx: w - 0.75pt * s, dy: -h / 2, line(angle: -90deg, length: haste, stroke: 0.9pt * s + color-strong))
    }
    for b in range(bandeiras) {
      place(top + left, dx: w - 0.3pt * s, dy: b * 4.6pt * s, curve(
        stroke: 1.5pt * s + color-strong,
        curve.move((0pt, 0pt)),
        curve.cubic((1pt * s, 4pt * s), (7pt * s, 5pt * s), (5pt * s, 11pt * s)),
      ))
    }
    if ponto {
      place(bottom + left, dx: w + 2.5pt * s, dy: -h / 2 + 1.2pt * s, circle(radius: 1.2pt * s, fill: color-strong))
    }
  })
}

#let pausa(tipo, escala: 1) = {
  let s = escala
  let alt = 24pt * s
  box(width: 11pt * s, height: alt, baseline: 0pt, {
    if tipo == "semibreve" {
      place(top + left, dy: 8pt * s, line(length: 11pt * s, stroke: 0.6pt + color-rule-dark))
      place(top + left, dx: 2pt * s, dy: 8pt * s, rect(width: 7pt * s, height: 3.2pt * s, fill: color-strong))
    } else if tipo == "minima" {
      place(top + left, dy: 11.2pt * s, line(length: 11pt * s, stroke: 0.6pt + color-rule-dark))
      place(top + left, dx: 2pt * s, dy: 8pt * s, rect(width: 7pt * s, height: 3.2pt * s, fill: color-strong))
    } else if tipo == "seminima" {
      place(top + left, dx: 2pt * s, curve(
        stroke: (paint: color-strong, thickness: 1.6pt * s, cap: "round", join: "round"),
        curve.move((1.5pt * s, 1pt * s)),
        curve.line((5.5pt * s, 6pt * s)),
        curve.line((2pt * s, 10.5pt * s)),
        curve.line((6pt * s, 15pt * s)),
        curve.cubic((1pt * s, 13pt * s), (0pt * s, 17pt * s), (4pt * s, 21pt * s)),
      ))
    } else {
      let n = if tipo == "semicolcheia" { 2 } else { 1 }
      place(top + left, dx: 2pt * s, dy: 3pt * s, line(start: (7pt * s, 0pt), end: (3pt * s, 17pt * s), stroke: 1pt * s + color-strong))
      for b in range(n) {
        let dy = 3pt * s + b * 5pt * s
        let dx = 2pt * s - b * 1.2pt * s
        place(top + left, dx: dx, dy: dy, circle(radius: 1.7pt * s, fill: color-strong))
        place(top + left, dx: dx + 1pt * s, dy: dy + 1.8pt * s, curve(
          stroke: 0.9pt * s + color-strong,
          curve.move((0pt, 0pt)),
          curve.quad((3pt * s, 1.3pt * s), (7pt * s - b * 1pt * s, -1.7pt * s)),
        ))
      }
    }
  })
}

#let grupo-notas(n, barras: 1, escala: 1, espaco: 9pt) = {
  let s = escala
  let haste = 19pt * s
  let w = 7.4pt * s
  let h = 5.2pt * s
  let passo = w + espaco * s
  let largura = passo * (n - 1) + w
  box(width: largura + 1pt, height: haste + h / 2, baseline: 0pt, {
    for i in range(n) {
      let x = passo * i
      place(bottom + left, dx: x, _cabeca(true, escala: s))
      place(bottom + left, dx: x + w - 0.75pt * s, dy: -h / 2, line(angle: -90deg, length: haste, stroke: 0.9pt * s + color-strong))
    }
    for b in range(barras) {
      place(top + left, dx: w - 0.75pt * s, dy: b * 4.2pt * s, rect(width: passo * (n - 1) + 0.9pt * s, height: 2.6pt * s, fill: color-strong))
    }
  })
}
