#import "/templates/layout.typ": *
#import "/templates/components.typ": *
#import "@preview/conchord:0.4.0": new-chordgen

#show: aula.with(
  instrumento: "Guitarra / Violão",
  nivel: "Exercícios — Iniciante",
)

// ------------------------------------------------------------
// Helpers locais
// ------------------------------------------------------------

#let chord = new-chordgen(number-to-left: true, use-shadow-barre: false, colors: (hold: black, barre: black))

// Exercício curto que não se divide entre páginas.
#let ex(..args, body) = block(breakable: false, width: 100%, exercicio(..args, body))

// Quadro de abertura no mesmo estilo de `objetivos`.
#let quadro(titulo, body) = block(
  width: 100%,
  fill: color-subtle-bg,
  stroke: (left: 3pt + color-strong, rest: 0.5pt + color-rule-dark),
  inset: (x: 14pt, y: 11pt),
  radius: (right: 5pt),
  below: 1.2em,
  [
    #text(size: 9pt, weight: "bold", tracking: 1.2pt, fill: color-secondary)[#upper(titulo)]
    #v(0.2em)
    #set text(size: 9.5pt)
    #set par(justify: false, leading: 0.7em)
    #body
  ],
)

#let lacuna(w: 2.4cm) = box(width: w, height: 0.9em, stroke: (bottom: 0.6pt + color-rule-dark))

// Ciclo das quintas desenhado em tons de cinza: tons maiores por fora,
// relativos menores por dentro e armadura de clave na borda.
#let ciclo(r: 4.2cm) = {
  let maiores = ("C", "G", "D", "A", "E", "B", "F\u{266F}/G\u{266D}", "D\u{266D}", "A\u{266D}", "E\u{266D}", "B\u{266D}", "F")
  let menores = ("Am", "Em", "Bm", "F\u{266F}m", "C\u{266F}m", "G\u{266F}m", "E\u{266D}m", "B\u{266D}m", "Fm", "Cm", "Gm", "Dm")
  let armaduras = ("0", "1\u{266F}", "2\u{266F}", "3\u{266F}", "4\u{266F}", "5\u{266F}", "6\u{266F}/6\u{266D}", "5\u{266D}", "4\u{266D}", "3\u{266D}", "2\u{266D}", "1\u{266D}")
  let pos(raio, i) = {
    let a = 90deg - i * 30deg
    (raio * calc.cos(a), -raio * calc.sin(a))
  }
  box(width: 2 * r + 1cm, height: 2 * r + 1cm, {
    place(center + horizon, circle(radius: r, fill: color-subtle-bg, stroke: 0.6pt + color-rule-dark))
    place(center + horizon, circle(radius: r * 0.74, fill: white, stroke: 0.5pt + color-rule-dark))
    place(center + horizon, circle(radius: r * 0.47, fill: color-subtle-bg, stroke: 0.5pt + color-rule-dark))
    place(center + horizon, circle(radius: r * 0.25, fill: white, stroke: 0.5pt + color-rule-dark))
    for i in range(12) {
      let (x, y) = pos(r * 0.87, i)
      place(center + horizon, dx: x, dy: y, text(size: 7pt, fill: color-secondary, armaduras.at(i)))
      let (x, y) = pos(r * 0.61, i)
      place(center + horizon, dx: x, dy: y, text(size: if i == 6 { 9pt } else { 12pt }, weight: "bold", maiores.at(i)))
      let (x, y) = pos(r * 0.36, i)
      place(center + horizon, dx: x, dy: y, text(size: 8.5pt, menores.at(i)))
    }
    place(center + horizon, align(center, text(size: 6.5pt, fill: color-secondary)[quintas \ ↻ \ quartas \ ↺]))
  })
}

= Cadência II–V–I em Todos os Tons

*Como usar este material.* Estes dois roteiros servem para treinar a cadência *II–V–I* nas doze tonalidades, de forma contínua: cada tom leva naturalmente ao seguinte pelo *ciclo das quartas*. O primeiro roteiro resolve em acordes maiores; o segundo acrescenta uma preparação menor entre um tom e outro. Antes de tocar, leia a seção 1 (o ciclo) e a seção 2 (os desenhos de acorde). Toque cada acorde por quatro tempos, com metrônomo, primeiro devagar; só aumente o andamento quando conseguir trocar os acordes sem parar. Os exercícios escritos do final têm *gabarito*.

