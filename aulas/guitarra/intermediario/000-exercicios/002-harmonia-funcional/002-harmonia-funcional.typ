#import "/templates/layout.typ": *
#import "/templates/components.typ": *
#import "@preview/conchord:0.4.0": new-chordgen, render-chord

#show: aula.with(
  instrumento: "Guitarra",
  nivel: "Exercícios — Intermediário",
)

#let chord = new-chordgen(number-to-left: true, use-shadow-barre: false, colors: (hold: black, barre: black))
#let chord-vazio = new-chordgen(
  number-to-left: true,
  use-shadow-barre: false,
  colors: (hold: gray, barre: gray),
  scale-length: 1.25pt,
)
#show <chord>: set text(fill: color-strong, weight: "bold")

// ------------------------------------------------------------
// Ajustes locais
// ------------------------------------------------------------

#show table: set par(justify: false)

// Resposta do gabarito que não se divide entre páginas.
#let resp(n, body) = block(breakable: false, width: 100%, resposta(n, body))

// Exercício que não se divide entre páginas.
#let ex(titulo: none, nivel: none, body) = block(
  breakable: false,
  width: 100%,
  exercicio(titulo: titulo, nivel: nivel, body),
)

// Tabela compacta para o gabarito.
#let tabela-gab(headers, rows, columns: none) = align(center, block(
  stroke: 0.5pt + color-rule-dark,
  radius: 4pt,
  clip: true,
  width: 100%,
  table(
    columns: if columns == none { (1fr,) * headers.len() } else { columns },
    align: center + horizon,
    stroke: 0.5pt + color-rule-light,
    inset: (x: 5pt, y: 4.5pt),
    fill: (c, r) => if r == 0 { color-subtle-bg-alt } else if calc.even(r) { color-subtle-bg } else { white },
    ..headers.map(h => text(weight: "bold", h)),
    ..rows.flatten(),
  ),
))

// Linha curta rotulada para resposta abaixo de diagramas.
#let campo(rotulo, largura: 2.4cm) = box[
  #text(size: 8.5pt, fill: color-secondary, rotulo)
  #box(width: largura, line(length: 100%, stroke: 0.6pt + color-rule-dark))
]

// Diagrama de acorde com pontos cinza (o aluno escreve dentro/ao lado).
#let diag-preencher(tabs, campos: ("Acorde:", "Inversão:", "Topo:")) = align(center)[
  #box(chord-vazio(tabs))
  #v(0.2em)
  #set par(leading: 1.1em)
  #for c in campos [
    #campo(c) \
  ]
]

// Diagrama totalmente vazio (casa inicial escrita pelo aluno).
#let diag-vazio(titulo) = align(center)[
  #text(size: 9.5pt, weight: "bold", titulo)
  #v(-0.2em)
  #box(render-chord(
    (),
    (),
    (),
    0,
    "",
    colors: (grid: luma(110)),
    number-to-left: true,
    thick-nut: false,
    scale-length: 1.35pt,
  ))
  #v(-0.3em)
  #campo("casa:", largura: 1.2cm)
]

// Progressão para analisar: acordes no topo, linhas em branco para grau e função.
#let analise(acordes, linhas: ("Grau", "Função / obs.")) = {
  let n = acordes.len()
  tabela-preencher(
    columns: (1.25fr,) + (1fr,) * n,
    altura: 1.15cm,
    ([],) + acordes.map(a => text(size: 9.5pt, a)),
    linhas.map(l => ([#text(size: 9pt, l)],) + (none,) * n),
  )
}

= Harmonia Funcional

Montar um campo harmônico (as tétrades formadas sobre cada grau da escala; em Dó: C7M – Dm7 – Em7 – F7M – G7 – Am7 – Bø) é só o ponto de partida. Aqui o foco é *entender o papel de cada acorde* numa progressão real: de onde ele vem, para onde quer ir e por que soa como soa. Os exercícios vão dos dominantes secundários às análises harmônicas completas.

== Como usar este material

#[
  #set text(size: 10pt)
  #passos((
    [Resolva *na ordem*: cada bloco vai do nível *Médio* (aplicação direta) ao *Desafio* (análise, escolhas, braço).],
    [Escreva a lápis e *toque cada progressão*: a análise só faz sentido quando você ouve a função de cada acorde.],
    [Confira no *Gabarito*. Onde há várias respostas válidas, ele traz uma resposta-modelo e o critério de correção.],
  ))
]

== Conteúdos cobertos

