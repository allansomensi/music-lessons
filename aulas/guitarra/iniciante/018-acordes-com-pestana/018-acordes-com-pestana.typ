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

// Lista numerada que pode continuar na página seguinte
#let passos-q(itens) = {
  set block(breakable: true)
  passos(itens)
}

// ============================================================
// HELPER LOCAL — intervalos de um acorde no braço
// ============================================================
// Recebe a tab do acorde (6ª → 1ª, "x" = abafada), a classe de
// altura da tônica (0 = C) e a janela de casas; devolve as linhas
// de `braco-notas` com o intervalo de cada nota calculado.

#let afinacao = (4, 9, 2, 7, 11, 4) // 6ª, 5ª, 4ª, 3ª, 2ª, 1ª corda
#let nomes-int = ("0": "T", "3": "b3", "4": "3", "7": "5", "10": "b7", "11": "7M")
#let intervalos-acorde(tabs, raiz, fs, fe) = {
  let casas = tabs.split(",")
  range(6).map(i => range(fs, fe + 1).map(f => {
    if casas.at(i) == "x" or int(casas.at(i)) != f { "" } else {
      let iv = calc.rem(afinacao.at(i) + f - raiz + 24, 12)
      nomes-int.at(str(iv), default: "?")
    }
  }))
}

#let legenda(body) = align(center, text(size: 8.5pt, fill: color-muted, body))

= Acordes com Pestana

A *pestana* é o grande divisor de águas do guitarrista iniciante. Com ela, os acordes abertos — aqueles tocados perto da cabeça da guitarra, com cordas soltas, como E e A — se transformam em *shapes móveis*: um único desenho de mão passa a tocar qualquer acorde maior, menor ou com sétima, em qualquer tom. Ela exige técnica e paciência no começo — mas, feita do jeito certo, deixa de ser esforço e vira hábito. Nesta aula você vai aprender a técnica correta, os dois shapes principais e um plano de treino para chegar ao famoso F completo sem dor.

#objetivos((
  [Executar a pestana com a técnica correta (lado do indicador, polegar e cotovelo) e diagnosticar erros],
  [Montar os shapes E (tônica na 6ª corda) e A (tônica na 5ª) para acordes maiores, menores, 7, m7 e 7M],
  [Encontrar a casa da pestana para qualquer tônica e escolher a posição mais próxima],
  [Tocar progressões reais trocando entre acordes com pestana],
  [Seguir um plano progressivo de treino, da mini-pestana ao F completo],
))

== 1. O que é a pestana

Um acorde aberto só funciona porque o *nut* (a pestana fixa da guitarra) "segura" as cordas soltas. Na pestana, o *dedo indicador faz o papel do nut*: ele pressiona várias cordas na mesma casa, enquanto os outros três dedos montam o desenho de um acorde aberto conhecido.

Como o desenho inteiro pode deslizar pelo braço, cada casa produz um acorde diferente. É por isso que bastam *dois shapes* — derivados dos acordes abertos de E e de A — para tocar os acordes de todos os tons.

== 2. A técnica

#passos-q((
  [*Use o lado do indicador.* Gire levemente o dedo para que a pressão fique na *lateral óssea* (voltada para a cabeça da guitarra), e não na parte macia e cheia de dobras da face do dedo.],
  [*Fique colado ao traste.* O indicador deve ficar logo atrás do traste, não no meio da casa. Quanto mais perto, menos força é necessária.],
  [*Polegar atrás do braço.* Posicione o polegar na parte de trás do braço, mais ou menos atrás do dedo médio e na altura do meio do braço — *não* por cima, como nos acordes abertos.],
  [*Use o peso do braço, não o aperto.* Deixe o cotovelo relaxado e próximo ao corpo e "puxe" levemente o braço para trás: o peso do braço faz boa parte da pressão. A mão aperta apenas o necessário.],
  [*Teste corda por corda.* Monte o acorde e toque cada corda separadamente, da 6ª à 1ª. Corrija a que estiver abafada ou trastejando antes de tocar o acorde inteiro.],
))

#v(0.5em)

