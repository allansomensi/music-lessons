#import "/templates/layout.typ": *
#import "/templates/components.typ": *

#show: aula.with(
  instrumento: "Dominantes e Substituições",
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
// DOMINANTES E SUBSTITUIÇÕES
// ============================================================

#let DOM7 = ("T", "3", "5", "b7")
#let MEIO-DIM = ("T", "b3", "b5", "b7")
#let MENOR7 = ("T", "b3", "5", "b7")
#let DIM7 = ("T", "b3", "b5", "bb7")
#let DOM7B9 = ("T", "3", "5", "b7", "b9")

#let tr(n, iv) = transp(n, iv)
#let sust(n) = (l: n.l, a: n.a + 1)
#let bem(n) = (l: n.l, a: n.a - 1)
#let raro(n) = calc.abs(n.a) >= 2 or nome(n) in ("Cb", "Fb", "E#", "B#")
// Enarmônico usual: natural se existir; senão mantém o tipo de acidente
#let simples(n) = {
  let p = pc(n)
  let nat = PC-NAT.position(x => x == p)
  if nat != none { (l: nat, a: 0) } else if n.a < 0 { (l: PC-NAT.position(x => x == calc.rem(p + 1, 12)), a: -1) } else {
    (l: PC-NAT.position(x => x == calc.rem(p + 11, 12)), a: 1)
  }
}

