// Tons neutros (escala de cinza)
#let color-ink = luma(15)   // texto principal
#let color-strong = luma(30)   // negrito em destaque (nome, rótulos)
#let color-secondary = luma(70)   // textos secundários (header, info de rodapé)
#let color-muted = luma(110)  // textos sutis (bullet separador, nível)
#let color-rule-dark = luma(130)  // linhas / divisores visíveis
#let color-rule-light = luma(170)  // linhas sutis (separador de seção)
#let color-subtle-bg = luma(235)  // fundo de caixas leves

// Cor de marca — azul profundo, imprime bem em P&B e colorido
#let color-brand = rgb("#1A3A5C")  // azul marinho (headings, acentos)
#let color-brand-soft = rgb("#2E5F8A")  // variante mais clara para sub-acentos

// Cor de detalhe — verde escuro sóbrio, legível no papel
#let color-accent = rgb("#1F5C3A")  // verde escuro (tabelas, destaques)
#let color-accent-soft = rgb("#2E7D52") // variante mais clara

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
      #set text(font: "Linux Libertine", size: 10pt)
      #align(right)[
        #text(weight: "bold", fill: color-secondary)[#instrumento]
        #text(fill: color-muted)[ #h(5pt) • #h(5pt) #nivel ]
      ]
    ],
    footer: context [
      #set text(font: "Linux Libertine", size: 10pt)
      #line(length: 100%, stroke: 0.5pt + color-rule-dark)

      #let separator = h(5pt) + "•" + h(5pt)

      #grid(
        columns: (1fr, auto),
        align: (left + horizon, right + horizon),
        // Left side: Logo and Info
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
            text(fill: color-muted)[
              #CONTACT_INFO.instagram #separator
              #CONTACT_INFO.phone #separator
              #CONTACT_INFO.website #separator
              #CONTACT_INFO.email
            ],
          ),
        ),
        // Right side: Page numbering
        text(weight: "bold", size: 11pt, fill: color-secondary)[
          #counter(page).display("01")
        ],
      )
    ],
  )

  // Text and Paragraph Styles
  set text(font: "Linux Libertine", size: 11pt, fill: color-ink)
  set par(justify: true, leading: 0.80em)

  // Heading Rules
  show heading.where(level: 1): it => align(center, block(
    below: 1.5em,
    text(size: 24pt, weight: "bold", fill: color-brand, it.body),
  ))

  show heading.where(level: 2): it => block(
    above: 1.5em,
    below: 1em,
    text(size: 14pt, weight: "bold", fill: color-brand-soft, it.body),
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