#comparativo(
  titulo-esquerda: "Correto",
  titulo-direita: "Errado",
  [
    - Indicador reto, levemente girado para a lateral.
    - Indicador colado ao traste.
    - Polegar no meio da parte de trás do braço.
    - Cotovelo relaxado, junto ao corpo.
    - Pressão mínima: as cordas soam limpas sem dor.
  ],
  [
    - Indicador dobrado ou pressionando com a face macia.
    - Indicador no meio da casa, longe do traste.
    - Polegar por cima do braço ou "esmagando" a madeira.
    - Cotovelo aberto, longe do corpo, punho torto.
    - Força exagerada: mão dolorida em poucos minutos.
  ],
)

#v(0.6em)

#tabela(
  columns: (1.3fr, 1.6fr, 2fr),
  alinhamento: left + horizon,
  ([*Sintoma*], [*Causa provável*], [*Solução*]),
  (
    ([Uma corda soa abafada], [A corda caiu numa dobra do indicador], [Suba ou desça o indicador alguns milímetros e gire-o para a lateral]),
    ([Corda trastejando (zumbido)], [Pressão fraca ou dedo longe do traste], [Aproxime o dedo do traste e use o peso do braço]),
    ([Corda abafada por outro dedo], [Dedos deitados encostando nas cordas vizinhas], [Arqueie os dedos e toque com a ponta]),
    ([Dor no polegar ou no punho], [Aperto excessivo, punho muito dobrado], [Relaxe, alinhe o punho e faça pausas curtas]),
  ),
)

#v(0.4em)

#caixa(tipo: "atencao")[
  Dor muscular leve é normal no início; *dor aguda ou formigamento não*. Treine pestana em blocos de poucos minutos, com pausas, ao longo do dia. A força certa se desenvolve aos poucos, com repetição, não numa tarde.
]

== 3. Shape E — tônica na 6ª corda

O shape E é o acorde aberto de *E (Mi maior)* tocado com os dedos 2, 3 e 4, com o indicador fazendo a pestana. A *tônica está na 6ª corda* (e se repete na 4ª e na 1ª): a casa da pestana é a casa da tônica na 6ª corda. Na casa 1, a tônica é Fá — por isso o primeiro exemplo é *F*.

Os tipos de acorde usados aqui são: *maior* (T – 3 – 5), *menor* ou *m* (T – b3 – 5), *7* (maior com a sétima menor, b7), *m7* (menor com b7) e *7M* (maior com a sétima maior, 7M). Nos diagramas, *T* é a tônica e os números indicam o intervalo de cada nota em relação a ela.

#v(0.3em)

#align(center, grid(
  columns: (auto, 1fr),
  column-gutter: 1.5em,
  align: horizon,
  braco-notas(intervalos-acorde("1,3,3,2,1,1", 5, 1, 4), fs: 1),
  align(left)[
    #set text(size: 9.5pt)
    *F — intervalos do shape E maior* \
    Tônica (T) na 6ª, 4ª e 1ª cordas; *3* na 3ª corda; *5* na 5ª e na 2ª. \
    #v(0.3em)
    Para mudar o tipo do acorde, você mexe apenas nas notas *3* e *T* da 4ª corda: é isso que diferencia os desenhos abaixo.
  ],
))

#v(0.4em)

#grid-acordes(
  chord: chord,
  columns: 5,
  gutter: 1.2em,
  (
    (tabs: "1,3,3,2,1,1", nome: " ", titulo: "F", detalhe: "T 5 T 3 5 T"),
    (tabs: "1,3,3,1,1,1", nome: " ", titulo: "Fm", detalhe: "T 5 T b3 5 T"),
    (tabs: "1,3,1,2,1,1", nome: " ", titulo: "F7", detalhe: "T 5 b7 3 5 T"),
    (tabs: "1,3,1,1,1,1", nome: " ", titulo: "Fm7", detalhe: "T 5 b7 b3 5 T"),
    (tabs: "1,x,2,2,1,x,*", nome: " ", titulo: "F7M", detalhe: "T · 7M 3 5 ·"),
  ),
)

#legenda[Intervalos listados da 6ª para a 1ª corda. No F7M, a 5ª e a 1ª cordas ficam abafadas (sem pestana).]

== 4. Shape A — tônica na 5ª corda