#[
  #set text(size: 9.5pt)
  #tabela(
    columns: (1.5fr, 3.6fr, 0.7fr),
    alinhamento: (left + horizon, left + horizon, center + horizon),
    ([Bloco], [O que você pratica], [Exerc.]),
    (
      ([*1. Dominantes secundários*], [V7/x em vários tons, trítono, SubV, II-V relacionado], [1–4]),
      ([*2. Tom menor*], [IIø – V7 – Im em vários tons, a b9 do dominante menor], [5–6]),
      ([*3. Empréstimo modal*], [Identificar, classificar (grau, origem, função) e aplicar acordes emprestados], [7–9]),
      ([*4. Acordes diminutos*], [As 3 famílias, º7 como V7(b9), funções de passagem, auxiliar e dominante], [10–13]),
      ([*5. Notas-guia e tríades*], [3ª e 7ª no II-V-I, shell voicings, tríades nos grupos de cordas], [14–17]),
      ([*6. Análise completa*], [Numerais romanos e funções em progressões reais], [18]),
    ),
  )
]

#v(0.4em)

#caixa(tipo: "resumo", titulo: none, width: 100%)[
  #set text(size: 9.5pt)
  #align(left)[*Convenções:* #h(4pt) V7/II = dominante secundário que resolve no IIm7; SubV7 = substituto por trítono do V7; IIm7/IV = II relacionado do V7/IV. Cifras: C7M, Cm7, C7, Cø = Cm7(b5), Cº7; *b7* = 7ª menor, *7M* = 7ª maior.]
]

#pagebreak()

// ============================================================
// BLOCO 1 — DOMINANTES SECUNDÁRIOS E SUBV
// ============================================================

#block(sticky: true)[
  == 1. Dominantes Secundários, SubV e II-V Relacionado

  Todo acorde diatônico maior ou menor pode ser precedido pelo *seu próprio V7* — o dominante secundário, uma 5ª justa acima do acorde-alvo. O *SubV* troca esse dominante por outro a um trítono de distância, que tem as mesmas 3ª e 7ª (invertidas) e resolve por semitom.
]

#ex(titulo: "Dominantes secundários em vários tons", nivel: "Médio")[
  Escreva o dominante secundário de cada grau. A primeira linha é um exemplo.

  #v(0.4em)
  #tabela-preencher(
    columns: (0.8fr,) + (1fr,) * 5,
    altura: 1.15cm,
    ([Tom], [V7/II], [V7/III], [V7/IV], [V7/V], [V7/VI]),
    (
      ([C], [A7], [B7], [C7], [D7], [E7]),
      ([G],) + (none,) * 5,
      ([F],) + (none,) * 5,
      ([D],) + (none,) * 5,
      ([Bb],) + (none,) * 5,
      ([A],) + (none,) * 5,
      ([Eb],) + (none,) * 5,
      ([E],) + (none,) * 5,
    ),
  )
]

#ex(titulo: "O dominante de cada acorde-alvo", nivel: "Médio")[
  Sem pensar em tom, escreva o V7 que resolve em cada acorde (uma 5ª justa acima da fundamental do alvo).

  #v(0.4em)
  #tabela-preencher(
    columns: (1fr,) * 8,
    altura: 1.05cm,
    ([Dm7], [F\#m7], [Bb7M], [Ebm7], [G\#m7], [Db7M], [E7M], [Cm7]),
    ((none,) * 8,),
  )

  #v(0.3em)
  Por que o VIIø do campo maior (Bø em Dó) normalmente *não* recebe um dominante secundário?
  #linhas-resposta(2)
]

#ex(titulo: "Trítono e substituição de trítono", nivel: "Médio")[
  Para cada dominante, escreva a 3ª e a 7ª (o trítono), o SubV e a 3ª e 7ª do SubV, e o acorde onde ambos resolvem. Compare as duas colunas de trítono: as notas são as mesmas (enarmonia permitida).

  #v(0.4em)
  #tabela-preencher(
    columns: (0.9fr, 1.2fr, 0.9fr, 1.2fr, 1fr),
    altura: 1.05cm,
    ([Dominante], [3ª e 7ª], [SubV], [3ª e 7ª do SubV], [Resolve em]),
    (
      ([G7], [B – F], [Db7], [F – Cb (B)], [C]),
      ([D7], none, none, none, none),
      ([A7], none, none, none, none),
      ([E7], none, none, none, none),
      ([B7], none, none, none, none),
      ([C7], none, none, none, none),
      ([F7], none, none, none, none),
      ([Bb7], none, none, none, none),
    ),
  )
]

#ex(titulo: "II-V relacionado", nivel: "Desafio")[
  Cada dominante secundário pode ser precedido pelo seu *II relacionado*: IIm7 quando o alvo é maior, IIø quando o alvo é menor. Complete os II-V secundários nos tons de Sol e Fá maior.

  #v(0.4em)
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1em,
    [
      #align(center, text(weight: "bold", size: 10pt)[Tom de Sol maior])
      #v(-0.3em)
      #tabela-preencher(
        columns: (0.9fr, 1fr, 1fr, 1fr),
        altura: 1.05cm,
        ([Alvo], [II relac.], [V7], [Alvo]),
        (
          ([II], none, none, none),
          ([III], none, none, none),
          ([IV], none, none, none),
          ([V], none, none, none),
          ([VI], none, none, none),
        ),
      )
    ],
    [
      #align(center, text(weight: "bold", size: 10pt)[Tom de Fá maior])
      #v(-0.3em)
      #tabela-preencher(
        columns: (0.9fr, 1fr, 1fr, 1fr),
        altura: 1.05cm,
        ([Alvo], [II relac.], [V7], [Alvo]),
        (
          ([II], none, none, none),
          ([III], none, none, none),
          ([IV], none, none, none),
          ([V], none, none, none),
          ([VI], none, none, none),
        ),
      )
    ],
  )
]

