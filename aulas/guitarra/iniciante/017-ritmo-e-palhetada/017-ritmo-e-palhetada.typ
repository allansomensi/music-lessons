#import "/templates/layout.typ": *
#import "/templates/components.typ": *

#show: aula.with(
  instrumento: "Guitarra",
  nivel: "Iniciante",
)

// Tabelas, caixas e diagramas não se partem entre páginas (os blocos
// que precisam quebrar, como `exercicio`, já declaram breakable: true).
#set block(breakable: false)

// Exercício que não se divide entre páginas (enunciado + área de resposta juntos)
#let ex(..args) = block(breakable: false, above: 1.5em, below: 0.9em, exercicio(..args))

// ============================================================
// HELPERS LOCAIS — escrita rítmica com contagem
// ============================================================
// Cada figura é um dicionário com:
//   f     → desenho (nota, pausa ou grupo)
//   dur   → duração em tempos (semínima = 1)
//   cont  → textos da contagem, um por nota/tempo
//   passo → distância horizontal entre os textos (none = 1 tempo)
//   palh  → direções de palhetada, alinhadas como `cont` (opcional)

#let cabeca = 7.4pt
#let fig(f, dur, cont, passo: none, palh: none) = (f: f, dur: dur, cont: cont, passo: passo, palh: palh)

#let SB(..c) = fig(nota("semibreve"), 4, c.pos())
#let MN(..c) = fig(nota("minima"), 2, c.pos())
#let MNP(..c) = fig(nota("minima", ponto: true), 3, c.pos())
#let SM(c, palh: none) = fig(nota("seminima"), 1, (c,), palh: palh)
#let CL(c, palh: none) = fig(nota("colcheia"), 0.5, (c,), palh: palh)
#let CC(a, b, palh: none) = fig(grupo-notas(2), 1, (a, b), passo: cabeca + 9pt, palh: palh)
#let SC(a, b, c, d, palh: none) = fig(
  grupo-notas(4, barras: 2, espaco: 4.5pt),
  1,
  (a, b, c, d),
  passo: cabeca + 4.5pt,
  palh: palh,
)
#let PS(tipo, dur, ..c) = fig(pausa(tipo), dur, c.pos())

#let txt-cont(t) = {
  if t.starts-with("(") { text(size: 8.5pt, fill: color-muted, t) } else if t in ("1", "2", "3", "4") {
    text(size: 9.5pt, weight: "bold", fill: color-strong, t)
  } else { text(size: 9.5pt, t) }
}

#let linha-txt(textos, passo, unidade) = {
  let p = if passo == none { unidade } else { passo }
  let cel(t) = box(width: cabeca, align(center, txt-cont(t)))
  if textos.len() == 1 { cel(textos.at(0)) } else {
    grid(columns: (p,) * (textos.len() - 1) + (cabeca,), ..textos.map(cel))
  }
}

#let compasso(itens, unidade: 40pt, vazio: false) = {
  let tem-palh = itens.any(i => i.palh != none)
  let linhas = (
    itens.map(i => box(height: 28pt, align(left + bottom, i.f))),
    if vazio {
      (grid.cell(colspan: itens.len(), box(width: 100%, height: 15pt, stroke: (bottom: 0.6pt + color-rule-dark))),)
    } else { itens.map(i => linha-txt(i.cont, i.passo, unidade)) },
  )
  if tem-palh {
    linhas.push(itens.map(i => if i.palh == none { [] } else { linha-txt(i.palh, i.passo, unidade) }))
  }
  grid(
    columns: itens.map(i => i.dur * unidade),
    row-gutter: 7pt,
    align: left + bottom,
    ..linhas.flatten(),
  )
}

// Linha de compassos com fórmula de compasso no início
#let ritmo(compassos, unidade: 40pt, vazio: false, formula: ("4", "4")) = {
  let n = compassos.len()
  align(center, block(breakable: false, grid(
    columns: (auto,) * (n + 1),
    align: bottom,
    box(inset: (right: 8pt, bottom: 4pt), stack(
      dir: ttb,
      spacing: 1pt,
      text(size: 14pt, weight: "bold", formula.at(0)),
      text(size: 14pt, weight: "bold", formula.at(1)),
    )),
    ..compassos
      .enumerate()
      .map(p => {
        let (k, c) = p
        box(
          inset: (left: 10pt, right: 4pt, y: 4pt),
          stroke: (
            left: if k == 0 { 0.8pt + color-strong } else { none },
            right: (if k == n - 1 { 1.6pt } else { 0.8pt }) + color-strong,
          ),
          compasso(c, unidade: unidade, vazio: vazio),
        )
      }),
  )))
}