O shape A vem do acorde aberto de *A (Lá maior)*. A *tônica está na 5ª corda* (e se repete na 3ª): a casa da pestana é a casa da tônica na 5ª corda. A 6ª corda *não é tocada* — encoste a ponta do indicador nela para abafá-la. Na casa 1, a tônica é Si bemol: o primeiro exemplo é *Bb*.

#v(0.3em)

#align(center, grid(
  columns: (auto, 1fr),
  column-gutter: 1.5em,
  align: horizon,
  braco-notas(intervalos-acorde("x,1,3,3,3,1", 10, 1, 4), fs: 1),
  align(left)[
    #set text(size: 9.5pt)
    *Bb — intervalos do shape A maior* \
    Tônica (T) na 5ª e na 3ª cordas; *3* na 2ª corda; *5* na 4ª e na 1ª. \
    #v(0.3em)
    No shape A maior é comum fazer as três notas da casa 3 com uma *pestana do anelar*. Se a 1ª corda abafar, tudo bem: o acorde continua completo sem ela.
  ],
))

#v(0.4em)

#grid-acordes(
  chord: chord,
  columns: 5,
  gutter: 1.2em,
  (
    (tabs: "x,1,3,3,3,1", nome: " ", titulo: "Bb", detalhe: "· T 5 T 3 5"),
    (tabs: "x,1,3,3,2,1", nome: " ", titulo: "Bbm", detalhe: "· T 5 T b3 5"),
    (tabs: "x,1,3,1,3,1", nome: " ", titulo: "Bb7", detalhe: "· T 5 b7 3 5"),
    (tabs: "x,1,3,1,2,1", nome: " ", titulo: "Bbm7", detalhe: "· T 5 b7 b3 5"),
    (tabs: "x,1,3,2,3,1", nome: " ", titulo: "Bb7M", detalhe: "· T 5 7M 3 5"),
  ),
)

#legenda[Intervalos listados da 6ª para a 1ª corda ("·" = corda não tocada).]

== 5. O que muda de um tipo para outro

Compare os desenhos: cada tipo de acorde é o shape maior com *uma ou duas notas alteradas*. Entender isso é muito mais útil do que decorar dez desenhos soltos.

#v(0.3em)

#tabela(
  columns: (0.8fr, 1.4fr, 2fr, 2fr),
  ([*Tipo*], [*Alteração*], [*Shape E (tônica na 6ª)*], [*Shape A (tônica na 5ª)*]),
  (
    ([m], [3 desce para b3], [3ª corda: 1 casa para trás], [2ª corda: 1 casa para trás]),
    ([7], [T (oitava) desce para b7], [4ª corda: 2 casas para trás], [3ª corda: 2 casas para trás]),
    ([m7], [as duas alterações], [3ª e 4ª cordas na pestana], [3ª corda na pestana, 2ª 1 casa atrás]),
    ([7M], [T (oitava) desce para 7M], [4ª corda: 1 casa para trás \ (5ª e 1ª abafadas)], [3ª corda: 1 casa para trás]),
  ),
)

== 6. Em que casa fica cada acorde?

A casa da pestana é a casa onde está a *tônica* — na 6ª corda para o shape E, na 5ª corda para o shape A. Use a tabela como referência enquanto as notas das cordas graves ainda não estão automáticas:

#v(0.3em)

