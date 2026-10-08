#import "/templates/layout.typ": *
#import "/templates/components.typ": *
#import "/templates/components.typ": caixa as caixa-modelo
#import "@preview/conchord:0.4.0": new-chordgen

#show: aula.with(
  instrumento: "Guitarra",
  nivel: "Iniciante",
)

#let chord = new-chordgen(number-to-left: true, use-shadow-barre: false, colors: (hold: black, barre: black))
#show <chord>: set text(fill: color-strong, weight: "bold")

// Texto de tabelas em 9,5pt (corpo do texto continua em 11pt)
#show table: set text(size: 9.5pt)

// Caixas com texto em 10pt (rótulo e corpo no mesmo tamanho)
#let caixa(..args) = {
  set text(size: 10pt)
  caixa-modelo(..args)
}

// Exercício que não se divide entre páginas (enunciado + área de resposta juntos)
#let ex(..args) = block(breakable: false, exercicio(..args))

= Primeiros Passos

Antes de tocar qualquer música, dois hábitos precisam nascer junto com você: *boa postura* e *o mínimo de força necessário*. A guitarra elétrica tem cordas mais finas e macias que as do violão, mas os vícios de postura se formam rápido — e são eles que causam dor, cansaço e lesões. Neste material você vai aprender a segurar a guitarra e a palheta, a pressionar as cordas do jeito certo e a tocar seus primeiros _power chords_ com _palm mute_.

#objetivos((
  [Sentar e ficar em pé com a guitarra numa posição confortável e segura],
  [Segurar a palheta corretamente e palhetar a partir do pulso],
  [Pressionar as cordas com a ponta dos dedos, logo atrás do traste, sem força excessiva],
  [Montar _power chords_ com tônica na 6ª e na 5ª corda],
  [Usar o _palm mute_ e tocar um riff completo com metrônomo],
))

== 1. Postura

#cartoes-info((
  (
    titulo: "Sentado",
    corpo: [
      - Sente-se na ponta da cadeira, com as costas retas e os pés apoiados no chão.
      - Apoie a cintura da guitarra na perna direita (para destros) e encoste o corpo do instrumento no tronco.
      - Mantenha o braço da guitarra levemente inclinado para cima, nunca caído.
    ],
  ),
  (
    titulo: "Em pé",
    corpo: [
      - Use sempre uma correia, ajustada para que a guitarra fique na mesma altura de quando você toca sentado.
      - Guitarra muito baixa força o pulso esquerdo a dobrar demais.
      - Distribua o peso nos dois pés e mantenha os ombros soltos.
    ],
  ),
))

#caixa(tipo: "atencao")[
  Dor não é sinal de progresso. Se sentir dor no pulso, no antebraço ou nas costas, pare, relaxe e revise a postura. Pausas curtas a cada 20–30 minutos de estudo previnem lesões.
]

== 2. A palheta

Segure a palheta entre o *polegar* e a *lateral do indicador*, deixando aparecer apenas uma pequena ponta. O movimento de ataque parte do *pulso*, como quem sacode água da mão — não do cotovelo nem do antebraço.

#block(breakable: false, comparativo(
  [
    Polegar sobre a lateral do indicador. \
    Ponta curta aparecendo (2–3 mm). \
    Pulso *relaxado*; o movimento vem do pulso.
  ],
  [
    Palheta apertada com força. \
    Muita ponta exposta: a palheta "engancha" na corda. \
    Pulso rígido; o braço inteiro se mexe.
  ],
))

=== Direção da palhetada

- *Palhetada para baixo* (↓): da corda mais grave em direção à mais aguda, ou seja, em direção ao chão.
- *Palhetada para cima* (↑): o movimento de volta.
- *Palhetada alternada*: ↓ ↑ ↓ ↑… sem repetir a direção. É a base para tocar notas rápidas com economia.

#caixa(tipo: "dica", titulo: "Espessura da palheta")[
  Palhetas finas (até 0,6 mm) são flexíveis e boas para acordes "varridos"; médias (0,7–0,9 mm) são versáteis; grossas (1 mm ou mais) dão mais controle para riffs e solos. Para começar na guitarra elétrica, uma palheta média é uma ótima escolha.
]

== 3. Mão esquerda: pressão e postura

Pressione a corda *logo atrás do traste* (o filete de metal), usando a *ponta dos dedos* — nunca a "barriga" do dedo, que esbarra nas cordas vizinhas. O polegar fica atrás do braço, mais ou menos na altura do dedo médio, como um ponto de apoio, e não como um alicate.

