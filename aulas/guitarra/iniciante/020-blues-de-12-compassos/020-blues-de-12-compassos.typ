#import "/templates/layout.typ": *
#import "/templates/components.typ": *
#import "@preview/conchord:0.4.0": new-chordgen

#show: aula.with(
  instrumento: "Guitarra",
  nivel: "Iniciante",
)

#let chord = new-chordgen(number-to-left: true, use-shadow-barre: false, colors: (hold: black, barre: black))
#show <chord>: set text(fill: color-strong, weight: "bold")

// Tabelas, caixas e diagramas não se partem entre páginas (os blocos
// que precisam quebrar, como `exercicio`, já declaram breakable: true).
#set block(breakable: false)

// Texto de células de tabela sem justificação (evita espaços esticados)
#show table: set par(justify: false)

// Exercício que não se divide entre páginas (enunciado + área de resposta juntos)
#let ex(..args) = block(breakable: false, above: 1.5em, below: 0.9em, exercicio(..args))

// ============================================================
// HELPERS LOCAIS
// ============================================================

// Grade de 12 compassos: `acordes` e `graus` são arrays de 12 itens
// (use none para deixar o compasso em branco, para o aluno preencher).
#let grade-blues(acordes, graus: none) = {
  let cel(i) = {
    let a = acordes.at(i)
    let g = if graus == none { none } else { graus.at(i) }
    box(width: 100%, height: if a == none { 0.85cm } else { auto }, inset: (y: 2pt), {
      place(top + left, dx: -3pt, dy: -3pt, text(size: 7pt, fill: color-muted)[#(i + 1)])
      align(center + horizon, stack(
        dir: ttb,
        spacing: 4pt,
        if a != none { text(size: 14pt, weight: "bold", fill: color-strong, a) },
        if g != none { text(size: 8.5pt, fill: color-secondary, g) },
      ))
    })
  }
  align(center, block(
    stroke: 0.6pt + color-rule-dark,
    radius: 6pt,
    clip: true,
    width: 100%,
    table(
      columns: (1fr,) * 4,
      inset: (x: 8pt, y: 9pt),
      stroke: (x, y) => (
        left: if x == 0 { none } else { 0.8pt + color-strong },
        top: if y == 0 { none } else { 0.5pt + color-rule-light },
      ),
      fill: (c, r) => if calc.even(r) { white } else { color-subtle-bg },
      ..range(12).map(cel),
    ),
  ))
}

// Grade de tercinas: cada tempo dividido em 3; `tocar` diz quais
// subdivisões soam (true) em cada tempo.
#let grade-tercinas(rotulo, tocar, tempos: 4) = {
  let silabas = ("ta", "ta")
  let cels = range(tempos)
    .map(t => range(3).map(k => {
      let txt = if k == 0 { str(t + 1) } else { silabas.at(k - 1) }
      let on = tocar.at(k)
      table.cell(
        fill: if on { color-strong } else { white },
        text(size: 8.5pt, weight: if k == 0 { "bold" } else { "regular" }, fill: if on { white } else { color-muted }, txt),
      )
    }))
    .flatten()
  grid(
    columns: (2.6cm, 1fr),
    align: (left + horizon, center),
    text(size: 9pt, weight: "bold", rotulo),
    table(
      columns: (1fr,) * (3 * tempos),
      align: center + horizon,
      inset: (y: 5pt),
      stroke: (x, y) => (
        left: if calc.rem(x, 3) == 0 { 1pt + color-strong } else { 0.4pt + color-rule-light },
        rest: 0.6pt + color-rule-dark,
      ),
      ..cels,
    ),
  )
}

// Escala no braço calculada a partir da afinação (0 = C)
#let afinacao = (4, 9, 2, 7, 11, 4) // 6ª, 5ª, 4ª, 3ª, 2ª, 1ª corda
#let escala-blues = ("0": "T", "3": "b3", "5": "4", "6": "*b5", "7": "5", "10": "b7")
#let escala-braco(raiz, rotulos, fs, fe) = afinacao.map(a => range(fs, fe + 1).map(f => rotulos.at(
  str(calc.rem(a + f - raiz + 24, 12)),
  default: "",
)))

