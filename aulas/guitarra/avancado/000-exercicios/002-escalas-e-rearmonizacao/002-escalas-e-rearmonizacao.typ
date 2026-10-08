#import "/templates/layout.typ": *
#import "/templates/components.typ": *

#show: aula.with(
  instrumento: "Guitarra",
  nivel: "Exercícios — Avançado",
)

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

// Progressão em destaque no enunciado.
#let prog(body) = align(center, box(
  fill: color-subtle-bg,
  stroke: 0.5pt + color-rule-light,
  inset: (x: 10pt, y: 6pt),
  radius: 3pt,
  text(weight: "bold", body),
))

// Progressão para analisar: acordes no topo, linhas para grau e função.
#let analise(acordes, linhas: ("Grau", "Função / obs.")) = {
  let n = acordes.len()
  tabela-preencher(
    columns: (1.25fr,) + (1fr,) * n,
    altura: 0.95cm,
    ([],) + acordes.map(a => text(size: 9.5pt, a)),
    linhas.map(l => ([#text(size: 9pt, l)],) + (none,) * n),
  )
}

// Tabela "acorde a acorde": cifra, função, escala, notas.
#let escala-a-escala(acordes, altura: 1.05cm) = tabela-preencher(
  columns: (1fr, 1.1fr, 1.6fr, 2.6fr),
  altura: altura,
  ([Acorde], [Função], [Escala], [Notas (a partir da fundamental)]),
  acordes.map(a => ([#a], none, none, none)),
)

= Escalas e Rearmonização

Escolher a escala certa para cada acorde e saber trocar acordes sem perder a melodia são as duas faces da mesma habilidade: *ouvir a função* de cada momento da música. Este material treina os modos da menor melódica, as escalas simétricas, a escolha de escala acorde a acorde em progressões de jazz e a rearmonização guiada.

== Como usar este material

#[
  #set text(size: 10pt)
  #passos((
    [Resolva *na ordem*: cada bloco vai do nível *Médio* (aplicação direta) ao *Desafio* (escolhas, análise, rearmonização).],
    [Para cada escala, escreva as notas *a partir da fundamental do acorde* — é assim que você vai pensá-la ao improvisar.],
    [Grave as progressões (ou use um backing track) e *toque* cada escala e cada rearmonização: o ouvido é o juiz final.],
    [Confira no *Gabarito*. Nas rearmonizações há várias respostas válidas: o gabarito traz uma resposta-modelo e o critério de correção.],
  ))
]

== Conteúdos cobertos

#[
  #set text(size: 9.5pt)
  #tabela(
    columns: (1.5fr, 3.8fr, 0.7fr),
    alinhamento: (left + horizon, left + horizon, center + horizon),
    ([Bloco], [O que você pratica], [Exerc.]),
    (
      ([*1. Menor melódica*], [Os 7 modos, notas em vários tons, qual escala para qual acorde], [1–4]),
      ([*2. Escalas simétricas*], [As 3 diminutas, dom-dim, as 2 de tons inteiros, quando usar cada uma], [5–8]),
      ([*3. Escala acorde a acorde*], [Progressões de jazz em tom maior e menor, frase sobre V7alt], [9–12]),
      ([*4. Rearmonização*], [Tarefas guiadas, melodia rearmonizada, análise com SubV, II-V relacionado, back-door e diminutos], [13–17]),
    ),
  )
]

#v(0.4em)

#caixa(tipo: "resumo", titulo: none, width: 100%)[
  #set text(size: 9.5pt)
  #align(left)[*Convenções:* #h(4pt) "mm" = menor melódica (forma do jazz, igual subindo e descendo). Nomes dos modos da menor melódica: I menor melódica · II dórico b2 · III lídio aumentado · IV lídio dominante · V mixolídio b6 · VI lócrio 9 · VII alterada (superlócrio). Em escalas de oito ou seis notas (diminutas e tons inteiros) a enarmonia é livre. *b7* = 7ª menor, *7M* = 7ª maior.]
]

#pagebreak()

// ============================================================
// BLOCO 1 — MODOS DA MENOR MELÓDICA
// ============================================================