#caixa(tipo: "neutro", titulo: "Teste da nota limpa")[
  Pressione qualquer corda e toque devagar. Se ouvir um chiado metálico (*trastejamento*), aproxime o dedo do traste ou aumente levemente a pressão. Se as cordas vizinhas ficarem abafadas sem querer, curve mais o dedo.
]

=== Curvatura em formato de "C"

A mão esquerda deve ficar arredondada, como se segurasse uma bola pequena. A palma *não* encosta no braço na maior parte do tempo. Essa curvatura faz a força vir das articulações dos dedos, e não de um aperto da mão inteira, e deixa espaço livre para as outras cordas vibrarem.

=== Economia de movimento

Mantenha os dedos que não estão tocando *perto da escala*. Se, ao levantar um dedo, você o afasta vários centímetros da corda (o famoso "dedo voador"), perde tempo para recolocá-lo e gasta energia à toa.

=== Aquecimento cromático 1-2-3-4

Este é o exercício clássico para coordenar as duas mãos. Use *um dedo por casa*: dedo 1 (indicador) na 5ª casa, dedo 2 (médio) na 6ª, dedo 3 (anelar) na 7ª e dedo 4 (mínimo) na 8ª. Toque com palhetada alternada (↓ ↑ ↓ ↑), uma nota por clique do metrônomo, da 6ª corda até a 1ª.

#tab(
  titulo: "Aquecimento cromático (casas 5 a 8)",
  legenda: [Dedos: 1 – 2 – 3 – 4 em todas as cordas. Mantenha cada dedo apoiado até precisar dele em outra corda.],
  "e|-----------------------------------------5-6-7-8-|\nB|---------------------------------5-6-7-8---------|\nG|-------------------------5-6-7-8-----------------|\nD|-----------------5-6-7-8-------------------------|\nA|---------5-6-7-8---------------------------------|\nE|-5-6-7-8-----------------------------------------|",
)

== 4. Power chords

O *power chord* é o acorde do rock. Ele usa apenas *duas notas*: a *tônica* (a nota que dá nome ao acorde) e a *quinta* (a nota que fica 7 semitons — 7 casas — acima dela). Como não tem a terça, a nota que define se um acorde é maior ou menor, o power chord *não é maior nem menor*. Na cifra, ele é indicado pelo número *5*: E5, A5, G5…

Por ter só tônica e quinta, ele soa limpo e "pesado" mesmo com muita distorção — por isso é a base de riffs de rock, punk e metal.

=== Com cordas soltas

#grid-acordes(
  chord: chord,
  columns: 3,
  gutter: 3em,
  (
    (tabs: "0,2,2,x,x,x", nome: "E5", titulo: "Mi5", detalhe: "Tônica: 6ª corda solta · dedos 1 e 2"),
    (tabs: "x,0,2,2,x,x", nome: "A5", titulo: "Lá5", detalhe: "Tônica: 5ª corda solta · dedos 1 e 2"),
    (tabs: "x,x,0,2,x,x", nome: "D5", titulo: "Ré5", detalhe: "Tônica: 4ª corda solta · dedo 1"),
  ),
)

=== Shapes móveis

Sem cordas soltas, o mesmo desenho pode ser arrastado para qualquer casa: a casa da tônica dá o nome ao acorde. Use o *dedo 1* na tônica e o *dedo 3* na quinta (duas casas acima, na corda seguinte). Se quiser um som mais cheio, acrescente a *oitava* (a tônica repetida, mais aguda) com o *dedo 4*.

#grid-acordes(
  chord: chord,
  columns: 4,
  gutter: 1.8em,
  (
    (tabs: "3,5,x,x,x,x", nome: "G5", titulo: "Sol5", detalhe: "Tônica na 6ª corda, 3ª casa"),
    (tabs: "3,5,5,x,x,x", nome: "G5", titulo: "Sol5 com oitava", detalhe: "Dedos 1, 3 e 4"),
    (tabs: "x,3,5,x,x,x", nome: "C5", titulo: "Dó5", detalhe: "Tônica na 5ª corda, 3ª casa"),
    (tabs: "x,3,5,5,x,x", nome: "C5", titulo: "Dó5 com oitava", detalhe: "Dedos 1, 3 e 4"),
  ),
)

