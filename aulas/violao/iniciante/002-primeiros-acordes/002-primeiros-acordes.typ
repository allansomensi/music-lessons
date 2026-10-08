#import "/templates/layout.typ": *
#import "/templates/components.typ": *
#import "@preview/conchord:0.4.0": new-chordgen

#show: aula.with(
  instrumento: "Violão",
  nivel: "Iniciante",
)

#let chord = new-chordgen(number-to-left: true, use-shadow-barre: false, colors: (hold: black, barre: black))
#show <chord>: set text(fill: color-strong, weight: "bold")

// Exercício que não se divide entre páginas (enunciado + área de resposta juntos)
#let ex(..args) = block(breakable: false, above: 1.5em, below: 0.9em, exercicio(..args))

= Primeiros Acordes

Os *acordes abertos* são o ponto de partida do violão: eles usam cordas soltas, o que deixa o som cheio e exige menos esforço da mão esquerda. Com os sete acordes deste material — Am, Em, E, A, D, G e C — você já consegue acompanhar centenas de músicas.

#objetivos((
  [Ler um diagrama de acorde: cordas, casas, dedos, cordas soltas e abafadas.],
  [Montar os sete acordes abertos essenciais com a digitação correta.],
  [Corrigir os erros mais comuns (notas abafadas, cordas a mais, dor nos dedos).],
  [Trocar de acorde com fluidez usando dedos-âncora e movimentos em bloco.],
))

== 1. Como ler um diagrama de acorde

O diagrama é um desenho do braço do violão *de frente, na vertical*, como se o instrumento estivesse em pé à sua frente:

#grid(
  columns: (auto, 1fr),
  column-gutter: 2em,
  align: (center + horizon, left + horizon),
  box(chord("x,3,2,0,1,0", name: "C")),
  [
    - *Linhas verticais:* as cordas. A da *esquerda* é a *6ª corda (Mi grave)*; a da direita, a *1ª corda (Mi agudo)*.
    - *Linhas horizontais:* os trastes. A linha grossa no topo é a pestana (o início do braço); o espaço entre duas linhas é uma *casa*.
    - *Bolinhas:* onde pressionar.
    - *○ acima da corda:* corda solta — toque sem pressionar.
    - *× acima da corda:* corda que *não* deve soar.
  ],
)

Os dedos da mão esquerda são numerados: *1 = indicador*, *2 = médio*, *3 = anelar*, *4 = mínimo*. Abaixo de cada diagrama deste material está indicado qual dedo vai em cada corda e casa.

#caixa(tipo: "dica", titulo: "Para a nota soar limpa")[
  Pressione com a *ponta do dedo*, *logo atrás do traste* (nunca em cima dele nem no meio da casa). Mantenha os dedos bem curvados, para que não encostem nas cordas vizinhas, e o polegar apoiado atrás do braço.
]

== 2. Os sete acordes essenciais

#block(breakable: false)[
=== Acordes menores

Acordes *menores* (escritos com "m": Am, Em) têm um som mais triste ou melancólico.

#grid-acordes(
  chord: chord,
  columns: 2,
  gutter: 3em,
  (
    (tabs: "0,2,2,0,0,0", nome: " ", titulo: "Em — Mi menor", detalhe: [dedo 2: 5ª corda, casa 2 \ dedo 3: 4ª corda, casa 2 \ toque as 6 cordas]),
    (tabs: "x,0,2,2,1,0", nome: " ", titulo: "Am — Lá menor", detalhe: [dedo 1: 2ª corda, casa 1 \ dedo 2: 4ª corda, casa 2 \ dedo 3: 3ª corda, casa 2 \ não toque a 6ª corda]),
  ),
)
]

=== Acordes maiores

Acordes *maiores* (só a letra: C, G, D…) têm um som mais alegre e estável.

#grid-acordes(
  chord: chord,
  columns: 3,
  gutter: 2.2em,
  (
    (tabs: "0,2,2,1,0,0", nome: " ", titulo: "E — Mi maior", detalhe: [dedo 1: 3ª corda, casa 1 \ dedo 2: 5ª corda, casa 2 \ dedo 3: 4ª corda, casa 2 \ toque as 6 cordas]),
    (tabs: "x,0,2,2,2,0", nome: " ", titulo: "A — Lá maior", detalhe: [dedo 1: 4ª corda, casa 2 \ dedo 2: 3ª corda, casa 2 \ dedo 3: 2ª corda, casa 2 \ não toque a 6ª corda]),
    (tabs: "x,x,0,2,3,2", nome: " ", titulo: "D — Ré maior", detalhe: [dedo 1: 3ª corda, casa 2 \ dedo 2: 1ª corda, casa 2 \ dedo 3: 2ª corda, casa 3 \ toque só da 4ª à 1ª corda]),
  ),
)

#v(0.6em)

