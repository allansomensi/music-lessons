#import "/templates/layout.typ": *
#import "/templates/components.typ": *

#show: aula.with(
  instrumento: "Guitarra",
  nivel: "Exercícios — Iniciante",
)

// ------------------------------------------------------------
// Helpers locais
// ------------------------------------------------------------

// Espaço em branco sublinhado para respostas curtas dentro do texto.
#let lacuna(w: 2.2cm) = box(width: w, height: 0.9em, stroke: (bottom: 0.6pt + color-rule-dark))

// Itens com letras: a) b) c) ...
#set enum(numbering: "a)", spacing: 0.9em)

// Exercício que não se divide entre páginas (para enunciados curtos).
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

// Rótulo pequeno usado acima de tabelas e braços.
#let rotulo(body) = text(size: 9pt, weight: "bold", fill: color-secondary, body)

= Notas, Intervalos e Escalas

*Como usar este material.* Estes exercícios fixam o "alfabeto" da música e a sua geografia no braço da guitarra. Resolva os blocos na ordem — a dificuldade cresce dentro de cada um —, a lápis, para poder apagar e refazer. Sempre que possível, *toque no instrumento* cada resposta escrita: ouvir o resultado é a melhor forma de conferir. Se travar, releia o enunciado e as convenções abaixo antes de consultar o *gabarito*, no final.

#rotulo-abertura[Quadro de temas]
#quadro-temas((
  ([1], [Notas, acidentes e enarmonia], [Cifras e nomes das notas · tom e semitom · sustenidos, bemóis e notas enarmônicas], [1–3], [F F M], 3),
  ([2], [Notas no braço], [Notas em cada corda e casa · cordas graves · todas as ocorrências de uma nota · oitavas], [4–7], [F M M D], 4),
  ([3], [Intervalos], [Nome, contagem, construção e inversão de intervalos · intervalos no braço], [8–12], [F M M M D], 5),
  ([4], [Escala maior], [Fórmula T – T – ST – T – T – T – ST · ortografia da escala em qualquer tom], [13–14], [M D], 2),
  ([5], [Menores, relativos e pentatônicas], [Escala menor natural · relativos maior e menor · pentatônicas menor e maior], [15–16], [M D], 2),
))
#block(above: 0.7em, text(size: 8.5pt, fill: color-secondary)[*Níveis:* F = fácil (aplicação direta de uma regra) · M = médio (raciocínio em etapas) · D = desafio (combina vários conceitos; vale errar e refazer). *Acertos:* depois de corrigir com o gabarito, anote quantos exercícios de cada bloco você acertou por completo e revise primeiro o bloco com menos acertos.])

#rotulo-abertura[Convenções]
#convencoes((
  ([Notas], [Dó = C · Ré = D · Mi = E · Fá = F · Sol = G · Lá = A · Si = B; sustenido = \#, bemol = b.]),
  ([Intervalos], [`T` (tônica) · `b2` · `2` · `b3` · `3` · `4` · `#4` · `b5` · `5` · `b6` · `6` · `7` (7ª menor) · `7M` (7ª maior) · `8` (oitava).]),
  ([Distâncias], [Em fórmulas de distância (T – T – ST…), *T* = tom e *ST* = semitom; em fórmulas de intervalo (T – 3 – 5), *T* = tônica. Uma casa da guitarra = 1 semitom.]),
  ([Cordas], [Da 1ª (Mi agudo) à 6ª (Mi grave); "casa 0" = corda solta. Nos diagramas de braço, cada linha é uma corda (a 6ª em cima) e as casas crescem para a direita.]),
))

#pagebreak()

// ============================================================
== 1. Notas, acidentes e enarmonia
// ============================================================

