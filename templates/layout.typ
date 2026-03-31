#let CONTACT_INFO = (
  name: "Allan Somensi",
  instagram: "@allansomensi",
  phone: "(54) 98118-7806",
  website: "allansomensi.com.br",
  email: "contato@allansomensi.com.br",
)

#let aula(
  module: "Guitarra / Violão",
  level: "Iniciante / Intermediário / Avançado",
  logo_path: "../assets/logo.svg",
  body,
) = {
  // Page Settings
  set page(
    margin: (top: 2.5cm, bottom: 3cm, x: 2cm),
    header: [
      #set text(font: "Linux Libertine", size: 10pt)
      #align(right)[
        #text(weight: "bold", fill: luma(80))[#module]
        #text(fill: luma(150))[ #h(5pt) • #h(5pt) #level ]
      ]
    ],
    footer: context [
      #set text(font: "Linux Libertine", size: 10pt)
      #line(length: 100%, stroke: 0.5pt + luma(220))

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
          box(width: 0.5pt, height: 24pt, fill: luma(220)),
          stack(
            dir: ttb,
            spacing: 5pt,
            text(weight: "bold", size: 12pt, fill: luma(40), CONTACT_INFO.name),
            text(fill: luma(120))[
              #CONTACT_INFO.instagram #separator
              #CONTACT_INFO.phone #separator
              #CONTACT_INFO.website #separator
              #CONTACT_INFO.email
            ],
          ),
        ),
        // Right side: Page numbering
        text(weight: "bold", size: 11pt, fill: luma(160))[
          #counter(page).display("01")
        ],
      )
    ],
  )

  // Text and Paragraph Styles
  set text(font: "Linux Libertine", size: 11pt)
  set par(justify: true, leading: 0.80em)

  // Heading Rules
  show heading.where(level: 1): it => align(center, block(
    below: 1.5em,
    text(size: 24pt, weight: "bold", it.body),
  ))

  show heading.where(level: 2): it => block(
    above: 1.5em,
    below: 1em,
    text(size: 14pt, weight: "bold", it.body),
  )

  body
}

// Explainer component for images and text side-by-side
#let explainer-component(image_content, text_content, inverted: false) = {
  block(below: 1.5em)[
    #let column_ratios = if inverted { (1fr, 1.5fr) } else { (1.5fr, 1fr) }
    #let final_content = if inverted { (image_content, text_content) } else { (text_content, image_content) }
    #grid(columns: column_ratios, gutter: 2em, align: horizon, ..final_content)
  ]
}