#quadro("Conteúdos cobertos")[
  #grid(
    columns: (1.5fr, 2.6fr),
    column-gutter: 1em,
    row-gutter: 0.85em,
    align: (left + top, left + top),
    text(size: 8.5pt, weight: "bold", fill: color-secondary)[BLOCO],
    text(size: 8.5pt, weight: "bold", fill: color-secondary)[TEMAS],
    [*1.* O ciclo das quartas], [Ordem das tonalidades · por que a cadência anda em quartas],
    [*2.* Shapes para tocar], [Desenhos móveis de IIm7, V7, I7M e IIm7(b5) com tônica na 6ª e na 5ª corda],
    [*3.* Roteiro 1], [II–V–I maior nos 12 tons, com a casa de cada desenho],
    [*4.* Roteiro 2], [II–V–I maior + preparação menor IIm7(b5) – V7 para o tom seguinte],
    [*5.* Exercícios de fixação], [Escrever cadências maiores e menores · reconhecer o tom · localizar os shapes (exercícios 1–5)],
  )
  #v(0.3em)
  #line(length: 100%, stroke: 0.4pt + color-rule-light)
  #v(-0.2em)
  #text(size: 8.5pt, fill: color-secondary)[*Convenções:* `IIm7` = segundo grau, acorde menor com sétima; `V7` = quinto grau, dominante; `I7M` = primeiro grau com sétima maior; `m7(b5)` = meio-diminuto. Na cifra, `7` = sétima menor e `7M` = sétima maior.]
]

// ============================================================
== 1. O ciclo das quartas
// ============================================================

No *ciclo das quintas*, os doze tons maiores ficam em círculo. Andando no sentido *horário*, cada tom está uma *quinta acima* do anterior (C → G → D…) e ganha um sustenido na armadura de clave. No sentido *anti-horário*, cada tom está uma *quarta acima* (C → F → Bb…) e ganha um bemol: é o *ciclo das quartas*. No anel interno estão os *relativos menores* (Am é o relativo de C, Em de G, e assim por diante); na borda, a quantidade de acidentes de cada tom.

#align(center, ciclo(r: 3.6cm))

Os roteiros desta apostila seguem o sentido *anti-horário*. O motivo: no II–V–I, cada acorde está uma quarta acima do anterior (Ré → Sol → Dó). Assim, ao encadear os tons em quartas, a cadência nunca "quebra".

// ============================================================
== 2. Shapes para tocar
// ============================================================

Para tocar os roteiros em todos os tons, use dois *padrões móveis* de quatro notas, sem cordas soltas. Em cada um, a tônica do primeiro acorde fica numa corda-guia: na *6ª corda* (padrão A) ou na *5ª corda* (padrão B). Os desenhos abaixo estão em um tom de exemplo; para mudar de tom, leve o padrão inteiro até a casa indicada nas tabelas das seções 3 e 4.

=== Padrão A — IIm7 com tônica na 6ª corda (exemplo em Sol maior)

#block(breakable: false, grid-acordes(
  chord: chord,
  columns: 3,
  gutter: 2.6em,
  (
    (tabs: "5,x,5,5,5,x,*", nome: " ", titulo: "Am7 (IIm7)", detalhe: "tônica na 6ª corda, casa 5"),
    (tabs: "x,5,4,5,3,x,*", nome: " ", titulo: "D7 (V7)", detalhe: "tônica na 5ª corda, casa 5"),
    (tabs: "3,x,4,4,3,x,*", nome: " ", titulo: "G7M (I7M)", detalhe: "tônica na 6ª corda, casa 3"),
  ),
))

=== Padrão B — IIm7 com tônica na 5ª corda (exemplo em Dó maior)

#block(breakable: false, grid-acordes(
  chord: chord,
  columns: 3,
  gutter: 2.6em,
  (
    (tabs: "x,5,7,5,6,x,*", nome: " ", titulo: "Dm7 (IIm7)", detalhe: "tônica na 5ª corda, casa 5"),
    (tabs: "3,x,3,4,3,x,*", nome: " ", titulo: "G7 (V7)", detalhe: "tônica na 6ª corda, casa 3"),
    (tabs: "x,3,5,4,5,x,*", nome: " ", titulo: "C7M (I7M)", detalhe: "tônica na 5ª corda, casa 3"),
  ),
))