#block(sticky: true)[
  == 1. Modos da Menor Melódica

  A menor melódica gera quatro dos sons mais usados no jazz moderno: o acorde menor com 7ª maior, o lídio dominante (X7(\#11)), o lócrio 9 (Xø com 9ª natural) e a escala alterada (X7alt).
]

#ex(titulo: "Os sete modos", nivel: "Médio")[
  Complete a fórmula, a tétrade e o uso típico de cada modo. A primeira linha é um exemplo.

  #v(0.4em)
  #tabela-preencher(
    columns: (0.45fr, 1.3fr, 2.4fr, 1fr, 1.7fr),
    altura: 1.15cm,
    ([Grau], [Modo], [Fórmula], [Tétrade], [Uso típico]),
    (
      ([I], [menor melódica], [T 2 b3 4 5 6 7M], [Xm(7M)], [tônica menor]),
      ([II], [dórico b2], none, none, none),
      ([III], [lídio aumentado], none, none, none),
      ([IV], [lídio dominante], none, none, none),
      ([V], [mixolídio b6], none, none, none),
      ([VI], [lócrio 9], none, none, none),
      ([VII], [alterada], none, none, none),
    ),
  )
]

#ex(titulo: "Notas dos modos", nivel: "Médio")[
  Escreva as notas de cada modo a partir da tônica indicada (uma letra por nota) e a menor melódica de origem.

  #v(0.4em)
  #tabela-preencher(
    columns: (1.6fr, 3fr, 1.1fr),
    altura: 1.1cm,
    ([Modo], [Notas], [mm de origem]),
    (
      ([D lídio dominante], none, none),
      ([E alterada], none, none),
      ([F\# lócrio 9], none, none),
      ([Bb mixolídio b6], none, none),
      ([Eb lídio aumentado], none, none),
      ([A dórico b2], none, none),
    ),
  )
]

