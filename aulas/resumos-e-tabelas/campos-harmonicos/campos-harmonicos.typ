#import "/templates/layout.typ": *
#import "/templates/components.typ": *

#show: aula.with(
  instrumento: "Campos Harmônicos",
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
// CAMPOS HARMÔNICOS
// ============================================================

#let ESCALAS = (
  maior: ("T", "2", "3", "4", "5", "6", "7M"),
  natural: ("T", "2", "b3", "4", "5", "b6", "7"),
  harmonica: ("T", "2", "b3", "4", "5", "b6", "7M"),
  melodica: ("T", "2", "b3", "4", "5", "6", "7M"),
)
#let SUF-TRIADE = ("4-7": ("", ("T", "3", "5")), "3-7": ("m", ("T", "b3", "5")), "3-6": ("º", ("T", "b3", "b5")), "4-8": ("+", ("T", "3", "#5")))
#let SUF-TETRADE = (
  "4-7-11": ("7M", ("T", "3", "5", "7M")),
  "4-7-10": ("7", ("T", "3", "5", "7")),
  "3-7-10": ("m7", ("T", "b3", "5", "7")),
  "3-6-10": ("m7(b5)", ("T", "b3", "b5", "7")),
  "3-6-9": ("º7", ("T", "b3", "b5", "bb7")),
  "3-7-11": ("m(7M)", ("T", "b3", "5", "7M")),
  "4-8-11": ("7M(#5)", ("T", "3", "#5", "7M")),
)

// Acorde sobre o grau g (0–6) da escala `esc`, com 3 ou 4 notas.
#let acorde-grau(esc, g, sons) = {
  let r = esc.at(g)
  let ns = range(sons).map(k => esc.at(calc.rem(g + 2 * k, 7)))
  let st = ns.slice(1).map(n => str(calc.rem(pc(n) - pc(r) + 12, 12))).join("-")
  let (suf, form) = if sons == 3 { SUF-TRIADE.at(st) } else { SUF-TETRADE.at(st) }
  [#chk(nome(r), form, ns.map(nome))#(nome(r) + suf)]
}

// Linha da tabela: tom + 7 acordes
#let linha-campo(tonica, tipo, sons, rotulo: auto) = {
  let form = ESCALAS.at(tipo)
  let esc = form.map(i => transp(nt(tonica), i))
  let sufixo = if tipo == "maior" { "" } else { "m" }
  ([#chk(tonica, form, esc.map(nome))#(if rotulo == auto { tonica + sufixo } else { rotulo })],) + range(7).map(g => acorde-grau(esc, g, sons))
}

#let TONS-MAIORES = ("C", "Db", "D", "Eb", "E", "F", "F#", "Gb", "G", "Ab", "A", "Bb", "B")
#let TONS-MENORES = ("C", "C#", "D", "D#", "Eb", "E", "F", "F#", "G", "G#", "A", "Bb", "B")

#let cab(graus, funcoes: none) = ([Tom],) + graus.enumerate().map(p => {
  let (i, g) = p
  if funcoes == none { [#g] } else { [#g \ #text(size: 7.5pt, weight: "regular")[#funcoes.at(i)]] }
})

#let campo(tipo, sons, graus, funcoes: none, tons: TONS-MAIORES) = tabela-resumo(
  cab(graus, funcoes: funcoes),
  tons.map(t => linha-campo(t, tipo, sons)),
  columns: (0.85fr,) + (1fr,) * 7,
  inset: (x: 0.3em, y: 0.4em),
  tamanho: 10pt,
)

// ============================================================
// CONTEÚDO
// ============================================================

= Campos Harmônicos

Campo harmônico é o conjunto de acordes formados empilhando terças sobre cada nota de uma escala. Este resumo traz os campos das escalas maior, menor natural, menor harmônica e menor melódica em todos os tons, prontos para consulta. *Como usar:* localize o tom na primeira coluna e leia os acordes na linha; o cabeçalho mostra o grau e a função de cada acorde. Os tons de Fá\# e Solb (e de Ré\# menor e Mib menor) aparecem nas duas grafias, pois ambas são usadas.