#let legenda(body) = align(center, text(size: 8.5pt, fill: color-muted, body))

= Blues de 12 Compassos

O *blues de 12 compassos* é provavelmente a forma musical mais tocada da música popular. Nasceu no blues afro-americano do início do século XX e se espalhou para o rock and roll, o rock, o jazz, o funk e até o pop. Conhecer essa forma é ter na mão uma "língua franca": em qualquer jam session do mundo, alguém dizendo "blues em Lá" é suficiente para todos tocarem juntos. Nesta aula você vai aprender a forma, o balanço do shuffle, um riff de base clássico e como improvisar sobre ele.

#objetivos((
  [Tocar a forma do blues de 12 compassos (I7 – IV7 – V7) e a variação quick change],
  [Entender o turnaround e o balanço do shuffle (colcheias tercinadas)],
  [Usar os acordes dominantes abertos e com pestana em A, D e E],
  [Tocar o riff de boogie (5ª – 6ª) como base nos 12 compassos],
  [Improvisar com a pentatônica menor e a blue note (b5), usando pergunta e resposta],
))

== 1. A forma: I7 – IV7 – V7 em 12 compassos

O blues usa apenas *três acordes*, todos *dominantes* (tríades maiores — T, 3 e 5 — com a 7ª menor acrescentada: T – 3 – 5 – b7): o *I7*, o *IV7* e o *V7* do tom. Em Lá, são *A7*, *D7* e *E7*. Eles se organizam em três frases de quatro compassos:

#v(0.4em)

#grade-blues(
  ("A7", "A7", "A7", "A7", "D7", "D7", "A7", "A7", "E7", "D7", "A7", "E7"),
  graus: ("I7", "I7", "I7", "I7", "IV7", "IV7", "I7", "I7", "V7", "IV7", "I7", "V7"),
)
#legenda[Cada quadro é um compasso de 4 tempos. Lê-se da esquerda para a direita, linha por linha, e depois volta ao início.]

#v(0.4em)

#cartoes-info((
  (titulo: "Frase 1 (comp. 1–4)", corpo: align(center)[Apresentação: quatro compassos na tônica.]),
  (titulo: "Frase 2 (comp. 5–8)", corpo: align(center)[Afastamento: vai ao IV7 e volta ao I7.]),
  (titulo: "Frase 3 (comp. 9–12)", corpo: align(center)[Tensão e retorno: V7 – IV7 – I7, e o V7 do fim prepara a volta.]),
))

#v(0.4em)

#caixa(tipo: "dica")[
  Repare que todos os acordes do blues são *dominantes* — inclusive o I7, que num tom maior "comum" seria um acorde 7M. Essa sonoridade de 7ª menor em todos os graus é uma das marcas do blues.
]

=== Variação "quick change"

Na versão *quick change* (troca rápida), o *compasso 2 vai para o IV7* e volta ao I7 no compasso 3. É muito comum no blues de Chicago e dá mais movimento à primeira frase:

#v(0.3em)

#grade-blues(
  ("A7", "D7", "A7", "A7", "D7", "D7", "A7", "A7", "E7", "D7", "A7", "E7"),
  graus: ("I7", "IV7", "I7", "I7", "IV7", "IV7", "I7", "I7", "V7", "IV7", "I7", "V7"),
)

=== O turnaround

Os dois últimos compassos (11 e 12) formam o *turnaround*: a "volta" que conduz a música de novo ao compasso 1. O V7 do compasso 12 cria tensão e pede a resolução no I7. Muitos guitarristas tocam ali uma frase característica, como esta descida cromática:

#v(0.3em)

#tab(
  titulo: "Turnaround em A (compassos 11 e 12)",
  "   A7                E7
e|-5---5---5---5---|-0---------------|
B|-5---4---3---2---|-0---------------|
G|-----------------|-1---------------|
D|-----------------|-0---------------|
A|-0---------------|-2---------------|
E|-----------------|-0---------------|",
  legenda: [Semínimas. Mantenha o Lá (1ª corda, casa 5) com o dedo mínimo e desça a 2ª corda de 5 até 2. No compasso 12, toque o E7 aberto e deixe soar.],
)

#v(0.3em)