#ex(titulo: "Qual escala para qual acorde?", nivel: "Médio")[
  Para cada acorde, escreva a menor melódica de origem, o modo e as notas da escala a partir da fundamental do acorde. A primeira linha é um exemplo.

  #v(0.4em)
  #tabela-preencher(
    columns: (1fr, 1fr, 1.3fr, 2.7fr),
    altura: 0.85cm,
    ([Acorde], [mm de origem], [Modo], [Notas]),
    (
      ([G7alt], [Ab mm], [alterada], [G Ab Bb Cb Db Eb F]),
      ([Bb7(\#11)], none, none, none),
      ([E7(b13)], none, none, none),
      ([Bø], none, none, none),
      ([Eb7M(\#5)], none, none, none),
      ([Cm(7M)], none, none, none),
      ([B7alt], none, none, none),
      ([D7(\#11)], none, none, none),
      ([A7alt], none, none, none),
      ([F\#ø], none, none, none),
      ([Ab7(\#11)], none, none, none),
      ([E7alt], none, none, none),
    ),
  )
]

#ex(titulo: "Uma escala, sete acordes", nivel: "Desafio")[
  a) A escala de *Dó menor melódica* (C D Eb F G A B) serve para sete acordes diferentes. Escreva a tétrade de cada grau e a cifra mais completa que a escala sugere (com tensões).

  #v(0.3em)
  #tabela-preencher(
    columns: (0.5fr,) + (1fr,) * 7,
    altura: 1.15cm,
    ([], [I], [II], [III], [IV], [V], [VI], [VII]),
    (
      ([Tétrade],) + (none,) * 7,
      ([Cifra],) + (none,) * 7,
    ),
  )

  #v(0.3em)
  b) F7(\#11) e B7alt usam exatamente as mesmas notas. Que relação existe entre esses dois dominantes? Como isso ajuda ao improvisar sobre um SubV?
  #linhas-resposta(2)
]

// ============================================================
// BLOCO 2 — ESCALAS SIMÉTRICAS
// ============================================================

#block(sticky: true)[
  == 2. Escalas Simétricas

  A *diminuta* alterna tom e semitom (8 notas) e existe em apenas 3 transposições; a *dominante-diminuta* (dom-dim) começa com semitom. A *tons inteiros* (6 notas) existe em apenas 2 transposições.
]

#ex(titulo: "As três diminutas", nivel: "Médio")[
  Escreva a escala diminuta *tom-semitom* a partir de Dó, Dó\# e Ré, e indique os dois acordes º7 que cada uma contém.

  #v(0.4em)
  #tabela-preencher(
    columns: (0.9fr, 3fr, 1.8fr),
    altura: 1.2cm,
    ([Escala], [Notas (8)], [Acordes º7 contidos]),
    (
      ([C T-ST], none, none),
      ([C\# T-ST], none, none),
      ([D T-ST], none, none),
    ),
  )

  #v(0.3em)
  Por que não existe uma quarta diminuta diferente (por exemplo, Ré\# tom-semitom)?
  #linhas-resposta(2)
]

#ex(titulo: "A escala dom-dim", nivel: "Médio")[
  A dom-dim (semitom-tom) contém T, b9, \#9, 3, \#11, 5, 13 e b7. Escreva a dom-dim de cada dominante, a diminuta tom-semitom com as mesmas notas e os outros três dominantes que usam a mesma escala.

  #v(0.4em)
  #tabela-preencher(
    columns: (0.8fr, 2.6fr, 1.1fr, 1.6fr),
    altura: 1.2cm,
    ([Dominante], [Notas da dom-dim], [Mesmas notas da T-ST de], [Outros dominantes]),
    (
      ([G7], none, none, none),
      ([A7], none, none, none),
      ([F7], none, none, none),
    ),
  )
]

#ex(titulo: "Tons inteiros", nivel: "Médio")[
  Escreva as duas escalas de tons inteiros e os seis dominantes que cada uma atende. Que alterações a escala de tons inteiros traz para um acorde dominante?

  #v(0.4em)
  #tabela-preencher(
    columns: (0.9fr, 2.4fr, 2.4fr),
    altura: 1.2cm,
    ([Escala], [Notas (6)], [Dominantes atendidos]),
    (
      ([C tons inteiros], none, none),
      ([Db tons inteiros], none, none),
    ),
  )
  #linhas-resposta(2)
]

#ex(titulo: "Simétrica, alterada ou outra?", nivel: "Desafio")[
  Escolha a escala que contém *todas* as tensões da cifra (e nenhuma nota que contrarie as que estão escritas). Escreva as notas a partir da fundamental.

  #v(0.4em)
  #tabela-preencher(
    columns: (1.2fr, 1.6fr, 2.6fr),
    altura: 1.05cm,
    ([Acorde], [Escala], [Notas]),
    (
      ([a) G7(b9,13)], none, none),
      ([b) G7(9,\#5)], none, none),
      ([c) G7(b9,\#9,\#11,b13)], none, none),
      ([d) G7(9,\#11,13)], none, none),
      ([e) G7(b9,b13)], none, none),
      ([f) G7(9,b13)], none, none),
      ([g) Bº7], none, none),
      ([h) G7(9,13)], none, none),
    ),
  )

  #v(0.3em)
  Qual tensão diferencia a dom-dim da alterada? E a dom-dim do frígio dominante?
  #linhas-resposta(2)
]

// ============================================================
// BLOCO 3 — ESCALA ACORDE A ACORDE
// ============================================================

#block(sticky: true)[
  == 3. Escala Acorde a Acorde

  Em progressões de jazz, a escala muda a cada acorde. Para escolher, pergunte sempre: *qual a função do acorde* e *quais notas do tom* (ou da cifra) precisam ser respeitadas?
]

#ex(titulo: "II-V-I com dominante secundário", nivel: "Médio")[
  Tom de Dó maior. Escreva a função, a escala e as notas para cada acorde.

  #v(0.3em)
  #prog[Dm7 – G7 – C7M – A7(b9) – Dm7 – G7alt – C7M(9)]
  #v(0.2em)
  #escala-a-escala(([Dm7], [G7], [C7M], [A7(b9)], [Dm7], [G7alt], [C7M(9)]), altura: 0.95cm)
]

#ex(titulo: "II-V-I menor", nivel: "Médio")[
  Escreva a escala de cada acorde nos dois tons. Para o IIø, indique as duas opções (lócrio e lócrio 9) e diga qual nota as diferencia.

  #v(0.3em)
  #prog[Lá menor: Bø – E7(b9) – Am(7M) #h(2em) Fá menor: Gø – C7alt – Fm6]
  #v(0.2em)
  #escala-a-escala(([Bø], [E7(b9)], [Am(7M)], [Gø], [C7alt], [Fm6]), altura: 1cm)
]

#ex(titulo: "Uma progressão de jazz completa", nivel: "Desafio")[
  Tom de Si bemol maior. Analise cada acorde e escolha a escala usando as notas do tom sempre que a cifra permitir.

  #v(0.3em)
  #prog[Bb7M – G7(b13) – Cm7 – F7 – Dm7 – Db7 – Cm7 – B7(\#11) – Bb7M]
  #v(0.2em)
  #escala-a-escala(([Bb7M], [G7(b13)], [Cm7], [F7], [Dm7], [Db7], [B7(\#11)]))
]