== 1. Visão geral: os quatro campos em graus

#tabela-resumo(
  ([Grau], [Maior], [Função], [Menor natural], [Menor harmônico], [Menor melódico]),
  (
    ([1], [I7M], [T], [Im7], [Im(7M)], [Im(7M)]),
    ([2], [IIm7], [S], [IIø], [IIø], [IIm7]),
    ([3], [IIIm7], [T (D)], [bIII7M], [bIII7M(\#5)], [bIII7M(\#5)]),
    ([4], [IV7M], [S], [IVm7], [IVm7], [IV7]),
    ([5], [V7], [D], [Vm7], [V7], [V7]),
    ([6], [VIm7], [T], [bVI7M], [bVI7M], [VIø]),
    ([7], [VIIø], [D], [bVII7], [VIIº7], [VIIø]),
  ),
  columns: (0.6fr, 1fr, 0.75fr, 1.1fr, 1.2fr, 1.2fr),
  tamanho: 10pt,
)

#nota-rodape[Tríades correspondentes — maior: I, IIm, IIIm, IV, V, VIm, VIIº · menor natural: Im, IIº, bIII, IVm, Vm, bVI, bVII · menor harmônica: Im, IIº, bIII+, IVm, V, bVI, VIIº · menor melódica: Im, IIm, bIII+, IV, V, VIº, VIIº.]

== 2. Campo harmônico maior — tríades

#campo("maior", 3, ("I", "IIm", "IIIm", "IV", "V", "VIm", "VIIº"), funcoes: ("T", "S", "T", "S", "D", "T", "D"))

#pagebreak()

== 3. Campo harmônico maior — tétrades

#campo("maior", 4, ("I7M", "IIm7", "IIIm7", "IV7M", "V7", "VIm7", "VIIø"), funcoes: ("T", "S", "T", "S", "D", "T", "D"))

#nota-rodape[Nos graus, ø indica o acorde meio-diminuto, m7(b5): o VIIø de Dó maior é Bm7(b5) = B - D - F - A.]

== 4. Campo menor natural — tétrades

#campo(
  "natural",
  4,
  ("Im7", "IIø", "bIII7M", "IVm7", "Vm7", "bVI7M", "bVII7"),
  funcoes: ("T", "S", "T", "S", "D (fraca)", "S", "D (subtônica)"),
  tons: TONS-MENORES,
)

#v(0.8em)
#aviso("dica")[O campo menor natural tem exatamente os mesmos acordes do campo maior *relativo*, apenas começando pelo VI grau: Lá menor (Am7, Bm7(b5), C7M, Dm7, Em7, F7M, G7) = Dó maior a partir do Am7. Para achar o relativo menor, desça 3 semitons a partir da tônica maior (C → A).]

#pagebreak()

== 5. Campo menor harmônico — tétrades

#intro[A 7ª maior (sensível) transforma o Vm7 em *V7* e o bVII7 em *VIIº7*, criando a cadência V7 → Im típica do tom menor.]

#campo(
  "harmonica",
  4,
  ("Im(7M)", "IIø", "bIII7M(#5)", "IVm7", "V7", "bVI7M", "VIIº7"),
  funcoes: ("T", "S", "T", "S", "D", "S", "D"),
  tons: TONS-MENORES,
)

#nota-rodape[Nos tons com sustenidos, a sensível pode exigir dobrado sustenido: em Sol\# menor ela é Fá\#\# (F\#\#º7 = F\#\# - A\# - C\# - E); em Ré\# menor, Dó\#\#. Ao tocar, Fá\#\# soa como Sol e Dó\#\# como Ré.]

== 6. Campo menor melódico — tétrades

#intro[Com 6ª e 7ª maiores (forma ascendente, usada na harmonia moderna), o IV vira dominante (IV7) e surgem dois meio-diminutos (VIø e VIIø).]

