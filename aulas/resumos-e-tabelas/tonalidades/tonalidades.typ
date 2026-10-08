#import "/templates/layout.typ": *
#import "/templates/components.typ": *

#show: aula.with(
  instrumento: "Tonalidades",
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
  "6": (5, 9), "bb7": (6, 9), "7": (6, 10), "7M": (6, 11),
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
// TONALIDADES
// ============================================================

#let MAIOR = ("T", "2", "3", "4", "5", "6", "7M")
#let MENOR = ("T", "2", "b3", "4", "5", "b6", "7")
#let ORDEM-SUST = ("F", "C", "G", "D", "A", "E", "B")
#let ORDEM-BEM = ("B", "E", "A", "D", "G", "C", "F")

// Acidentes da armadura (em ordem) a partir da escala maior do tom
#let armadura(tonica) = {
  let esc = notas-de(tonica, MAIOR)
  let alt = esc.filter(n => n.len() > 1)
  if alt.len() == 0 { () } else if alt.first().ends-with("#") {
    ORDEM-SUST.map(l => l + "#").filter(n => n in alt)
  } else {
    ORDEM-BEM.map(l => l + "b").filter(n => n in alt)
  }
}
#let rel-menor(maior) = nome(transp(nt(maior), "6"))
#let rel-maior(menor) = nome(transp(nt(menor), "b3"))
#let quinta(t) = nome(transp(nt(t), "5"))
#let quarta(t) = nome(transp(nt(t), "4"))

#let linha-armadura(t, simbolo) = {
  let ac = armadura(t)
  let r = rel-menor(t)
  ([#chk(t, MAIOR, notas-de(t, MAIOR))#metadata((maior: t, menor: r, acidentes: ac)) <arm>#ac.len() #simbolo], [*#t*], [#(r + "m")], text(size: 9.5pt, if ac.len() == 0 { [—] } else { ac.join(" ") }))
}

#let TONS-SUST = ("C", "G", "D", "A", "E", "B", "F#", "C#")
#let TONS-BEM = ("C", "F", "Bb", "Eb", "Ab", "Db", "Gb", "Cb")

// ============================================================
// CONTEÚDO
// ============================================================

= Tonalidades e Armaduras de Clave

A armadura de clave é o conjunto de sustenidos ou bemóis escrito logo após a clave, no início de cada pauta. Ela indica quais notas são alteradas durante toda a música e, por consequência, em que tom a música está. Aqui estão as armaduras de todos os tons, a ordem dos acidentes, as regras para descobrir o tom, os enarmônicos e os tons vizinhos. *Como usar:* conte os acidentes da armadura e procure a linha correspondente nas tabelas da seção 1.

== 1. Tons maiores, relativos menores e armaduras

#grid(
  columns: (1fr, 1fr),
  gutter: 0.9em,
  tabela-resumo(
    ([Nº], [Maior], [Menor], [Sustenidos]),
    TONS-SUST.map(t => linha-armadura(t, "#")),
    columns: (0.55fr, 0.7fr, 0.75fr, 1.9fr),
    inset: (x: 0.35em, y: 0.45em),
    tamanho: 10pt,
    negrito-1a: false,
  ),
  tabela-resumo(
    ([Nº], [Maior], [Menor], [Bemóis]),
    TONS-BEM.map(t => linha-armadura(t, "b")),
    columns: (0.55fr, 0.7fr, 0.75fr, 1.9fr),
    inset: (x: 0.35em, y: 0.45em),
    tamanho: 10pt,
    negrito-1a: false,
  ),
)

#nota-rodape[Cada tom maior divide a armadura com seu *relativo menor*, cuja tônica é o VI grau da escala maior (3 semitons abaixo). Exemplo: Mib maior e Dó menor têm os mesmos três bemóis.]

== 2. Ordem dos acidentes

#[
  #set par(justify: false)
  #cartoes-info((
    (titulo: "ORDEM DOS SUSTENIDOS", corpo: [
      #align(center, text(size: 17pt, weight: "bold", tracking: 2pt)[F\# C\# G\# D\# A\# E\# B\#])
      #align(center)[Fá – Dó – Sol – Ré – Lá – Mi – Si]
      #v(0.2em)
      Cada novo sustenido fica uma *5ª justa acima* do anterior. Uma armadura com 3 sustenidos tem sempre os três primeiros: F\#, C\# e G\#.
    ]),
    (titulo: "ORDEM DOS BEMÓIS", corpo: [
      #align(center, text(size: 17pt, weight: "bold", tracking: 2pt)[Bb Eb Ab Db Gb Cb Fb])
      #align(center)[Si – Mi – Lá – Ré – Sol – Dó – Fá]
      #v(0.2em)
      É a ordem dos sustenidos *de trás para a frente*; cada novo bemol fica uma *4ª justa acima* do anterior. Com 2 bemóis: Bb e Eb.
    ]),
  ))
]

#v(0.6em)
#aviso("dica")[Os acidentes nunca se misturam na armadura: ou são só sustenidos, ou só bemóis. E nunca há lacunas: não existe armadura com F\# e G\# sem C\#.]

#pagebreak()

== 3. Como descobrir o tom pela armadura