Na última volta da música, o compasso 12 costuma ficar no *I7* (A7) para terminar — muitas vezes com um final do tipo "V7 → I7" nos dois últimos tempos.

== 2. O balanço: shuffle e colcheias tercinadas

O blues raramente é tocado com colcheias "retas" (iguais). O balanço típico é o *shuffle* (ou *swing*): cada tempo é pensado em *três partes iguais* — uma *tercina* — e você toca apenas a *primeira e a terceira*. O resultado é um padrão *longo–curto*, "manco", que dá o groove do blues.

#block(width: 100%)[
Para contar tercinas usamos *"1 ta ta, 2 ta ta…"*: o número cai no tempo e os dois "ta" dividem o resto do tempo em partes iguais. No shuffle, o "ta" do meio fica em silêncio:

#v(0.4em)

#grade-tercinas("Tercinas (todas)", (true, true, true))
#v(0.3em)
#grade-tercinas("Shuffle", (true, false, true))
#v(0.3em)
#legenda[Quadros pretos = notas tocadas. No shuffle, a primeira nota de cada tempo dura o dobro da segunda.]
]

#v(0.4em)

#explainer-component(
  align(center)[
    #grid(
      columns: 3,
      column-gutter: 8pt,
      align: horizon,
      box(grupo-notas(2)),
      text(size: 13pt)[=],
      stack(
        dir: ttb,
        spacing: 2pt,
        align(center, text(size: 8pt, weight: "bold")[3]),
        box(nota("seminima") + h(2pt) + nota("colcheia")),
      ),
    )
    #v(0.2em)
    #text(size: 8pt, fill: color-muted)[colcheias escritas = semínima + colcheia tercinadas]
  ],
  [
    Na partitura e na tablatura, o shuffle quase sempre é escrito com *colcheias normais* e uma indicação no início ("Shuffle" ou "Swing"), ou com a fórmula ao lado: duas colcheias escritas valem uma tercina com a nota do meio ligada. Na prática: *leia colcheias, toque longo–curto*.
  ],
)

#caixa(tipo: "dica")[
  Antes de tocar, *fale* o shuffle junto com o metrônomo: "*um*–ta, *dois*–ta, *três*–ta, *quatro*–ta", alongando a sílaba do número. Pense no ritmo de um trote de cavalo.
]

== 3. Os acordes dominantes

Você precisa de três acordes dominantes. Eles podem ser tocados abertos, na região das primeiras casas, ou com pestana, todos perto da casa 5 — o que facilita alternar com os solos na mesma região:

#v(0.3em)

#grid-acordes(
  chord: chord,
  columns: 6,
  gutter: 1.1em,
  (
    (tabs: "x,0,2,0,2,0", nome: " ", titulo: "A7", detalhe: "aberto"),
    (tabs: "x,x,0,2,1,2", nome: " ", titulo: "D7", detalhe: "aberto"),
    (tabs: "0,2,0,1,0,0", nome: " ", titulo: "E7", detalhe: "aberto"),
    (tabs: "5,7,5,6,5,5", nome: " ", titulo: "A7", detalhe: "shape E, casa 5"),
    (tabs: "x,5,7,5,7,5", nome: " ", titulo: "D7", detalhe: "shape A, casa 5"),
    (tabs: "x,7,9,7,9,7", nome: " ", titulo: "E7", detalhe: "shape A, casa 7"),
  ),
)

#legenda[Shapes com pestana: o indicador prende as cordas na casa indicada e os outros dedos montam o E7 (tônica na 6ª corda) ou o A7 (tônica na 5ª corda) abertos.]

== 4. O riff de boogie

#block(width: 100%)[
Em vez de acordes cheios, a base de blues mais clássica da guitarra é o *riff de boogie*: um power chord de *5ª* que alterna com a *6ª* (o dedo anelar avança duas casas). Cada acorde usa a corda solta como baixo: A na 5ª corda, D na 4ª e E na 6ª. Toque em *shuffle*, com palhetadas para baixo e um leve palm mute (a lateral da mão direita apoiada de leve sobre as cordas, junto à ponte).

#v(0.3em)

#tab(
  titulo: "Riff de boogie — compassos 1 a 4",
  "   A7