// Lista numerada que pode continuar na página seguinte
#let passos-q(itens) = {
  set block(breakable: true)
  passos(itens)
}

#let legenda(body) = align(center, text(size: 8.5pt, fill: color-muted, body))

= Ritmo, Contagem e Palhetada Alternada

Um guitarrista que toca as notas certas fora do tempo soa errado; um que toca poucas notas *no tempo* soa como música. Ritmo é a base de tudo: dos acordes da base ao solo mais rápido. Nesta aula você vai aprender a sentir e contar o pulso, ler as figuras rítmicas básicas, usar o metrônomo de forma inteligente e desenvolver a *palhetada alternada* — a técnica que dá precisão e velocidade à mão direita.

#objetivos((
  [Reconhecer pulso, andamento (BPM) e compasso, e contar compassos de 4/4 e 3/4],
  [Ler as figuras rítmicas e pausas da semibreve à semicolcheia],
  [Contar colcheias ("1 e 2 e") e semicolcheias ("1 i e a") em voz alta enquanto toca],
  [Usar o metrônomo para progredir de forma segura, de 5 em 5 BPM],
  [Aplicar as regras da palhetada alternada em exercícios de subdivisão e no cromático 1-2-3-4],
))

== 1. Pulso e andamento

O *pulso* é a batida regular e constante que você sente na música — aquela que faz você bater o pé sem pensar. Ele não acelera nem atrasa: é o "relógio" da música. O *andamento* é a velocidade desse pulso, medida em *BPM* (batidas por minuto).

- *60 BPM* = uma batida por segundo (como o ponteiro dos segundos).
- *120 BPM* = duas batidas por segundo — o dobro da velocidade.

#v(0.3em)

#tabela(
  columns: (1fr, 1.2fr, 2.4fr),
  ([*Andamento*], [*Faixa típica*], [*Onde costuma aparecer*]),
  (
    ([Lento], [60–80 BPM], [Baladas, blues lento, canções intimistas]),
    ([Moderado], [80–110 BPM], [Pop, MPB, reggae, boa parte do rock]),
    ([Rápido], [110–140 BPM], [Rock animado, pop dançante, country]),
    ([Muito rápido], [acima de 140 BPM], [Punk rock, metal, bluegrass]),
  ),
)

#v(0.3em)

#caixa(tipo: "dica")[
  Bata o pé ou balance a cabeça *sempre* que tocar. O corpo marcando o pulso é o seu metrônomo interno — e é ele que você vai usar quando tocar com outras pessoas.
]

== 2. Compasso: organizando os tempos

Os pulsos se agrupam em ciclos que se repetem, chamados *compassos*. A *fórmula de compasso*, escrita no começo da música como uma fração, diz como cada ciclo é formado: o número de cima indica *quantos tempos* há em cada compasso; o de baixo, *qual figura vale um tempo* (4 = semínima).

#v(0.3em)

#cartoes-info((
  (
    titulo: "4/4 — quaternário",
    corpo: [
      Quatro tempos por compasso, cada um valendo uma semínima. É o compasso de quase todo o rock, pop, blues e funk.

      #v(0.3em)
      #align(center)[*1* · 2 · *3* · 4 \ #text(size: 8.5pt, fill: color-muted)[forte · fraco · meio-forte · fraco]]
    ],
  ),
  (
    titulo: "3/4 — ternário",
    corpo: [
      Três tempos por compasso, cada um valendo uma semínima. É o compasso da valsa e de muitas baladas e canções folclóricas.

      #v(0.3em)
      #align(center)[*1* · 2 · 3 \ #text(size: 8.5pt, fill: color-muted)[forte · fraco · fraco]]
    ],
  ),
))

