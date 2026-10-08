#import "/templates/layout.typ": *
#import "/templates/components.typ": *
#import "@preview/conchord:0.4.0": new-chordgen

#show: aula.with(
  instrumento: "Guitarra",
  nivel: "Exercícios — Iniciante",
)

#let chord = new-chordgen(number-to-left: true, use-shadow-barre: false, scale-length: 1.2pt, colors: (hold: black, barre: black))
#show <chord>: set text(fill: color-strong, weight: "bold")

// ------------------------------------------------------------
// Helpers locais
// ------------------------------------------------------------

#set enum(numbering: "a)", spacing: 0.9em)

// Exercício que não se divide entre páginas.
#let ex(..args, body) = block(breakable: false, width: 100%, above: 1.5em, below: 0.9em, exercicio(..args, body))

// Página de abertura: quadro de temas (com níveis e espaço para
// anotar os acertos de cada bloco) e convenções.
#let rotulo-abertura(body) = block(
  above: 2.2em,
  below: 0.7em,
  sticky: true,
  text(size: 9pt, weight: "bold", tracking: 1.2pt, fill: color-secondary, upper(body)),
)

#let quadro-temas(linhas) = {
  set text(size: 9.5pt)
  tabela(
    columns: (1.55fr, 2.75fr, 0.9fr, 1.2fr, 0.9fr),
    alinhamento: (left + horizon, left + horizon, center + horizon, center + horizon, center + horizon),
    ([Bloco], [Temas], [Exercícios], [Níveis], [Acertos]),
    linhas.map(l => (
      [*#l.at(0).* #l.at(1)],
      l.at(2),
      l.at(3),
      text(tracking: 0.6pt, l.at(4)),
      [#box(width: 0.75cm, stroke: (bottom: 0.5pt + color-rule-dark)) / #l.at(5)],
    )),
  )
}

#let convencoes(itens) = caixa(tipo: "neutro", titulo: none, width: 100%)[
  #set text(size: 9.5pt)
  #set par(justify: false)
  #set par(hanging-indent: 6.2em, spacing: 0.9em)
  #for i in itens [
    #box(width: 6.2em, text(weight: "bold", fill: color-strong, i.at(0)))#i.at(1)

  ]
]

#let rotulo(body) = text(size: 9pt, weight: "bold", fill: color-secondary, body)
#let linha-nome(w: 1.8cm) = box(width: w, height: 1em, stroke: (bottom: 0.7pt + color-strong))

// Figuras rítmicas abreviadas
#let sb = nota("semibreve")
#let mi = nota("minima")
#let mip = nota("minima", ponto: true)
#let se = nota("seminima")
#let sep = nota("seminima", ponto: true)
#let co = nota("colcheia")
#let sc = nota("semicolcheia")
#let c2 = grupo-notas(2)
#let s4 = grupo-notas(4, barras: 2)
#let pse = pausa("seminima")
#let pmi = pausa("minima")
#let psb = pausa("semibreve")
#let pco = pausa("colcheia")

// Sequência de figuras numa linha
#let seq(..figs) = box(baseline: 30%, figs.pos().join(h(5pt)))

// Fórmula de compasso (números empilhados)
#let fc(a, b) = box(baseline: 35%, stack(
  spacing: 1pt,
  text(size: 12pt, weight: "bold")[#a],
  text(size: 12pt, weight: "bold")[#b],
))

// Linha rítmica: figuras em cima, caixas vazias embaixo para escrever
#let ritmo(compasso, figs, altura: 0.85cm, rot: none) = {
  let n = figs.len()
  grid(
    columns: (14pt, 16pt, 1fr),
    column-gutter: 4pt,
    align: (left + horizon, center + horizon, left + horizon),
    if rot == none { [] } else { text(size: 9pt, weight: "bold", fill: color-secondary, rot) },
    compasso,
    block(stroke: (left: 1pt + color-strong, right: 1.5pt + color-strong), inset: (x: 4pt), table(
      columns: (1fr,) * n,
      align: center + bottom,
      inset: (x: 2pt, y: 4pt),
      stroke: (x, y) => if y == 1 { 0.5pt + color-rule-light } else { none },
      ..figs.map(f => box(height: 27pt, align(center + bottom, f))),
      ..figs.map(_ => box(height: altura - 8pt)),
    )),
  )
}

