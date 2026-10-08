#import "/templates/layout.typ": *
#import "/templates/components.typ": *

#show: aula.with(
  instrumento: "Acordes",
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
// DADOS
// ============================================================

// (nome, fórmula, sufixo da cifra, cifras alternativas)
#let TRIADES = (
  ("Maior", ("T", "3", "5"), "", "CM, Cmaj"),
  ("Menor", ("T", "b3", "5"), "m", "Cmin, Cmi, C–"),
  ("Diminuta", ("T", "b3", "b5"), "º", "Cdim, Cm(b5)"),
  ("Aumentada", ("T", "3", "#5"), "+", "Caug, C(#5)"),
  ("Suspensa de 2ª", ("T", "2", "5"), "sus2", "C(sus2)"),
  ("Suspensa de 4ª", ("T", "4", "5"), "sus4", "Csus, C(sus4)"),
  ("Quinta (power chord)", ("T", "5"), "5", "C(no3)"),
)

#let SEXTAS = (
  ("Maior com 6ª", ("T", "3", "5", "6"), "6", "C(6), CM6"),
  ("Menor com 6ª", ("T", "b3", "5", "6"), "m6", "Cmin6, C–6"),
  ("Maior com 6ª e 9ª", ("T", "3", "5", "6", "9"), "6(9)", "C6/9, C69"),
  ("Menor com 6ª e 9ª", ("T", "b3", "5", "6", "9"), "m6(9)", "Cm6/9, Cm69"),
  ("Maior com 9ª adicionada", ("T", "3", "5", "9"), "(add9)", "Cadd9, C(9)"),
  ("Menor com 9ª adicionada", ("T", "b3", "5", "9"), "m(add9)", "Cmadd9, Cm(9)"),
)

#let TETRADES = (
  ("Maior com 7ª maior", ("T", "3", "5", "7M"), "7M", "Cmaj7, CΔ, CΔ7, C7+"),
  ("Dominante (7ª menor)", ("T", "3", "5", "7"), "7", "Cdom7"),
  ("Menor com 7ª menor", ("T", "b3", "5", "7"), "m7", "Cmin7, Cmi7, C–7"),
  ("Meio-diminuto", ("T", "b3", "b5", "7"), "m7(b5)", "Cø, Cø7, Cm7b5, C–7(b5)"),
  ("Diminuto", ("T", "b3", "b5", "bb7"), "º7", "Cdim7, Cº (uso popular)"),
  ("Menor com 7ª maior", ("T", "b3", "5", "7M"), "m(7M)", "Cm7M, Cm(maj7), CmΔ"),
  ("Aumentado com 7M", ("T", "3", "#5", "7M"), "7M(#5)", "Cmaj7(#5), C+7M, CΔ(#5)"),
  ("Dominante suspenso (sus4)", ("T", "4", "5", "7"), "7sus4", "C7(sus4), C7sus, C7(4)"),
)

#let EXTENSOES = (
  ("T", "3", "5", "7M", "9"), "7M(9)", "Cmaj9, CΔ9",
  ("T", "3", "5", "7M", "#11"), "7M(#11)", "Cmaj7(#11), CΔ(#11)",
  ("T", "3", "5", "7M", "9", "#11"), "7M(9,#11)", "Cmaj9(#11)",
  ("T", "3", "5", "7M", "13"), "7M(13)", "Cmaj7(13), C7M(6)",
  ("T", "3", "5", "7", "9"), "7(9)", "C9",
  ("T", "3", "5", "7", "13"), "7(13)", "C7(6), C13*",
  ("T", "3", "5", "7", "9", "13"), "7(9,13)", "C13",
  ("T", "3", "5", "7", "#11"), "7(#11)", "C7#11",
  ("T", "3", "5", "7", "9", "#11"), "7(9,#11)", "C9(#11)",
  ("T", "4", "5", "7", "9"), "7sus4(9)", "C9sus4, C9sus, Bb/C",
  ("T", "b3", "5", "7", "9"), "m7(9)", "Cm9, Cmi9, C–9",
  ("T", "b3", "5", "7", "11"), "m7(11)", "Cm7(4), Cm11*",
  ("T", "b3", "5", "7", "9", "11"), "m7(9,11)", "Cm11",
  ("T", "b3", "5", "7M", "9"), "m(7M,9)", "Cm7M(9), Cm(maj9), CmΔ9",
  ("T", "b3", "b5", "7", "9"), "m7(b5,9)", "Cø(9)",
  ("T", "b3", "b5", "7", "11"), "m7(b5,11)", "Cø(11)",
  ("T", "b3", "b5", "bb7", "9"), "º7(9)", "Cdim7(9)",
).chunks(3)