#grid-acordes(
  chord: chord,
  columns: 2,
  gutter: 3em,
  (
    (tabs: "3,2,0,0,0,3", nome: " ", titulo: "G — Sol maior", detalhe: [dedo 2: 5ª corda, casa 2 \ dedo 3: 6ª corda, casa 3 \ dedo 4: 1ª corda, casa 3 \ toque as 6 cordas]),
    (tabs: "x,3,2,0,1,0", nome: " ", titulo: "C — Dó maior", detalhe: [dedo 1: 2ª corda, casa 1 \ dedo 2: 4ª corda, casa 2 \ dedo 3: 5ª corda, casa 3 \ não toque a 6ª corda]),
  ),
)

#caixa(tipo: "neutro", titulo: "Por que esses nomes?")[
  Todo acorde tem uma nota principal, a *tônica*, que dá nome a ele: em C (Dó maior) é o Dó; em Am (Lá menor), o Lá. Em geral, a corda mais grave tocada no acorde é a própria tônica — por isso, em Am, A e C a 6ª corda fica de fora, e em D tocamos só a partir da 4ª corda.
]

== 3. Erros comuns e como corrigir

#tabela(
  ([*Problema*], [*Causa provável*], [*Solução*]),
  (
    ([Nota abafada ou com chiado], [Dedo longe do traste ou pressão insuficiente], [Aproxime o dedo do traste; pressione só o necessário para a nota soar limpa]),
    ([Corda solta vizinha abafada], [A "barriga" do dedo encosta na corda ao lado], [Curve mais os dedos e use a ponta; levante um pouco o pulso]),
    ([Corda grave sobrando no D, no C ou no Am], [A mão direita toca cordas que deveriam ficar de fora (×)], [Comece o toque na corda certa: 4ª corda no D, 5ª no C e no Am]),
    ([Dor na ponta dos dedos], [Normal no começo, enquanto os calos se formam], [Faça sessões curtas e frequentes e descanse quando doer]),
    ([Troca de acorde lenta], [Os dedos se movem um de cada vez], [Mova *todos os dedos juntos*, visualizando o desenho do próximo acorde]),
  ),
  columns: (1.2fr, 1.4fr, 1.6fr),
  alinhamento: (left + horizon, left + horizon, left + horizon),
)

== 4. Trocas de acorde

A troca é o maior desafio do início. Duas técnicas aceleram muito o aprendizado:

- *Dedo-âncora:* se um dedo está no mesmo lugar nos dois acordes, *não o tire da corda* durante a troca. Ele serve de guia para os outros.
- *Movimento em bloco:* quando não há âncora, levante todos os dedos juntos, já no formato do próximo acorde, e pouse-os ao mesmo tempo.

#grid(
  columns: (auto, auto, auto, 1fr),
  column-gutter: 1em,
  align: (center + horizon, center + horizon, center + horizon, left + horizon),
  box(chord("x,0,2,2,1,0", name: "Am")),
  text(size: 20pt, fill: color-muted)[↔],
  box(chord("x,3,2,0,1,0", name: "C")),
  [
    *Exemplo — Am ↔ C:* os dedos 1 (2ª corda, casa 1) e 2 (4ª corda, casa 2) *ficam parados*. Só o dedo 3 se move: da 3ª corda, casa 2 (Am), para a 5ª corda, casa 3 (C).
  ],
)

#block(breakable: false, tabela(
  ([*Troca*], [*Como fazer*], [*Dificuldade*]),
  (
    ([Am ↔ C], [Dedos 1 e 2 ficam; só o dedo 3 muda de corda.], [Fácil]),
    ([Am ↔ E], [O desenho é o mesmo: os três dedos mudam juntos uma corda, em direção às cordas graves (Am → E) ou às agudas (E → Am).], [Fácil]),
    ([Em ↔ Am], [Dedos 2 e 3 descem juntos uma corda (5ª e 4ª → 4ª e 3ª); acrescente o dedo 1 na 2ª corda, casa 1.], [Fácil]),
    ([Em ↔ G], [O dedo 2 fica na 5ª corda, casa 2; o dedo 3 vai para a 6ª corda e o 4 para a 1ª, ambos na casa 3.], [Média]),
    ([A ↔ D], [Movimento em bloco: os três dedos mudam ao mesmo tempo.], [Média]),
    ([C ↔ G], [Movimento em bloco; visualize o desenho de destino antes de levantar os dedos.], [Difícil]),
  ),
  columns: (0.9fr, 3.6fr, 1fr),
  alinhamento: (center + horizon, left + horizon, center + horizon),
))

#caixa(tipo: "dica", titulo: "Como treinar")[
  Não tente aprender os sete acordes de uma vez. Siga as etapas: *1)* Em, Am e C; *2)* acrescente G e D; *3)* acrescente E e A. Treine cada troca em ciclo, sem ritmo, até sair limpa; depois use o metrônomo a 50 BPM, um acorde a cada 4 cliques, e suba 5 BPM quando a troca estiver sem pausas.
]

== 5. Exercícios

#ex(titulo: "Lendo o diagrama", nivel: "Escrita")[
  Observe o diagrama do acorde *D (Ré maior)* na seção 2 e responda.

  a) Quais cordas *não* devem ser tocadas? \
  b) Qual dedo pressiona a 2ª corda e em qual casa? \
  c) Qual corda soa solta?

  #linhas-resposta(3)
]