// ============================================================
// BLOCO 2 — CADÊNCIA EM TOM MENOR
// ============================================================

#block(sticky: true)[
  == 2. Cadência em Tom Menor

  Em tom menor, a cadência completa é *IIø – V7 – Im*: o IIø vem da menor natural e o V7 (com a sensível) da menor harmônica.
]

#ex(titulo: "IIø – V7 – Im em oito tons", nivel: "Médio")[
  Complete a cadência menor e indique a sensível (3ª do V7) de cada tom. Use uma letra por nota: em Fá\# menor a sensível é *Mi\#*.

  #v(0.4em)
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1em,
    tabela-preencher(
      columns: (0.8fr, 1fr, 1fr, 1fr),
      altura: 1.3cm,
      ([Tom], [IIø], [V7], [Sensível]),
      (
        ([Dm],) + (none,) * 3,
        ([Gm],) + (none,) * 3,
        ([Cm],) + (none,) * 3,
        ([Em],) + (none,) * 3,
      ),
    ),
    tabela-preencher(
      columns: (0.8fr, 1fr, 1fr, 1fr),
      altura: 1.3cm,
      ([Tom], [IIø], [V7], [Sensível]),
      (
        ([Bm],) + (none,) * 3,
        ([F\#m],) + (none,) * 3,
        ([Fm],) + (none,) * 3,
        ([C\#m],) + (none,) * 3,
      ),
    ),
  )
]

#ex(titulo: "As notas da cadência menor", nivel: "Desafio")[
  Escreva as notas de cada acorde e responda: que nota da tônica menor é a *b9* do V7(b9)? Ela aparece em qual acorde anterior?

  #v(0.4em)
  #tabela-preencher(
    columns: (0.6fr, 1.4fr, 1.6fr, 1.4fr, 1.6fr),
    altura: 1.5cm,
    ([Tom], [IIø], [V7(b9)], [Im(7M)], [b9 = qual nota do IIø?]),
    (
      ([Gm], [Aø:], [D7(b9):], [Gm(7M):], none),
      ([Cm], [Dø:], [G7(b9):], [Cm(7M):], none),
      ([Em], [F\#ø:], [B7(b9):], [Em(7M):], none),
    ),
  )

  #v(0.3em)
  Toque Aø – D7(b9) – Gm(7M) e descreva o caminho da nota Mib de um acorde para o outro.
  #linhas-resposta(2)
]

// ============================================================
// BLOCO 3 — EMPRÉSTIMO MODAL
// ============================================================

#block(sticky: true)[
  == 3. Empréstimo Modal

  Empréstimo modal é usar, num tom maior, acordes do *tom menor paralelo* (ou de outros modos com a mesma tônica). Dó maior pode "pedir emprestado" acordes de Dó menor sem mudar de tom.
]

#ex(titulo: "Classifique os acordes emprestados", nivel: "Médio")[
  No tom de *Dó maior*, todos os acordes abaixo são emprestados. Escreva o grau, o modo de origem (com tônica Dó) e a função harmônica: tônica (T), subdominante menor (SDm) ou dominante (D).

  #v(0.4em)
  #tabela-preencher(
    columns: (0.9fr, 1fr, 1.6fr, 1.4fr),
    altura: 1.05cm,
    ([Acorde], [Grau], [Modo de origem], [Função]),
    (
      ([Fm7], none, none, none),
      ([Ab7M], none, none, none),
      ([Bb7], none, none, none),
      ([Eb7M], none, none, none),
      ([Dø], none, none, none),
      ([Db7M], none, none, none),
      ([Gm7], none, none, none),
    ),
  )
]

#ex(titulo: "Encontre o empréstimo", nivel: "Médio")[
  Circule o(s) acorde(s) emprestado(s) de cada progressão e escreva grau e origem.

  #v(0.4em)
  #tabela-preencher(
    columns: (0.6fr, 2fr, 2.4fr),
    altura: 1.05cm,
    ([Tom], [Progressão], [Acorde(s) emprestado(s) — grau e origem]),
    (
      ([G], [G – Em – Cm – G], none),
      ([D], [D – Bb – C – D], none),
      ([C], [C7M – Fm7 – Bb7 – C7M], none),
      ([F], [F – Db7M – F], none),
      ([A], [A – F – G – A], none),
      ([E], [E – G – A – E], none),
      ([F], [F7M – Bbm6 – F7M], none),
    ),
  )
]