#let enarm(a, b) = [#a / #b]
#tabela(
  columns: (1.4fr, 1fr, 1fr, 1.4fr, 1fr, 1fr),
  ([*Tônica*], [*Shape E*], [*Shape A*], [*Tônica*], [*Shape E*], [*Shape A*]),
  (
    ([C], [8], [3], [F\# / Gb], [2], [9]),
    ([C\# / Db], [9], [4], [G], [3], [10]),
    ([D], [10], [5], [G\# / Ab], [4], [11]),
    ([D\# / Eb], [11], [6], [A], [5], [0 / 12]),
    ([E], [0 / 12], [7], [A\# / Bb], [6], [1]),
    ([F], [1], [8], [B], [7], [2]),
  ),
)

#legenda[Casa 0 = acorde aberto (sem pestana); a casa 12 repete a casa 0.]

== 7. Escolhendo a pestana mais próxima

Todo acorde tem pelo menos duas posições com pestana. Repare na tabela: para a mesma tônica, *o shape A fica 5 casas abaixo do shape E* (ou 7 casas acima). Exemplo: C está na casa 8 (shape E) e na casa 3 (shape A).

Ao tocar uma progressão, escolha para cada acorde a posição *mais próxima do acorde anterior*. A mão quase não se desloca, as trocas ficam mais rápidas e o som fica mais coeso. Na prática, alternar entre os shapes E e A permite tocar quase qualquer progressão dentro de uma região de 4 ou 5 casas.

#caixa(tipo: "dica")[
  *Regra prática:* se a tônica do próximo acorde estiver na 6ª corda perto da sua mão, use o shape E; se estiver mais perto na 5ª corda, use o shape A. Antes de tocar, *planeje as posições* da progressão inteira.
]

== 8. Progressões práticas

Toque cada progressão com *quatro batidas para baixo por acorde* (semínimas), a 60 BPM, e só suba o andamento quando todas as cordas soarem limpas na troca. Observe como todos os acordes ficam numa mesma região do braço.

=== Progressão 1 — tom de F: F – Dm – Bb – C (I – VIm – IV – V)

#grid-acordes(
  chord: chord,
  columns: 4,
  (
    (tabs: "1,3,3,2,1,1", nome: " ", titulo: "F", detalhe: "shape E, casa 1"),
    (tabs: "x,5,7,7,6,5", nome: " ", titulo: "Dm", detalhe: "shape A, casa 5"),
    (tabs: "x,1,3,3,3,1", nome: " ", titulo: "Bb", detalhe: "shape A, casa 1"),
    (tabs: "x,3,5,5,5,3", nome: " ", titulo: "C", detalhe: "shape A, casa 3"),
  ),
)

=== Progressão 2 — tom de D: Bm – G – D – A (VIm – IV – I – V)

#grid-acordes(
  chord: chord,
  columns: 4,
  (
    (tabs: "x,2,4,4,3,2", nome: " ", titulo: "Bm", detalhe: "shape A, casa 2"),
    (tabs: "3,5,5,4,3,3", nome: " ", titulo: "G", detalhe: "shape E, casa 3"),
    (tabs: "x,5,7,7,7,5", nome: " ", titulo: "D", detalhe: "shape A, casa 5"),
    (tabs: "5,7,7,6,5,5", nome: " ", titulo: "A", detalhe: "shape E, casa 5"),
  ),
)

=== Progressão 3 — tom de C com tétrades: C7M – Am7 – Dm7 – G7 (I7M – VIm7 – IIm7 – V7)

#grid-acordes(
  chord: chord,
  columns: 4,
  (
    (tabs: "x,3,5,4,5,3", nome: " ", titulo: "C7M", detalhe: "shape A, casa 3"),
    (tabs: "5,7,5,5,5,5", nome: " ", titulo: "Am7", detalhe: "shape E, casa 5"),
    (tabs: "x,5,7,5,6,5", nome: " ", titulo: "Dm7", detalhe: "shape A, casa 5"),
    (tabs: "3,5,3,4,3,3", nome: " ", titulo: "G7", detalhe: "shape E, casa 3"),
  ),
)

#v(0.4em)

#caixa(tipo: "dica")[
  Na troca, *alivie a pressão sem tirar a mão do braço*, deslize até a nova casa e pressione de novo. O indicador funciona como um trilho: ele não precisa "voar" de um acorde para outro.
]

#pagebreak()

== 9. Estratégia de treino: do F simplificado ao F completo

Ninguém faz um F completo limpo de primeira — e não precisa. Construa a pestana em etapas, avançando só quando a etapa atual soar limpa:

#v(0.3em)

#grid-acordes(
  chord: chord,
  columns: 4,
  (
    (tabs: "x,x,3,2,1,0", nome: " ", titulo: "Etapa 1 — F7M", detalhe: "sem pestana; 1ª corda solta"),
    (tabs: "x,x,3,2,1,1", nome: " ", titulo: "Etapa 2 — F", detalhe: "mini-pestana em 2 cordas"),
    (tabs: "5,7,7,6,5,5", nome: " ", titulo: "Etapa 3 — A", detalhe: "pestana completa na casa 5"),
    (tabs: "1,3,3,2,1,1", nome: " ", titulo: "Etapa 4 — F", detalhe: "pestana completa na casa 1"),
  ),
)

#v(0.4em)

#passos-q((
  [*Etapa 1 — F7M aberto.* Mesmo desenho do F, sem pestana. Treina a posição dos dedos 2, 3 e 4.],
  [*Etapa 2 — mini-pestana.* O indicador cobre só as cordas 2 e 1. É o "F simplificado", ótimo para usar já nas músicas.],
  [*Etapa 3 — pestana completa no meio do braço.* Perto da casa 5 as casas são mais estreitas e as cordas ficam mais baixas: a pestana exige menos força. Toque o shape E na casa 5 (A) e desça casa a casa: 4, 3, 2…],
  [*Etapa 4 — F completo na casa 1.* Agora sim, com a técnica e a força desenvolvidas nas etapas anteriores.],
))

#v(0.4em)

#caixa(tipo: "resumo")[
  *Exercício-chave:* monte a pestana, toque corda por corda, solte a pressão (sem tirar a mão), pressione de novo e repita 10 vezes. Esse "liga e desliga" treina a pressão certa e evita a tensão constante.
]