#ex(titulo: "Uma frase sobre G7alt", nivel: "Desafio")[
  Escreva na tablatura uma frase de dois compassos: no primeiro, oito colcheias da *escala alterada de Sol* sobre G7alt; no segundo, resolva numa nota de C7M (de preferência a 3ª ou a 9ª) por grau conjunto. Fique entre as casas 1 e 5.

  #tab-vazia(sistemas: 2, compassos: 2, altura-linha: 11pt)

  Notas usadas e resolução:
  #linhas-resposta(2)
]

// ============================================================
// BLOCO 4 — REARMONIZAÇÃO
// ============================================================

#block(sticky: true)[
  == 4. Rearmonização

  Rearmonizar é trocar acordes mantendo a melodia e o sentido da progressão. As ferramentas principais: dominantes secundários, II-V relacionado, SubV, empréstimo modal (back-door) e diminutos.
]

#ex(titulo: "Tarefas guiadas em Dó", nivel: "Médio")[
  Parta sempre da progressão original e faça cada tarefa separadamente. Escreva a progressão resultante.

  #v(0.2em)
  #prog[C7M – Am7 – Dm7 – G7 – C7M]

  a) Transforme o Am7 em dominante secundário.
  #linhas-resposta(1)
  b) Troque o G7 pelo seu SubV.
  #linhas-resposta(1)
  c) Na versão de (a), troque o dominante secundário pelo SubV dele.
  #linhas-resposta(1)
  d) Na versão de (a), troque o dominante secundário por um º7 com a mesma função.
  #linhas-resposta(1)
  e) Combine (b) e (c). Que movimento o baixo faz?
  #linhas-resposta(1)
]

#ex(titulo: "Tarefas guiadas em Fá", nivel: "Médio")[
  Parta sempre da progressão original.

  #v(0.2em)
  #prog[F7M – Dm7 – Gm7 – C7 – F7M]

  a) Troque o Dm7 por um º7 de passagem ascendente entre F7M e Gm7.
  #linhas-resposta(1)
  b) Troque Gm7 – C7 por uma cadência back-door (IVm7 – bVII7).
  #linhas-resposta(1)
  c) Troque o Dm7 pelo II-V relacionado que prepara o Gm7.
  #linhas-resposta(1)
  d) Na versão de (c), troque o II-V secundário pelo II-V do SubV (IIm7 relacionado + SubV).
  #linhas-resposta(1)
]

#ex(titulo: "Rearmonize a melodia", nivel: "Desafio")[
  A melodia abaixo tem uma nota longa por compasso. Rearmonize cada compasso conforme a técnica pedida. Em cada acorde, a nota da melodia deve ser *nota do acorde ou tensão disponível* — escreva o intervalo que ela forma.

  #v(0.3em)
  #tabela-preencher(
    columns: (1.5fr,) + (1fr,) * 4,
    altura: 1.25cm,
    ([], [Compasso 1], [Compasso 2], [Compasso 3], [Compasso 4]),
    (
      ([*Melodia*], [Mi], [Fá], [Ré], [Dó]),
      ([*Original*], [C7M (3)], [Dm7 (b3)], [G7 (5)], [C7M (T)]),
      ([a) Empréstimo e back-door], none, none, none, none),
      ([b) II-V secundário e final no VIm], none, none, none, none),
    ),
  )

  #v(0.3em)
  c) Por que o SubV Db7 *não* é uma boa escolha para o compasso 3 desta melodia?
  #linhas-resposta(2)
]