Na partitura e na tablatura, os compassos são separados por *barras verticais*. Ao contar, você recomeça do "1" a cada barra. O tempo 1 é o mais forte: é nele que costumam cair as trocas de acorde.

== 3. Figuras rítmicas e pausas

As *figuras* indicam quanto tempo cada nota dura; as *pausas* indicam quanto tempo de silêncio. Cada figura vale *metade* da anterior. Os valores abaixo valem para compassos em que a semínima é o tempo (4/4, 3/4):

#let fg(x) = box(height: 26pt, align(center + horizon, x))
#tabela(
  columns: (0.9fr, 0.9fr, 1.3fr, 1.1fr, 1.5fr),
  ([*Figura*], [*Pausa*], [*Nome*], [*Duração*], [*Cabem em um 4/4*]),
  (
    (fg(nota("semibreve")), fg(pausa("semibreve")), [Semibreve], [4 tempos], [1]),
    (fg(nota("minima")), fg(pausa("minima")), [Mínima], [2 tempos], [2]),
    (fg(nota("seminima")), fg(pausa("seminima")), [Semínima], [1 tempo], [4]),
    (fg(nota("colcheia")), fg(pausa("colcheia")), [Colcheia], [½ tempo], [8]),
    (fg(nota("semicolcheia")), fg(pausa("semicolcheia")), [Semicolcheia], [¼ de tempo], [16]),
  ),
)

Colcheias e semicolcheias vizinhas costumam ser *ligadas por barras* em vez de bandeirolas, agrupadas tempo a tempo: uma barra para colcheias (#box(baseline: 30%, grupo-notas(2, escala: 0.6))), duas barras para semicolcheias (#box(baseline: 30%, grupo-notas(4, barras: 2, escala: 0.6))).

*Ponto de aumento.* O ponto ao lado de uma figura *aumenta metade do seu valor*: a *mínima pontuada* (#box(baseline: 20%, nota("minima", ponto: true, escala: 0.7))) vale 2 + 1 = *3 tempos* (um compasso de 3/4 inteiro); a semínima pontuada, 1 + ½ = 1½ tempo.

=== A pirâmide rítmica

Um compasso de 4/4 pode ser preenchido por uma semibreve, duas mínimas, quatro semínimas, oito colcheias ou dezesseis semicolcheias. Veja a mesma duração total dividida em partes cada vez menores, já com a contagem que vamos estudar na próxima seção:

#v(0.4em)

#ritmo((
  (SB("1", "(2)", "(3)", "(4)"),),
  (MN("1", "(2)"), MN("3", "(4)")),
), unidade: 44pt)
#v(0.2em)
#ritmo((
  (SM("1"), SM("2"), SM("3"), SM("4")),
  (CC("1", "e"), CC("2", "e"), CC("3", "e"), CC("4", "e")),
), unidade: 44pt)
#v(0.2em)
#ritmo((
  (SC("1", "i", "e", "a"), SC("2", "i", "e", "a"), SC("3", "i", "e", "a"), SC("4", "i", "e", "a")),
), unidade: 52pt)

#legenda[Números entre parênteses: tempos em que a nota continua soando (conte mentalmente, sem tocar de novo).]

== 4. Contando em voz alta

Contar em voz alta é a ferramenta mais poderosa para tocar no tempo: a voz organiza a mão. Neste material usamos a seguinte convenção:

#v(0.3em)

#tabela(
  columns: (1fr, 1.1fr, 1.4fr, 2.2fr),
  ([*Subdivisão*], [*Notas/tempo*], [*Contagem*], [*Como falar*]),
  (
    ([Semínimas], [1], [*1 2 3 4*], ["um, dois, três, quatro"]),
    ([Colcheias], [2], [*1* e *2* e *3* e *4* e], ["um-e, dois-e, três-e, quatro-e"]),
    ([Semicolcheias], [4], [*1* i e a *2* i e a …], ["um-i-e-a, dois-i-e-a…"]),
  ),
)

#v(0.4em)

*Por que "1 i e a"?* Porque o *"e"* fica sempre no *meio do tempo* — exatamente onde ele já estava na contagem das colcheias. As sílabas *"i"* e *"a"* apenas preenchem os espaços entre o número e o "e". Assim, quando você passa de colcheias para semicolcheias, nada do que já sabia muda de lugar: só aparecem sílabas novas no meio. Os números coincidem com o clique do metrônomo e com o pé no chão; o "e" (o *contratempo*) é o momento em que o pé está no alto.