e|-----------------|-----------------|-----------------|-----------------|
B|-----------------|-----------------|-----------------|-----------------|
G|-----------------|-----------------|-----------------|-----------------|
D|-2-2-4-4-2-2-4-4-|-2-2-4-4-2-2-4-4-|-2-2-4-4-2-2-4-4-|-2-2-4-4-2-2-4-4-|
A|-0-0-0-0-0-0-0-0-|-0-0-0-0-0-0-0-0-|-0-0-0-0-0-0-0-0-|-0-0-0-0-0-0-0-0-|
E|-----------------|-----------------|-----------------|-----------------|",
)
]

#v(0.2em)
#tab(
  titulo: "Compassos 5 a 8",
  "   D7                                  A7
e|-----------------|-----------------|-----------------|-----------------|
B|-----------------|-----------------|-----------------|-----------------|
G|-2-2-4-4-2-2-4-4-|-2-2-4-4-2-2-4-4-|-----------------|-----------------|
D|-0-0-0-0-0-0-0-0-|-0-0-0-0-0-0-0-0-|-2-2-4-4-2-2-4-4-|-2-2-4-4-2-2-4-4-|
A|-----------------|-----------------|-0-0-0-0-0-0-0-0-|-0-0-0-0-0-0-0-0-|
E|-----------------|-----------------|-----------------|-----------------|",
)
#v(0.2em)
#tab(
  titulo: "Compassos 9 a 12",
  "   E7                D7                A7                E7
e|-----------------|-----------------|-----------------|-----------------|
B|-----------------|-----------------|-----------------|-----------------|
G|-----------------|-2-2-4-4-2-2-4-4-|-----------------|-----------------|
D|-----------------|-0-0-0-0-0-0-0-0-|-2-2-4-4-2-2-4-4-|-----------------|
A|-2-2-4-4-2-2-4-4-|-----------------|-0-0-0-0-0-0-0-0-|-2-2-4-4-2-2-4-4-|
E|-0-0-0-0-0-0-0-0-|-----------------|-----------------|-0-0-0-0-0-0-0-0-|",
  legenda: [Colcheias em shuffle (longo–curto). Casa 2 = 5ª do acorde; casa 4 = 6ª.],
)

#v(0.4em)

#tab(
  titulo: "Variação com a b7 (um compasso de cada acorde)",
  "   A7                D7                E7
e|-----------------|-----------------|-----------------|
B|-----------------|-----------------|-----------------|
G|-----------------|-2-2-4-4-5-5-4-4-|-----------------|
D|-2-2-4-4-5-5-4-4-|-0-0-0-0-0-0-0-0-|-----------------|
A|-0-0-0-0-0-0-0-0-|-----------------|-2-2-4-4-5-5-4-4-|
E|-----------------|-----------------|-0-0-0-0-0-0-0-0-|",
  legenda: [Casa 5 = b7 do acorde, alcançada com o dedo mínimo: 5 – 6 – b7 – 6. É a base de incontáveis rocks e blues.],
)

#v(0.4em)

#caixa(tipo: "atencao")[
  Mantenha o indicador fixo na casa 2 enquanto o anelar (ou o mínimo) alterna — não levante a mão inteira. E não deixe a corda solta do acorde anterior soando quando trocar de acorde: abafe-a com a palma da mão direita.
]

== 5. Improvisando: pentatônica menor + blue note

A escala mais usada para solar sobre o blues é a *pentatônica menor* da tônica — em Lá, a "caixa" das casas 5 a 8 (*T – b3 – 4 – 5 – b7*: A – C – D – E – G), com a tônica sob o dedo 1 na 6ª corda. Acrescentando a *b5* (a *blue note*), ela vira a *escala blues*: *T – b3 – 4 – b5 – 5 – b7* (em Lá: A – C – D – Eb – E – G).

#v(0.3em)

#align(center, grid(
  columns: (auto, 1fr),
  column-gutter: 1.5em,
  align: horizon,
  braco-notas(escala-braco(9, escala-blues, 5, 8), fs: 5),
  align(left)[
    #set text(size: 9.5pt)
    *A blues — casas 5 a 8* \
    Em cinza, a blue note (b5 = Eb), na 5ª corda (casa 6) e na 3ª corda (casa 8).
    #v(0.3em)
    A b5 é uma *nota de passagem*: use-a para ligar a 4 e a 5 (D – Eb – E), sem parar nela. Parada sobre o acorde, ela soa como erro; de passagem, soa como blues.
  ],
))