// Grade de 12 compassos (3 linhas × 4) para o blues
#let grade-blues(celulas, titulo: none) = {
  if titulo != none { rotulo(titulo); v(0.15em) }
  grid(
    columns: (1fr,) * 4,
    ..celulas
      .enumerate()
      .map(((i, c)) => block(
        width: 100%,
        height: 0.95cm,
        stroke: (
          left: if calc.rem(i, 4) == 0 { 1pt + color-strong } else { 0.5pt + color-rule-dark },
          right: if calc.rem(i, 4) == 3 { 1pt + color-strong } else { none },
          top: 0.5pt + color-rule-light,
          bottom: 0.5pt + color-rule-light,
        ),
        inset: 3pt,
        {
          place(top + left, text(size: 6.5pt, fill: color-muted)[#(i + 1)])
          align(center + horizon, text(size: 10.5pt, weight: "bold", if c == none { [] } else { c }))
        },
      )),
  )
}

// Diagrama de acorde em branco (6 cordas × 5 casas) para o aluno desenhar.
#let diagrama-branco(casas: 5) = {
  let w = 60pt
  let h = 62pt
  let dx = w / 5
  let dy = h / casas
  box(width: w + 24pt, height: h + 14pt, {
    place(top + left, dx: 20pt, dy: 12pt, {
      for i in range(6) {
        place(top + left, dx: dx * i, line(angle: 90deg, length: h, stroke: 0.6pt + color-rule-dark))
      }
      for j in range(casas + 1) {
        place(top + left, dy: dy * j, line(length: w, stroke: (if j == 0 { 1.6pt } else { 0.6pt }) + color-rule-dark))
      }
    })
    place(top + left, dx: 2pt, dy: 12pt + dy / 2 + 3pt, line(length: 13pt, stroke: 0.5pt + color-rule-light))
  })
}

#let diag-desenhar(rotulo-txt) = align(center)[
  #diagrama-branco()
  #v(0.1em)
  #text(size: 9.5pt, weight: "bold")[#rotulo-txt]
]

#let diag-nomear(tabs) = align(center)[
  #box(chord(tabs))
  #v(0.3em)
  #text(size: 8.5pt, fill: color-secondary)[Shape:] #linha-nome(w: 1.1cm) \
  #v(0.2em)
  #text(size: 8.5pt, fill: color-secondary)[Acorde:] #linha-nome(w: 1.1cm)
]

= Ritmo, Pestana e Blues

*Como usar este material.* Estes exercícios juntam três habilidades que andam sempre juntas na guitarra: *ler e tocar ritmo*, *mover acordes pelo braço* com pestana e com o sistema CAGED, e *tocar um blues de 12 compassos* com técnicas de expressão. Resolva os blocos na ordem, a lápis, com o instrumento e um metrônomo por perto: toda resposta rítmica deve ser *batida ou tocada* antes de ser considerada certa. Confira tudo no *gabarito*, no final.

#rotulo-abertura[Quadro de temas]
#quadro-temas((
  ([1], [Figuras, compassos e palhetada], [Figuras e pausas · soma de tempos · contagem em voz alta · palhetada alternada], [1–5], [F F M M M], 5),
  ([2], [Pestana e CAGED], [Casa da pestana nos shapes de E e de A · nomear e desenhar acordes · sistema CAGED], [6–9], [F M M D], 4),
  ([3], [Blues de 12 compassos], [Acordes dominantes I7, IV7 e V7 · forma básica · quick change e turnaround], [10–13], [F M M D], 4),
  ([4], [Técnicas de expressão e transcrição], [Hammer-on, pull-off, bend, slide e vibrato · leitura e transcrição de tablatura], [14–16], [M D D], 3),
))
#block(above: 0.7em, text(size: 8.5pt, fill: color-secondary)[*Níveis:* F = fácil (aplicação direta de uma regra) · M = médio (raciocínio em etapas) · D = desafio (combina vários conceitos; vale errar e refazer). *Acertos:* depois de corrigir com o gabarito, anote quantos exercícios de cada bloco você acertou por completo e revise primeiro o bloco com menos acertos.])