#v(0.3em)

#caixa(tipo: "atencao")[
  Notas longas e pausas também são contadas — só que *em silêncio* (aqui, entre parênteses). Quem para de contar durante a pausa quase sempre entra adiantado.
]

== 5. O metrônomo

O metrônomo é um aparelho (ou aplicativo) que emite um clique regular no BPM escolhido. Ele não serve para "tocar rápido": serve para mostrar, com honestidade, se você está no tempo. Use-o assim:

#v(0.3em)

#passos-q((
  [*Encontre o seu BPM limpo.* Comece num andamento em que você toca o exercício *sem nenhum erro* e sem tensão — mesmo que pareça lento demais.],
  [*Conte um compasso antes de entrar.* Ouça quatro cliques contando "1, 2, 3, 4" e comece no próximo "1".],
  [*Encaixe a nota no clique.* O objetivo é que o clique "desapareça" dentro do som da nota. Se você ouve o clique separado, está adiantado ou atrasado.],
  [*Regra dos três acertos.* Tocou três vezes seguidas sem erro? *Suba 5 BPM.* Errou duas vezes seguidas? *Volte 5 BPM.*],
  [*Anote o seu recorde.* Na sessão seguinte, comece 10 BPM abaixo dele para aquecer e só então volte a subir.],
))

#v(0.4em)

#caixa(tipo: "dica")[
  Velocidade é *consequência* de precisão. Subir de 5 em 5 parece lento, mas dez avanços desses somam 50 BPM a mais — com a técnica correta gravada na memória muscular.
]

== 6. Palhetada alternada

Na *palhetada alternada* a palheta *alterna estritamente* entre ataques para baixo (↓) e para cima (↑): baixo, cima, baixo, cima. É a técnica-base para riffs, solos e escalas, porque aproveita o movimento de volta da mão — que de outra forma seria desperdiçado.

=== As regras

#passos-q((
  [*Colcheias:* ↓ nos números (tempos) e ↑ nos "e" (contratempos).],
  [*Semicolcheias:* ↓ no número e no "e"; ↑ no "i" e no "a". Ou seja: ↓ ↑ ↓ ↑ a cada tempo, sempre começando para baixo.],
  [*A mão nunca para.* Ela funciona como um pêndulo, no ritmo da subdivisão. Em pausas e notas longas, a mão continua o movimento *sem tocar a corda* ("palhetada fantasma"), e a próxima nota cai na direção certa.],
  [*Movimento pequeno.* O movimento vem do *pulso* (e um pouco do antebraço), não do braço inteiro. A palheta passa pouco além da corda: 2 a 3 mm.],
  [*O pêndulo segue a menor subdivisão do trecho.* Se uma frase mistura colcheias e semicolcheias, a mão se move em semicolcheias; as colcheias, que caem no número e no "e", passam a ser tocadas ambas para baixo.],
))

#v(0.5em)

#comparativo(
  titulo-esquerda: "Correto",
  titulo-direita: "Errado",
  [
    - Palheta quase paralela às cordas, com só a ponta para fora.
    - Pulso solto; movimento curto e simétrico para baixo e para cima.
    - Ataques para cima com o mesmo volume dos ataques para baixo.
    - Dedo indicador e polegar firmes, mas sem apertar.
  ],
  [
    - Palheta muito "enterrada" na corda, travando o movimento.
    - Movimento grande, vindo do ombro ou do cotovelo.
    - Dois ataques seguidos para baixo "para facilitar".
    - Mão parando durante pausas e perdendo a sincronia.
  ],
)

#v(0.6em)

== 7. Exercícios técnicos

=== Pirâmide de subdivisão em uma corda

Toque a 5ª corda solta mantendo o pulso fixo e dobrando a quantidade de notas a cada compasso: mínimas, semínimas, colcheias e semicolcheias. Conte em voz alta o tempo todo. Na tablatura, cada uma das seis linhas é uma corda (a de baixo é a 6ª, Mi grave) e o número indica a casa — 0 é corda solta. Acima das linhas, a primeira fileira mostra a contagem e a segunda, a direção da palheta. Repare que, nas mínimas e semínimas, só os ataques para baixo soam — a mão sobe "no vazio". Comece a *60 BPM*; o compasso de semicolcheias é o desafio.

