#import "/templates/layout.typ": *
#import "/templates/components.typ": *

#show: aula.with(
  instrumento: "Guitarra",
  nivel: "Iniciante",
)

// Exercício curto que não se divide entre páginas.
#let ex(..args, body) = block(breakable: false, width: 100%, exercicio(..args, body))

= Técnicas de Expressão

Tocar as notas certas é só metade do caminho. O que transforma uma sequência de notas numa *frase musical* é a forma de tocá-las: ligar uma nota à outra, "esticar" a afinação, fazer a nota vibrar, deslizar pelo braço. Nesta aula você vai aprender as quatro técnicas de expressão mais importantes da guitarra e como elas aparecem na tablatura. Todos os exemplos usam a pentatônica de Lá menor na região das casas 5 a 8.

#objetivos((
  [Executar hammer-on e pull-off com volume equilibrado],
  [Fazer bends afinados de meio tom e de um tom],
  [Controlar o vibrato em notas longas],
  [Usar slides para ligar notas e posições],
  [Ler e escrever essas técnicas na tablatura],
))

== 1. Legato: hammer-on e pull-off

*Legato* significa "ligado": duas ou mais notas soam em sequência com *uma única palhetada*. O som fica mais fluido e suave do que quando cada nota é palhetada.

#block(breakable: false, cartoes-info(
  columns: (1fr, 1fr),
  (
    (
      titulo: "Hammer-on (h)",
      corpo: [Toque a primeira nota com a palheta. Sem palhetar de novo, *"martele"* a corda com outro dedo numa casa mais alta, com força e precisão suficientes para a nova nota soar. \ #v(0.3em) *Na tab:* `5h7` = toque a casa 5 e martele a 7.],
    ),
    (
      titulo: "Pull-off (p)",
      corpo: [Prenda as duas notas ao mesmo tempo e toque a mais aguda. Ao soltar o dedo de cima, *puxe a corda levemente para o lado* (como se a beliscasse), fazendo soar a nota de baixo. \ #v(0.3em) *Na tab:* `7p5` = toque a casa 7 e "puxe" para a 5.],
    ),
  ),
))

#v(0.6em)

#tab(
  titulo: "Exercício de legato",
  legenda: "Palhete apenas a primeira nota de cada grupo. As notas ligadas devem soar com o mesmo volume da palhetada.",
  "e|--------------------------5h8p5---|\nB|--------------5h8--8p5------------|\nG|--5h7--7p5------------------------|\nD|----------------------------------|\nA|----------------------------------|\nE|----------------------------------|",
)

== 2. Bend

No *bend*, você empurra (ou puxa) a corda na direção das outras cordas enquanto a nota soa. A corda estica e a afinação *sobe*. É a técnica que mais aproxima a guitarra da voz humana.

#tabela(
  columns: (1.15fr, 0.75fr, 3.1fr),
  ([Tipo], [Na tab], [O que fazer]),
  (
    ([Meio bend], [`7b8`], [Subir meio tom: a nota passa a soar como a casa seguinte]),
    ([Bend inteiro], [`7b9`], [Subir um tom: a nota passa a soar como duas casas acima]),
    ([Bend e release], [`7b9r7`], [Subir até a nota-alvo e voltar à nota original sem palhetar]),
    ([Pre-bend], [`7pb9`], [Esticar a corda *antes* de tocar; palhetar e então soltar]),
    ([Unison bend], [—], [Esticar uma corda até soar igual à nota presa na corda vizinha]),
  ),
)

#caixa(tipo: "dica", titulo: "Bend afinado")[
  Toque primeiro a *nota-alvo* (por exemplo, a casa 9 da 3ª corda), memorize o som e só então faça o bend a partir da casa 7. As duas notas devem soar *iguais*. Use dois ou três dedos juntos na corda (anelar apoiado pelo médio e pelo indicador) e gire o pulso: a força vem do antebraço, não só da ponta dos dedos.
]

#v(0.4em)

#tab(
  titulo: "Treino de afinação do bend",
  legenda: "Toque a nota-alvo (9), faça o bend da 7 até soar igual e depois o bend e release. Repita na 2ª corda (8 → 10).",
  "e|------------------------------------|\nB|-----------------------8b10----10---|\nG|--9----7b9----7b9r7-----------------|\nD|------------------------------------|\nA|------------------------------------|\nE|------------------------------------|",
)

Cordas mais finas facilitam os bends: com um encordoamento .009 a corda dobra com bem menos esforço do que com .011 ou .012, que exigem mais força e mais calo nos dedos.

== 3. Vibrato

O *vibrato* é uma oscilação regular da afinação que dá vida e sustentação a uma nota longa. É como a "assinatura" do guitarrista: cada um desenvolve o seu, com mais ou menos amplitude (quanto a nota sobe) e velocidade.

#block(breakable: false, cartoes-info(
  columns: (1fr, 1fr),
  (
    (
      titulo: "Vibrato de bend (guitarra elétrica)",
      corpo: [O pulso *gira* em pequenos movimentos, fazendo o dedo empurrar e soltar a corda repetidamente, como vários mini-bends. É o vibrato típico do rock e do blues.],
    ),
    (
      titulo: "Vibrato clássico (violão)",
      corpo: [O dedo *balança no sentido do comprimento da corda* (em direção à cabeça e ao corpo do instrumento), sem empurrá-la para o lado. É mais sutil, muito usado no violão clássico.],
    ),
  ),
))

#v(0.6em)

#tab(
  titulo: "Vibrato em notas longas",
  legenda: "~~~ = vibrato. Deixe cada nota soar quatro tempos; comece lento e regular.",
  "e|------------------5~~~~---|\nB|--5~~~--------------------|\nG|----------7~~~------------|\nD|--------------------------|\nA|--------------------------|\nE|--------------------------|",
)