== 10. Exercícios

#ex(titulo: "Descubra a casa da pestana", nivel: "Escrita")[
  Escreva a casa da pestana de cada acorde no shape E e no shape A (casas de 1 a 11).

  #v(0.3em)
  #tabela-preencher(
    ([*Acorde*], [*Gm*], [*Ab7*], [*Cm7*], [*D7M*], [*Eb*], [*F\#m*]),
    (
      ([Shape E — casa], none, none, none, none, none, none),
      ([Shape A — casa], none, none, none, none, none, none),
    ),
    columns: (2fr,) + (1fr,) * 6,
  )
]

#ex(titulo: "Nomeie o acorde", nivel: "Escrita")[
  Escreva a cifra do acorde formado por cada shape, tipo e casa.

  #v(0.3em)
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1.2em,
    tabela-preencher(
      ([*Shape e tipo*], [*Casa*], [*Cifra*]),
      (
        ([a) E — menor], [7], none),
        ([b) A — maior], [5], none),
        ([c) E — 7], [3], none),
        ([d) A — m7], [2], none),
      ),
      columns: (1.6fr, 0.7fr, 1fr),
    ),
    tabela-preencher(
      ([*Shape e tipo*], [*Casa*], [*Cifra*]),
      (
        ([e) A — 7M], [3], none),
        ([f) E — menor], [10], none),
        ([g) A — 7], [4], none),
        ([h) E — 7M], [8], none),
      ),
      columns: (1.6fr, 0.7fr, 1fr),
    ),
  )
]

#ex(titulo: "Escreva a tab do acorde", nivel: "Escrita")[
  Escreva as casas de cada acorde da 6ª para a 1ª corda (use "x" para corda abafada), como nos diagramas desta aula.

  #v(0.3em)
  #tabela-preencher(
    ([*Acorde*], [*Shape*], [*Casas (6ª → 1ª)*]),
    (
      ([a) G], [E], none),
      ([b) Cm], [A], none),
      ([c) A7], [E], none),
      ([d) Dm7], [A], none),
      ([e) Eb7M], [A], none),
    ),
    columns: (1fr, 1fr, 3fr),
  )
]

#ex(titulo: "A pestana mais próxima", nivel: "Escrita")[
  Na progressão *C – Am – F – G*, o C será tocado no shape A, casa 3. Escolha o shape e a casa dos outros acordes de modo que *todas as pestanas fiquem entre as casas 1 e 5*.

  #v(0.3em)
  #tabela-preencher(
    ([*Acorde*], [*C*], [*Am*], [*F*], [*G*]),
    (
      ([Shape], [A], none, none, none),
      ([Casa], [3], none, none, none),
    ),
    columns: (1.5fr,) + (1fr,) * 4,
  )
]