#v(0.3em)

#tab(
  titulo: "Pirâmide — compassos 1 e 2 (mínimas e semínimas)",
  "   1 (2)           3 (4)             1       2       3       4
   ↓               ↓                 ↓       ↓       ↓       ↓
e|---------------------------------|---------------------------------|
B|---------------------------------|---------------------------------|
G|---------------------------------|---------------------------------|
D|---------------------------------|---------------------------------|
A|-0---------------0---------------|-0-------0-------0-------0-------|
E|---------------------------------|---------------------------------|",
)

#v(0.4em)

#tab(
  titulo: "Pirâmide — compassos 3 e 4 (colcheias e semicolcheias)",
  "   1   e   2   e   3   e   4   e     1 i e a 2 i e a 3 i e a 4 i e a
   ↓   ↑   ↓   ↑   ↓   ↑   ↓   ↑     ↓ ↑ ↓ ↑ ↓ ↑ ↓ ↑ ↓ ↑ ↓ ↑ ↓ ↑ ↓ ↑
e|---------------------------------|---------------------------------|
B|---------------------------------|---------------------------------|
G|---------------------------------|---------------------------------|
D|---------------------------------|---------------------------------|
A|-0---0---0---0---0---0---0---0---|-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-|
E|---------------------------------|---------------------------------|",
  legenda: [Depois de dominar a ida, faça a volta: semicolcheias → colcheias → semínimas → mínimas, sem parar.],
)

=== O cromático 1-2-3-4

O exercício mais clássico de coordenação entre as mãos: *um dedo por casa* (indicador na 5, médio na 6, anelar na 7, mínimo na 8), quatro notas por corda, em colcheias e palhetada alternada estrita. Começamos na casa 5 porque as casas são mais estreitas e a abertura da mão é mais confortável; depois de dominar, leve o exercício para a casa 1.

#v(0.3em)

#tab(
  titulo: "Cromático 1-2-3-4 — subida (colcheias)",
  "   1  e  2  e  3  e  4  e    1  e  2  e  3  e  4  e    1  e  2  e  3  e  4  e
   ↓  ↑  ↓  ↑  ↓  ↑  ↓  ↑    ↓  ↑  ↓  ↑  ↓  ↑  ↓  ↑    ↓  ↑  ↓  ↑  ↓  ↑  ↓  ↑
e|-------------------------|-------------------------|-------------5--6--7--8--|
B|-------------------------|-------------------------|-5--6--7--8--------------|
G|-------------------------|-------------5--6--7--8--|-------------------------|
D|-------------------------|-5--6--7--8--------------|-------------------------|
A|-------------5--6--7--8--|-------------------------|-------------------------|
E|-5--6--7--8--------------|-------------------------|-------------------------|",
  legenda: [Na descida, faça 8-7-6-5 da 1ª corda até a 6ª, mantendo ↓ ↑ ↓ ↑.],
)

#v(0.4em)

#caixa(tipo: "atencao")[
  Mantenha os dedos da mão esquerda *perto das cordas* e deixe cada dedo pressionado até o próximo entrar ("dedos que ficam"). Se a mão doer, pare: o cromático é um exercício de precisão, não de resistência.
]

== 8. Leitura rítmica

Agora junte figuras e contagem. Leia cada linha em voz alta, batendo palmas nas notas e contando as pausas em silêncio; depois toque na 5ª corda solta (ou com um power chord — tônica e quinta, por exemplo 5ª corda casa 3 e 4ª corda casa 5 — abafado com a lateral da mão direita apoiada perto da ponte) usando palhetada alternada. Na última linha o compasso é *3/4*: conte só até três — a mínima pontuada ocupa o compasso inteiro.

#v(0.4em)