#v(0.4em)

#caixa(tipo: "dica")[
  O blues mistura de propósito a *b3* da escala com a *3* maior do acorde. Experimente fazer um bend pequeno (¼ de tom) na b3 (1ª corda, casa 8): a nota fica "entre" a menor e a maior — esse é o som mais característico do gênero.
]

=== Pergunta e resposta (call & response)

Um solo de blues não é uma sequência de notas, é uma *conversa*. A técnica de *pergunta e resposta* vem do canto tradicional: uma frase "pergunta" (termina em suspenso, numa nota que não é a tônica) e a seguinte "responde" (resolve na tônica). Entre elas, *deixe espaço*: o silêncio faz parte da frase.

#v(0.3em)

#grid(
  columns: (1fr, 1fr),
  column-gutter: 0.8em,
  tab(
    titulo: "Pergunta (compassos 1–2)",
    "   1  e  2  e  3  e
e|----5--8--5--------------|---------|
B|-5-----------8--5--------|---------|
G|-------------------------|---------|
D|-------------------------|---------|
A|-------------------------|---------|
E|-------------------------|---------|
   5  T  b3 T  b7 5",
    tamanho: 7.6pt,
  ),
  tab(
    titulo: "Resposta (compassos 3–4)",
    "   1  e  2  e  3
e|-------------------------|---------|
B|-------------------------|---------|
G|-7--8--7--5--------------|---------|
D|-------------7-----------|---------|
A|-------------------------|---------|
E|-------------------------|---------|
   4  b5 4  b3 T",
    tamanho: 7.6pt,
  ),
)
#legenda[A pergunta para na 5 (Mi); a resposta passa pela blue note e resolve na tônica Lá. O segundo compasso de cada uma é silêncio.]

== 6. Blues em outros tons

A forma é sempre a mesma; mudam os acordes e a casa da escala. Os tons mais comuns na guitarra são os que aproveitam cordas soltas:

#v(0.3em)

#tabela(
  columns: (0.8fr, 1fr, 1fr, 1fr, 2fr, 1.2fr),
  ([*Tom*], [*I7*], [*IV7*], [*V7*], [*Caixa da penta (casa)*], [*Blue note*]),
  (
    ([E], [E7], [A7], [B7], [0 (ou 12)], [Bb]),
    ([A], [A7], [D7], [E7], [5], [Eb]),
    ([G], [G7], [C7], [D7], [3], [Db]),
    ([C], [C7], [F7], [G7], [8], [Gb]),
    ([D], [D7], [G7], [A7], [10], [Ab]),
  ),
)

#legenda[A casa indica onde começa a caixa da pentatônica menor, com a tônica na 6ª corda.]

== 7. Exercícios

#ex(titulo: "A forma em Mi", nivel: "Escrita")[
  Escreva os acordes do blues de 12 compassos (forma básica) no tom de *E*.

  #v(0.3em)
  #grade-blues((none,) * 12)
]

#ex(titulo: "Quick change em Sol", nivel: "Escrita")[
  Escreva os acordes do blues *quick change* no tom de *G*, com o compasso 12 em turnaround (V7).

  #v(0.3em)
  #grade-blues((none,) * 12)
]

#ex(titulo: "I7, IV7 e V7", nivel: "Escrita")[
  Complete os três acordes do blues em cada tom.

  #v(0.3em)
  #tabela-preencher(
    ([*Tom*], [*C*], [*D*], [*F*], [*Bb*], [*B*]),
    (
      ([I7], none, none, none, none, none),
      ([IV7], none, none, none, none, none),
      ([V7], none, none, none, none, none),
    ),
    columns: (1.2fr,) + (1fr,) * 5,
  )
]