#let ALTERADOS = (
  ("T", "3", "b5", "7"), "7(b5)", "C7-5",
  ("T", "3", "#5", "7"), "7(#5)", "C+7, Caug7, C7+5",
  ("T", "3", "5", "7", "b9"), "7(b9)", "C7-9",
  ("T", "3", "5", "7", "#9"), "7(#9)", "C7+9 (“acorde Hendrix”)",
  ("T", "3", "5", "7", "b13"), "7(b13)", "C7-13 (em geral sem a 5ª)",
  ("T", "3", "5", "7", "b9", "13"), "7(b9,13)", "C13(b9)",
  ("T", "3", "5", "7", "b9", "b13"), "7(b9,b13)", "C7(b9b13)",
  ("T", "3", "5", "7", "#9", "b13"), "7(#9,b13)", "C7(#9b13)",
  ("T", "3", "5", "7", "b9", "#11"), "7(b9,#11)", "C7(b9#11)",
  ("T", "3", "7", "b9", "#9", "#11", "b13"), "7alt", "C7(alt), Calt",
).chunks(3)

// Linha de tabela de fórmulas: (nome?, fórmula, cifra, alternativas, notas em C)
#let linha-formula(formula, sufixo, alt, nome: none) = {
  let ns = notas-de("C", formula)
  let base = (
    formula.join(" - "),
    [#chk("C", formula, ns)*C#sufixo*],
    text(size: 9pt, alt),
    ns.join(" - "),
  )
  if nome == none { base } else { (nome,) + base }
}

// ============================================================
// CONTEÚDO
// ============================================================

= Fórmulas de Acordes

Este resumo reúne, em um só lugar, a fórmula intervalar de cada tipo de acorde, a cifra adotada aqui, as cifras alternativas que você vai encontrar em songbooks e partituras, e as notas do acorde com tônica em Dó. *Como usar:* encontre o tipo de acorde, leia a fórmula e aplique-a a qualquer tônica. Todas as notas seguem a grafia correta (a 3ª de um acorde é sempre uma letra de terça acima da tônica, a 5ª outra terça acima, e assim por diante). Convenção de intervalos: *7* = 7ª menor, *7M* = 7ª maior e *bb7* = 7ª diminuta (soa igual à 6ª).

== 1. Tríades e acordes de três sons

#tabela-resumo(
  ([Tipo], [Fórmula], [Cifra], [Cifras alternativas], [Notas em C]),
  TRIADES.map(t => linha-formula(t.at(1), t.at(2), t.at(3), nome: t.at(0))),
  columns: (1.55fr, 0.95fr, 0.8fr, 1.3fr, 1fr),
  tamanho: 9.5pt,
)

#nota-rodape[Os acordes suspensos não são maiores nem menores: a 3ª é substituída pela 2ª ou pela 4ª. O power chord (C5) não tem 3ª e por isso combina com qualquer contexto maior ou menor.]

== 2. Acordes de 6ª e com 9ª adicionada

#tabela-resumo(
  ([Tipo], [Fórmula], [Cifra], [Cifras alternativas], [Notas em C]),
  SEXTAS.map(t => linha-formula(t.at(1), t.at(2), t.at(3), nome: t.at(0))),
  columns: (1.55fr, 1fr, 0.8fr, 1.1fr, 1.15fr),
  tamanho: 9.5pt,
)