#ex(titulo: "Rearmonize com empréstimo modal", nivel: "Desafio")[
  Parta da progressão #box(fill: color-subtle-bg, inset: (x: 5pt, y: 2pt), radius: 2pt)[*C – Am – F – G – C*] e faça cada tarefa separadamente. Escreva a progressão resultante e toque-a.

  a) Troque o IV pelo IVm.
  #linhas-resposta(1)

  b) Troque o VIm pelo bVI7M emprestado.
  #linhas-resposta(1)

  c) Troque o V por uma cadência *back-door* (IVm7 – bVII7 – I).
  #linhas-resposta(1)

  d) Combine (b) e (c) numa só progressão. Que nota comum liga Am e Ab7M?
  #linhas-resposta(2)
]

// ============================================================
// BLOCO 4 — ACORDES DIMINUTOS
// ============================================================

#block(sticky: true)[
  == 4. Acordes Diminutos

  O acorde º7 é feito só de terças menores e divide a oitava em quatro partes iguais: por isso existem apenas *três* acordes diminutos diferentes — cada um com quatro nomes possíveis.
]

#ex(titulo: "As três famílias de diminutos", nivel: "Médio")[
  a) Escreva as notas de cada diminuto e os outros três nomes que ele pode receber (um para cada nota).

  #v(0.3em)
  #tabela-preencher(
    columns: (0.8fr, 2fr, 2.4fr),
    altura: 1.05cm,
    ([Acorde], [Notas (T – b3 – b5 – bb7)], [Também se chama]),
    (
      ([Cº7], none, none),
      ([C\#º7], none, none),
      ([Dº7], none, none),
    ),
  )

  #v(0.3em)
  b) A qual família (Cº7, C\#º7 ou Dº7) pertence cada acorde?

  #v(0.2em)
  #tabela-preencher(
    columns: (1fr,) * 8,
    altura: 1.05cm,
    ([G\#º7], [Ebº7], [Bbº7], [Fº7], [F\#º7], [Eº7], [Abº7], [Aº7]),
    ((none,) * 8,),
  )
]

#ex(titulo: "O diminuto como dominante", nivel: "Médio")[
  Um º7 é um V7(b9) sem a fundamental. Como ele tem quatro notas "equivalentes", cada º7 pode representar *quatro* dominantes diferentes. Para cada diminuto, escreva os quatro V7(b9) que ele representa e os acordes onde eles resolvem.

  #v(0.4em)
  #tabela-preencher(
    columns: (0.8fr, 1.6fr, 2.4fr),
    altura: 1.4cm,
    ([Diminuto], [Notas], [V7(b9) representados → resolução]),
    (
      ([Bº7], none, none),
      ([C\#º7], none, none),
      ([F\#º7], none, none),
    ),
  )
]

#ex(titulo: "Qual é a função do diminuto?", nivel: "Desafio")[
  Classifique o diminuto de cada progressão: *passagem ascendente* (baixo sobe ½ tom até o alvo; tem função dominante, pois equivale a um V7(b9) sem fundamental), *passagem descendente* (baixo cromático descendente, sem função dominante) ou *auxiliar* (mesmo baixo antes e depois). Para os ascendentes, escreva qual V7(b9) ele substitui.

  #v(0.4em)
  #tabela-preencher(
    columns: (0.5fr, 2.4fr, 1.2fr, 1.4fr),
    altura: 1.2cm,
    ([Tom], [Progressão], [Função], [Substitui (se ascendente)]),
    (
      ([C], [C7M – C\#º7 – Dm7 – G7], none, none),
      ([C], [Dm7 – D\#º7 – Em7], none, none),
      ([C], [Em7 – Ebº7 – Dm7 – G7], none, none),
      ([C], [C7M – Cº7 – C7M], none, none),
      ([G], [G7M – G\#º7 – Am7 – D7], none, none),
      ([G], [Am7 – Abº7 – G7M], none, none),
      ([G], [G7M – Gº7 – G7M], none, none),
    ),
  )
]

#ex(titulo: "Insira diminutos de passagem ascendentes", nivel: "Desafio")[
  Na progressão abaixo, insira um º7 ascendente entre cada par de acordes cujas fundamentais estejam a *um tom* de distância. Depois indique qual dominante secundário cada º7 está substituindo.

  #v(0.3em)
  #align(center, box(fill: color-subtle-bg, inset: (x: 8pt, y: 5pt), radius: 3pt)[*C7M – Dm7 – Em7 – F7M – G7 – C7M*])

  #v(0.2em)
  Progressão com diminutos:
  #linhas-resposta(1)
  Dominante que cada º7 substitui:
  #linhas-resposta(2)
]

// ============================================================
// BLOCO 5 — NOTAS-GUIA E TRÍADES
// ============================================================

#block(sticky: true)[
  == 5. Notas-Guia e Tríades no Braço

  A *3ª* e a *7ª* definem a qualidade de qualquer tétrade. No II-V-I, elas se movem por grau conjunto (ou ficam paradas): a 7ª de um acorde desce ½ tom ou 1 tom até a 3ª do seguinte.
]

#ex(titulo: "Notas-guia do II-V-I", nivel: "Médio")[
  Escreva a 3ª e a 7ª de cada acorde do II-V-I. A primeira linha é um exemplo.

  #v(0.4em)
  #tabela-preencher(
    columns: (0.6fr, 1fr, 0.9fr, 1fr, 0.9fr, 1fr, 0.9fr),
    altura: 1.05cm,
    ([Tom], [IIm7], [3ª – 7ª], [V7], [3ª – 7ª], [I7M], [3ª – 7ª]),
    (
      ([C], [Dm7], [F – C], [G7], [B – F], [C7M], [E – B]),
      ([F],) + (none,) * 6,
      ([Bb],) + (none,) * 6,
      ([Eb],) + (none,) * 6,
      ([G],) + (none,) * 6,
      ([D],) + (none,) * 6,
      ([A],) + (none,) * 6,
    ),
  )

  #v(0.3em)
  Observe a linha de Dó: para onde vai a 7ª do Dm7 (Dó)? E a 7ª do G7 (Fá)? Descreva a regra.
  #linhas-resposta(2)
]

#ex(titulo: "Shell voicings do II-V-I", nivel: "Médio")[
  Desenhe nos diagramas os *shell voicings* (T, 3ª e 7ª, sem a 5ª) do II-V-I pedido, alternando a fundamental entre a 6ª e a 5ª corda para que as notas-guia se movam o mínimo possível. Escreva a casa inicial ao lado de cada diagrama.

  #v(0.5em)
  #grid(
    columns: (1fr,) * 6,
    column-gutter: 0.4em,
    diag-vazio[Am7], diag-vazio[D7], diag-vazio[G7M], diag-vazio[Dm7], diag-vazio[G7], diag-vazio[C7M],
  )
  #v(0.2em)
  #grid(
    columns: (1fr, 1fr),
    align(center, text(size: 9pt, fill: color-muted)[II-V-I em Sol maior (Am7 com fundamental na 6ª corda)]),
    align(center, text(size: 9pt, fill: color-muted)[II-V-I em Dó maior (Dm7 com fundamental na 5ª corda)]),
  )
]