#caixa(tipo: "dica", titulo: "Como mover")[
  Nos dois padrões, o *V7* começa na *mesma casa* do IIm7 (na outra corda-guia) e o *I7M* fica *duas casas abaixo*. Para encadear os tons sem grandes saltos, *alterne os padrões*: Sol maior no padrão A (Am7 na casa 5) → Dó maior no padrão B (Dm7 na casa 5) → Fá maior no padrão A (Gm7 na casa 3) → Si bemol maior no padrão B (Cm7 na casa 3)… A cada dois tons, o desenho desce duas casas; quando ficar baixo demais, recomece 12 casas acima.
]

=== Preparação menor (para o roteiro 2)

Os mesmos padrões servem para o *IIm7(b5) – V7* que prepara o acorde menor seguinte. O IIm7(b5) fica *duas casas acima* do acorde-alvo, na mesma corda-guia; o V7 usa o mesmo desenho do padrão (ou a versão com b9, mais tensa).

#block(breakable: false, grid-acordes(
  chord: chord,
  columns: 4,
  gutter: 1.6em,
  (
    (tabs: "5,x,5,5,4,x,*", nome: " ", titulo: "Am7(b5)", detalhe: "6ª corda, casa 5"),
    (tabs: "x,5,4,5,3,x,*", nome: " ", titulo: "D7", detalhe: "5ª corda, casa 5"),
    (tabs: "x,5,4,5,4,x,*", nome: " ", titulo: "D7(b9)", detalhe: "alternativa ao D7"),
    (tabs: "3,x,3,3,3,x,*", nome: " ", titulo: "Gm7 (alvo)", detalhe: "6ª corda, casa 3"),
  ),
))

#v(0.4em)

Com a tônica na 5ª corda, o caminho é o mesmo: *Cm7(b5)* x,3,4,3,4,x → *F7* 1,x,1,2,1,x → *Bbm7* x,1,3,1,2,x.

// ============================================================
== 3. Roteiro 1 — II–V–I maior nos 12 tons
// ============================================================

A cadência II–V–I é a estrutura harmônica mais comum do jazz e da música popular. Neste roteiro, você a toca nas doze tonalidades. Para passar de um tom ao seguinte, a *tônica* do acorde de resolução (I7M) passa a ser a tônica do *V7* do próximo tom, e a cadência recomeça uma quarta acima. Exemplo: depois de *C7M* vem *Gm7 – C7 – F7M* (II–V–I de Fá maior), depois *Cm7 – F7 – Bb7M*, e assim por diante, sempre uma quarta acima (Dó → Fá → Sib…), como no ciclo da seção 1.