#passos((
  [*Armadura com sustenidos:* o último sustenido (o mais à direita) é a *sensível* (7º grau) do tom maior. Suba um semitom e você tem a tônica. Ex.: F\# C\# G\# → o último é G\#, e meio tom acima vem *Lá maior*.],
  [*Armadura com bemóis:* o *penúltimo* bemol é a tônica do tom maior. Ex.: Bb Eb Ab Db → o penúltimo é Ab: *Láb maior*. Com um único bemol (Bb), o tom é *Fá maior* — memorize esse caso.],
  [*Sem acidentes:* Dó maior ou Lá menor.],
  [*Relativo menor:* desça 3 semitons (uma 3ª menor) a partir da tônica maior, ou conte até o VI grau. Ex.: Láb maior → *Fá menor*.],
  [*Maior ou menor?* A armadura serve aos dois tons. Observe o primeiro e principalmente o último acorde, e a nota final da melodia. Em tom menor, a *sensível* costuma aparecer como acidente fora da armadura (G\# em Lá menor, F\# em Sol menor, B natural em Dó menor), por causa das escalas menor harmônica e melódica.],
  [*Do tom para a armadura:* a partir de Dó, cada 5ª acima no ciclo das quintas acrescenta um sustenido (G = 1, D = 2, A = 3…); cada 4ª acima (5ª abaixo) acrescenta um bemol (F = 1, Bb = 2, Eb = 3…).],
))

#v(0.6em)
#tabela-resumo(
  ([Tons maiores], [Armadura], [Tons menores], [Armadura]),
  (
    ([C], [nenhum acidente], [Am], [nenhum acidente]),
    ([G, D, A, E, B, F\#, C\#], [sustenidos], [Em, Bm, F\#m, C\#m, G\#m, D\#m, A\#m], [sustenidos]),
    ([F, Bb, Eb, Ab, Db, Gb, Cb], [bemóis], [Dm, Gm, Cm, Fm, Bbm, Ebm, Abm], [bemóis]),
  ),
  columns: (1.5fr, 1fr, 1.9fr, 1fr),
  tamanho: 9.5pt,
)

#nota-rodape[Regra rápida: entre os tons maiores, só Fá maior tem bemol na armadura sem ter bemol no nome. Entre os menores, Ré, Sol, Dó e Fá menor também usam bemóis sem ter bemol no nome.]

== 4. Tons enarmônicos

#intro[Tons enarmônicos soam iguais, mas são escritos de forma diferente. Nos pares abaixo, a soma dos acidentes das duas armaduras é sempre 12. Na prática, escolhe-se a grafia com menos acidentes.]

#tabela-resumo(
  ([Tom], [Armadura], [Enarmônico], [Armadura], [Grafia mais usada]),
  (
    ([B], [5 sustenidos], [Cb], [7 bemóis], [B (Si maior)]),
    ([F\#], [6 sustenidos], [Gb], [6 bemóis], [as duas]),
    ([C\#], [7 sustenidos], [Db], [5 bemóis], [Db (Réb maior)]),
    ([G\#m], [5 sustenidos], [Abm], [7 bemóis], [G\#m (Sol\# menor)]),
    ([D\#m], [6 sustenidos], [Ebm], [6 bemóis], [as duas]),
    ([A\#m], [7 sustenidos], [Bbm], [5 bemóis], [Bbm (Sib menor)]),
  ),
  columns: (0.8fr, 1.1fr, 1fr, 1.1fr, 1.5fr),
  tamanho: 10pt,
)

#nota-rodape[Tons com mais de 7 acidentes (como G\# maior, com 8 sustenidos) são apenas teóricos: usa-se sempre o enarmônico (Ab maior).]

#pagebreak()

== 5. Tons vizinhos

#intro[Tons vizinhos são os que diferem do tom principal em *no máximo um acidente*: o relativo, o tom da dominante (5ª acima), o tom da subdominante (4ª acima) e os relativos desses dois. São as modulações mais naturais e ficam lado a lado no ciclo das quintas.]

#let VIZ-MAIORES = ("C", "G", "D", "A", "E", "B", "F#", "F", "Bb", "Eb", "Ab", "Db", "Gb")
#let VIZ-MENORES = ("A", "E", "B", "F#", "C#", "G#", "D#", "D", "G", "C", "F", "Bb", "Eb")

#let viz-maior(t) = {
  let d = quinta(t)
  let s = quarta(t)
  let linha = (t, rel-menor(t) + "m", d, rel-menor(d) + "m", s, rel-menor(s) + "m")
  ([#metadata((modo: "maior", linha: linha)) <viz>#linha.first()],) + linha.slice(1).map(x => [#x])
}
#let viz-menor(t) = {
  let d = quinta(t)
  let s = quarta(t)
  let linha = (t + "m", rel-maior(t), d + "m", rel-maior(d), s + "m", rel-maior(s))
  ([#metadata((modo: "menor", linha: linha)) <viz>#linha.first()],) + linha.slice(1).map(x => [#x])
}

=== Tons maiores

#tabela-resumo(
  ([Tom], [Relativo], [Dominante], [Rel. dominante], [Subdominante], [Rel. subdominante]),
  VIZ-MAIORES.map(viz-maior),
  columns: (0.75fr, 1fr, 1fr, 1.25fr, 1.1fr, 1.4fr),
  inset: (x: 0.4em, y: 0.45em),
  tamanho: 10pt,
)

=== Tons menores

#tabela-resumo(
  ([Tom], [Relativo], [Dominante], [Rel. dominante], [Subdominante], [Rel. subdominante]),
  VIZ-MENORES.map(viz-menor),
  columns: (0.75fr, 1fr, 1fr, 1.25fr, 1.1fr, 1.4fr),
  inset: (x: 0.4em, y: 0.45em),
  tamanho: 10pt,
)

#nota-rodape[Em tom menor, a dominante e a subdominante dos tons vizinhos são tons menores (Am → Em e Dm). (O acorde V7 de Lá menor, E7, é maior por causa da sensível, mas o tom vizinho é Mi menor.) Para Cb/Abm e C\#/A\#m, alguns vizinhos seriam tons teóricos; use os enarmônicos (B/G\#m e Db/Bbm).]