#campo(
  "melodica",
  4,
  ("Im(7M)", "IIm7", "bIII7M(#5)", "IV7", "V7", "VIø", "VIIø"),
  funcoes: ("T", "S", "T", "S", "D", "S", "D"),
  tons: TONS-MENORES,
)

#pagebreak()

== 7. Funções harmônicas por grau

#intro[Cada acorde do campo exerce uma de três funções. Acordes com a mesma função têm notas em comum e podem substituir uns aos outros.]

#[
  #set par(justify: false)
  #cartoes-info((
    (titulo: "TÔNICA (T)", corpo: [Repouso e estabilidade; é onde a música “chega”. \ *Maior:* I, IIIm, VIm \ *Menor:* Im, bIII]),
    (titulo: "SUBDOMINANTE (S)", corpo: [Afastamento e preparação; leva à dominante ou volta à tônica. \ *Maior:* IIm, IV \ *Menor:* IIø, IVm, bVI]),
    (titulo: "DOMINANTE (D)", corpo: [Tensão máxima (trítono entre a 3ª e a 7ª); pede resolução na tônica. \ *Maior:* V7, VIIø \ *Menor:* V7, VIIº7]),
  ))
]

#v(0.8em)

#tabela-resumo(
  ([Grau], [Função], [Notas comuns com…], [Uso típico]),
  (
    ([I7M], [Tônica], [IIIm7 e VIm7 (3 notas cada)], [início e fim de frases; repouso]),
    ([IIm7], [Subdominante], [IV7M (3 notas)], [preparação da dominante: IIm7 – V7 – I]),
    ([IIIm7], [Tônica (fraca)], [I7M e V7], [substituto do I; ponte para o VIm]),
    ([IV7M], [Subdominante], [IIm7 e VIm7], [afastamento da tônica; cadência plagal IV – I]),
    ([V7], [Dominante], [VIIø (3 notas, inclusive o trítono)], [cadência perfeita V7 – I]),
    ([VIm7], [Tônica (relativa)], [I7M e IV7M], [cadência de engano V7 – VIm]),
    ([VIIø], [Dominante], [V7 (é o V7(9) sem tônica)], [substituto do V7; IIø do relativo menor]),
  ),
  columns: (0.65fr, 1fr, 1.55fr, 1.9fr),
  alinhar: (c, r) => if c >= 2 { left + horizon } else { center + horizon },
  tamanho: 9.5pt,
)

#v(0.8em)

#tabela-resumo(
  ([Grau (tom menor)], [Função], [Observação]),
  (
    ([Im7 / Im(7M) / Im6], [Tônica], [a forma do acorde depende da escala usada (natural, harmônica ou melódica)]),
    ([bIII7M], [Tônica (relativa)], [é o I do relativo maior]),
    ([IIø], [Subdominante], [prepara o V7 na cadência menor IIø – V7 – Im]),
    ([IVm7], [Subdominante], [cadência plagal menor IVm – Im]),
    ([bVI7M], [Subdominante], [também substitui a tônica na cadência de engano V7 – bVI7M]),
    ([V7 (harmônico)], [Dominante], [contém a sensível; resolução mais forte que o Vm7 (natural)]),
    ([VIIº7 (harmônico)], [Dominante], [é o V7(b9) sem tônica]),
    ([bVII7 (natural)], [Dominante fraca], [subtônica; funciona também como V7 do bIII]),
  ),
  columns: (1.15fr, 1fr, 2.9fr),
  alinhar: (c, r) => if c == 2 { left + horizon } else { center + horizon },
  tamanho: 9.5pt,
)

#v(0.8em)
#aviso("dica")[Cadências essenciais: *perfeita* V7 – I · *plagal* IV – I · *de engano* V7 – VIm · *meia cadência* termina no V · *II-V-I* IIm7 – V7 – I7M (maior) e IIø – V7 – Im (menor).]