#tabela(
  columns: (1.5fr, 1fr, 1fr, 1fr, 1.2fr, 1.2fr),
  ([Tom], [IIm7], [V7], [I7M], [Padrão A: casa], [Padrão B: casa]),
  (
    ([Dó (C)], [Dm7], [G7], [C7M], [10], [5]),
    ([Fá (F)], [Gm7], [C7], [F7M], [3], [10]),
    ([Si bemol (Bb)], [Cm7], [F7], [Bb7M], [8], [3]),
    ([Mi bemol (Eb)], [Fm7], [Bb7], [Eb7M], [13], [8]),
    ([Lá bemol (Ab)], [Bbm7], [Eb7], [Ab7M], [6], [13]),
    ([Ré bemol (Db)], [Ebm7], [Ab7], [Db7M], [11], [6]),
    ([Sol bemol (Gb)], [Abm7], [Db7], [Gb7M], [4], [11]),
    ([Si (B)], [C\#m7], [F\#7], [B7M], [9], [4]),
    ([Mi (E)], [F\#m7], [B7], [E7M], [14], [9]),
    ([Lá (A)], [Bm7], [E7], [A7M], [7], [14]),
    ([Ré (D)], [Em7], [A7], [D7M], [12], [7]),
    ([Sol (G)], [Am7], [D7], [G7M], [5], [12]),
  ),
)

#v(0.3em)
#text(size: 9pt, fill: color-secondary)[As duas últimas colunas indicam a casa da tônica do IIm7 na corda-guia (6ª corda no padrão A, 5ª corda no padrão B). Quando um padrão cair muito alto no braço (casas 13 e 14), prefira o outro. Depois de *Gb7M*, a tabela passa para os sustenidos (*C\#m7*), mais fáceis de ler: Gb e F\# são o mesmo som (notas *enarmônicas*). Depois de G7M, o ciclo volta para Dm7.]

// ============================================================
== 4. Roteiro 2 — com preparação menor
// ============================================================

Agora, entre um tom e o seguinte, entra uma *preparação menor*. Como o alvo da transição é um acorde menor (o IIm7 do próximo tom), ele recebe o seu próprio II–V de tom menor: um acorde *meio-diminuto* (IIm7(b5)) seguido de um *dominante* (V7, que também pode ser tocado como V7(b9)).

#caixa(tipo: "neutro", titulo: "Exemplo de transição")[
  Depois de resolver em *C7M*, o próximo alvo é o *Gm7* (IIm7 de Fá maior). Antes dele, toque o II–V de Sol menor: *Am7(b5) – D7*. A sequência fica: Dm7 – G7 – C7M – *Am7(b5) – D7* → Gm7 – C7 – F7M – *Dm7(b5) – G7* → Cm7…
]

#v(0.4em)

#tabela(
  columns: (1fr, 1fr, 1fr, 1.4fr, 1.1fr, 1.1fr),
  ([IIm7], [V7], [I7M], [IIm7(b5) da prep.], [V7 da prep.], [→ próximo alvo]),
  (
    ([Dm7], [G7], [C7M], [Am7(b5)], [D7], [Gm7]),
    ([Gm7], [C7], [F7M], [Dm7(b5)], [G7], [Cm7]),
    ([Cm7], [F7], [Bb7M], [Gm7(b5)], [C7], [Fm7]),
    ([Fm7], [Bb7], [Eb7M], [Cm7(b5)], [F7], [Bbm7]),
    ([Bbm7], [Eb7], [Ab7M], [Fm7(b5)], [Bb7], [Ebm7]),
    ([Ebm7], [Ab7], [Db7M], [Bbm7(b5)], [Eb7], [Abm7]),
    ([Abm7], [Db7], [Gb7M], [D\#m7(b5)], [G\#7], [C\#m7]),
    ([C\#m7], [F\#7], [B7M], [G\#m7(b5)], [C\#7], [F\#m7]),
    ([F\#m7], [B7], [E7M], [C\#m7(b5)], [F\#7], [Bm7]),
    ([Bm7], [E7], [A7M], [F\#m7(b5)], [B7], [Em7]),
    ([Em7], [A7], [D7M], [Bm7(b5)], [E7], [Am7]),
    ([Am7], [D7], [G7M], [Em7(b5)], [A7], [Dm7]),
  ),
)

#v(0.3em)
#text(size: 9pt, fill: color-secondary)[A última coluna é o primeiro acorde da linha seguinte. Na linha de Gb7M, a preparação já está escrita em sustenidos: D\#m7(b5) – G\#7 equivale a Ebm7(b5) – Ab7.]

// ============================================================
== 5. Exercícios de fixação
// ============================================================

Resolva sem olhar as tabelas; depois confira no gabarito.

#ex(titulo: "II–V–I maior fora de ordem")[
  #tabela-preencher(
    columns: (1.4fr, 1fr, 1fr, 1fr),
    ([Tom], [IIm7], [V7], [I7M]),
    (
      ([Lá maior (A)], none, none, none),
      ([Mi bemol maior (Eb)], none, none, none),
      ([Fá sustenido maior (F\#)], none, none, none),
      ([Ré bemol maior (Db)], none, none, none),
      ([Mi maior (E)], none, none, none),
      ([Si bemol maior (Bb)], none, none, none),
    ),
  )
]

#ex(titulo: "II–V–I menor")[
  Escreva a cadência *IIm7(b5) – V7 – Im7* de cada tom menor.

  #tabela-preencher(
    columns: (1.4fr, 1fr, 1fr, 1fr),
    ([Tom], [IIm7(b5)], [V7], [Im7]),
    (
      ([Lá menor (Am)], none, none, none),
      ([Ré menor (Dm)], none, none, none),
      ([Mi menor (Em)], none, none, none),
      ([Sol menor (Gm)], none, none, none),
      ([Dó menor (Cm)], none, none, none),
      ([Si menor (Bm)], none, none, none),
    ),
  )
]

#ex(titulo: "Qual é o tom?")[
  Cada cadência resolve num tom maior ou menor. Escreva qual.

  #grid(
    columns: (1fr, 1fr),
    row-gutter: 1.1em,
    column-gutter: 1.5em,
    [a) Em7 – A7 – D7M #h(0.4em) #lacuna()], [b) Bbm7 – Eb7 – Ab7M #h(0.4em) #lacuna()],
    [c) F\#m7(b5) – B7 – Em7 #h(0.4em) #lacuna()], [d) Dm7(b5) – G7 – Cm7 #h(0.4em) #lacuna()],
    [e) C\#m7 – F\#7 – B7M #h(0.4em) #lacuna()], [f) Gm7 – C7 – F7M #h(0.4em) #lacuna()],
  )
]

#ex(titulo: "Onde fica o shape?")[
  Escreva a casa da tônica do IIm7 em cada padrão (6ª corda no padrão A, 5ª corda no padrão B). Use casas entre 3 e 12.

  #tabela-preencher(
    columns: (1.4fr, 1fr, 1fr, 1fr, 1fr),
    ([Tom], [Sol (G)], [Si bemol (Bb)], [Ré (D)], [Fá (F)]),
    (
      ([IIm7], none, none, none, none),
      ([Padrão A (6ª)], none, none, none, none),
      ([Padrão B (5ª)], none, none, none, none),
    ),
  )
]

#ex(titulo: "Continue o roteiro 2")[
  A partir de *F7M*, escreva a sequência do roteiro 2 por mais dois tons, até chegar ao I7M de Mi bemol maior.

  #v(0.3em)
  F7M → #lacuna(w: 2.2cm) – #lacuna(w: 1.8cm) → #lacuna(w: 1.8cm) – #lacuna(w: 1.8cm) – #lacuna(w: 1.8cm) → \
  #v(0.6em)
  → #lacuna(w: 2.2cm) – #lacuna(w: 1.8cm) → #lacuna(w: 1.8cm) – #lacuna(w: 1.8cm) – Eb7M
  #v(0.6em)
]

=== Sugestão de prática

#rotina-estudo((
  ([Roteiro 1 só com o padrão A, um tom por vez], [10 min], [60–80]),
  ([Roteiro 1 alternando os padrões A e B, para ficar na mesma região do braço], [10 min], [60–80]),
  ([Roteiro 2 completo (com a preparação menor)], [10 min], [50–70]),
))

=== Autoavaliação

#checklist((
  [Sei a ordem do ciclo das quartas a partir de C],
  [Escrevo o II–V–I maior e o menor de qualquer tom],
  [Toco os padrões A e B em qualquer casa],
  [Toco o roteiro 1 inteiro, no tempo, sem parar],
  [Toco o roteiro 2 com a preparação menor],
))