// Célula de acorde. Raízes com dobrado acidente (Ebb, C##…) ou Cb/Fb/E#/B#
// aparecem pelo enarmônico usual, com a grafia funcional em cinza.
#let cel-acorde(raiz, suf, formula) = {
  let ns = formula.map(i => nome(transp(raiz, i)))
  let c = chk(nome(raiz), formula, ns)
  if raro(raiz) {
    let s = simples(raiz)
    let ns2 = formula.map(i => nome(transp(s, i)))
    [#c#chk(nome(s), formula, ns2)*#(nome(s) + suf)* #text(size: 7.5pt, fill: color-muted)[(#(nome(raiz) + suf))]]
  } else { [#c*#(nome(raiz) + suf)*] }
}
#let nomep(n) = if raro(n) { nome(simples(n)) } else { nome(n) }

#let TONS = ("C", "Db", "D", "Eb", "E", "F", "Gb", "G", "Ab", "A", "Bb", "B")
// alvos: (rótulo, intervalo a partir da tônica, alvo é menor?)
#let ALVOS = (("I", "T", false), ("IIm", "2", true), ("IIIm", "3", true), ("IV", "4", false), ("V", "5", false), ("VIm", "6", true))

#let cab-alvos(prefixo) = ([Tom],) + ALVOS.map(a => {
  let (rot, _, _) = a
  if rot == "I" { [#(prefixo)V7 \ #text(size: 7.5pt, weight: "regular")[→ I]] } else {
    [#(prefixo)V/#(rot.replace("m", "")) \ #text(size: 7.5pt, weight: "regular")[→ #rot]]
  }
})

#let tab-alvos(cabecalho, f) = tabela-resumo(
  cabecalho,
  TONS.map(t => ([#t],) + ALVOS.map(a => f(tr(nt(t), a.at(1)), a.at(2)))),
  columns: (0.6fr,) + (1fr,) * 6,
  inset: (x: 0.3em, y: 0.42em),
  tamanho: 10pt,
)

// ============================================================
// CONTEÚDO
// ============================================================

= Dominantes e Substituições

Este resumo organiza, em todos os tons, os dominantes que criam movimento harmônico: V7, dominantes secundários, SubV, II-V relacionados e diminutos de passagem. *Como usar:* encontre o tom na primeira coluna e o acorde-alvo no cabeçalho; a célula mostra o acorde que prepara esse alvo. Lembre que todo dominante resolve, idealmente, uma *5ª justa abaixo* (ou um semitom abaixo, no caso do SubV).

#tabela-resumo(
  ([Conceito], [O que é], [Exemplo em C]),
  (
    ([Dominante secundário], [X7 que funciona como V7 de um grau do campo que não é a tônica], [A7 (V/II) → Dm7]),
    ([SubV (subst. de trítono)], [dominante a um trítono do original: mesmo trítono, resolve um semitom abaixo], [Db7 → C (no lugar de G7)]),
    ([II-V relacionado], [o II do acorde-alvo tocado antes do dominante secundário], [Eø – A7 → Dm7]),
    ([Diminuto de passagem], [º7 cromático entre dois acordes; é um V7(b9) sem tônica do acorde seguinte], [C – C\#º7 – Dm7]),
  ),
  columns: (1.15fr, 2.3fr, 1.25fr),
  alinhar: (c, r) => if c == 1 { left + horizon } else { center + horizon },
  inset: (x: 0.5em, y: 0.42em),
  tamanho: 9.5pt,
)

== 1. V7 e dominantes secundários nos 12 tons maiores

#intro[Leia como “quem prepara quem”: em Ré maior, B7 (V/II) leva a Em7 e F\#7 (V/VI) leva a Bm7. Em C, a cadeia C – E7 – Am – A7 – Dm – G7 – C usa V/VI, V/II e V7.]

#tab-alvos(cab-alvos(""), (alvo, menor) => cel-acorde(tr(alvo, "5"), "7", DOM7))

#nota-rodape[O VIIø não recebe dominante secundário, pois um acorde meio-diminuto não funciona como tônica momentânea. Fá\# maior (enarmônico de Solb) não aparece para evitar raízes como E\#7; use a linha de Gb.]

#pagebreak()

== 2. Substituição de trítono (SubV) de cada dominante

#intro[O SubV fica uma 5ª diminuta (trítono) acima do dominante original e resolve *um semitom abaixo* no acorde-alvo. Funcionalmente é um bII7 do alvo. Quando essa grafia exige dobrado bemol (ou Cb, Fb), a tabela mostra o nome usual e, em cinza, a grafia funcional.]

#tab-alvos(cab-alvos("Sub"), (alvo, menor) => cel-acorde(tr(alvo, "b2"), "7", DOM7))

== 3. II-V relacionado de cada dominante

#intro[O II relacionado é o II grau do acorde-alvo: *m7* quando o alvo é maior e *ø* (m7(b5)) quando o alvo é menor. A cadeia completa fica II – V → alvo.]

#tab-alvos(cab-alvos(""), (alvo, menor) => [
  #cel-acorde(tr(alvo, "2"), if menor { "ø" } else { "m7" }, if menor { MEIO-DIM } else { MENOR7 })
  #h(0.1em)–#h(0.1em)
  #cel-acorde(tr(alvo, "5"), "7", DOM7)
])

#nota-rodape[Exemplo em C: Eø – A7 → Dm7 · F\#ø – B7 → Em7 · Gm7 – C7 → F7M · Am7 – D7 → G7 · Bø – E7 → Am7.]

#pagebreak()

== 4. Cadência em tom menor: V7 e IIø – V7 – Im

#intro[Em tom menor, o V7 vem da escala menor harmônica (sensível um semitom abaixo da tônica). A b9 do V7(b9) também vem dessa escala e torna a cadência ainda mais “menor”.]

#let TONS-MENORES = ("C", "C#", "D", "Eb", "E", "F", "F#", "G", "G#", "A", "Bb", "B")
#tabela-resumo(
  ([Tom], [IIø], [V7], [Notas do V7(b9)], [SubV7], [Cadência completa]),
  TONS-MENORES.map(t => {
    let r = nt(t)
    let ii = tr(r, "2")
    let v = tr(r, "5")
    let ns = DOM7B9.map(i => nome(transp(v, i)))
    (
      [#(t + "m")],
      cel-acorde(ii, "ø", MEIO-DIM),
      cel-acorde(v, "7", DOM7),
      [#chk(nome(v), DOM7B9, ns)#text(size: 9pt, ns.join(" - "))],
      cel-acorde(tr(r, "b2"), "7", DOM7),
      text(size: 9pt)[#(nomep(ii) + "ø") – #(nomep(v) + "7") – #(t + "m")],
    )
  }),
  columns: (0.6fr, 0.8fr, 0.8fr, 1.6fr, 1.05fr, 1.55fr),
  inset: (x: 0.3em, y: 0.42em),
  tamanho: 10pt,
)

#nota-rodape[Variações comuns: IIø – V7(b9) – Im6, IIø – V7(b13) – Im7M e IIø – SubV7 – Im (ex.: Dø – Db7 – Cm). Em Sol\# e Dó\# menor, a sensível é Fá\#\# e Si\# (notas do V7).]

== 5. Diminutos de passagem

#intro[O diminuto de passagem liga dois acordes por cromatismo no baixo. Ele é o VIIº7 do acorde seguinte (ex.: C\#º7 = A7(b9) sem tônica → Dm7). Como o º7 é simétrico, a grafia funcional pode gerar dobrados sustenidos; nesses casos aparece o nome usual.]

#let PASSAGENS = (
  ("I – #Iº7 – IIm7", n => sust(n)),
  ("IIm7 – #IIº7 – IIIm7", n => sust(tr(n, "2"))),
  ("IV – #IVº7 – V", n => sust(tr(n, "4"))),
  ("V – #Vº7 – VIm7", n => sust(tr(n, "5"))),
  ("IIIm7 – bIIIº7 – IIm7", n => bem(tr(n, "3"))),
)

#tabela-resumo(
  ([Tom],) + PASSAGENS.map(p => text(size: 8.5pt, p.at(0))),
  TONS.map(t => ([#t],) + PASSAGENS.map(p => cel-acorde((p.at(1))(nt(t)), "º7", DIM7))),
  columns: (0.55fr,) + (1fr,) * 5,
  inset: (x: 0.3em, y: 0.42em),
  tamanho: 10pt,
)

#nota-rodape[Em C: C – C\#º7 – Dm7 · Dm7 – D\#º7 – Em7 · F – F\#º7 – C/G (ou G) · G – G\#º7 – Am7 · Em7 – Ebº7 – Dm7 (descendente).]

#pagebreak()

== 6. Trítono de cada dominante e seu SubV

#intro[O trítono entre a *3ª* e a *b7* é o que dá ao dominante sua tensão. O SubV usa as mesmas duas notas, com as funções trocadas (a 3ª de um é a b7 do outro, enarmonicamente). Por isso os dois resolvem no mesmo acorde.]

#let DOMINANTES = ("C", "Db", "D", "Eb", "E", "F", "F#", "G", "Ab", "A", "Bb", "B")
#tabela-resumo(
  ([Dominante], [Notas], [Trítono (3ª – b7)], [Resolve em], [SubV], [Trítono do SubV]),
  DOMINANTES.map(d => {
    let r = nt(d)
    let ns = DOM7.map(i => nome(transp(r, i)))
    let alvo = tr(r, "4")
    let sv = tr(alvo, "b2")
    let svs = if raro(sv) { simples(sv) } else { sv }
    let nsv = DOM7.map(i => nome(transp(svs, i)))
    (
      [#chk(d, DOM7, ns)#metadata((dom: ns, sub: nsv)) <tri>#(d + "7")],
      text(size: 9.5pt, ns.join(" - ")),
      [*#ns.at(1) – #ns.at(3)*],
      [#nome(alvo)],
      cel-acorde(sv, "7", DOM7),
      [#chk(nome(svs), DOM7, nsv)*#nsv.at(1) – #nsv.at(3)*],
    )
  }),
  columns: (0.95fr, 1.4fr, 1.15fr, 0.85fr, 1.1fr, 1.15fr),
  inset: (x: 0.35em, y: 0.5em),
  tamanho: 10pt,
)

#nota-rodape[Exemplo: G7 tem o trítono B – F; Db7 tem F – Cb (Cb = Si). Ambos resolvem em C. Os 12 dominantes formam 6 pares de SubV: C7/Gb7, Db7/G7, D7/Ab7, Eb7/A7, E7/Bb7, F7/B7.]

== 7. Os três acordes diminutos

#intro[Existem só três acordes º7 diferentes. Cada um equivale a quatro dominantes com b9 (sem a tônica): os dominantes cujas tônicas ficam um semitom abaixo das notas do diminuto.]

#tabela-resumo(
  ([Diminuto (mesmas notas)], [Notas], [Substitui (sem tônica)], [Resolve em]),
  (
    ([Cº7 = Ebº7 = F\#º7 = Aº7], [C - Eb - Gb - Bbb], [B7(b9), D7(b9), F7(b9), Ab7(b9)], [E, G, Bb, Db]),
    ([C\#º7 = Eº7 = Gº7 = Bbº7], [C\# - E - G - Bb], [C7(b9), Eb7(b9), F\#7(b9), A7(b9)], [F, Ab, B, D]),
    ([Dº7 = Fº7 = Abº7 = Bº7], [D - F - Ab - Cb], [Db7(b9), E7(b9), G7(b9), Bb7(b9)], [Gb, A, C, Eb]),
  ),
  columns: (1.5fr, 1.05fr, 1.6fr, 1fr),
  tamanho: 9.5pt,
)

#v(0.6em)
#aviso("dica")[Para achar o diminuto que substitui um dominante, suba meio tom a partir da tônica do dominante: G7(b9) → *Abº7*, enarmônico de *Bº7* (B - D - F - Ab), que são exatamente a 3ª, a 5ª, a b7 e a b9 de G7(b9). Toque G7(b9) e Bº7 seguidos e compare: soam quase iguais.]