#ex(titulo: "Que acorde é este?", nivel: "Escrita")[
  Escreva o nome (cifra) de cada acorde abaixo.

  #v(0.3em)
  #grid-acordes(
    chord: chord,
    columns: 4,
    gutter: 2em,
    (
      (tabs: "x,0,2,2,2,0", nome: " ", titulo: "a) ______"),
      (tabs: "3,2,0,0,0,3", nome: " ", titulo: "b) ______"),
      (tabs: "0,2,2,0,0,0", nome: " ", titulo: "c) ______"),
      (tabs: "x,0,2,2,1,0", nome: " ", titulo: "d) ______"),
    ),
  )
]

#ex(titulo: "As notas do acorde", nivel: "Escrita")[
  Escreva a nota que soa em cada corda nos acordes Em e C (× = não tocar). Use as notas das cordas soltas (E A D G B E) e conte as casas: cada casa sobe um semitom.

  #v(0.3em)
  #tabela-preencher(
    ([*Acorde*], [*6ª*], [*5ª*], [*4ª*], [*3ª*], [*2ª*], [*1ª*]),
    (
      ([Em (0,2,2,0,0,0)], none, none, none, none, none, none),
      ([C (×,3,2,0,1,0)], [×], none, none, none, none, none),
    ),
    columns: (1.8fr,) + (1fr,) * 6,
  )
]

#ex(titulo: "Monte a digitação", nivel: "Escrita")[
  Sem olhar a seção 2, complete a digitação do acorde *G (Sol maior)*.

  #v(0.3em)
  #tabela-preencher(
    ([*Dedo*], [*Corda*], [*Casa*]),
    (
      ([2], none, none),
      ([3], none, none),
      ([4], none, none),
    ),
    columns: (1fr, 1fr, 1fr),
    width: 60%,
  )
]

#ex(titulo: "Diagnóstico", nivel: "Escrita")[
  Para cada situação, escreva a causa provável e como corrigir.

  a) No acorde Am, a 1ª corda (solta) não soa. \
  b) No acorde D, o som fica "embolado" e grave demais. \
  c) A nota da 2ª corda no C sai com chiado.

  #linhas-resposta(3)
]

#ex(titulo: "Trocas cronometradas", nivel: "Prática")[
  Durante 1 minuto, troque entre os acordes indicados, tocando uma vez todas as cordas de cada acorde. Conte quantas trocas *limpas* você fez e anote. Repita em outro momento e compare.

  #v(0.3em)
  #tabela-preencher(
    ([*Troca*], [*Am ↔ C*], [*Em ↔ G*], [*A ↔ D*], [*C ↔ G*]),
    (([Trocas em 1 min], none, none, none, none),),
    columns: (1.4fr, 1fr, 1fr, 1fr, 1fr),
  )
]

=== Sugestão de prática

#block(breakable: false, rotina-estudo((
  ([Montar cada acorde e tocar corda por corda, conferindo se todas soam], [5 min], [—]),
  ([Troca Am ↔ C com dedo-âncora, um acorde a cada 4 cliques], [3 min], [50–70]),
  ([Troca Em ↔ G e Am ↔ E], [3 min], [50–70]),
  ([Trocas em bloco A ↔ D e C ↔ G], [4 min], [50–60]),
  ([Sequência Em – C – G – D, um acorde a cada 4 cliques], [5 min], [50–70]),
)))

#v(0.6em)

#checklist(
  (
    [Leio um diagrama de acorde: cordas, casas, dedos, ○ e ×.],
    [Monto os sete acordes de memória, com todas as cordas soando limpas.],
    [Toco só as cordas certas em D, C, Am e A.],
    [Uso dedos-âncora nas trocas Am ↔ C e Em ↔ G.],
    [Toco a sequência Em – C – G – D a 60 BPM sem pausas nas trocas.],
  ),
  titulo: "Autoavaliação",
)

#gabarito[
  #resposta(1)[a) A 6ª e a 5ª cordas. · b) O dedo 3, na casa 3. · c) A 4ª corda (Ré).]
  #resposta(2)[a) A (Lá maior) · b) G (Sol maior) · c) Em (Mi menor) · d) Am (Lá menor).]
  #resposta(3)[
    *Em:* E – B – E – G – B – E (Mi, Si, Mi, Sol, Si, Mi). \
    *C:* × – C – E – G – C – E (Dó, Mi, Sol, Dó, Mi).
  ]
  #resposta(4)[Dedo 2: 5ª corda, casa 2 · dedo 3: 6ª corda, casa 3 · dedo 4: 1ª corda, casa 3.]
  #resposta(5)[
    a) A "barriga" do dedo 1 (ou de outro dedo) encosta na 1ª corda: curve mais os dedos e use a ponta. \
    b) A mão direita está tocando a 6ª e/ou a 5ª corda: comece o toque na 4ª corda. \
    c) Dedo 1 longe do traste ou com pouca pressão: aproxime-o do traste da casa 1 e pressione com a ponta.
  ]
  #resposta(6)[Exercício prático — referência: 20 trocas limpas por minuto em Am ↔ C e Em ↔ G já é um bom resultado; em A ↔ D e C ↔ G, 12 a 15.]
]