#ex(titulo: "Cifra e nome", nivel: "Fácil")[
  Complete a tabela: escreva o nome em português de cada cifra (colunas da esquerda) e a cifra de cada nome (colunas da direita).

  #tabela-preencher(
    columns: (0.7fr, 1.5fr, 1.5fr, 0.7fr),
    ([Cifra], [Nome], [Nome], [Cifra]),
    (
      ([G], none, [Mi], none),
      ([Bb], none, [Si], none),
      ([F\#], none, [Ré bemol], none),
      ([D], none, [Sol sustenido], none),
      ([Eb], none, [Fá], none),
      ([C\#], none, [Lá sustenido], none),
      ([Ab], none, [Sol bemol], none),
    ),
  )
]

#ex(titulo: "Tom ou semitom?", nivel: "Fácil")[
  Para cada par de notas (sempre ascendente, da primeira para a segunda), escreva *T* se a distância for de um tom ou *ST* se for de um semitom. Lembre-se das duas exceções entre as notas naturais.

  #tabela-preencher(
    columns: (1fr, 0.8fr, 1fr, 0.8fr, 1fr, 0.8fr),
    ([Par], [T/ST], [Par], [T/ST], [Par], [T/ST]),
    (
      ([E → F], none, [G → A], none, [Eb → F], none),
      ([C → D], none, [A → Bb], none, [B → C\#], none),
      ([B → C], none, [F\# → G], none, [D → Eb], none),
      ([E → F\#], none, [Ab → Bb], none, [C\# → D], none),
    ),
  )
]

#ex(titulo: "Enarmonia e deslocamentos", nivel: "Médio")[
  + Escreva o *enarmônico* de cada nota (o outro nome para o mesmo som). Os três últimos parecem estranhos, mas existem — pense em qual nota natural ocupa aquela tecla ou casa.

    #tabela-preencher(
      columns: (1fr,) * 9,
      ([Nota], [C\#], [Eb], [F\#], [Ab], [Bb], [E\#], [Cb], [Fb]),
      (([Enarm.],) + (none,) * 8,),
    )

  + Partindo da nota indicada, ande a distância pedida e escreva a nota de chegada. Use *sustenido* quando subir e *bemol* quando descer.

    #grid(
      columns: (1fr, 1fr),
      row-gutter: 1.1em,
      column-gutter: 1.5em,
      [Sol (G) + 1 tom = #lacuna()], [Fá (F) − 1 semitom = #lacuna()],
      [Mi (E) + 1 semitom = #lacuna()], [Dó (C) − 1 tom = #lacuna()],
      [Si (B) + 1 tom = #lacuna()], [Lá (A) − 2 tons = #lacuna()],
      [Ré (D) + 1,5 tom = #lacuna()], [Lá bemol (Ab) − 1 semitom = #lacuna()],
      [Mi bemol (Eb) + 1 tom = #lacuna()], [Ré (D) − 1,5 tom = #lacuna()],
    )
]

// ============================================================
== 2. Notas no braço
// ============================================================

#ex(titulo: "Qual é a nota?", nivel: "Fácil")[
  Escreva a nota que soa em cada corda e casa. Use a afinação padrão (6ª a 1ª: E – A – D – G – B – E) e conte casa por casa a partir da corda solta. Quando houver acidente, escreva os dois nomes (ex.: F\#/Gb).

  #tabela-preencher(
    columns: (0.8fr, 0.6fr, 1fr, 0.8fr, 0.6fr, 1fr),
    ([Corda], [Casa], [Nota], [Corda], [Casa], [Nota]),
    (
      ([6ª], [3], none, [3ª], [5], none),
      ([5ª], [5], none, [2ª], [3], none),
      ([4ª], [7], none, [6ª], [8], none),
      ([3ª], [2], none, [5ª], [2], none),
      ([2ª], [1], none, [4ª], [9], none),
      ([1ª], [8], none, [6ª], [6], none),
    ),
  )
]

#ex(titulo: "Localize as notas nas cordas graves", nivel: "Médio")[
  As cordas 6 e 5 são a referência para encontrar a tônica de power chords e de acordes com pestana. Indique em que casa (entre 0 e 12) cada nota aparece em cada uma dessas cordas. Se a nota aparecer em duas casas, escreva as duas.

  #tabela-preencher(
    columns: (1.4fr,) + (1fr,) * 10,
    ([Nota], [C], [D], [E], [F], [G], [A], [B], [F\#], [Bb], [Eb]),
    (
      ([6ª corda],) + (none,) * 10,
      ([5ª corda],) + (none,) * 10,
    ),
  )
]

#ex(titulo: "Preencha o braço", nivel: "Médio")[
  Marque com um círculo e o nome da nota *todas* as ocorrências pedidas entre as casas 1 e 12, nas seis cordas. Depois toque todas elas, da mais grave para a mais aguda.

  #align(center)[
    #rotulo[a) Todas as notas Dó (C)]
    #v(0.2em)
    #braco-vazio(casas: 12)
    #v(0.8em)
    #rotulo[b) Todas as notas Sol (G)]
    #v(0.2em)
    #braco-vazio(casas: 12)
  ]
]

#ex(titulo: "O desenho da oitava", nivel: "Desafio")[
  Um desenho muito usado para achar a oitava de uma nota é: *pular uma corda* (ir duas cordas na direção do agudo) e *avançar duas casas*. Use-o para completar a tabela — mas cuidado: em algumas linhas o desenho precisa ser corrigido para que a nota de chegada seja realmente a oitava. Confira cada resposta contando as notas.

  #tabela-preencher(
    columns: (1.5fr, 0.8fr, 0.8fr, 0.8fr, 1.5fr, 0.8fr, 0.8fr, 0.8fr),
    ([Partida], [Nota], [Corda], [Casa], [Partida], [Nota], [Corda], [Casa]),
    (
      ([6ª corda, casa 3], none, none, none, [4ª corda, casa 2], none, none, none),
      ([6ª corda, casa 7], none, none, none, [4ª corda, casa 7], none, none, none),
      ([5ª corda, casa 3], none, none, none, [3ª corda, casa 2], none, none, none),
      ([5ª corda, casa 7], none, none, none, [3ª corda, casa 5], none, none, none),
    ),
    altura: 0.95cm,
  )

  #text(size: 9pt, fill: color-muted)[Corda e Casa = onde está a oitava acima da nota de partida.]

  Em quais linhas o desenho mudou? Explique por quê.
  #linhas-resposta(2)
]

// ============================================================
== 3. Intervalos
// ============================================================

#ex(titulo: "Semitons, tons e nomes", nivel: "Fácil")[
  Complete a tabela com a distância em tons, o nome do intervalo e a sua cifra.

  #tabela-preencher(
    columns: (0.6fr, 0.6fr, 1.9fr, 0.6fr, 0.6fr, 0.6fr, 1.9fr, 0.6fr),
    ([ST], [Tons], [Nome do intervalo], [Cifra], [ST], [Tons], [Nome do intervalo], [Cifra]),
    (
      ([3], none, none, none, [11], none, none, none),
      ([7], none, none, none, [2], none, none, none),
      ([4], none, none, none, [6], none, none, none),
      ([10], none, none, none, [9], none, none, none),
      ([5], none, none, none, [1], none, none, none),
      ([12], none, none, none, [8], none, none, none),
    ),
    altura: 0.95cm,
  )

  #text(size: 9pt, fill: color-muted)[ST = semitons. Lembre-se: 1 tom = 2 semitons = 2 casas no braço.]
]

#ex(titulo: "Nomeie os intervalos", nivel: "Médio")[
  Os intervalos abaixo são *ascendentes* (a primeira nota é a referência). Conte primeiro as letras (para achar o número do intervalo) e depois os semitons (para achar a qualidade). Escreva a cifra do intervalo.

  #tabela-preencher(
    columns: (1fr, 0.8fr, 1fr, 0.8fr, 1fr, 0.8fr),
    ([Notas], [Interv.], [Notas], [Interv.], [Notas], [Interv.]),
    (
      ([C → E], none, [G → F], none, [D → C\#], none),
      ([D → F], none, [A → F\#], none, [B → F], none),
      ([E → B], none, [Bb → D], none, [C → F\#], none),
      ([F → Bb], none, [E → C], none, [Eb → Db], none),
    ),
  )
]

#ex(titulo: "Construa os intervalos", nivel: "Médio")[
  Escreva a nota que forma o intervalo pedido *acima* da nota dada. Respeite a ortografia: a 3ª de Ré tem de ser algum tipo de Fá, a 5ª de Si tem de ser algum tipo de Fá, e assim por diante.

  #tabela-preencher(
    columns: (1fr, 0.8fr, 1fr, 0.8fr, 1fr, 0.8fr),
    ([Pedido], [Nota], [Pedido], [Nota], [Pedido], [Nota]),
    (
      ([3 de D], none, [7 de A], none, [2 de Bb], none),
      ([b3 de E], none, [7M de Eb], none, [b2 de E], none),
      ([5 de B], none, [6 de G], none, [\#4 de C], none),
      ([4 de F], none, [b6 de C], none, [b5 de A], none),
    ),
  )
]

#ex(titulo: "Intervalos no braço", nivel: "Médio")[
  No diagrama, a tônica *T* é a nota Sol (6ª corda, casa 3). Para cada ponto marcado com uma letra, escreva a nota e o intervalo que ela forma com a tônica. Toque cada par e memorize o desenho.

  #grid(
    columns: (auto, 1fr),
    column-gutter: 1.5em,
    align: (center + horizon, left + horizon),
    braco-notas(
      fs: 1,
      (
        ("", "", "T", "", "f"),
        ("e", "c", "b", "", "a"),
        ("", "", "h", "g", "d"),
        ("", "", "", "", ""),
        ("", "", "", "", ""),
        ("", "", "", "", ""),
      ),
    ),
    tabela-preencher(
      columns: (0.6fr, 1fr, 1fr),
      ([Ponto], [Nota], [Intervalo]),
      (
        ([a], none, none),
        ([b], none, none),
        ([c], none, none),
        ([d], none, none),
        ([e], none, none),
        ([f], none, none),
        ([g], none, none),
        ([h], none, none),
      ),
      altura: 0.62cm,
    ),
  )
]

#ex(titulo: "Inversão de intervalos", nivel: "Desafio")[
  *Inverter* um intervalo é trocar a ordem das notas, colocando a nota de baixo uma oitava acima: Dó → Mi (3ª maior) invertido vira Mi → Dó. Para intervalos simples, valem três regras: (1) os números somam *9* (3ª ↔ 6ª, 2ª ↔ 7ª, 4ª ↔ 5ª); (2) *maior* vira *menor* e vice-versa, *justo* continua justo, *aumentado* vira *diminuto*; (3) os semitons somam *12*.

  + Complete a tabela.

    #tabela-preencher(
      columns: (1.2fr,) + (1fr,) * 8,
      ([Intervalo], [3], [b3], [4], [2], [b2], [6], [7M], [\#4]),
      (
        ([Semitons],) + (none,) * 8,
        ([Invertido],) + (none,) * 8,
        ([Semitons],) + (none,) * 8,
      ),
    )

  + Sabendo que Lá → Fá\# é uma 6ª maior, que intervalo é Fá\# → Lá? E sabendo que Ré → Dó é uma 7ª menor, que intervalo é Dó → Ré?
    #linhas-resposta(2)
]

// ============================================================
== 4. Escala maior
// ============================================================

#ex(titulo: "Escalas maiores em vários tons", nivel: "Médio")[
  Aplique a fórmula *T – T – ST – T – T – T – ST* a partir de cada tônica. Use *uma nota de cada letra* (sem repetir nem pular letras) e, na última coluna, anote quantos acidentes a escala tem e quais são.

  #tabela-preencher(
    columns: (0.7fr,) + (0.8fr,) * 7 + (1.6fr,),
    ([Tom], [1], [2], [3], [4], [5], [6], [7], [Acidentes]),
    (
      ([C], [C], [D], [E], [F], [G], [A], [B], [nenhum]),
      ([G],) + (none,) * 8,
      ([D],) + (none,) * 8,
      ([A],) + (none,) * 8,
      ([E],) + (none,) * 8,
      ([F],) + (none,) * 8,
      ([Bb],) + (none,) * 8,
      ([Eb],) + (none,) * 8,
      ([Ab],) + (none,) * 8,
    ),
    altura: 0.78cm,
  )
]

#ex(titulo: "Encontre o erro", nivel: "Desafio")[
  Cada escala maior abaixo tem *exatamente uma nota errada* — às vezes o som está errado, às vezes só o nome (ortografia). Circule a nota errada e escreva a correção.

  #tabela-preencher(
    columns: (0.9fr, 3.2fr, 1.1fr),
    alinhamento: (center + horizon, left + horizon, center + horizon),
    ([Escala], [Notas escritas], [Correção]),
    (
      ([F maior], [F – G – A – A\# – C – D – E], none),
      ([D maior], [D – E – F\# – G – A – B – C], none),
      ([E maior], [E – F\# – G\# – A – B – C\# – Eb], none),
      ([Bb maior], [Bb – C – D – D\# – F – G – A], none),
      ([A maior], [A – B – C\# – D – E – F – G\#], none),
      ([G maior], [G – A – B – C – D – E – F], none),
    ),
  )
]

// ============================================================
== 5. Menores, relativos e pentatônicas
// ============================================================

#exercicio(titulo: "Relativos e escala menor natural", nivel: "Médio")[
  + O relativo menor está uma *terça menor (1,5 tom) abaixo* da tônica maior — ou seja, no 6º grau. Complete a tabela.

    #tabela-preencher(
      columns: (1.3fr,) + (1fr,) * 8,
      ([], [1], [2], [3], [4], [5], [6], [7], [8]),
      (
        ([Tom maior], [C], [G], [D], [A], none, [F], none, [Eb]),
        ([Relativo menor], none, none, none, none, [C\#m], none, [Gm], none),
      ),
    )

  + Escreva as escalas menores naturais (*T – 2 – b3 – 4 – 5 – b6 – 7*). Dica: cada uma tem as mesmas notas do seu relativo maior.

    #tabela-preencher(
      columns: (0.7fr,) + (1fr,) * 7,
      ([Tom], [T], [2], [b3], [4], [5], [b6], [7]),
      (
        ([Am],) + (none,) * 7,
        ([Em],) + (none,) * 7,
        ([Dm],) + (none,) * 7,
        ([Bm],) + (none,) * 7,
        ([Gm],) + (none,) * 7,
      ),
    )

  + No braço, o relativo menor fica *3 casas abaixo* na mesma corda (1,5 tom = 3 semitons). Para cada tônica maior na 6ª corda, escreva o relativo menor e a casa onde está a sua tônica, também na 6ª corda. Se a conta der negativa, some 12.

    #tabela-preencher(
      columns: (1.6fr,) + (1fr,) * 6,
      ([Tom maior (casa na 6ª)], [C (8)], [G (3)], [A (5)], [D (10)], [F (1)], [Bb (6)]),
      (
        ([Relativo menor],) + (none,) * 6,
        ([Casa na 6ª corda],) + (none,) * 6,
      ),
    )
]

#ex(titulo: "Pentatônicas: notas e posições", nivel: "Desafio")[
  + Escreva as notas das pentatônicas. Fórmulas: *menor* = T – b3 – 4 – 5 – 7; *maior* = T – 2 – 3 – 5 – 6.

    #grid(
      columns: (1fr, 1fr),
      column-gutter: 1.2em,
      tabela-preencher(
        columns: (1.1fr,) + (1fr,) * 5,
        ([Menor], [T], [b3], [4], [5], [7]),
        (
          ([Am],) + (none,) * 5,
          ([Em],) + (none,) * 5,
          ([Dm],) + (none,) * 5,
          ([Gm],) + (none,) * 5,
        ),
      ),
      tabela-preencher(
        columns: (1.1fr,) + (1fr,) * 5,
        ([Maior], [T], [2], [3], [5], [6]),
        (
          ([C],) + (none,) * 5,
          ([G],) + (none,) * 5,
          ([D],) + (none,) * 5,
          ([F],) + (none,) * 5,
        ),
      ),
    )

  + Compare as linhas: qual pentatônica maior tem exatamente as mesmas notas de Lá menor pentatônica? E de Mi menor pentatônica? Que relação entre esses tons explica isso?
    #linhas-resposta(2)

  + Desenhe no braço, com o nome de cada nota, as três posições pedidas. Pinte as tônicas.

    #align(center)[
      #grid(
        columns: (auto, auto, auto),
        column-gutter: 1.6em,
        align: center,
        [#rotulo[Am penta — posição 1] #v(0.2em) #braco-vazio(casas: 4, fs: 5)],
        [#rotulo[Cm penta — mesma posição] #v(0.2em) #braco-vazio(casas: 4, fs: 8)],
        [#rotulo[G maior penta — tônica 6ª/3] #v(0.2em) #braco-vazio(casas: 4, fs: 2)],
      )
    ]
]

#block(breakable: false)[
  #set text(size: 10pt)
  == Autoavaliação

  Antes de conferir o gabarito, marque o que você já consegue fazer *sem consultar* nenhum material de apoio. O que ficar em branco indica o que revisar primeiro.

  #checklist((
    [Digo o nome de qualquer nota natural ou com acidente nas duas nomenclaturas (Dó = C).],
    [Sei onde estão os semitons naturais (Mi–Fá e Si–Dó) e dou os dois nomes de uma nota enarmônica.],
    [Encontro qualquer nota nas cordas 6 e 5 em poucos segundos e acho a sua oitava no braço.],
    [Nomeio um intervalo contando letras e semitons, e construo qualquer intervalo a partir de uma nota.],
    [Escrevo a escala maior em qualquer tom com a ortografia correta (uma nota de cada letra).],
    [Encontro o relativo menor de um tom maior e escrevo as pentatônicas menor e maior.],
    [Toco a posição 1 da pentatônica menor em qualquer tom, sabendo onde estão as tônicas.],
  ))

  === Sugestão de prática no instrumento

  Depois de corrigir os exercícios, transforme os erros em prática no instrumento. Uma sugestão, com metrônomo:

  #rotina-estudo((
    ([Dizer em voz alta as notas da 6ª e da 5ª corda, casa por casa (0–12)], [5 min], [60]),
    ([Achar uma nota sorteada em todas as cordas, com o desenho de oitava], [5 min], [—]),
    ([Tocar tônica + intervalo (3, b3, 5, 7, 7M) a partir de notas diferentes], [5 min], [60]),
    ([Escala maior em uma corda só, cantando o nome das notas], [5 min], [60–70]),
    ([Pentatônica menor, posição 1, em Am, Cm e Em, subindo e descendo], [5 min], [70–90]),
  ))

  #v(0.6em)
  #text(weight: "bold", size: 10pt)[Anotações — dúvidas para tirar com o professor]
  #linhas-resposta(7)
]

// ============================================================
#gabarito[
  #resposta(1)[
    G = Sol · Bb = Si bemol · F\# = Fá sustenido · D = Ré · Eb = Mi bemol · C\# = Dó sustenido · Ab = Lá bemol. \
    Mi = E · Si = B · Ré bemol = Db · Sol sustenido = G\# · Fá = F · Lá sustenido = A\# · Sol bemol = Gb.
  ]

  #resposta(2)[
    E→F *ST* · C→D *T* · B→C *ST* · E→F\# *T* · G→A *T* · A→Bb *ST* · F\#→G *ST* · Ab→Bb *T* · Eb→F *T* · B→C\# *T* · D→Eb *ST* · C\#→D *ST*. As exceções naturais são Mi–Fá e Si–Dó (semitom).
  ]

  #resposta(3)[
    a) C\# = Db · Eb = D\# · F\# = Gb · Ab = G\# · Bb = A\# · E\# = F · Cb = B · Fb = E. \
    b) G + 1 tom = *A* · E + 1 ST = *F* · B + 1 tom = *C\#* · D + 1,5 tom = *F* · Eb + 1 tom = *F* · F − 1 ST = *E* · C − 1 tom = *Bb* · A − 2 tons = *F* · Ab − 1 ST = *G* · D − 1,5 tom = *B*.
  ]

  #resposta(4)[
    6ª/3 = *G* · 5ª/5 = *D* · 4ª/7 = *A* · 3ª/2 = *A* · 2ª/1 = *C* · 1ª/8 = *C* · 3ª/5 = *C* · 2ª/3 = *D* · 6ª/8 = *C* · 5ª/2 = *B* · 4ª/9 = *B* · 6ª/6 = *A\#/Bb*.
  ]

  #resposta(5)[
    #tabela(
      columns: (1.4fr,) + (1fr,) * 10,
      ([Nota], [C], [D], [E], [F], [G], [A], [B], [F\#], [Bb], [Eb]),
      (
        ([6ª corda], [8], [10], [0 e 12], [1], [3], [5], [7], [2], [6], [11]),
        ([5ª corda], [3], [5], [7], [8], [10], [0 e 12], [2], [9], [1], [6]),
      ),
    )
  ]

  #resposta(6)[
    a) Dó (C): 6ª casa 8 · 5ª casa 3 · 4ª casa 10 · 3ª casa 5 · 2ª casa 1 · 1ª casa 8. \
    b) Sol (G): 6ª casa 3 · 5ª casa 10 · 4ª casa 5 · 3ª casa 12 (e solta) · 2ª casa 8 · 1ª casa 3.
  ]

  #resposta(7)[
    6ª/3 (G) → 4ª casa 5 · 6ª/7 (B) → 4ª casa 9 · 5ª/3 (C) → 3ª casa 5 · 5ª/7 (E) → 3ª casa 9 · 4ª/2 (E) → 2ª casa *5* · 4ª/7 (A) → 2ª casa *10* · 3ª/2 (A) → 1ª casa *5* · 3ª/5 (C) → 1ª casa *8*. \
    Nas quatro partidas da coluna da direita (4ª e 3ª cordas) é preciso avançar *três* casas, e não duas: o salto passa pelo par 3ª–2ª corda (Sol–Si), afinado em terça maior (4 semitons) e não em quarta justa (5 semitons) como os demais pares. Falta um semitom, que é compensado com uma casa a mais.
  ]

  #resposta(8)[
    #tabela(
      columns: (0.7fr, 0.7fr, 2fr, 0.7fr, 0.7fr, 0.7fr, 2fr, 0.7fr),
      ([ST], [Tons], [Nome], [Cifra], [ST], [Tons], [Nome], [Cifra]),
      (
        ([3], [1,5], [Terça menor], [b3], [11], [5,5], [Sétima maior], [7M]),
        ([7], [3,5], [Quinta justa], [5], [2], [1], [Segunda maior], [2]),
        ([4], [2], [Terça maior], [3], [6], [3], [Quarta aum. / Quinta dim.], [\#4/b5]),
        ([10], [5], [Sétima menor], [7], [9], [4,5], [Sexta maior], [6]),
        ([5], [2,5], [Quarta justa], [4], [1], [0,5], [Segunda menor], [b2]),
        ([12], [6], [Oitava justa], [8], [8], [4], [Sexta menor], [b6]),
      ),
    )
  ]

  #resposta(9)[
    C→E *3* · D→F *b3* · E→B *5* · F→Bb *4* · G→F *7* · A→F\# *6* · Bb→D *3* · E→C *b6* · D→C\# *7M* · B→F *b5* · C→F\# *\#4* · Eb→Db *7*. Repare em B→F (b5) e C→F\# (\#4): ambos têm 6 semitons (trítono), mas a ortografia define o nome.
  ]

  #resposta(10)[
    3 de D = *F\#* · b3 de E = *G* · 5 de B = *F\#* · 4 de F = *Bb* · 7 de A = *G* · 7M de Eb = *D* · 6 de G = *E* · b6 de C = *Ab* · 2 de Bb = *C* · b2 de E = *F* · \#4 de C = *F\#* · b5 de A = *Eb*.
  ]

  #resposta(11)[
    a) 5ª/5 = Ré, *5* · b) 5ª/3 = Dó, *4* · c) 5ª/2 = Si, *3* · d) 4ª/5 = Sol, *8* (oitava) · e) 5ª/1 = Sib, *b3* · f) 6ª/5 = Lá, *2* · g) 4ª/4 = Fá\#, *7M* · h) 4ª/3 = Fá, *7*.
  ]

  #resposta(12)[
    a) 3 (4 ST) → *b6* (8 ST) · b3 (3) → *6* (9) · 4 (5) → *5* (7) · 2 (2) → *7* (10) · b2 (1) → *7M* (11) · 6 (9) → *b3* (3) · 7M (11) → *b2* (1) · \#4 (6) → *b5* (6). \
    b) Fá\# → Lá é uma *terça menor* (b3); Dó → Ré é uma *segunda maior* (2).
  ]

  #resposta(13)[
    #tabela(
      columns: (0.6fr,) + (0.7fr,) * 7 + (2fr,),
      ([Tom], [1], [2], [3], [4], [5], [6], [7], [Acidentes]),
      (
        ([G], [G], [A], [B], [C], [D], [E], [F\#], [1 \#: F\#]),
        ([D], [D], [E], [F\#], [G], [A], [B], [C\#], [2 \#: F\# C\#]),
        ([A], [A], [B], [C\#], [D], [E], [F\#], [G\#], [3 \#: F\# C\# G\#]),
        ([E], [E], [F\#], [G\#], [A], [B], [C\#], [D\#], [4 \#: F\# C\# G\# D\#]),
        ([F], [F], [G], [A], [Bb], [C], [D], [E], [1 b: Bb]),
        ([Bb], [Bb], [C], [D], [Eb], [F], [G], [A], [2 b: Bb Eb]),
        ([Eb], [Eb], [F], [G], [Ab], [Bb], [C], [D], [3 b: Bb Eb Ab]),
        ([Ab], [Ab], [Bb], [C], [Db], [Eb], [F], [G], [4 b: Bb Eb Ab Db]),
      ),
    )
  ]

  #resposta(14)[
    F maior: A\# → *Bb* (letra A repetida) · D maior: C → *C\#* (som errado) · E maior: Eb → *D\#* (letra E repetida) · Bb maior: D\# → *Eb* (letra D repetida) · A maior: F → *F\#* (som errado) · G maior: F → *F\#* (som errado).
  ]

  #resposta(15)[
    a) C → *Am* · G → *Em* · D → *Bm* · A → *F\#m* · *E* → C\#m · F → *Dm* · *Bb* → Gm · Eb → *Cm*. \
    b) Am: A B C D E F G · Em: E F\# G A B C D · Dm: D E F G A Bb C · Bm: B C\# D E F\# G A · Gm: G A Bb C D Eb F. \
    c) C (8) → *Am*, casa *5* · G (3) → *Em*, casa *0* (ou 12) · A (5) → *F\#m*, casa *2* · D (10) → *Bm*, casa *7* · F (1) → *Dm*, casa *10* (1 − 3 + 12) · Bb (6) → *Gm*, casa *3*.
  ]

  #resposta(16)[
    a) Am: A C D E G · Em: E G A B D · Dm: D F G A C · Gm: G Bb C D F. \
    C: C D E G A · G: G A B D E · D: D E F\# A B · F: F G A C D. \
    b) Am pentatônica = *C maior* pentatônica; Em pentatônica = *G maior* pentatônica. São tons *relativos*: a tônica menor está uma terça menor abaixo da maior, e as cinco notas são as mesmas, só muda a nota tomada como centro. \
    c) Posições (T = tônica):

    #align(center)[
      #grid(
        columns: (auto, auto, auto),
        column-gutter: 1.2em,
        align: center,
        [#text(size: 8pt, weight: "bold")[Am — casas 5–8] #v(0.1em) #braco-notas(fs: 5, (
          ("T", "", "", "C"),
          ("D", "", "E", ""),
          ("G", "", "T", ""),
          ("C", "", "D", ""),
          ("E", "", "", "G"),
          ("T", "", "", "C"),
        ), casa-largura: 21pt)],
        [#text(size: 8pt, weight: "bold")[Cm — casas 8–11] #v(0.1em) #braco-notas(fs: 8, (
          ("T", "", "", "Eb"),
          ("F", "", "G", ""),
          ("Bb", "", "T", ""),
          ("Eb", "", "F", ""),
          ("G", "", "", "Bb"),
          ("T", "", "", "Eb"),
        ), casa-largura: 21pt)],
        [#text(size: 8pt, weight: "bold")[G maior — casas 2–5] #v(0.1em) #braco-notas(fs: 2, (
          ("", "T", "", "A"),
          ("B", "", "", "D"),
          ("E", "", "", "T"),
          ("A", "", "B", ""),
          ("", "D", "", "E"),
          ("", "T", "", "A"),
        ), casa-largura: 21pt)],
      )
    ]
  ]
]