#block(breakable: false)[
Para achar qualquer power chord, basta saber onde estão as notas naturais nas duas cordas mais graves:

#tabela(
  columns: (1.5fr,) + (1fr,) * 8,
  ([Casa], [0], [1], [2], [3], [5], [7], [8], [10]),
  (
    ([*6ª corda (Mi)*], [E], [F], [—], [G], [A], [B], [C], [D]),
    ([*5ª corda (Lá)*], [A], [—], [B], [C], [D], [E], [F], [G]),
  ),
)
]

#caixa(tipo: "dica", titulo: "Só as cordas certas")[
  Toque apenas as cordas do acorde. Encoste levemente a ponta do dedo 1 na corda de baixo (mais aguda) e a lateral dos dedos nas demais para abafá-las: assim, mesmo que a palheta esbarre, só o power chord soa.
]

== 5. Palm mute

O *palm mute* (abafamento com a palma) cria o som percussivo e "fechado" típico do rock e do metal. A lateral da mão direita — a parte carnuda abaixo do dedo mínimo — repousa *levemente* sobre as cordas, bem perto da ponte, enquanto você palheta.

#cartoes-info((
  (titulo: "Mão sobre a ponte", corpo: align(center)[Abafamento leve: \ som mais *aberto* e brilhante.]),
  (titulo: "Mão mais longe da ponte", corpo: align(center)[Abafamento forte: \ som mais *fechado* e percussivo.]),
))

O contato deve ser *muito leve*: a corda ainda precisa vibrar e a nota tem que ser reconhecível. Se o som sumir por completo, a mão está pesada ou longe demais da ponte. Na tablatura, o palm mute aparece como *P.M.* acima das notas, com um traço mostrando até onde ele vale (P.M.---|).

== 6. Juntando tudo: riff com palm mute

Progressão *E5 – G5 – A5 – G5*, um acorde por compasso, quatro palhetadas para baixo em cada um (uma por tempo). Use palm mute nos *tempos 1 e 2* e solte a mão nos *tempos 3 e 4* — o contraste entre som fechado e aberto é o que dá "peso" ao riff. Comece com o metrônomo em *60 BPM*: limpeza primeiro, velocidade depois.

#tab(
  titulo: "Riff E5 – G5 – A5 – G5",
  legenda: [Cada compasso tem 4 tempos; cada número é uma palhetada para baixo (↓), uma por tempo.],
  "    E5                G5                A5                G5\n    P.M.-|            P.M.-|            P.M.-|            P.M.-|\ne|-----------------|-----------------|-----------------|-----------------|\nB|-----------------|-----------------|-----------------|-----------------|\nG|-----------------|-----------------|-----------------|-----------------|\nD|-----------------|-----------------|-----------------|-----------------|\nA|--2---2---2---2--|--5---5---5---5--|--7---7---7---7--|--5---5---5---5--|\nE|--0---0---0---0--|--3---3---3---3--|--5---5---5---5--|--3---3---3---3--|",
)

== 7. Exercícios

#ex(titulo: "Revisando a técnica")[
  Responda com suas palavras:

  a) De onde deve partir o movimento da palhetada?

  #linhas-resposta(1)

  b) Onde o dedo deve pressionar a corda para a nota soar limpa, com pouca força?

  #linhas-resposta(1)

  c) Você ouve um chiado metálico ao tocar uma nota. Cite duas correções possíveis.

  #linhas-resposta(2)
]

#ex(titulo: "O que é um power chord?")[
  Quais são as duas notas de um power chord? Por que ele não é considerado maior nem menor?

  #linhas-resposta(3)
]

#ex(titulo: "Encontre os power chords")[
  Use a tabela de notas da seção 4. Para cada acorde, escolha a corda da tônica indicada e escreva a casa da tônica e a casa da quinta (na corda seguinte, mais aguda).

  #tabela-preencher(
    columns: (1fr, 1.4fr, 1.4fr, 1.4fr),
    ([Acorde], [Tônica na…], [Casa da tônica], [Casa da quinta]),
    (
      ([A5], [6ª corda], none, none),
      ([C5], [6ª corda], none, none),
      ([D5], [5ª corda], none, none),
      ([F5], [6ª corda], none, none),
      ([E5], [5ª corda], none, none),
      ([G5], [5ª corda], none, none),
    ),
  )
]