#ex(titulo: "Tríades nos grupos de cordas", nivel: "Médio")[
  Escreva o nome da nota em cada ponto cinza. Depois dê a cifra da tríade, a inversão (fundamental, 1ª ou 2ª — conforme a nota mais grave) e a nota do topo (com o intervalo).

  #v(0.5em)
  #grid(
    columns: (1fr,) * 4,
    row-gutter: 1.4em,
    diag-preencher("x,x,x,5,5,3"),
    diag-preencher("x,x,x,9,10,8"),
    diag-preencher("x,x,7,5,6,x"),
    diag-preencher("x,x,5,4,3,x"),
    diag-preencher("x,8,7,7,x,x"),
    diag-preencher("x,5,4,2,x,x"),
    diag-preencher("x,x,x,7,8,6"),
    diag-preencher("x,x,6,5,4,x"),
  )
]

#ex(titulo: "Uma tríade, três inversões", nivel: "Desafio")[
  Desenhe cada tríade nas três inversões, no grupo de cordas indicado, *subindo pelo braço* (cada forma acima da anterior). Escreva os intervalos (T, 3/b3, 5) em cada ponto e a casa inicial ao lado.

  #v(0.4em)
  #let linha-triade(rotulo, nomes) = grid(
    columns: (1.6fr, 1fr, 1fr, 1fr),
    align: horizon,
    text(size: 9.5pt, rotulo),
    ..nomes.map(n => diag-vazio(n)),
  )
  #linha-triade([*a) Dó maior* \ cordas 3-2-1 (Sol, Si, Mi) \ a partir da casa 3], ([C (fund.)], [C/E], [C/G]))
  #v(1em)
  #linha-triade([*b) Lá menor* \ cordas 4-3-2 (Ré, Sol, Si) \ a partir da casa 5], ([Am (fund.)], [Am/C], [Am/E]))
  #v(1em)
  #linha-triade([*c) Sol maior* \ cordas 5-4-3 (Lá, Ré, Sol) \ a partir da casa 4], ([G/D], [G (fund.)], [G/B]))

  #v(0.4em)
  Toque as três formas de cada tríade em sequência, subindo e descendo. Que nota fica no topo de cada forma de Dó maior?
  #linhas-resposta(2)
]

// ============================================================
// BLOCO 6 — ANÁLISE COMPLETA
// ============================================================

#block(sticky: true)[
  == 6. Análise Harmônica Completa

  Junte tudo: diatônicos, dominantes secundários, II relacionado, SubV, empréstimo e diminutos.
]