#ritmo((
  (SM("1"), SM("2"), MN("3", "(4)")),
  (CC("1", "e"), SM("2"), CC("3", "e"), SM("4")),
), unidade: 50pt)
#v(0.3em)
#ritmo((
  (SM("1"), PS("seminima", 1, "(2)"), CC("3", "e"), CC("4", "e")),
  (SC("1", "i", "e", "a"), CC("2", "e"), SM("3"), PS("seminima", 1, "(4)")),
), unidade: 50pt)
#v(0.3em)
#ritmo(
  (
    (MNP("1", "(2)", "(3)"),),
    (SM("1"), CC("2", "e"), SM("3")),
  ),
  formula: ("3", "4"),
)

#v(0.4em)

== 9. Exercícios

#ex(titulo: "Valores das figuras", nivel: "Escrita")[
  Complete a tabela com o nome de cada figura e sua duração em tempos (compasso 4/4).

  #v(0.3em)
  #tabela-preencher(
    ([*Figura*], [*Nome*], [*Tempos*], [*Figura*], [*Nome*], [*Tempos*]),
    (
      (fg(nota("seminima")), none, none, fg(pausa("minima")), none, none),
      (fg(nota("semicolcheia")), none, none, fg(nota("semibreve")), none, none),
      (fg(nota("minima", ponto: true)), none, none, fg(pausa("colcheia")), none, none),
    ),
    columns: (0.8fr, 1.4fr, 0.8fr, 0.8fr, 1.4fr, 0.8fr),
  )
]

#ex(titulo: "Quantos tempos?", nivel: "Escrita")[
  Some as durações e escreva o total de tempos.

  #v(0.3em)
  #let sm-in(x) = box(baseline: 25%, x)
  #grid(
    columns: (1fr, 1fr),
    row-gutter: 1.1em,
    column-gutter: 1.5em,
    [a) #sm-in(nota("minima")) + #sm-in(nota("seminima")) + #sm-in(pausa("seminima")) = #box(width: 2cm, stroke: (bottom: 0.5pt))],
    [b) #sm-in(grupo-notas(2)) + #sm-in(nota("minima", ponto: true)) = #box(width: 2cm, stroke: (bottom: 0.5pt))],
    [c) #sm-in(grupo-notas(4, barras: 2, espaco: 4.5pt)) + #sm-in(nota("colcheia")) + #sm-in(nota("colcheia")) = #box(width: 2cm, stroke: (bottom: 0.5pt))],
    [d) #sm-in(nota("semibreve")) + #sm-in(nota("minima")) = #box(width: 2cm, stroke: (bottom: 0.5pt))],
  )
]

#ex(titulo: "Escreva a contagem", nivel: "Escrita")[
  Escreva a contagem ("1 e 2 e", "1 i e a"…) na linha embaixo de cada compasso. Use parênteses para os tempos de nota longa e de pausa.

  #v(0.3em)
  #ritmo(
    (
      (SM("1"), CC("2", "e"), MN("3", "(4)")),
      (CC("1", "e"), CC("2", "e"), PS("seminima", 1, "(3)"), SM("4")),
    ),
    vazio: true,
  )
  #v(0.5em)
  #ritmo(
    (
      (SC("1", "i", "e", "a"), SM("2"), SC("3", "i", "e", "a"), SM("4")),
      (MN("1", "(2)"), CC("3", "e"), SC("4", "i", "e", "a")),
    ),
    vazio: true,
    unidade: 48pt,
  )
]

#ex(titulo: "Complete o compasso", nivel: "Escrita")[
  Cada compasso de 4/4 abaixo está incompleto. Escreva *uma única figura* (nota) que complete os 4 tempos.

  #v(0.3em)
  #let sm-in(x) = box(baseline: 25%, x)
  #grid(
    columns: (1fr, 1fr),
    row-gutter: 1.1em,
    column-gutter: 1.5em,
    [a) #sm-in(nota("minima")) #sm-in(nota("seminima")) + #box(width: 2.6cm, stroke: (bottom: 0.5pt))],
    [b) #sm-in(nota("seminima")) #sm-in(grupo-notas(2)) + #box(width: 2.6cm, stroke: (bottom: 0.5pt))],
    [c) #sm-in(nota("minima", ponto: true)) + #box(width: 2.6cm, stroke: (bottom: 0.5pt))],
    [d) #sm-in(grupo-notas(4, barras: 2, espaco: 4.5pt)) #sm-in(grupo-notas(4, barras: 2, espaco: 4.5pt)) #sm-in(grupo-notas(2)) + #box(width: 2.6cm, stroke: (bottom: 0.5pt))],
  )
]