#ex(titulo: "Escreva a tablatura")[
  Escreva em tablatura a progressão *A5 – C5 – D5 – C5* com a tônica na 6ª corda, quatro palhetadas por acorde (um acorde por compasso).

  #tab-vazia(sistemas: 1, compassos: 4, altura-linha: 11pt)
]

#ex(titulo: "Aquecimento com metrônomo", nivel: "Prática")[
  Toque o aquecimento cromático 1-2-3-4 da seção 3 com o metrônomo em 60 BPM, uma nota por clique, ida (6ª → 1ª corda) e volta (1ª → 6ª). Só aumente 5 BPM quando conseguir tocar três vezes seguidas sem nenhum ruído. Anote o andamento que você alcançou:

  #linhas-resposta(1)
]

#ex(titulo: "Riff com palm mute", nivel: "Prática")[
  Toque o riff da seção 6 quatro vezes seguidas, sem parar, a 60 BPM. Depois grave-se (pode ser com o celular) e confira: o palm mute aparece só nos tempos 1 e 2? As trocas de acorde caem no tempo certo? Anote o que precisa melhorar:

  #linhas-resposta(2)
]

=== Sugestão de prática

#rotina-estudo((
  ([Conferir a postura (sentado ou em pé) e a pegada da palheta], [2 min], [—]),
  ([Aquecimento cromático 1-2-3-4, palhetada alternada], [5 min], [60–80]),
  ([Power chords: G5 → C5 → D5 → A5, um acorde a cada 4 tempos], [5 min], [60–70]),
  ([Palm mute numa só corda: 4 notas abafadas + 4 abertas], [3 min], [60–80]),
  ([Riff E5 – G5 – A5 – G5 com palm mute nos tempos 1 e 2], [5 min], [60–80]),
))

#block(breakable: false, checklist(
  titulo: "Autoavaliação",
  (
    [Toco sentado e em pé sem dor e com o braço da guitarra inclinado para cima.],
    [Seguro a palheta com pouca ponta e o movimento vem do pulso.],
    [Minhas notas soam limpas, com a ponta do dedo logo atrás do traste.],
    [Monto power chords com tônica na 6ª e na 5ª corda, abafando as outras cordas.],
    [Toco o riff com palm mute a 60 BPM sem perder o tempo.],
  ),
))

#gabarito[
  #resposta(1)[a) Do pulso, relaxado — não do cotovelo nem do antebraço. b) Com a ponta do dedo, logo atrás do traste (o filete de metal à frente da casa). c) Aproximar o dedo do traste; aumentar levemente a pressão; usar a ponta do dedo (e não a "barriga").]
  #resposta(2)[A tônica e a quinta (7 semitons acima da tônica). Ele não é maior nem menor porque não tem a terça, a nota que define essa qualidade.]
  #resposta(3)[
    #tabela(
      columns: (1fr, 1.4fr, 1.4fr, 1.4fr),
      ([Acorde], [Tônica na…], [Casa da tônica], [Casa da quinta]),
      (
        ([A5], [6ª corda], [5], [7 (5ª corda)]),
        ([C5], [6ª corda], [8], [10 (5ª corda)]),
        ([D5], [5ª corda], [5], [7 (4ª corda)]),
        ([F5], [6ª corda], [1], [3 (5ª corda)]),
        ([E5], [5ª corda], [7], [9 (4ª corda)]),
        ([G5], [5ª corda], [10], [12 (4ª corda)]),
      ),
    )
  ]
  #resposta(4)[
    #tab(
      "    A5                C5                D5                C5\ne|-----------------|-----------------|-----------------|-----------------|\nB|-----------------|-----------------|-----------------|-----------------|\nG|-----------------|-----------------|-----------------|-----------------|\nD|-----------------|-----------------|-----------------|-----------------|\nA|--7---7---7---7--|--10--10--10--10-|--12--12--12--12-|--10--10--10--10-|\nE|--5---5---5---5--|--8---8---8---8--|--10--10--10--10-|--8---8---8---8--|",
    )
  ]
  #resposta(5)[Exercício prático — critério de sucesso: três repetições seguidas, ida e volta, sem trastejar, com palhetada alternada e sem perder o clique do metrônomo.]
  #resposta(6)[Exercício prático — critério de sucesso: quatro voltas seguidas a 60 BPM, contraste claro entre tempos 1–2 (abafados) e 3–4 (abertos), trocas de acorde sem atraso e nenhuma corda indesejada soando.]
]