#ex(titulo: "Analise as progressões", nivel: "Desafio")[
  Escreva o grau (numeral romano) de cada acorde e, na linha de baixo, a função ou técnica (V7/x, II relacionado, SubV, empréstimo, º7 de passagem…). Toque cada progressão antes de analisar.

  #v(0.4em)
  *a) Tom de Fá maior*
  #analise(([F7M], [D7], [Gm7], [C7], [Am7], [Abº7], [Gm7], [Gb7], [F7M]))

  *b) Tom de Dó maior*
  #analise(([C7M], [Bø], [E7], [Am7], [Gm7], [C7], [F7M], [Fm7], [Bb7], [C7M]))

  *c) Tom de Lá menor*
  #analise(([Am7], [Bø], [E7], [Am7], [Dm7], [G7], [C7M], [F7M], [Bø], [E7(b9)], [Am]))

  *d) Tom de Sol maior*
  #analise(([G7M], [Em7], [Am7], [D7], [Bm7], [E7], [Am7], [Ab7], [G7M]))
]

// ============================================================
// GABARITO
// ============================================================

#gabarito[
  #resp(1)[
    #tabela-gab(
      ([Tom], [V7/II], [V7/III], [V7/IV], [V7/V], [V7/VI]),
      (
        ([G], [E7], [F\#7], [G7], [A7], [B7]),
        ([F], [D7], [E7], [F7], [G7], [A7]),
        ([D], [B7], [C\#7], [D7], [E7], [F\#7]),
        ([Bb], [G7], [A7], [Bb7], [C7], [D7]),
        ([A], [F\#7], [G\#7], [A7], [B7], [C\#7]),
        ([Eb], [C7], [D7], [Eb7], [F7], [G7]),
        ([E], [C\#7], [D\#7], [E7], [F\#7], [G\#7]),
      ),
    )
    Regra: o V7/x tem a fundamental uma 5ª justa acima do grau-alvo. O V7/IV tem a mesma fundamental do I (com b7 acrescentada).
  ]

  #resp(2)[
    Dm7 ← A7 · F\#m7 ← C\#7 · Bb7M ← F7 · Ebm7 ← Bb7 · G\#m7 ← D\#7 · Db7M ← Ab7 · E7M ← B7 · Cm7 ← G7. \
    O VIIø tem 5ª diminuta: é instável e não funciona como centro tonal provisório. Um dominante só "tonaliza" acordes que poderiam ser tônica de um tom (maiores ou menores).
  ]

  #resp(3)[
    #tabela-gab(
      ([Dominante], [3ª – 7ª], [SubV], [3ª – 7ª do SubV], [Resolve em]),
      (
        ([D7], [F\# – C], [Ab7], [C – Gb (F\#)], [G]),
        ([A7], [C\# – G], [Eb7], [G – Db (C\#)], [D]),
        ([E7], [G\# – D], [Bb7], [D – Ab (G\#)], [A]),
        ([B7], [D\# – A], [F7], [A – Eb (D\#)], [E]),
        ([C7], [E – Bb], [Gb7], [Bb – Fb (E)], [F]),
        ([F7], [A – Eb], [B7 (= Cb7)], [D\# – A], [Bb]),
        ([Bb7], [D – Ab], [E7 (= Fb7)], [G\# – D], [Eb]),
      ),
    )
    Critério: aceite grafias enarmônicas (Gb7 = F\#7; B7 = Cb7). A 3ª de um é a 7ª do outro.
  ]

  #resp(4)[
    *Sol maior:* II: Bø – E7 – Am7 · III: C\#ø – F\#7 – Bm7 · IV: Dm7 – G7 – C7M · V: Em7 – A7 – D7 · VI: F\#ø – B7 – Em7. \
    *Fá maior:* II: Aø – D7 – Gm7 · III: Bø – E7 – Am7 · IV: Cm7 – F7 – Bb7M · V: Dm7 – G7 – C7 · VI: Eø – A7 – Dm7. \
    Critério: para alvos menores, aceite também o II relacionado m7 (Bm7 – E7 – Am7), muito usado na prática; o IIø é a forma "do tom menor".
  ]

  #resp(5)[
    Dm: Eø – A7 (C\#) · Gm: Aø – D7 (F\#) · Cm: Dø – G7 (B) · Em: F\#ø – B7 (D\#) · Bm: C\#ø – F\#7 (A\#) · F\#m: G\#ø – C\#7 (E\#) · Fm: Gø – C7 (E) · C\#m: D\#ø – G\#7 (B\#).
  ]

  #resp(6)[
    Gm: Aø = A C Eb G · D7(b9) = D F\# A C Eb · Gm(7M) = G Bb D F\# · b9 = Eb (5ª diminuta do Aø). \
    Cm: Dø = D F Ab C · G7(b9) = G B D F Ab · Cm(7M) = C Eb G B · b9 = Ab (5ª diminuta do Dø). \
    Em: F\#ø = F\# A C E · B7(b9) = B D\# F\# A C · Em(7M) = E G B D\# · b9 = C (5ª diminuta do F\#ø). \
    A b9 do V7 é o 6º grau da escala menor (b6) — a mesma nota que já soava como b5 no IIø. Em Sol menor, o Mib fica parado de Aø para D7(b9) e desce ½ tom até o Ré (5ª) de Gm(7M).
  ]

  #resp(7)[
    #tabela-gab(
      ([Acorde], [Grau], [Origem (tônica Dó)], [Função]),
      (
        ([Fm7], [IVm7], [C eólio (também dórico)], [SDm]),
        ([Ab7M], [bVI7M], [C eólio], [SDm]),
        ([Bb7], [bVII7], [C eólio], [SDm (dominante "back-door")]),
        ([Eb7M], [bIII7M], [C eólio (também dórico)], [T (substituto da tônica)]),
        ([Dø], [IIø], [C eólio], [SDm]),
        ([Db7M], [bII7M], [C frígio], [SDm (napolitano)]),
        ([Gm7], [Vm7], [C eólio / mixolídio], [D (sem sensível)]),
      ),
    )
    Critério: aceite a origem "Dó menor natural" para eólio.
  ]

  #resp(8)[
    G: Cm = IVm (G menor) · D: Bb = bVI e C = bVII (D eólio) · C: Fm7 = IVm7 e Bb7 = bVII7 (C eólio — cadência back-door) · F: Db7M = bVI7M (F eólio) · A: F = bVI e G = bVII (A eólio) · E: G = bIII (E eólio) · F: Bbm6 = IVm6 (F menor; Bb Db F G).
  ]

  #resp(9)[
    a) C – Am – Fm – G – C · b) C – Ab7M – F – G – C · c) C – Am – Fm7 – Bb7 – C · d) C – Ab7M – Fm7 – Bb7 – C. \
    Nota comum entre Am (A C E) e Ab7M (Ab C Eb G): *Dó*, que fica parado enquanto Lá e Mi descem ½ tom (Láb e Mib). \
    Critério: em (d), aceite também C – Ab7M – F – Fm7 – Bb7 – C.
  ]

  #resp(10)[
    a) Cº7 = C Eb Gb Bbb (Lá) = Ebº7 = F\#º7 (Gbº7) = Aº7 · C\#º7 = C\# E G Bb = Eº7 = Gº7 = Bbº7 (A\#º7) · Dº7 = D F Ab Cb (Si) = Fº7 = Abº7 (G\#º7) = Bº7. \
    b) G\#º7 → Dº7 · Ebº7 → Cº7 · Bbº7 → C\#º7 · Fº7 → Dº7 · F\#º7 → Cº7 · Eº7 → C\#º7 · Abº7 → Dº7 · Aº7 → Cº7.
  ]

  #resp(11)[
    Bº7 (B D F Ab): G7(b9) → C · Bb7(b9) → Eb · Db7(b9) → Gb · E7(b9) → A. \
    C\#º7 (C\# E G Bb): A7(b9) → D · C7(b9) → F · Eb7(b9) → Ab · F\#7(b9) → B. \
    F\#º7 (F\# A C Eb): D7(b9) → G · F7(b9) → Bb · Ab7(b9) → Db · B7(b9) → E. \
    Regra: a fundamental de cada dominante fica uma 3ª maior abaixo de cada nota do º7 (e cada nota do º7 é a 3ª de um desses dominantes).
  ]

  #resp(12)[
    C\#º7 – passagem ascendente, função dominante (A7(b9) → Dm7) · D\#º7 – passagem ascendente (B7(b9) → Em7) · Ebº7 – passagem descendente (Mi – Mib – Ré no baixo) · Cº7 – auxiliar · G\#º7 – passagem ascendente (E7(b9) → Am7) · Abº7 – passagem descendente (Lá – Láb – Sol) · Gº7 – auxiliar.
  ]

  #resp(13)[
    C7M – *C\#º7* – Dm7 – *D\#º7* – Em7 – F7M – *F\#º7* – G7 – C7M (entre Em7 e F7M há só ½ tom; entre G7 e C7M não há grau intermediário). \
    C\#º7 = A7(b9) (V7/II) · D\#º7 = B7(b9) (V7/III) · F\#º7 = D7(b9) (V7/V).
  ]

  #resp(14)[
    #tabela-gab(
      ([Tom], [IIm7], [3ª–7ª], [V7], [3ª–7ª], [I7M], [3ª–7ª]),
      (
        ([F], [Gm7], [Bb – F], [C7], [E – Bb], [F7M], [A – E]),
        ([Bb], [Cm7], [Eb – Bb], [F7], [A – Eb], [Bb7M], [D – A]),
        ([Eb], [Fm7], [Ab – Eb], [Bb7], [D – Ab], [Eb7M], [G – D]),
        ([G], [Am7], [C – G], [D7], [F\# – C], [G7M], [B – F\#]),
        ([D], [Em7], [G – D], [A7], [C\# – G], [D7M], [F\# – C\#]),
        ([A], [Bm7], [D – A], [E7], [G\# – D], [A7M], [C\# – G\#]),
      ),
    )
    Regra: a 7ª do IIm7 desce ½ tom e vira a 3ª do V7 (Dó → Si); a 3ª do IIm7 fica parada e vira a 7ª do V7 (Fá); a 7ª do V7 desce ½ tom para a 3ª do I (Fá → Mi) e a 3ª do V7 fica como 7M do I (Si).
  ]

  #resp(15)[
    Resposta-modelo (outras regiões são válidas se mantiverem T-3-7 e o movimento mínimo das notas-guia):
    #v(0.2em)
    #grid(
      columns: (1fr,) * 6,
      align: center,
      [#box(chord("5,x,5,5,x,x", name: "Am7")) \ #text(size: 8pt)[A · G · C]],
      [#box(chord("x,5,4,5,x,x", name: "D7")) \ #text(size: 8pt)[D · F\# · C]],
      [#box(chord("3,x,4,4,x,x", name: "G7M")) \ #text(size: 8pt)[G · F\# · B]],
      [#box(chord("x,5,3,5,x,x", name: "Dm7")) \ #text(size: 8pt)[D · F · C]],
      [#box(chord("3,x,3,4,x,x", name: "G7")) \ #text(size: 8pt)[G · F · B]],
      [#box(chord("x,3,2,4,x,x", name: "C7M")) \ #text(size: 8pt)[C · E · B]],
    )
    Em Sol: G–C (Am7) → F\#–C (D7) → F\#–B (G7M). Em Dó: F–C (Dm7) → F–B (G7) → E–B (C7M).
  ]

  #resp(16)[
    1) C E G — C, fundamental, topo G (5) · 2) E A C — Am, 2ª inversão, topo C (b3) · 3) A C F — F, 1ª inversão, topo F (T) · 4) G B D — G, fundamental, topo D (5) · 5) F A D — Dm, 1ª inversão, topo D (T) · 6) D F\# A — D, fundamental, topo A (5) · 7) D G Bb — Gm, 2ª inversão, topo Bb (b3) · 8) Ab C Eb (G\# C D\#) — Ab, fundamental, topo Eb (5).
  ]

  #resp(17)[
    Resposta-modelo:
    #v(0.2em)
    #grid(
      columns: (1fr,) * 6,
      align: center,
      [#box(chord("x,x,x,5,5,3", name: "C")) \ #text(size: 8pt)[T · 3 · 5]],
      [#box(chord("x,x,x,9,8,8", name: "C/E")) \ #text(size: 8pt)[3 · 5 · T]],
      [#box(chord("x,x,x,12,13,12", name: "C/G")) \ #text(size: 8pt)[5 · T · 3]],
      [#box(chord("x,x,7,5,5,x", name: "Am")) \ #text(size: 8pt)[T · b3 · 5]],
      [#box(chord("x,x,10,9,10,x", name: "Am/C")) \ #text(size: 8pt)[b3 · 5 · T]],
      [#box(chord("x,x,14,14,13,x", name: "Am/E")) \ #text(size: 8pt)[5 · T · b3]],
    )
    #grid(
      columns: (1fr,) * 6,
      align: center,
      [],
      [#box(chord("x,5,5,4,x,x", name: "G/D")) \ #text(size: 8pt)[5 · T · 3]],
      [#box(chord("x,10,9,7,x,x", name: "G")) \ #text(size: 8pt)[T · 3 · 5]],
      [#box(chord("x,14,12,12,x,x", name: "G/B")) \ #text(size: 8pt)[3 · 5 · T]],
      [],
      [],
    )
    Critério: no grupo 3-2-1, C = C(3ª corda) E G; C/E = E G C; C/G = G C E. No grupo 4-3-2, Am = A C E; Am/C = C E A; Am/E = E A C. No grupo 5-4-3, G/D = D G B; G = G B D; G/B = B D G. Topo das formas de Dó: G (fund.), C (C/E) e E (C/G). As mesmas formas existem uma oitava abaixo (C/G solto: x,x,x,0,1,0; Am/E: x,x,2,2,1,x).
  ]

  #resp(18)[
    a) I7M – V7/II – IIm7 – V7 – IIIm7 – º7 de passagem (descendente) – IIm7 – SubV7 – I7M. \
    b) I7M – IIø/VI (II relacionado) – V7/VI – VIm7 – IIm7/IV (II relacionado) – V7/IV – IV7M – IVm7 (empréstimo, SDm) – bVII7 (empréstimo, back-door) – I7M. \
    c) Im7 – IIø – V7 – Im7 – IVm7 – bVII7 – bIII7M – bVI7M – IIø – V7(b9) – Im (Dm7 – G7 – C7M é o II-V-I do relativo maior; F7M – Bø – E7 forma a cadência de volta). \
    d) I7M – VIm7 – IIm7 – V7 – IIIm7 (II relacionado de E7) – V7/II – IIm7 – SubV7 – I7M.
  ]
]