#v(0.6em)
#aviso("atencao")[No Brasil, *C9* em cifras populares quase sempre significa *C(add9)* (tríade + 9ª, sem 7ª). Em partituras de jazz, *C9* significa *C7(9)* (com 7ª menor). Na dúvida, confira pelo contexto ou pela gravação.]

#pagebreak()

== 3. Tétrades (acordes de quatro sons)

#tabela-resumo(
  ([Tipo], [Fórmula], [Cifra], [Cifras alternativas], [Notas em C]),
  TETRADES.map(t => linha-formula(t.at(1), t.at(2), t.at(3), nome: t.at(0))),
  columns: (1.7fr, 1.05fr, 0.85fr, 1.5fr, 1.05fr),
  tamanho: 9.5pt,
)

#nota-rodape[No Cº7 a 7ª é *diminuta* (bb7): por isso a nota é Bbb, enarmônica de Lá. Na prática você toca Lá; na escrita, mantém-se a letra B para preservar o empilhamento de terças.]

== 4. Extensões: 9ª, 11ª e 13ª

#intro[As extensões (tensões) são notas acima da oitava empilhadas sobre a tétrade: *9 = 2*, *11 = 4* e *13 = 6* uma oitava acima. Combinações são escritas dentro dos mesmos parênteses, separadas por vírgula: C7(9,13).]

#tabela-resumo(
  ([Fórmula], [Cifra], [Cifras alternativas], [Notas em C]),
  EXTENSOES.map(t => linha-formula(t.at(0), t.at(1), t.at(2))),
  columns: (1.35fr, 1fr, 1.3fr, 1.35fr),
  tamanho: 9.5pt,
  inset: (x: 0.5em, y: 0.42em),
  negrito-1a: false,
)

#nota-rodape[\* Em cifragem americana, *C13* e *Cm11* pressupõem as extensões inferiores (C13 = 7, 9 e 13; Cm11 = 7, 9 e 11). Na prática, a 11ª justa é evitada nos acordes maiores e dominantes, pois choca com a 3ª.]

#pagebreak()

== 5. Dominantes alterados

#intro[Alterar um dominante é deslocar a 5ª e/ou a 9ª um semitom (b5/\#11, \#5/b13, b9, \#9). Essas notas aumentam a tensão e pedem resolução, geralmente para um acorde a uma quinta abaixo.]

#tabela-resumo(
  ([Fórmula], [Cifra], [Cifras alternativas], [Notas em C]),
  ALTERADOS.map(t => linha-formula(t.at(0), t.at(1), t.at(2))),
  columns: (1.65fr, 0.95fr, 1.4fr, 1.45fr),
  tamanho: 9.5pt,
  negrito-1a: false,
)

#nota-rodape[*C7alt* indica a escala alterada: mantêm-se tônica, 3ª e 7ª menor, e as tensões podem ser qualquer combinação de b9, \#9, \#11 (b5) e b13 (\#5). Como b9 e \#9 usam a mesma letra (Db e D\#), a grafia do acorde completo foge excepcionalmente do empilhamento de terças.]