#gabarito[
  #resposta(1)[
    A: Bm7 – E7 – A7M · Eb: Fm7 – Bb7 – Eb7M · F\#: G\#m7 – C\#7 – F\#7M · Db: Ebm7 – Ab7 – Db7M · E: F\#m7 – B7 – E7M · Bb: Cm7 – F7 – Bb7M.
  ]
  #resposta(2)[
    Am: Bm7(b5) – E7 – Am7 · Dm: Em7(b5) – A7 – Dm7 · Em: F\#m7(b5) – B7 – Em7 · Gm: Am7(b5) – D7 – Gm7 · Cm: Dm7(b5) – G7 – Cm7 · Bm: C\#m7(b5) – F\#7 – Bm7.
  ]
  #resposta(3)[
    a) Ré maior · b) Lá bemol maior · c) Mi menor · d) Dó menor · e) Si maior · f) Fá maior.
  ]
  #resposta(4)[
    G: Am7 — A: casa 5 · B: casa 12 · Bb: Cm7 — A: 8 · B: 3 · D: Em7 — A: 12 · B: 7 · F: Gm7 — A: 3 · B: 10.
  ]
  #resposta(5)[
    F7M → *Dm7(b5) – G7* → Cm7 – F7 – Bb7M → *Gm7(b5) – C7* → Fm7 – Bb7 – Eb7M.
  ]
]
