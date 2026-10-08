#let color-ink = luma(15)          // Texto principal (preto suavizado)
#let color-strong = luma(0)        // Negrito em destaque / títulos principais
#let color-secondary = luma(70)    // Textos secundários (header, rodapé, legendas)
#let color-muted = luma(110)       // Textos sutis (observações, bullets de apoio)
#let color-rule-dark = luma(60)    // Linhas / divisores visíveis, bordas de caixas
#let color-rule-light = luma(170)  // Linhas sutis (separador de seção, grades leves)
#let color-subtle-bg = luma(240)   // Fundo de caixas — visível mas econômico em tinta
#let color-subtle-bg-alt = luma(222) // Fundo mais forte — cabeçalhos de tabela, zebra-striping
#let color-brand = luma(0)         // Headings principais (H1)
#let color-brand-soft = luma(35)   // Sub-headings (H2) — grafite
#let color-accent = luma(0)        // Tabelas e destaques fortes
#let color-accent-soft = luma(60)  // Variante para sub-destaques

// ============================================================
// CONTATO
// ============================================================

#let CONTACT_INFO = (
  name: "Allan Somensi",
  instagram: "@allansomensi",
  phone: "(54) 98118-7806",
  website: "allansomensi.com.br",
  email: "contato@allansomensi.com.br",
)

// ============================================================
// TEMPLATE PRINCIPAL
// ============================================================

#let aula(
  instrumento: "Guitarra / Violão",
  nivel: "Iniciante / Intermediário / Avançado",
  logo_path: "../assets/logo.svg",
  body,
) = {
  // Page Settings
  set page(
    margin: (top: 2.5cm, bottom: 3cm, x: 2cm),
    header: [
      #set text(font: "Linux Libertine", size: 9.5pt)
      #align(right)[
        #text(weight: "bold", fill: color-secondary, tracking: 0.3pt)[#instrumento]
        #text(fill: color-muted)[ #h(5pt) • #h(5pt) #nivel ]
      ]
    ],
    footer: context [
      #set text(font: "Linux Libertine", size: 10pt)
      #line(length: 100%, stroke: 0.5pt + color-rule-dark)

      #let separator = h(5pt) + "•" + h(5pt)

      // Verifica se a página atual (física) é a página 1 (capa)
      #let is-cover = here().page() == 1

      #grid(
        columns: (1fr, auto),
        align: (left + horizon, right + horizon),
        // Lado Esquerdo: Logo e Informações
        grid(
          columns: (auto, auto, auto),
          gutter: 6pt,
          align: horizon,
          image(logo_path, height: 26pt),
          box(width: 0.5pt, height: 24pt, fill: color-rule-dark),
          stack(
            dir: ttb,
            spacing: 5pt,
            text(weight: "bold", size: 12pt, fill: color-strong, CONTACT_INFO.name),
            text(size: 8.5pt, fill: color-muted)[
              #CONTACT_INFO.instagram #separator
              #CONTACT_INFO.phone #separator
              #CONTACT_INFO.website #separator
              #CONTACT_INFO.email
            ],
          ),
        ),
        text(weight: "bold", size: 11pt, fill: color-secondary)[
          #if not is-cover [
            #counter(page).display(n => if n < 10 { "0" + str(n) } else { str(n) })
          ]
        ],
      )
    ],
  )

  // Text and Paragraph Styles
  set text(font: "Linux Libertine", size: 11pt, fill: color-ink)
  set par(justify: true, leading: 0.95em, first-line-indent: 0pt)

  // Heading Rules
  // H1 — Título de abertura de aula/capítulo. Centralizado, com regra fina
  show heading.where(level: 1): it => align(center, block(
    above: 0.5em,
    below: 1.8em,
    [
      #text(size: 23pt, weight: "bold", fill: color-brand, it.body)
      #v(0em)
      #box(width: 3.2cm, line(length: 100%, stroke: 1pt + color-rule-dark))
    ],
  ))

  // H2 — Seção principal. Barra vertical à esquerda, estilo "marcador didático".
  show heading.where(level: 2): it => block(
    above: 1.6em,
    below: 1em,
    [
      #box(width: 3pt, height: 0.85em, fill: color-brand-soft, baseline: 15%)
      #h(6pt)
      #text(size: 13.5pt, weight: "bold", fill: color-brand-soft, it.body)
    ],
  )

  // H3 — Subseção. Discreto, itálico grafite, sem numeração visual pesada,
  // para não competir com H2 mas ainda marcar hierarquia com clareza.
  show heading.where(level: 3): it => block(
    above: 1.1em,
    below: 0.7em,
    text(size: 11.5pt, weight: "bold", style: "italic", fill: color-secondary, it.body),
  )

  body
}

// ============================================================
// COMPONENTE: Explainer (imagem + texto lado a lado)
// ============================================================

#let explainer-component(image_content, text_content, inverted: false) = {
  block(below: 1.5em)[
    #let column_ratios = if inverted { (1fr, 1.5fr) } else { (1.5fr, 1fr) }
    #let final_content = if inverted { (image_content, text_content) } else { (text_content, image_content) }
    #grid(columns: column_ratios, gutter: 2em, align: horizon, ..final_content)
  ]
}

// ============================================================
// COMPONENTE: Caixa de Destaque / Dica
// ============================================================
#let caixa-destaque(body, width: 85%) = {
  align(center)[
    #block(
      fill: color-subtle-bg,
      stroke: 0.5pt + color-rule-dark,
      inset: 12pt,
      radius: 5pt,
      width: width,
      body,
    )
  ]
}