== 6. Leitura de símbolos e equivalências

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  tabela-resumo(
    ([Símbolo], [Significado]),
    (
      ([m, min, mi, –], [acorde menor (3ª menor)]),
      ([7], [7ª menor]),
      ([7M, maj7, Δ, 7+], [7ª maior]),
      ([º, dim], [diminuto]),
      ([ø], [meio-diminuto = m7(b5)]),
      ([+, aug], [5ª aumentada]),
      ([sus2, sus4], [3ª trocada pela 2ª / 4ª]),
      ([add], [nota adicionada sem 7ª]),
      ([( )], [tensões e alterações]),
      ([/], [baixo invertido: C/E]),
      ([alt], [dominante alterado]),
    ),
    columns: (1fr, 1.45fr),
    tamanho: 9.5pt,
  ),
  tabela-resumo(
    ([Acorde], [Mesmas notas que]),
    (
      ([C6], [Am7/C]),
      ([Cm6], [Am7(b5)/C]),
      ([Cm7], [Eb6/C]),
      ([Cm7(b5)], [Ebm6/C]),
      ([Cº7], [Ebº7 = F\#º7 = Aº7 (enarmônicos)]),
      ([C+], [E+ = G\#+ (enarmônicos)]),
      ([C7M(9) sem tônica], [Em7]),
      ([C7(9) sem tônica], [Em7(b5) (E - G - Bb - D)]),
      ([C7sus4(9)], [Bb/C (sem a 5ª)]),
      ([C7(b9) sem tônica], [Eº7]),
    ),
    columns: (1fr, 1.45fr),
    tamanho: 9.5pt,
  ),
)

#v(0.8em)
#tabela-resumo(
  ([Posição], [Nota no baixo], [Tríade (C)], [Tétrade (C7M)], [Notas do C7M (grave → agudo)]),
  (
    ([Estado fundamental], [Tônica], [C], [C7M], [C - E - G - B]),
    ([1ª inversão], [3ª], [C/E], [C7M/E], [E - G - B - C]),
    ([2ª inversão], [5ª], [C/G], [C7M/G], [G - B - C - E]),
    ([3ª inversão], [7ª], [—], [C7M/B], [B - C - E - G]),
  ),
  columns: (1.3fr, 1fr, 0.9fr, 1fr, 1.6fr),
  tamanho: 9.5pt,
)

#pagebreak()

== 7. Tétrades nos 12 tons

#intro[Notas das cinco tétrades principais em todos os tons. A tônica de cada coluna usa a grafia mais comum para aquele tipo de acorde (por exemplo, *Db7M*, mas *C\#m7*), sempre com o empilhamento correto de terças.]

#let TONS-TET = (
  // (rótulo da linha, raízes para 7M, 7, m7, m7(b5), º7)
  ("C", ("C", "C", "C", "C", "C")),
  ("C#/Db", ("Db", "Db", "C#", "C#", "C#")),
  ("D", ("D", "D", "D", "D", "D")),
  ("D#/Eb", ("Eb", "Eb", "Eb", "D#", "D#")),
  ("E", ("E", "E", "E", "E", "E")),
  ("F", ("F", "F", "F", "F", "F")),
  ("F#/Gb", ("Gb", "F#", "F#", "F#", "F#")),
  ("G", ("G", "G", "G", "G", "G")),
  ("G#/Ab", ("Ab", "Ab", "G#", "G#", "G#")),
  ("A", ("A", "A", "A", "A", "A")),
  ("A#/Bb", ("Bb", "Bb", "Bb", "A#", "A#")),
  ("B", ("B", "B", "B", "B", "B")),
)
#let TIPOS-TET = (
  ("7M", ("T", "3", "5", "7M")),
  ("7", ("T", "3", "5", "7")),
  ("m7", ("T", "b3", "5", "7")),
  ("m7(b5)", ("T", "b3", "b5", "7")),
  ("º7", ("T", "b3", "b5", "bb7")),
)