#ex(titulo: "Transpondo com shapes", nivel: "Escrita")[
  Desloque a Progressão 1 (F – Dm – Bb – C) *duas casas para cima*, mantendo os mesmos shapes. Escreva a cifra e a casa de cada novo acorde. Em que tom ficou a progressão?

  #v(0.3em)
  #tabela-preencher(
    ([*Original*], [*F (E, 1)*], [*Dm (A, 5)*], [*Bb (A, 1)*], [*C (A, 3)*]),
    (([Nova cifra e casa], none, none, none, none),),
    columns: (1.5fr,) + (1fr,) * 4,
  )
  #v(0.2em)
  Tom: #box(width: 4cm, stroke: (bottom: 0.5pt + color-rule-dark))
]

#ex(titulo: "Diagnóstico corda por corda", nivel: "Prática")[
  Monte o F completo (casa 1) e o A no shape E (casa 5). Toque corda por corda e marque ✓ para as cordas que soam limpas. Repita o teste de tempos em tempos e acompanhe a evolução.

  #v(0.3em)
  #tabela-preencher(
    ([*Acorde*], [*6ª*], [*5ª*], [*4ª*], [*3ª*], [*2ª*], [*1ª*]),
    (
      ([A (shape E, casa 5)], none, none, none, none, none, none),
      ([F (shape E, casa 1)], none, none, none, none, none, none),
    ),
    columns: (2fr,) + (1fr,) * 6,
  )
]

#ex(titulo: "Progressões com metrônomo", nivel: "Prática")[
  Toque as três progressões da seção 8 com quatro batidas por acorde, começando a 60 BPM. Suba 5 BPM sempre que conseguir três voltas seguidas com todas as trocas limpas. Meta: *80 BPM*.
]

=== Sugestão de prática

#rotina-estudo((
  ([Liga e desliga da pestana (10×), corda por corda], [3 min], [—]),
  ([Etapas 1 → 4 do plano de treino (até onde soar limpo)], [5 min], [—]),
  ([Shapes E e A: maior, m, 7, m7 e 7M em uma casa escolhida], [5 min], [60]),
  ([Progressões 1, 2 e 3 com quatro batidas por acorde], [7 min], [60 → 80]),
))

#v(0.6em)

#checklist(
  (
    [Faço a pestana com a lateral do indicador, colado ao traste, e com o polegar atrás do braço.],
    [Identifico e corrijo cordas abafadas e trastejando, testando corda por corda.],
    [Monto os shapes E e A nos tipos maior, m, 7, m7 e 7M.],
    [Encontro a casa de qualquer acorde nos dois shapes.],
    [Escolho a posição mais próxima ao tocar uma progressão.],
    [Toco pelo menos uma progressão inteira com pestana a 60 BPM, sem parar.],
  ),
  titulo: "Autoavaliação",
)

#gabarito[
  #resposta(1)[
    Gm: E 3, A 10 · Ab7: E 4, A 11 · Cm7: E 8, A 3 · D7M: E 10, A 5 · Eb: E 11, A 6 · F\#m: E 2, A 9.
  ]
  #resposta(2)[
    a) Bm · b) D · c) G7 · d) Bm7 · e) C7M · f) Dm · g) C\#7 (= Db7) · h) C7M.
  ]
  #resposta(3)[
    a) G: 3 5 5 4 3 3 · b) Cm: x 3 5 5 4 3 · c) A7: 5 7 5 6 5 5 · d) Dm7: x 5 7 5 6 5 · e) Eb7M: x 6 8 7 8 6.
  ]
  #resposta(4)[
    Am: shape E, casa 5 · F: shape E, casa 1 · G: shape E, casa 3. (As alternativas no shape A — Am na casa 12, F na 8, G na 10 — ficam fora da região.)
  ]
  #resposta(5)[
    G (E, 3) – Em (A, 7) – C (A, 3) – D (A, 5). A progressão passou do tom de F para o *tom de G* (I – VIm – IV – V em G).
  ]
  #resposta(6)[
    Exercício prático — critério de sucesso: as seis cordas soando limpas nos dois acordes, três vezes seguidas, sem dor e sem tensão no polegar.
  ]
  #resposta(7)[
    Exercício prático — critério de sucesso: três voltas seguidas de cada progressão a 80 BPM, com as trocas no tempo 1 e sem cordas abafadas.
  ]
]