#rotulo-abertura[Convenções]
#convencoes((
  ([Ritmo], [A semínima vale 1 tempo. Contagem em colcheias: "1 e 2 e 3 e 4 e" (o número cai no tempo; o "e", no contratempo). Tempos só sustentados ou pausados vão entre parênteses.]),
  ([Palhetada], [↓ = palhetada para baixo · ↑ = palhetada para cima.]),
  ([Shapes], ["Shape de E" = desenho do acorde aberto de Mi tocado com pestana (idem para A, Em, Am, E7, A7…). A pestana fica na casa da tônica.]),
  ([Tablatura], [`h` hammer-on · `p` pull-off · `b` bend · `r` release (volta do bend) · `/` e `\` slide · `~` vibrato.]),
))

#pagebreak()

// ============================================================
== 1. Figuras, compassos e palhetada
// ============================================================

#ex(titulo: "Figuras e pausas", nivel: "Fácil")[
  Escreva o nome de cada figura e quantos tempos ela vale, considerando a *semínima = 1 tempo*. O ponto de aumento acrescenta *metade* do valor da figura.

  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1em,
    tabela-preencher(
      columns: (0.8fr, 2fr, 0.9fr),
      ([Figura], [Nome], [Tempos]),
      (
        (sb, none, none),
        (mi, none, none),
        (se, none, none),
        (co, none, none),
        (sc, none, none),
      ),
      altura: 1.0cm,
    ),
    tabela-preencher(
      columns: (0.8fr, 2fr, 0.9fr),
      ([Figura], [Nome], [Tempos]),
      (
        (mip, none, none),
        (sep, none, none),
        (pse, none, none),
        (pmi, none, none),
        (pco, none, none),
      ),
      altura: 1.0cm,
    ),
  )
]

#ex(titulo: "Some os tempos", nivel: "Fácil")[
  Some a duração das figuras de cada linha. Depois diga se elas completam exatamente um compasso *4/4*, um compasso *3/4* ou *nenhum* dos dois.

  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1em,
    tabela-preencher(
      columns: (0.3fr, 2.45fr, 0.7fr, 1.1fr),
      ([], [Figuras], [Soma], [Compasso]),
      (
        ([a)], seq(se, se, mi), none, none),
        ([b)], seq(mip), none, none),
        ([c)], seq(c2, se, se, se), none, none),
        ([d)], seq(mi, se), none, none),
        ([e)], seq(sep, co, mi), none, none),
        ([f)], seq(se, pse, c2, se), none, none),
      ),
      altura: 1.0cm,
    ),
    tabela-preencher(
      columns: (0.3fr, 2.45fr, 0.7fr, 1.1fr),
      ([], [Figuras], [Soma], [Compasso]),
      (
        ([g)], seq(se, se, c2, se, se), none, none),
        ([h)], seq(s4, c2, se), none, none),
        ([i)], seq(mi, pmi), none, none),
        ([j)], seq(co, pco, se, se), none, none),
        ([k)], seq(sb), none, none),
        ([l)], seq(mip, co), none, none),
      ),
      altura: 1.0cm,
    ),
  )
]

#ex(titulo: "Escreva a contagem", nivel: "Médio")[
  Escreva, na caixa abaixo de cada figura, a contagem em que ela começa e as subdivisões que ela ocupa ("1 e 2 e…"). Coloque entre parênteses os tempos que são apenas *sustentados* ou *pausados*. Exemplo: uma mínima no início de um 4/4 = "1 (2)". Depois bata palmas contando em voz alta, a 60 BPM.

  #v(0.3em)
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1.4em,
    row-gutter: 0.9em,
    ritmo(fc(4, 4), (se, c2, se, c2), rot: "a)"),
    ritmo(fc(4, 4), (c2, c2, mi), rot: "b)"),
    ritmo(fc(4, 4), (sep, co, se, se), rot: "c)"),
    ritmo(fc(4, 4), (pse, c2, se, c2), rot: "d)"),
    ritmo(fc(3, 4), (mi, c2), rot: "e)"),
    ritmo(fc(3, 4), (c2, se, c2), rot: "f)"),
  )
]

#ex(titulo: "Complete os compassos", nivel: "Médio")[
  Cada compasso abaixo está incompleto. Calcule quantos tempos faltam e escreva (ou desenhe) uma figura — ou combinação de figuras — que complete o compasso.

  #tabela-preencher(
    columns: (0.35fr, 1fr, 2fr, 0.9fr, 2fr),
    ([], [Compasso], [Figuras dadas], [Faltam], [Complete com]),
    (
      ([a)], [4/4], seq(se, se, se), none, none),
      ([b)], [4/4], seq(mi, c2), none, none),
      ([c)], [3/4], seq(se), none, none),
      ([d)], [4/4], seq(mip), none, none),
      ([e)], [4/4], seq(sep, co), none, none),
      ([f)], [3/4], seq(c2, c2), none, none),
      ([g)], [4/4], seq(se, pse), none, none),
      ([h)], [4/4], seq(s4, co), none, none),
    ),
    altura: 0.92cm,
  )
]

#ex(titulo: "Palhetada alternada", nivel: "Médio")[
  Na palhetada alternada a mão direita *nunca para*: desce (↓) em cada tempo e sobe (↑) em cada contratempo ("e"), mesmo quando não toca a corda. Escreva nas caixas as palhetadas que *soam*; marque entre parênteses o movimento que passa sem tocar (em pausas). Em semicolcheias, a regra é ↓↑↓↑ dentro de cada tempo.

  #v(0.3em)
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1.4em,
    row-gutter: 0.9em,
    ritmo(fc(4, 4), (c2, c2, c2, c2), rot: "a)"),
    ritmo(fc(4, 4), (se, c2, se, c2), rot: "b)"),
    ritmo(fc(4, 4), (c2, se, c2, se), rot: "c)"),
    ritmo(fc(4, 4), (pco, co, se, pco, co, se), rot: "d)"),
  )
  #v(0.6em)
  #ritmo(fc(4, 4), (s4, s4, c2, se), altura: 0.95cm, rot: "e)")

  #v(0.3em)
  Por que, no item d), as colcheias depois das pausas são tocadas com palhetada *para cima*?
  #linhas-resposta(2)
]

// ============================================================
== 2. Pestana e CAGED
// ============================================================

#ex(titulo: "Em que casa fica a pestana?", nivel: "Fácil")[
  No *shape de E* (Mi / Mi menor), a tônica está na *6ª corda*; no *shape de A* (Lá / Lá menor), na *5ª corda*. A pestana fica na casa da tônica. Indique a casa de cada acorde (entre 1 e 12).

  + Shape de E (tônica na 6ª corda):

    #tabela-preencher(
      columns: (1.1fr,) + (1fr,) * 10,
      ([Acorde], [F], [G], [A], [Bm], [Cm], [F\#m], [Ab], [Bb], [Dm], [Ebm]),
      (([Casa],) + (none,) * 10,),
    )

  + Shape de A (tônica na 5ª corda):

    #tabela-preencher(
      columns: (1.1fr,) + (1fr,) * 10,
      ([Acorde], [Bm], [C], [C\#m], [D], [Eb], [Em], [F], [F\#m], [G], [Bb]),
      (([Casa],) + (none,) * 10,),
    )
]

#ex(titulo: "Nomeie os acordes com pestana", nivel: "Médio")[
  Identifique o shape usado (E, Em, E7, A, Am, Am7…) e o nome do acorde. Dica: ache a tônica na 6ª ou na 5ª corda e conte a casa.

  #v(0.4em)
  #grid(
    columns: (1fr,) * 4,
    row-gutter: 1.6em,
    align: center + bottom,
    diag-nomear("5,7,7,5,5,5"),
    diag-nomear("x,2,4,4,4,2"),
    diag-nomear("x,7,9,9,8,7"),
    diag-nomear("10,12,12,10,10,10"),
    diag-nomear("6,8,8,7,6,6"),
    diag-nomear("x,4,6,6,5,4"),
    diag-nomear("8,10,8,9,8,8"),
    diag-nomear("x,5,7,5,6,5"),
  )
]

#ex(titulo: "Desenhe os acordes", nivel: "Médio")[
  Desenhe cada acorde no shape pedido. Escreva o número da casa da pestana na linha à esquerda do diagrama, marque a pestana com uma barra e os demais dedos com pontos.

  #v(0.4em)
  #grid(
    columns: (1fr,) * 4,
    row-gutter: 1.2em,
    align: center,
    diag-desenhar[F\#m — shape Em],
    diag-desenhar[C — shape A],
    diag-desenhar[Gm — shape Em],
    diag-desenhar[Bb — shape A],
    diag-desenhar[Ab — shape E],
    diag-desenhar[Ebm — shape Am],
    diag-desenhar[A7 — shape E7],
    diag-desenhar[D7 — shape A7],
  )
]

#ex(titulo: "Um acorde, cinco lugares: CAGED", nivel: "Desafio")[
  No sistema CAGED, as cinco formas abertas de C, A, G, E e D viram shapes móveis (com o indicador fazendo o papel da pestana fixa), e cada uma toca o mesmo acorde em uma região diferente do braço. Os cinco shapes se encadeiam pelo braço sempre na ordem *C → A → G → E → D → C…*. Complete a tabela para os acordes *C* e *D*: em que corda e em que casa fica a tônica principal de cada shape e qual região (casas aproximadas) ele ocupa.

  #tabela-preencher(
    columns: (0.9fr, 1fr, 0.8fr, 1.1fr, 1fr, 0.8fr, 1.1fr),
    ([Shape], [C: corda], [C: casa], [C: região], [D: corda], [D: casa], [D: região]),
    (
      ([C], none, none, none, none, none, none),
      ([A], none, none, none, none, none, none),
      ([G], none, none, none, none, none, none),
      ([E], none, none, none, none, none, none),
      ([D], none, none, none, none, none, none),
    ),
  )

  Você está tocando G no shape de E, com pestana na casa 3. Qual shape de G vem logo *acima* no braço e em que casa está a sua tônica? E qual vem logo *abaixo*?
  #linhas-resposta(2)
]

// ============================================================
== 3. Blues de 12 compassos
// ============================================================

#ex(titulo: "Os três acordes do blues", nivel: "Fácil")[
  O blues usa três acordes dominantes: *I7*, *IV7* e *V7*. Complete a tabela para cada tom.

  #tabela-preencher(
    columns: (1fr,) * 8,
    ([Grau], [E], [A], [D], [G], [C], [F], [Bb]),
    (
      ([I7],) + (none,) * 7,
      ([IV7],) + (none,) * 7,
      ([V7],) + (none,) * 7,
    ),
  )
]

#ex(titulo: "A forma básica", nivel: "Médio")[
  A forma mais comum do blues de 12 compassos, com *turnaround* (V7 no último compasso, puxando a volta ao início), é:

  #grade-blues(([I7], [I7], [I7], [I7], [IV7], [IV7], [I7], [I7], [V7], [IV7], [I7], [V7]), titulo: "Forma em graus")

  #v(0.5em)
  Escreva a forma com os acordes de cada tom.

  #v(0.2em)
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1.2em,
    grade-blues((none,) * 12, titulo: "Blues em A"),
    grade-blues((none,) * 12, titulo: "Blues em E"),
  )
]

#ex(titulo: "Quick change e turnaround", nivel: "Médio")[
  Na variação com *quick change*, o compasso 2 vai para o IV7 e volta ao I7 no compasso 3. Escreva a forma com quick change e turnaround nos tons de G e de C.

  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1.2em,
    grade-blues((none,) * 12, titulo: "Blues em G (quick change)"),
    grade-blues((none,) * 12, titulo: "Blues em C (quick change)"),
  )

  #v(0.4em)
  + Em quais compassos a forma com quick change difere da forma básica?
  + Um turnaround muito usado ocupa os dois últimos compassos com *I7 – IV7 | I7 – V7*. Escreva-o para o blues em A.
  #linhas-resposta(2)
]

#ex(titulo: "Encontre os erros", nivel: "Desafio")[
  Um colega escreveu um blues em E *com quick change e turnaround*, mas errou *três* compassos. Circule os erros e escreva a correção ao lado.

  #grade-blues(([E7], [A7], [E7], [E7], [A7], [B7], [E7], [E7], [B7], [E7], [E7], [A7]))

  #v(0.3em)
  #linhas-resposta(2)
]

// ============================================================
== 4. Técnicas de expressão e transcrição
// ============================================================

#ex(titulo: "Leia os símbolos da tablatura", nivel: "Médio")[
  Para cada trecho marcado com uma letra, escreva o nome da técnica e o que a mão esquerda deve fazer (de que casa para que casa, quanto sobe o bend etc.).

  #tab("    a)       b)       c)       d)       e)       f)       g)       h)\ne|--------------------------------------------------------5~~--------------|\nB|--------------------8b10-----8b10r8------------------------------8b9-----|\nG|--5h7------7p5------------------------7/9------9\\7-----------------------|\nD|-------------------------------------------------------------------------|\nA|-------------------------------------------------------------------------|\nE|-------------------------------------------------------------------------|", tamanho: 8.5pt)

  #tabela-preencher(
    columns: (0.5fr, 1.6fr, 3.4fr),
    ([], [Técnica], [O que fazer]),
    (
      ([a)], none, none),
      ([b)], none, none),
      ([c)], none, none),
      ([d)], none, none),
      ([e)], none, none),
      ([f)], none, none),
      ([g)], none, none),
      ([h)], none, none),
    ),
    altura: 0.8cm,
  )
]

#ex(titulo: "Transcreva para a tablatura", nivel: "Desafio")[
  + Escreva na tab a frase descrita (pentatônica de Lá menor, posição 1), na ordem: ① 3ª corda, casa 5, *hammer-on* para a casa 7; ② 2ª corda, casa 8, *bend de 1 tom* e *release*; ③ 2ª corda, casa 5; ④ 3ª corda, casa 7, *pull-off* para a casa 5; ⑤ 4ª corda, *slide* da casa 5 para a casa 7, terminando com *vibrato*.

    #tab-vazia(sistemas: 1, compassos: 2, altura-linha: 10pt)

  + O riff de *shuffle* (boogie) em A alterna duas notas sobre a 5ª corda solta: casa 2 e casa 4 da 4ª corda, duas colcheias de cada. Escreva um compasso do riff em *A* (5ª corda solta) e transporte o mesmo desenho para *D* (4ª corda solta) e para *E* (6ª corda solta).

    #tab-vazia(sistemas: 1, compassos: 3, altura-linha: 10pt)
]

#ex(titulo: "Seu blues com pestana", nivel: "Desafio")[
  Você vai tocar um blues em *A* com todas as pestanas entre as casas 5 e 7. Para cada acorde, escolha um shape com pestana (E7 ou A7), indique a casa da pestana e desenhe. Depois toque a forma com quick change usando a batida ↓ ↓↑ ↓ ↓↑ e termine com um lick seu na pentatônica de Lá menor.

  #grid(
    columns: (1.2fr, 1fr, 1fr, 1fr),
    column-gutter: 0.8em,
    align: (left + horizon, center, center, center),
    tabela-preencher(
      columns: (0.8fr, 1fr, 0.8fr),
      ([Acorde], [Shape], [Casa]),
      (
        ([A7], none, none),
        ([D7], none, none),
        ([E7], none, none),
      ),
      altura: 1cm,
    ),
    diag-desenhar[A7],
    diag-desenhar[D7],
    diag-desenhar[E7],
  )

  #v(0.3em)
  Escreva o seu lick final (2 compassos), usando pelo menos duas técnicas de expressão:
  #tab-vazia(sistemas: 1, compassos: 2, altura-linha: 10pt)
]

#block(breakable: false)[
  #set text(size: 10pt)
  == Autoavaliação

  Antes de conferir o gabarito, marque o que você já consegue fazer *sem consultar* nenhum material de apoio.

  #checklist((
    [Sei o valor de cada figura e pausa e somo os tempos de um compasso 4/4 ou 3/4.],
    [Conto em voz alta ("1 e 2 e…") enquanto toco, sem perder o tempo.],
    [Mantenho a palhetada alternada (↓ no tempo, ↑ no contratempo), inclusive nas pausas.],
    [Encontro a casa de qualquer acorde maior, menor ou com sétima nos shapes de E e de A.],
    [Toco o mesmo acorde em cinco regiões usando o CAGED.],
    [Escrevo e toco o blues de 12 compassos em qualquer tom, com quick change e turnaround.],
    [Leio e executo `h`, `p`, `b`, `r`, `/`, `\` e `~` na tablatura, e transcrevo uma frase simples.],
  ))

  === Sugestão de prática no instrumento

  Depois de corrigir os exercícios, transforme os erros em prática no instrumento, sempre com metrônomo:

  #rotina-estudo((
    ([Ritmos dos exercícios 3 e 5 em uma corda abafada, contando em voz alta], [5 min], [60–80]),
    ([Palhetada alternada em colcheias e semicolcheias numa nota só], [5 min], [60–90]),
    ([Pestana: F, Fm, Bb, Bm, subindo e descendo o braço nos shapes de E e A], [5 min], [—]),
    ([Blues em A com quick change e turnaround, batida ↓ ↓↑ ↓ ↓↑], [5 min], [70–90]),
    ([Frase do exercício 15 com bend afinado (confira a nota-alvo antes)], [5 min], [60]),
  ))

  #v(0.6em)
  #text(weight: "bold", size: 10pt)[Anotações — dúvidas para tirar com o professor]
  #linhas-resposta(7)
]

// ============================================================
#gabarito[
  #set par(leading: 0.8em)

  #resposta(1)[
    Semibreve = *4* · mínima = *2* · semínima = *1* · colcheia = *½* · semicolcheia = *¼* · mínima pontuada = *3* · semínima pontuada = *1½* · pausa de semínima = *1* · pausa de mínima = *2* · pausa de colcheia = *½*. (A pausa de mínima fica *apoiada sobre* a linha; a de semibreve fica *pendurada* nela.)
  ]

  #resposta(2)[
    a) 1 + 1 + 2 = *4* → 4/4 · b) *3* → 3/4 · c) ½ + ½ + 1 + 1 + 1 = *4* → 4/4 · d) 2 + 1 = *3* → 3/4 · e) 1½ + ½ + 2 = *4* → 4/4 · f) 1 + 1 + 1 + 1 = *4* → 4/4 · g) 1 + 1 + 1 + 1 + 1 = *5* → nenhum · h) 1 + 1 + 1 = *3* → 3/4 · i) 2 + 2 = *4* → 4/4 · j) ½ + ½ + 1 + 1 = *3* → 3/4 · k) *4* → 4/4 · l) 3 + ½ = *3½* → nenhum.
  ]

  #resposta(3)[
    a) 1 | 2 e | 3 | 4 e · b) 1 e | 2 e | 3 (4) · c) 1 (2) | e | 3 | 4 — a colcheia cai no "e" do tempo 2 · d) (1) | 2 e | 3 | 4 e · e) 1 (2) | 3 e · f) 1 e | 2 | 3 e.
  ]

  #resposta(4)[
    a) falta *1* tempo → semínima · b) *1* → semínima · c) *2* → mínima · d) *1* → semínima · e) *2* → mínima · f) *1* → semínima · g) *2* → mínima (ou duas semínimas) · h) 1 + ½ = 1½ dados, faltam *2½* → colcheia + mínima (ou semínima pontuada + semínima). Outras combinações com a mesma soma também estão corretas.
  ]

  #resposta(5)[
    a) ↓↑ ↓↑ ↓↑ ↓↑ · b) ↓ | ↓↑ | ↓ | ↓↑ (na semínima, a mão sobe sem tocar) · c) ↓↑ | ↓ | ↓↑ | ↓ · d) (↓) ↑ | ↓ | (↓) ↑ | ↓ · e) ↓↑↓↑ | ↓↑↓↑ | ↓↑ | ↓. \
    No item d) as colcheias estão no *contratempo* ("e"): a mão desceu no tempo durante a pausa, sem tocar, e por isso a nota seguinte é atacada na subida. Manter o movimento constante é o que garante a precisão rítmica.
  ]

  #resposta(6)[
    a) Shape de E: F *1* · G *3* · A *5* · Bm *7* · Cm *8* · F\#m *2* · Ab *4* · Bb *6* · Dm *10* · Ebm *11*. \
    b) Shape de A: Bm *2* · C *3* · C\#m *4* · D *5* · Eb *6* · Em *7* · F *8* · F\#m *9* · G *10* · Bb *1*.
  ]

  #resposta(7)[
    `5,7,7,5,5,5` shape Em, casa 5 → *Am* · `x,2,4,4,4,2` shape A, casa 2 → *B* · `x,7,9,9,8,7` shape Am, casa 7 → *Em* · `10,12,12,10,10,10` shape Em, casa 10 → *Dm* · `6,8,8,7,6,6` shape E, casa 6 → *Bb* (= A\#) · `x,4,6,6,5,4` shape Am, casa 4 → *C\#m* · `8,10,8,9,8,8` shape E7, casa 8 → *C7* · `x,5,7,5,6,5` shape Am7, casa 5 → *Dm7*.
  ]

  #resposta(8)[
    F\#m `2,4,4,2,2,2` (pestana 2) · C `x,3,5,5,5,3` (pestana 3) · Gm `3,5,5,3,3,3` (pestana 3) · Bb `x,1,3,3,3,1` (pestana 1) · Ab `4,6,6,5,4,4` (pestana 4) · Ebm `x,6,8,8,7,6` (pestana 6) · A7 `5,7,5,6,5,5` (pestana 5) · D7 `x,5,7,5,7,5` (pestana 5).
  ]

  #resposta(9)[
    #tabela(
      columns: (0.8fr, 1fr, 0.8fr, 1fr, 1fr, 0.8fr, 1fr),
      ([Shape], [C: corda], [C: casa], [C: região], [D: corda], [D: casa], [D: região]),
      (
        ([C], [5ª], [3], [0–3], [5ª], [5], [2–5]),
        ([A], [5ª], [3], [3–5], [5ª], [5], [5–7]),
        ([G], [6ª], [8], [5–8], [6ª], [10], [7–10]),
        ([E], [6ª], [8], [8–10], [6ª], [10], [10–12]),
        ([D], [4ª], [10], [10–13], [4ª], [0 (12)], [0–3 (12–15)]),
      ),
    )
    Acima do shape de E vem o *shape de D*, com a tônica na 4ª corda, casa *5*; abaixo dele vem o *shape de G* — aqui, o próprio G aberto (casas 0–3), com a tônica na 6ª corda, casa 3.
  ]

  #resposta(10)[
    E: E7 A7 B7 · A: A7 D7 E7 · D: D7 G7 A7 · G: G7 C7 D7 · C: C7 F7 G7 · F: F7 Bb7 C7 · Bb: Bb7 Eb7 F7.
  ]

  #resposta(11)[
    A: A7 | A7 | A7 | A7 || D7 | D7 | A7 | A7 || E7 | D7 | A7 | E7. \
    E: E7 | E7 | E7 | E7 || A7 | A7 | E7 | E7 || B7 | A7 | E7 | B7.
  ]

  #resposta(12)[
    G: G7 | *C7* | G7 | G7 || C7 | C7 | G7 | G7 || D7 | C7 | G7 | D7. \
    C: C7 | *F7* | C7 | C7 || F7 | F7 | C7 | C7 || G7 | F7 | C7 | G7. \
    a) Só no *compasso 2* (IV7 em vez de I7). b) A7 – D7 | A7 – E7.
  ]

  #resposta(13)[
    Compasso *6*: B7 → *A7* (o compasso 6 é IV7) · compasso *10*: E7 → *A7* (o compasso 10 é IV7) · compasso *12*: A7 → *B7* (o turnaround termina no V7).
  ]

  #resposta(14)[
    a) *Hammer-on*: toque a casa 5 da 3ª corda e martele a casa 7 sem palhetar · b) *Pull-off*: toque a casa 7 e puxe o dedo, fazendo soar a casa 5 · c) *Bend de 1 tom*: na casa 8 da 2ª corda, empurre até soar a nota da casa 10 · d) *Bend e release*: igual ao anterior e volte à casa 8 sem palhetar · e) *Slide ascendente*: deslize da casa 7 à 9 na 3ª corda mantendo a pressão · f) *Slide descendente*: da casa 9 à 7 · g) *Vibrato*: casa 5 da 1ª corda com oscilação da afinação · h) *Meio bend* (½ tom): na casa 8 da 2ª corda, suba até a nota da casa 9.
  ]

  #resposta(15)[
    a) #v(-0.4em)
    #tab("e|------------------------------|\nB|--------8b10r8--5-------------|\nG|--5h7-------------7p5---------|\nD|----------------------5/7~~---|\nA|------------------------------|\nE|------------------------------|", tamanho: 8pt)
    b) Colcheias, um compasso por tom (padrão 2–2–4–4 repetido):
    #tab("  A                 D                 E\ne|-----------------|-----------------|-----------------|\nB|-----------------|-----------------|-----------------|\nG|-----------------|-2-2-4-4-2-2-4-4-|-----------------|\nD|-2-2-4-4-2-2-4-4-|-0-0-0-0-0-0-0-0-|-----------------|\nA|-0-0-0-0-0-0-0-0-|-----------------|-2-2-4-4-2-2-4-4-|\nE|-----------------|-----------------|-0-0-0-0-0-0-0-0-|", tamanho: 8pt)
  ]

  #resposta(16)[
    Pestanas entre as casas 5 e 7: *A7* shape E7, casa *5* (`5,7,5,6,5,5`) · *D7* shape A7, casa *5* (`x,5,7,5,7,5`) · *E7* shape A7, casa *7* (`x,7,9,7,9,7`). O lick é pessoal — critério de sucesso: usa notas da pentatônica de Lá menor (A C D E G), pelo menos duas técnicas (ex.: bend e vibrato) e termina na tônica Lá, no tempo.
  ]
]