#tabela-resumo(
  ([Tom], [7M \ #text(size: 8pt, weight: "regular")[T - 3 - 5 - 7M]], [7 \ #text(size: 8pt, weight: "regular")[T - 3 - 5 - 7]], [m7 \ #text(size: 8pt, weight: "regular")[T - b3 - 5 - 7]], [m7(b5) \ #text(size: 8pt, weight: "regular")[T - b3 - b5 - 7]], [º7 \ #text(size: 8pt, weight: "regular")[T - b3 - b5 - bb7]]),
  TONS-TET.map(t => {
    let (rotulo, raizes) = t
    (rotulo,) + TIPOS-TET.enumerate().map(p => {
      let (i, tipo) = p
      let raiz = raizes.at(i)
      let ns = notas-de(raiz, tipo.at(1))
      [#chk(raiz, tipo.at(1), ns)*#(raiz + tipo.at(0))* \ #text(size: 8.5pt, ns.join(" - "))]
    })
  }),
  columns: (0.75fr, 1fr, 1fr, 1fr, 1fr, 1fr),
  inset: (x: 0.4em, y: 0.55em),
  tamanho: 10pt,
)

#v(0.6em)
#aviso("dica")[O acorde diminuto (º7) é simétrico: todas as notas estão a 3 semitons de distância. Por isso existem apenas *três* acordes º7 diferentes: Cº7 = Ebº7 = F\#º7 = Aº7; C\#º7 = Eº7 = Gº7 = Bbº7; Dº7 = Fº7 = Abº7 = Bº7. Ao mudar a tônica, só muda a grafia.]

#pagebreak()

== 8. Tensões disponíveis e notas evitadas

#intro[As tensões disponíveis de um acorde vêm da escala (modo) que ele representa no contexto. Uma *nota evitada* é a nota da escala que fica *um semitom acima* de uma nota do acorde (formando b9 com ela) e desestabiliza o som — por exemplo, Fá sobre C7M (Fá fica um semitom acima de Mi, a 3ª).]

#tabela-resumo(
  ([Acorde (contexto)], [Escala de referência], [Tensões disponíveis], [Evitar]),
  (
    ([7M como I (tônica)], [Jônico], [9, 13], [11]),
    ([7M como IV ou bVI], [Lídio], [9, \#11, 13], [—]),
    ([m7 como IIm7 (ou Im7 dórico)], [Dórico], [9, 11 (13 com cautela)], [—]),
    ([m7 como IIIm7], [Frígio], [11], [b9, b13]),
    ([m7 como VIm7 ou Im7 eólio], [Eólio], [9, 11], [b13]),
    ([m7(b5) como VIIø (tom maior)], [Lócrio], [11, b13], [b9]),
    ([m7(b5) como IIø (tom menor)], [Lócrio 9 (menor melódica)], [9, 11, b13], [—]),
    ([º7 (diminuto)], [Diminuta (tom-semitom)], [9, 11, b13, 7M], [—]),
    ([7 como V7 de tom maior], [Mixolídio], [9, 13], [11]),
    ([7 como bVII7 ou SubV], [Lídio dominante], [9, \#11, 13], [—]),
    ([7 resolvendo em acorde menor], [Mixolídio b9 b13], [b9, b13], [11]),
    ([7 alterado (V7alt)], [Alterada (superlócrio)], [b9, \#9, \#11, b13], [—]),
    ([7(b9,13)], [Dominante-diminuta], [b9, \#9, \#11, 13], [—]),
    ([7sus4], [Mixolídio], [9, 13 (b9 no sus4 frígio)], [3 (trocada pela 4)]),
    ([m(7M), m6 (Im de tom menor)], [Menor melódica], [9, 11, 13 (6)], [—]),
    ([7M(\#5)], [Lídio aumentado], [9, \#11, 13], [—]),
    ([6 (maior com 6ª)], [Jônico], [9], [11]),
  ),
  columns: (1.9fr, 1.4fr, 1.3fr, 0.9fr),
  alinhar: (c, r) => if c == 0 { left + horizon } else { center + horizon },
  tamanho: 9.5pt,
)

#v(0.6em)
#aviso("dica")[Em acordes dominantes, as tensões *naturais* (9, \#11, 13) soam abertas e funcionam bem em contexto maior; as *alteradas* (b9, \#9, b13) aumentam a tensão e preparam a resolução em acorde menor ou um retorno mais dramático à tônica.]

#v(0.4em)
#set par(justify: false)
#cartoes-info((
  (titulo: "Dm7 (IIm7 em C)", corpo: [Escala: Ré Dórico (D E F G A B C). \ Tensões: 9 = E, 11 = G, 13 = B. \ Acordes: Dm7(9), Dm7(11), Dm7(9,11).]),
  (titulo: "G7 (V7 de Dó menor)", corpo: [Escala: Sol Mixolídio b9 b13 (G Ab B C D Eb F). \ Tensões: b9 = Ab, b13 = Eb. \ Acordes: G7(b9), G7(b13) e G7(b9,b13).]),
  (titulo: "Bm7(b5) (VIIø em C)", corpo: [Escala: Si Lócrio (B C D E F G A). \ Tensões: 11 = E, b13 = G. \ Evitar: b9 = C (um semitom acima da tônica).]),
))