#ex(titulo: "Quatro rearmonizações do turnaround", nivel: "Desafio")[
  O turnaround I-VI-II-V em Dó é #box(fill: color-subtle-bg, inset: (x: 5pt, y: 2pt), radius: 2pt)[*C7M – Am7 – Dm7 – G7*]. Escreva uma versão para cada técnica, toque todas em loop e anote qual soa mais "moderna" para você e por quê.

  #v(0.3em)
  #tabela-preencher(
    columns: (2fr,) + (1fr,) * 4,
    altura: 1.25cm,
    ([Técnica], [I], [VI], [II], [V]),
    (
      ([a) Só dominantes secundários], none, none, none, none),
      ([b) SubV no VI e no V], none, none, none, none),
      ([c) º7 no lugar do VI], none, none, none, none),
      ([d) SubV com 7M (som "Tadd Dameron")], none, none, none, none),
    ),
  )
  #linhas-resposta(2)
]

#ex(titulo: "Análise harmônica avançada", nivel: "Desafio")[
  Escreva o grau de cada acorde e, embaixo, a técnica: SubV, II relacionado, back-door, empréstimo, º7 dominante ou de passagem…

  #v(0.3em)
  *a) Tom de Dó maior*
  #analise(([C7M], [C\#º7], [Dm7], [G7], [Em7], [Eb7], [Dm7], [Db7], [C7M]))

  *b) Tom de Sol maior*
  #analise(([G7M], [Bm7], [E7], [Am7], [Cm7], [F7], [G7M]))

  *c) Tom de Mi bemol maior*
  #analise(([Eb7M], [Gø], [C7(b9)], [Fm7], [Bbm7], [Eb7], [Ab7M], [Abm7], [Db7], [Eb7M]))

  *d) Tom de Ré menor*
  #analise(([Dm7], [C\#º7], [Dm7], [Gm7], [C7], [F7M], [Eø], [Eb7], [Dm(7M)]))
]

#v(0.8em)

#block(breakable: false)[
  == Autoavaliação

  #checklist((
    [Encontro a menor melódica certa para Xm(7M), X7(\#11), Xø, X7(b13) e X7alt em qualquer tom.],
    [Escrevo as três diminutas, a dom-dim e as duas escalas de tons inteiros e sei a que acordes elas servem.],
    [Escolho a escala de cada acorde numa progressão de jazz respeitando as notas do tom.],
    [Aplico dominantes secundários, SubV, II-V relacionado, back-door e diminutos numa progressão dada.],
    [Rearmonizo uma melodia simples verificando se cada nota é nota do acorde ou tensão disponível.],
  ))
]

// ============================================================
// GABARITO
// ============================================================