#ex(titulo: "Marque a palhetada", nivel: "Escrita")[
  Escreva ↓ ou ↑ embaixo de cada nota, seguindo as regras da palhetada alternada em colcheias (a mão não para nas notas longas nem nas pausas).

  #v(0.3em)
  #ritmo(
    (
      (CC("1", "e"), SM("2"), CC("3", "e"), CC("4", "e")),
      (SM("1"), CC("2", "e"), PS("seminima", 1, "(3)"), CC("4", "e")),
    ),
    vazio: true,
    unidade: 46pt,
  )
]

#ex(titulo: "Cromático com metrônomo", nivel: "Prática")[
  Toque o cromático 1-2-3-4 (subida e descida) seguindo a regra dos três acertos. Anote o BPM máximo *limpo* de cada tentativa.

  #v(0.3em)
  #tabela-preencher(
    ([*Tentativa*], [*1*], [*2*], [*3*], [*4*], [*5*], [*6*], [*7*]),
    (([BPM limpo], none, none, none, none, none, none, none),),
    columns: (1.6fr,) + (1fr,) * 7,
  )
]

=== Sugestão de prática

#rotina-estudo((
  ([Bater palmas e contar as linhas da seção 8], [3 min], [60]),
  ([Pirâmide na 5ª corda: 8 compassos sem parar, contando], [5 min], [60–80]),
  ([Cromático 1-2-3-4 (casa 5), regra dos três acertos], [7 min], [60 → +5]),
  ([Leitura rítmica tocada com palhetada alternada], [5 min], [70]),
))

#v(0.6em)

#checklist(
  (
    [Explico a diferença entre pulso, andamento e compasso.],
    [Sei o nome e a duração de todas as figuras e pausas desta aula.],
    [Conto "1 e 2 e" e "1 i e a" em voz alta sem perder o pulso.],
    [Mantenho a mão em movimento contínuo durante pausas e notas longas.],
    [Toco o cromático 1-2-3-4 em colcheias com palhetada alternada estrita.],
    [Uso a regra dos três acertos e anoto meu BPM limpo.],
  ),
  titulo: "Autoavaliação",
)

#gabarito[
  #resposta(1)[
    Semínima — 1 · Pausa de mínima — 2 · Semicolcheia — ¼ · Semibreve — 4 · Mínima pontuada — 3 · Pausa de colcheia — ½.
  ]
  #resposta(2)[
    a) 2 + 1 + 1 = *4 tempos* · b) ½ + ½ + 3 = *4 tempos* · c) 1 + ½ + ½ = *2 tempos* · d) 4 + 2 = *6 tempos* (não cabe em um único compasso de 4/4).
  ]
  #resposta(3)[
    Linha 1: compasso 1 — *1 · 2 e · 3 (4)* ; compasso 2 — *1 e · 2 e · (3) · 4*. \
    Linha 2: compasso 1 — *1 i e a · 2 · 3 i e a · 4* ; compasso 2 — *1 (2) · 3 e · 4 i e a*.
  ]
  #resposta(4)[
    a) 2 + 1 = 3 → falta *uma semínima* · b) 1 + 1 = 2 → falta *uma mínima* · c) 3 → falta *uma semínima* ·
    d) 1 + 1 + 1 = 3 → falta *uma semínima*.
  ]
  #resposta(5)[
    Compasso 1: 1 ↓, e ↑ · 2 ↓ (a mão sobe no vazio) · 3 ↓, e ↑ · 4 ↓, e ↑. \
    Compasso 2: 1 ↓ (sobe no vazio) · 2 ↓, e ↑ · pausa (a mão faz ↓ ↑ sem tocar) · 4 ↓, e ↑. \
    Regra: em colcheias, todo número é ↓ e todo "e" é ↑, não importa o que venha antes.
  ]
  #resposta(6)[
    Exercício prático — critério de sucesso: tocar subida e descida três vezes seguidas sem erro, com todas as notas soando por igual, e ganhar ao menos 15 BPM ao longo das tentativas.
  ]
]