== 4. Slide

No *slide*, você toca uma nota e *desliza o dedo* pelo braço até outra casa, sem soltar a pressão. A nota de chegada soa sem nova palhetada.

#tab(
  titulo: "Slides para cima (/) e para baixo (\\)",
  legenda: "5/7 = deslize da casa 5 para a 7 · 7\\5 = deslize da casa 7 para a 5.",
  "e|-----------------------8\\5---|\nB|-----------------------------|\nG|--5/7----7\\5-----------------|\nD|----------------5/7----------|\nA|-----------------------------|\nE|-----------------------------|",
)

#v(0.4em)

Existe também o *slide com bottleneck*: um tubo de vidro ou metal colocado num dedo da mão que digita e deslizado *sobre* as cordas, sem pressioná-las contra o braço. O som é contínuo e "cantado", muito usado no blues.

== 5. Juntando tudo

#tab(
  titulo: "Frase com todas as técnicas (Lá menor, casas 5 a 8)",
  legenda: "Slide 5/7 · bend e release 8b10r8 · hammer-on e pull-off 5h8p5 · vibrato na tônica (4ª corda, casa 7).",
  "e|------------------5h8p5---------------|\nB|-------8b10r8--5---------8--5---------|\nG|--5/7---------------------------------|\nD|-------------------------------7~~~---|\nA|--------------------------------------|\nE|--------------------------------------|",
)

#caixa(tipo: "resumo", titulo: "Conceito fundamental")[
  Não é a velocidade que torna uma frase musical, é a *intenção*. Uma nota longa com bend afinado e vibrato bem feito comunica mais do que vinte notas rápidas sem expressão.
]

== 6. Exercícios

#ex(titulo: "Leia a tablatura")[
  Escreva o nome da técnica indicada por cada símbolo.

  #tabela-preencher(
    columns: (1.2fr,) + (1fr,) * 7,
    ([Símbolo], [`5h7`], [`7p5`], [`7b9`], [`7b9r7`], [`5/7`], [`7\5`], [`5~~~`]),
    (([Técnica],) + (none,) * 7,),
    altura: 1.3cm,
  )
]

#ex(titulo: "Qual é a nota-alvo?")[
  Escreva a casa que deve soar ao final de cada bend.

  #tabela-preencher(
    columns: (1.4fr,) + (1fr,) * 5,
    ([], [a)], [b)], [c)], [d)], [e)]),
    (
      ([*Corda*], [3ª], [2ª], [2ª], [1ª], [3ª]),
      ([*Casa*], [7], [8], [5], [8], [14]),
      ([*Bend*], [inteiro], [inteiro], [meio], [inteiro], [inteiro]),
      ([*Casa-alvo*],) + (none,) * 5,
    ),
  )
]

#ex(titulo: "Descreva a frase")[
  Na frase da seção 5, escreva, na ordem, cada técnica usada e em que corda ela acontece.

  #linhas-resposta(3)
]

#ex(titulo: "Por que conferir?")[
  Por que é recomendado tocar a nota-alvo antes de treinar um bend? O que acontece se o bend ficar "curto"?

  #linhas-resposta(2)
]

#ex(titulo: "Escreva a sua frase")[
  Usando a pentatônica de Lá menor nas casas 5 a 8, escreva uma frase com pelo menos *um hammer-on, um bend e um vibrato*, terminando na tônica (Lá). Depois toque.

  #tab-vazia(sistemas: 2, compassos: 2)
]

=== Sugestão de prática

#rotina-estudo((
  ([Exercício de legato (seção 1), volume igual em todas as notas], [5 min], [60–80]),
  ([Treino de afinação do bend, conferindo com a nota-alvo], [5 min], [—]),
  ([Vibrato em notas longas, quatro tempos cada], [5 min], [60]),
  ([Frase da seção 5, devagar e depois no tempo], [5 min], [60–80]),
))

=== Autoavaliação

#checklist((
  [Meus hammer-ons e pull-offs soam com o mesmo volume da nota palhetada],
  [Meus bends de um tom chegam exatamente na nota-alvo],
  [Consigo manter um vibrato regular por quatro tempos],
  [Faço slides sem perder a pressão nem o som da nota],
  [Leio e escrevo `h`, `p`, `b`, `r`, `/`, `\` e `~` na tablatura],
))

#gabarito[
  #resposta(1)[
    `5h7` hammer-on · `7p5` pull-off · `7b9` bend inteiro (um tom) · `7b9r7` bend e release · `5/7` slide para cima · `7\5` slide para baixo · `5~~~` vibrato.
  ]
  #resposta(2)[
    a) 9 · b) 10 · c) 6 · d) 10 · e) 16.
  ]
  #resposta(3)[
    Slide para cima da casa 5 à 7 na 3ª corda → bend e release (8 → 10 → 8) na 2ª corda → nota na casa 5 da 2ª corda → hammer-on e pull-off (5 → 8 → 5) na 1ª corda → notas nas casas 8 e 5 da 2ª corda → vibrato na casa 7 da 4ª corda (tônica Lá).
  ]
  #resposta(4)[
    Ouvir a nota-alvo antes cria uma referência para o ouvido; sem ela é comum parar o bend antes da hora. Um bend "curto" fica *desafinado* (abaixo da nota desejada) e soa errado mesmo que a técnica esteja limpa.
  ]
  #resposta(5)[
    Resposta pessoal. Confira se todas as notas pertencem à pentatônica de Lá menor (Lá, Dó, Ré, Mi, Sol), se aparecem as três técnicas pedidas e se a última nota é Lá (6ª corda casa 5, 4ª corda casa 7 ou 1ª corda casa 5).
  ]
]