#gabarito[
  #resp(1)[
    #tabela-gab(
      columns: (0.4fr, 1.2fr, 1.9fr, 1fr, 2.2fr),
      ([Grau], [Modo], [Fórmula], [Tétrade], [Uso típico]),
      (
        ([II], [dórico b2], [T b2 b3 4 5 6 b7], [Xm7], [Xm7 e X7sus4(b9)]),
        ([III], [lídio aumentado], [T 2 3 \#4 \#5 6 7M], [X7M(\#5)], [maior com 5ª aumentada]),
        ([IV], [lídio dominante], [T 2 3 \#4 5 6 b7], [X7], [X7(\#11), SubV, bVII7]),
        ([V], [mixolídio b6], [T 2 3 4 5 b6 b7], [X7], [X7(9,b13), V7 de acorde menor]),
        ([VI], [lócrio 9], [T 2 b3 4 b5 b6 b7], [Xø], [IIø do tom menor]),
        ([VII], [alterada], [T b2 \#2 3 \#4 b6 b7], [X7], [X7alt (b9, \#9, \#11, b13)]),
      ),
    )
    Critério: aceite a grafia da alterada como T b9 \#9 3 b5 b13 b7 e os sinônimos dórico b9, lídio \#5, mixolídio b13, lócrio \#2 e superlócrio.
  ]

  #resp(2)[
    D lídio dominante: D E F\# G\# A B C (A mm) · E alterada: E F G Ab Bb C D (F mm) · F\# lócrio 9: F\# G\# A B C D E (A mm) · Bb mixolídio b6: Bb C D Eb F Gb Ab (Eb mm) · Eb lídio aumentado: Eb F G A B C D (C mm) · A dórico b2: A Bb C D E F\# G (G mm).
  ]

  #resp(3)[
    #tabela-gab(
      columns: (0.9fr, 0.8fr, 1.2fr, 2.4fr),
      ([Acorde], [mm], [Modo], [Notas]),
      (
        ([Bb7(\#11)], [F mm], [lídio dominante], [Bb C D E F G Ab]),
        ([E7(b13)], [A mm], [mixolídio b6], [E F\# G\# A B C D]),
        ([Bø], [D mm], [lócrio 9], [B C\# D E F G A]),
        ([Eb7M(\#5)], [C mm], [lídio aumentado], [Eb F G A B C D]),
        ([Cm(7M)], [C mm], [menor melódica], [C D Eb F G A B]),
        ([B7alt], [C mm], [alterada], [B C D Eb F G A]),
        ([D7(\#11)], [A mm], [lídio dominante], [D E F\# G\# A B C]),
        ([A7alt], [Bb mm], [alterada], [A Bb C Db Eb F G]),
        ([F\#ø], [A mm], [lócrio 9], [F\# G\# A B C D E]),
        ([Ab7(\#11)], [Eb mm], [lídio dominante], [Ab Bb C D Eb F Gb]),
        ([E7alt], [F mm], [alterada], [E F G Ab Bb C D]),
      ),
    )
    Regras rápidas: X7alt → mm ½ tom acima · X7(\#11) → mm uma 5ª acima · Xø (lócrio 9) → mm uma 3ª menor acima · X7(b13) → mm uma 4ª acima · X7M(\#5) → mm uma 3ª menor abaixo.
  ]

  #resp(4)[
    a) I Cm(7M) → Cm(7M)(9) · II Dm7 → Dm7(b9) ou D7sus4(b9) · III Eb7M(\#5) → Eb7M(\#5)(9,\#11) · IV F7 → F7(9,\#11,13) · V G7 → G7(9,b13) · VI Aø → Aø(9) · VII Bø (B D F A) → usado como B7alt (o Ré\# = Mib faz o papel de 3ª). \
    b) Estão a um trítono de distância (B7 é o SubV de F7 e vice-versa) e compartilham o trítono Lá–Mib (Ré\#). Sobre um SubV com \#11 (lídio dominante), você pode pensar a alterada do dominante original, e vice-versa: as notas são as mesmas.
  ]

  #resp(5)[
    C T-ST: C D Eb F Gb Ab A B — contém Cº7 (C Eb Gb A) e Dº7 (D F Ab B). \
    C\# T-ST: C\# D\# E F\# G A Bb C — contém C\#º7 (C\# E G Bb) e D\#º7 (= Cº7). \
    D T-ST: D E F G Ab Bb B C\# — contém Dº7 (D F Ab B) e C\#º7 (E G Bb C\#). \
    Ré\# tom-semitom tem as mesmas notas de Dó tom-semitom (D\# F F\# G\# A B C D) — a escala é simétrica e se repete a cada 3ª menor, por isso só há três.
  ]

  #resp(6)[
    G7: G Ab Bb B C\# D E F = Ab T-ST (= D, F, B T-ST) → Bb7, Db7, E7. \
    A7: A Bb C C\# D\# E F\# G = Bb T-ST (= C\#, E, G T-ST) → C7, Eb7, F\#7. \
    F7: F Gb Ab A B C D Eb = Gb T-ST (= C, Eb, A T-ST) → Ab7, B7, D7. \
    Regra: a dom-dim de X é a diminuta tom-semitom ½ tom acima; os dominantes que a compartilham estão a 3ªs menores de distância.
  ]

  #resp(7)[
    C tons inteiros: C D E F\# G\# A\# (Bb) → C7, D7, E7, F\#7, G\#7 (Ab7), Bb7. \
    Db tons inteiros: Db Eb F G A B → Db7, Eb7, F7, G7, A7, B7. \
    Traz 9ª natural, \#11 e \#5 (b13): som de X7(9,\#11,b13) ou X7(\#5) — sem 5ª justa e sem 13 natural.
  ]

  #resp(8)[
    a) G dom-dim: G Ab Bb B C\# D E F · b) G tons inteiros: G A B C\# D\# F · c) G alterada (Ab mm): G Ab Bb Cb Db Eb F · d) G lídio dominante (D mm): G A B C\# D E F · e) G frígio dominante (C menor harmônica): G Ab B C D Eb F · f) G mixolídio b6 (C mm): G A B C D Eb F · g) B diminuta tom-semitom: B C\# D E F G Ab A\# (Bb) · h) G mixolídio: G A B C D E F. \
    Dom-dim × alterada: a 13 natural (dom-dim) × b13 (alterada). Dom-dim × frígio dominante: a 13 natural e o \#11 (dom-dim) × b13 e 11 justa (frígio dominante).
  ]

  #resp(9)[
    Dm7: IIm7 · D dórico · D E F G A B C — G7: V7 · G mixolídio · G A B C D E F — C7M: I · C jônico · C D E F G A B (ou lídio, com F\#) — A7(b9): V7/II · A frígio dominante (Ré menor harmônica) · A Bb C\# D E F G — Dm7: IIm7 · dórico — G7alt: V7 · G alterada (Ab mm) · G Ab Bb Cb Db Eb F — C7M(9): I · jônico ou lídio. \
    Critério: em A7(b9), aceite também A dom-dim (A Bb C C\# D\# E F\# G), que traz 13 natural.
  ]

  #resp(10)[
    Bø: IIø · B lócrio (B C D E F G A) ou B lócrio 9 (B C\# D E F G A — difere no Dó/Dó\#) — E7(b9): V7 · E frígio dominante (E F G\# A B C D) — Am(7M): Im · A menor melódica (A B C D E F\# G\#). \
    Gø: IIø · G lócrio (G Ab Bb C Db Eb F) ou G lócrio 9 (G A Bb C Db Eb F — difere no Láb/Lá) — C7alt: V7 · C alterada (Db mm): C Db Eb Fb Gb Ab Bb — Fm6: Im · F menor melódica (F G Ab Bb C D E) ou F dórico. \
    Critério: o lócrio respeita as notas do tom menor natural; o lócrio 9 é a opção "jazz" e soa mais aberta.
  ]

  #resp(11)[
    #tabela-gab(
      columns: (0.9fr, 1.1fr, 1.5fr, 2.4fr),
      ([Acorde], [Função], [Escala], [Notas]),
      (
        ([Bb7M], [I], [jônico (ou lídio)], [Bb C D Eb F G A]),
        ([G7(b13)], [V7/II], [mixolídio b6 (C mm)], [G A B C D Eb F]),
        ([Cm7], [IIm7], [dórico], [C D Eb F G A Bb]),
        ([F7], [V7], [mixolídio], [F G A Bb C D Eb]),
        ([Dm7], [IIIm7], [frígio], [D Eb F G A Bb C]),
        ([Db7], [SubV/II (→ Cm7)], [lídio dominante (Ab mm)], [Db Eb F G Ab Bb Cb]),
        ([B7(\#11)], [SubV7 (→ Bb7M)], [lídio dominante (F\# mm)], [B C\# D\# E\# F\# G\# A]),
      ),
    )
    Critério: no G7(b13), as notas do tom (Lá e Mib) dão o mixolídio b6; aceite também o frígio dominante se o aluno justificar pelo alvo menor (Cm7).
  ]

  #resp(12)[
    Resposta-modelo:
    #v(0.2em)
    #tab("   G7alt            C7M\ne|-4-1-------------|-----------|\nB|-----4-2---------|-----------|\nG|---------4-3-1---|-----------|\nD|---------------3-|-2---------|\nA|-----------------|-----------|\nE|-----------------|-----------|")
    Notas: Láb (b9) – Fá (b7) – Mib (b13) – Réb (b5) – Si (3) – Sib (\#9) – Láb (b9) – Fá (b7) → Mi (3ª de C7M), resolução por ½ tom (Fá → Mi). Critério: todas as notas do 1º compasso na escala G Ab Bb B Db Eb F, casas 1–5, e resolução por grau conjunto em Mi (3) ou Ré (9).
  ]

  #resp(13)[
    a) C7M – A7 – Dm7 – G7 – C7M · b) C7M – Am7 – Dm7 – Db7 – C7M · c) C7M – Eb7 – Dm7 – G7 – C7M · d) C7M – C\#º7 – Dm7 – G7 – C7M · e) C7M – Eb7 – Dm7 – Db7 – C7M: o baixo faz Dó – Mib – Ré – Réb – Dó: depois do salto inicial, desce cromaticamente (Mib – Ré – Réb – Dó), cada SubV chegando ao alvo por ½ tom.
  ]

  #resp(14)[
    a) F7M – F\#º7 – Gm7 – C7 – F7M · b) F7M – Dm7 – Bbm7 – Eb7 – F7M · c) F7M – Aø – D7 – Gm7 – C7 – F7M (aceite Am7 – D7) · d) F7M – Ebm7 – Ab7 – Gm7 – C7 – F7M (Ab7 é o SubV de D7; Ebm7 é o II relacionado de Ab7).
  ]

  #resp(15)[
    #tabela-gab(
      columns: (1.6fr,) + (1fr,) * 4,
      ([Versão], [Comp. 1 (Mi)], [Comp. 2 (Fá)], [Comp. 3 (Ré)], [Comp. 4 (Dó)]),
      (
        ([a) Empréstimo / back-door], [C7M (3) ou Am7 (5)], [Fm7 (T)], [Bb7 (3)], [C7M (T)]),
        ([b) II-V secundário → VIm], [Em7 (T) – A7 (5)], [Dm7 (b3)], [Bø (b3) – E7 (b7)], [Am7 (b3)]),
      ),
    )
    c) Ré sobre Db7 é a b9 (½ tom acima da fundamental); o SubV soa com lídio dominante (9 natural = Mib), e a b9 choca com a fundamental. Melhor manter G7 (Ré = 5) ou usar Bb7 (Ré = 3). \
    Critério: aceite outras soluções em que a nota da melodia seja nota do acorde ou tensão disponível e a progressão tenha sentido funcional.
  ]

  #resp(16)[
    a) C7M – A7 – D7 – G7 · b) C7M – Eb7 – D7 – Db7 (aceite C7M – Eb7 – Dm7 – Db7) · c) C7M – C\#º7 – Dm7 – G7 · d) C7M – Eb7M – Ab7M – Db7M. \
    Critério: em (b) o Eb7 é SubV de A7 e o Db7 é SubV de G7; em (c) o C\#º7 equivale a A7(b9) sem fundamental; em (d) as fundamentais são as mesmas de (b) com acordes 7M. A última pergunta é pessoal.
  ]

  #resp(17)[
    a) I7M – \#Iº7 (passagem ascendente com função dominante, = A7(b9) → Dm7) – IIm7 – V7 – IIIm7 – SubV/II (Eb7 = SubV de A7) – IIm7 – SubV7 – I7M. \
    b) I7M – IIIm7 (II relacionado de E7) – V7/II – IIm7 – IVm7 – bVII7 (back-door) – I7M. \
    c) I7M – IIø/II (II relacionado) – V7/II – IIm7 – IIm7/IV – V7/IV – IV7M – IVm7 (empréstimo) – bVII7 (back-door) – I7M. \
    d) Im7 – VIIº7 (dominante, = A7(b9)) – Im7 – IVm7 – bVII7 (II-V do relativo maior) – bIII7M – IIø – SubV7 (Eb7 → Dm) – Im(7M).
  ]
]