#ex(titulo: "A escala blues", nivel: "Escrita")[
  Escreva a escala blues (T – b3 – 4 – b5 – 5 – b7) de cada tom.

  #v(0.3em)
  #tabela-preencher(
    ([*Tom*], [*T*], [*b3*], [*4*], [*b5*], [*5*], [*b7*]),
    (
      ([E], none, none, none, none, none, none),
      ([G], none, none, none, none, none, none),
      ([C], none, none, none, none, none, none),
      ([D], none, none, none, none, none, none),
    ),
    columns: (1fr,) * 7,
  )
]

#ex(titulo: "Escreva uma resposta", nivel: "Escrita e prática")[
  Toque a "pergunta" da seção 5 e escreva, na pauta abaixo, uma *resposta* de dois compassos sua, usando a escala blues de A nas casas 5 a 8. Regras: comece depois de uma pausa e termine na tônica Lá (6ª ou 1ª corda na casa 5, ou 4ª corda na casa 7).

  #tab-vazia(sistemas: 1, compassos: 2, altura-linha: 11pt)
]

#ex(titulo: "Os 12 compassos completos", nivel: "Prática")[
  Toque os 12 compassos com o riff de boogie em shuffle, terminando cada volta com o turnaround da seção 1. Comece a *70 BPM* e faça três voltas seguidas sem parar. Depois, troque o riff básico pela variação com a b7.
]

#ex(titulo: "Conversa com a base", nivel: "Prática")[
  Grave a base (riff de boogie, três voltas) ou use uma base de blues em A. Improvise *apenas com pergunta e resposta*: dois compassos de frase, dois compassos de silêncio. Use a blue note pelo menos uma vez em cada resposta.
]

=== Sugestão de prática

#rotina-estudo((
  ([Falar e bater o shuffle com o metrônomo ("um–ta, dois–ta")], [2 min], [70]),
  ([Riff de boogie nos 12 compassos (básico e com b7)], [6 min], [70 → 90]),
  ([Acordes dominantes abertos e com pestana na forma do blues], [4 min], [70]),
  ([Turnaround da seção 1 (compassos 11–12)], [3 min], [70]),
  ([Pergunta e resposta com a escala blues de A], [5 min], [—]),
))

#v(0.6em)

#checklist(
  (
    [Sei a forma do blues de 12 compassos de cor, em graus (I7, IV7, V7).],
    [Toco a variação quick change e sei onde fica o turnaround.],
    [Toco colcheias em shuffle (longo–curto) sem perder o pulso.],
    [Toco o riff de boogie nos 12 compassos sem parar.],
    [Uso a blue note como nota de passagem, sem parar nela.],
    [Improviso com pergunta e resposta, deixando espaço entre as frases.],
    [Transponho a forma do blues para E, G, C e D.],
  ),
  titulo: "Autoavaliação",
)

#gabarito[
  #resposta(1)[
    E7 – E7 – E7 – E7 | A7 – A7 – E7 – E7 | B7 – A7 – E7 – B7.
  ]
  #resposta(2)[
    G7 – C7 – G7 – G7 | C7 – C7 – G7 – G7 | D7 – C7 – G7 – D7.
  ]
  #resposta(3)[
    C: C7, F7, G7 · D: D7, G7, A7 · F: F7, Bb7, C7 · Bb: Bb7, Eb7, F7 · B: B7, E7, F\#7.
  ]
  #resposta(4)[
    E: E – G – A – Bb – B – D · G: G – Bb – C – Db – D – F · C: C – Eb – F – Gb – G – Bb · D: D – F – G – Ab – A – C.
  ]
  #resposta(5)[
    Resposta livre. Critério de sucesso: usa apenas notas da escala blues de A (A, C, D, Eb, E, G), cabe em dois compassos, começa depois de uma pausa e termina na tônica Lá. Exemplo: 3ª corda 7 – 8 – 7 – 5, 4ª corda 7 (a resposta da seção 5).
  ]
  #resposta(6)[
    Exercício prático — critério de sucesso: três voltas completas a 70 BPM com shuffle constante, trocas de acorde no tempo 1 e o turnaround levando de volta ao compasso 1 sem hesitar.
  ]
  #resposta(7)[
    Exercício prático — critério de sucesso: frases que respeitam os dois compassos de silêncio, respostas terminando na tônica e a blue note usada de passagem.
  ]
]
