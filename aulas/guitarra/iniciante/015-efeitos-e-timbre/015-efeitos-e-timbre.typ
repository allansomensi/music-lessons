#import "/templates/layout.typ": *
#import "/templates/components.typ": *
#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node

#show: aula.with(
  instrumento: "Guitarra",
  nivel: "Iniciante",
)

// Exercício curto que não se divide entre páginas.
#let ex(..args, body) = block(breakable: false, width: 100%, exercicio(..args, body))

// Rótulo pequeno abaixo do nome de um bloco nos diagramas.
#let sub(t) = text(size: 7.5pt, fill: color-muted, t)

// Cadeia de efeitos em blocos numerados, com setas (cabe na largura da página).
#let elo(n, nome, desc) = block(
  width: 100%,
  fill: if n == none { color-subtle-bg-alt } else { white },
  stroke: 0.5pt + color-rule-dark,
  radius: 4pt,
  height: 1.75cm,
  inset: (x: 4pt, y: 6pt),
  align(center + horizon)[
    #if n != none [#text(size: 7.5pt, weight: "bold", fill: color-secondary)[#n] \ ]
    #text(size: 9pt, weight: "bold", nome) \
    #sub(desc)
  ],
)
#let seta = align(center + horizon, text(size: 12pt, fill: color-strong)[→])

= Efeitos e Construção do Timbre

O timbre da guitarra elétrica raramente vem só do instrumento. Ele é o resultado de uma *cadeia de decisões*: a guitarra, os pedais, o amplificador e o alto-falante, cada um moldando o som que chega ao ouvido. Entender esse caminho é o que permite criar sons de propósito e evitar erros comuns que deixam o som confuso ou sem definição.

#objetivos((
  [Descrever o caminho do sinal da guitarra até o alto-falante],
  [Diferenciar pré-amplificador e amplificador de potência (power amp)],
  [Conhecer os principais grupos de efeitos e o que cada um faz],
  [Montar uma cadeia de pedais numa ordem lógica],
  [Saber quando usar a entrada normal e o loop de efeitos (FX loop) do amplificador],
))

#align(center, image("attachments/amp-e-pedais.svg", width: 72%))

== 1. O caminho do sinal

A guitarra gera um sinal elétrico *fraco*. Ele passa pelos pedais, é preparado e "colorido" no pré-amplificador, ganha força no amplificador de potência e só então movimenta o alto-falante.

#v(0.4em)
#align(center)[
  #diagram(
    spacing: (9mm, 10mm),
    node-stroke: 0.5pt + color-rule-dark,
    node-fill: white,
    node-shape: rect,
    node((0, 0), [*Guitarra* \ #sub[sinal fraco]], name: <G>),
    node((1, 0), [*Pedais* \ #sub[efeitos]], name: <P>),
    node((2, 0), [*Pré-amp* \ #sub[ganho + EQ]], name: <PRE>, fill: color-subtle-bg),
    node((3, 0), [*Power amp* \ #sub[potência]], name: <PWR>),
    node((4, 0), [*Caixa* \ #sub[alto-falante]], name: <CAB>),
    node((5, 0), [*Ouvido*], name: <EAR>),
    edge(<G>, <P>, "->"),
    edge(<P>, <PRE>, "->"),
    edge(<PRE>, <PWR>, "->"),
    edge(<PWR>, <CAB>, "->"),
    edge(<CAB>, <EAR>, "->"),
    node((2, 0.85), text(size: 8pt)[Aqui nascem o *ganho* \ e o *caráter* do som], name: <LA>),
    edge(<LA>, <PRE>, "-->", stroke: 0.5pt + color-rule-dark),
  )
]

=== Pré-amp × power amp

Todo amplificador de guitarra tem esses dois estágios, com funções bem diferentes:

#block(breakable: false, cartoes-info(
  columns: (1fr, 1fr),
  (
    (
      titulo: "Pré-amplificador (pré-amp)",
      corpo: [Recebe o sinal fraco da guitarra e o eleva a um nível de trabalho. É aqui que ficam o *ganho* (a quantidade de saturação), a *equalização* (graves, médios e agudos) e a maior parte do *caráter* do amplificador: brilhante, quente, agressivo. \ #v(0.2em) #sub[Exemplos: o canal de distorção de um amplificador, a simulação de amp de uma pedaleira.]],
    ),
    (
      titulo: "Amplificador de potência (power amp)",
      corpo: [Recebe o sinal já pronto do pré-amp e lhe dá *potência elétrica* (watts) suficiente para movimentar o cone do alto-falante. A sua função principal não é colorir o som, e sim torná-lo *alto*. \ #v(0.2em) #sub[Exemplos: a seção de potência de um amplificador, um power amp de rack.]],
    ),
  ),
))

=== O erro do "pré em cima de pré"

Muitas pedaleiras multiefeitos *simulam um amplificador completo* (pré-amp e caixa). Quando ela já faz esse papel e é ligada na entrada normal de um amplificador, o sinal passa por *dois* pré-amps em sequência:

#v(0.4em)
#align(center)[
  #diagram(
    spacing: (11mm, 9mm),
    node-stroke: 0.5pt + color-rule-dark,
    node-shape: rect,
    node((0, 0), [Pedaleira \ #sub[simulando pré-amp]], fill: white, name: <PED>),
    node((1, 0), [Entrada do amp \ #sub[pré-amp do amp]], fill: white, name: <AMP>),
    node((2, 0), [Power amp], fill: color-subtle-bg, name: <PWR>),
    node((3, 0), [Caixa], fill: color-subtle-bg, name: <CAB>),
    edge(<PED>, <AMP>, "->"),
    edge(<AMP>, <PWR>, "->"),
    edge(<PWR>, <CAB>, "->"),
    node(
      (0.5, 0.85),
      text(size: 8pt, weight: "bold")[Dois pré-amps em sequência: \ som embolado e sem controle],
      fill: color-subtle-bg,
      name: <WARN>,
    ),
    edge(<WARN>, <PED>, "-->", stroke: 0.5pt + color-rule-dark),
    edge(<WARN>, <AMP>, "-->", stroke: 0.5pt + color-rule-dark),
  )
]

O resultado costuma ser um som sem definição e com excesso de médios. A solução é *pular o pré-amp do amplificador*: ligar a pedaleira no *FX Return* (veja a seção 4) ou numa entrada *Power Amp In*, quando o amplificador tiver.

== 2. A ordem dos pedais

A ordem importa: um chorus antes de uma distorção soa bem diferente de uma distorção antes de um chorus. A cadeia abaixo é a ordem mais usada como ponto de partida:

#v(0.4em)
#block(breakable: false, grid(
  columns: (1fr, 16pt, 1fr, 16pt, 1fr, 16pt, 1fr, 16pt, 1fr),
  row-gutter: 0.8em,
  align: horizon,
  elo(none, "Guitarra", "início"), seta,
  elo(1, "Afinador", "sinal limpo"), seta,
  elo(2, "Filtro", "wah"), seta,
  elo(3, "Dinâmica", "compressor"), seta,
  elo(4, "Ganho", "drive, distorção, fuzz"),

  align(right + horizon, text(size: 8.5pt, style: "italic", fill: color-muted)[(continua)]), seta,
  elo(5, "Modulação", "chorus, flanger, phaser"), seta,
  elo(6, "Delay", "eco"), seta,
  elo(7, "Reverb", "ambiência"), seta,
  elo(none, "Amplificador", "fim"),
))

=== Por que essa ordem?

O *afinador* precisa do sinal mais puro possível. *Wah, compressor e pedais de ganho* reagem à dinâmica da palhetada, por isso vêm no começo. *Modulação, delay e reverb* devem receber o som já distorcido e equalizado: assim as repetições e a ambiência soam limpas, em vez de serem distorcidas junto com a nota. A posição do *boost* varia: antes dos pedais de ganho ele aumenta a saturação; depois deles, aumenta só o volume.

== 3. Os principais grupos de efeitos

=== Dinâmica: compressor e boost

#tabela(
  columns: (1fr, 3fr),
  alinhamento: (left + horizon),
  ([Pedal], [O que faz]),
  (
    ([*Compressor*], [Reduz a diferença entre as notas mais fortes e as mais fracas. O som fica mais *uniforme e sustentado*; muito usado em guitarras limpas de funk e country.]),
    ([*Boost*], [Aumenta o nível do sinal *sem acrescentar distorção*. Serve para "empurrar" o pré-amp do amplificador ou destacar um solo.]),
  ),
)

=== Ganho: overdrive, distorção e fuzz

Os três *saturam* o sinal (cortam o topo da onda sonora), mas de formas diferentes:

#tabela(
  columns: (1fr, 2.4fr, 1.5fr),
  ([Tipo], [Característica], [Uso típico]),
  (
    ([*Overdrive*], [Saturação suave, que imita um amplificador valvulado no limite. Responde à palhetada: tocar mais forte gera mais saturação.], [Blues, rock clássico, country]),
    ([*Distorção*], [Saturação mais forte, comprimida e constante; responde menos à dinâmica e mantém a definição em riffs pesados.], [Hard rock, metal]),
    ([*Fuzz*], [Saturação extrema, que deixa a onda quase "quadrada": som áspero, cheio de harmônicos, com muito sustain.], [Rock dos anos 60, psicodélico, stoner]),
  ),
)

=== Filtro: wah

O *wah* é um filtro que realça uma faixa estreita de frequências; com o pé, você move essa faixa dos graves para os agudos. O efeito lembra a voz dizendo "uá".

#block(breakable: false, cartoes-info(
  columns: (1fr, 1fr),
  (
    (titulo: "Calcanhar para baixo", corpo: [Realça os *graves*: som escuro e abafado.]),
    (titulo: "Ponta do pé para baixo", corpo: [Realça os *agudos*: som brilhante, nasal e cortante.]),
  ),
))

#v(0.5em)

O *auto-wah* (ou *envelope filter*) faz esse movimento sozinho, de acordo com a força da palhetada, sem precisar do pedal de expressão.

=== Modulação

Os efeitos de modulação variam continuamente algum aspecto do som (afinação, fase ou volume), em geral misturando uma cópia alterada do sinal com o original.

#tabela(
  columns: (1fr, 2.6fr, 1.4fr),
  ([Efeito], [O que faz], [Som típico]),
  (
    ([*Chorus*], [Mistura uma cópia levemente desafinada e oscilante: som mais "largo", como vários instrumentos juntos.], [Pop dos anos 80, guitarras limpas]),
    ([*Flanger*], [Cópia com atraso curtíssimo e variável: efeito de "avião a jato".], [Intros de rock]),
    ([*Phaser*], [Desloca a fase de algumas frequências: um "rodopio" mais suave.], [Funk, rock psicodélico]),
    ([*Tremolo*], [Variação rítmica do *volume* (a afinação não muda).], [Surf, blues, rockabilly]),
    ([*Vibrato*], [Variação rítmica da *afinação*, como uma alavanca automática.], [Psicodélico, indie]),
  ),
)

=== Tempo e ambiência: delay e reverb

Estes dois criam a *sensação de espaço* e ficam no fim da cadeia, porque devem processar o som já finalizado.

#block(breakable: false, cartoes-info(
  columns: (1fr, 1fr),
  (
    (
      titulo: "Delay (eco)",
      corpo: [Repete o sinal depois de um tempo definido. Controles: *Time* (intervalo entre as repetições), *Feedback* (quantas repetições) e *Mix* (volume do eco em relação ao som original). Delays *digitais* têm eco limpo e preciso; os *analógicos* e de *fita* (tape), um eco mais quente, que vai perdendo brilho.],
    ),
    (
      titulo: "Reverb (ambiência)",
      corpo: [Simula as reflexões do som num ambiente. O *Decay* controla quanto tempo o reverb dura. Tipos: *room* e *hall* (sala e salão, sons naturais), *spring* e *plate* (mola e placa, sons metálicos e "vintage"). Reverb em excesso tira a definição, principalmente com distorção.],
    ),
  ),
))

#caixa(tipo: "dica", titulo: "Delay no tempo da música")[
  Para o eco cair no tempo, use: *tempo do delay (ms) = 60.000 ÷ BPM* para repetições em semínimas. Em 120 BPM: 60.000 ÷ 120 = *500 ms*. Para colcheias, divida o resultado por 2 (250 ms).
]

== 4. O loop de efeitos (FX loop)

Muitos amplificadores têm duas conexões extras no painel traseiro: *Send* (envio) e *Return* (retorno). Elas ficam *entre o pré-amp e o power amp*: o sinal sai do pré-amp pelo Send, passa pelos pedais e volta pelo Return direto para o power amp.

#v(0.4em)
#align(center)[
  #diagram(
    spacing: (4mm, 12mm),
    node-stroke: 0.5pt + color-rule-dark,
    node-shape: rect,
    node-fill: white,
    node((0, 0), [*Guitarra*], name: <G>, fill: color-subtle-bg),
    node((1, 0), [*Drive* \ #sub[ganho]], name: <DRV>),
    node((2, 0), [*Pré-amp* \ #sub[entrada do amp]], name: <PRE>),
    node((3, 0), [*Send*], name: <SND>, fill: color-subtle-bg),
    node((4, 0), [*Chorus · Delay \ Reverb* \ #sub[modulação e tempo]], name: <LOOP>),
    node((5, 0), [*Return*], name: <RET>, fill: color-subtle-bg),
    node((6, 0), [*Power amp* \ #sub[e caixa]], name: <PWR>),
    edge(<G>, <DRV>, "->"),
    edge(<DRV>, <PRE>, "->"),
    edge(<PRE>, <SND>, "->"),
    edge(<SND>, <LOOP>, "->"),
    edge(<LOOP>, <RET>, "->"),
    edge(<RET>, <PWR>, "->"),
  )
]

#v(0.4em)

Assim, se a distorção vem do próprio amplificador, o delay e o reverb processam o som *depois* dela e soam muito mais limpos do que se estivessem ligados na entrada. E o *Return* sozinho funciona como entrada direta do power amp: é ali que se liga uma pedaleira que já simula o amplificador.

#tabela(
  columns: (1.3fr, 2fr, 2fr),
  ([Onde ligar], [O que vai ali], [Por quê]),
  (
    ([Entrada (input) do amp], [Afinador, wah, compressor, overdrive, distorção, fuzz, boost], [Precisam do sinal direto da guitarra, com toda a dinâmica]),
    ([FX loop (Send → Return)], [Chorus, flanger, phaser, tremolo, delay, reverb], [Processam o som já "pronto" do pré-amp]),
    ([Só o FX Return], [Pedaleira com simulação de amplificador], [Pula o pré-amp do amp e evita o "pré em cima de pré"]),
  ),
)

== 5. Resumo: boas práticas

#comparativo(
  titulo-esquerda: "Boas práticas",
  titulo-direita: "Erros comuns",
  [
    - Montar a cadeia testando um pedal de cada vez
    - Ajustar o tempo do delay ao BPM da música
    - Usar delay e reverb com moderação junto com distorção
    - Pedaleira com simulação de amp → FX Return
    - Afinador no início da cadeia
  ],
  [
    - Pedaleira com simulação de amp na entrada do amp
    - Reverb antes do delay
    - Wah depois da distorção (perde expressividade)
    - Delay fora do tempo da música
    - Ganho no máximo "para compensar" um som sem definição
  ],
)

#v(0.6em)

#caixa(tipo: "resumo", titulo: "Regra de ouro")[
  Nenhuma cadeia de efeitos compensa um som ruim na origem. Comece pela guitarra, pelas cordas, pela palhetada e pelo amplificador. Os efeitos são *temperos*, não a refeição.
]

== 6. Exercícios

#ex(titulo: "Monte a cadeia")[
  Coloque os pedais na ordem da seção 2, numerando de 1 (mais perto da guitarra) a 6 (mais perto do amplificador).

  #tabela-preencher(
    columns: (1fr,) + (1fr,) * 6,
    ([Pedal], [Reverb], [Overdrive], [Afinador], [Delay], [Compressor], [Chorus]),
    (([Posição],) + (none,) * 6,),
  )
]

#ex(titulo: "Que grupo é este?")[
  Escreva o grupo de cada efeito: *dinâmica*, *ganho*, *filtro*, *modulação* ou *tempo/ambiência*.

  #tabela-preencher(
    columns: (1fr,) + (1.1fr,) * 5,
    ([Efeito], [Fuzz], [Phaser], [Delay], [Wah], [Tremolo]),
    (([Grupo],) + (none,) * 5,),
  )
  #v(0.3em)
  #tabela-preencher(
    columns: (1fr,) + (1.1fr,) * 5,
    ([Efeito], [Compressor], [Reverb], [Flanger], [Distorção], [Chorus]),
    (([Grupo],) + (none,) * 5,),
  )
]

#ex(titulo: "Delay no tempo")[
  Calcule o tempo do delay, em milissegundos, para repetições em semínimas (60.000 ÷ BPM). Na última coluna, calcule para colcheias.

  #tabela-preencher(
    columns: (1.4fr,) + (1fr,) * 5,
    ([Andamento], [60 BPM], [80 BPM], [100 BPM], [120 BPM], [120 BPM (colcheia)]),
    (([Delay (ms)],) + (none,) * 5,),
  )
]

#ex(titulo: "Onde ligar?")[
  Para cada situação, escreva onde o equipamento deve ser ligado: *entrada do amp*, *FX loop* ou *FX Return*.

  #grid(
    columns: (1fr, 4cm),
    row-gutter: 1em,
    column-gutter: 1em,
    [a) Uma pedaleira que simula amplificador, num amp com loop de efeitos:], box(width: 100%, height: 0.9em, stroke: (bottom: 0.6pt + color-rule-dark)),
    [b) Um delay, num amp cuja distorção vem do próprio canal:], box(width: 100%, height: 0.9em, stroke: (bottom: 0.6pt + color-rule-dark)),
    [c) Um pedal de overdrive:], box(width: 100%, height: 0.9em, stroke: (bottom: 0.6pt + color-rule-dark)),
    [d) Um pedal wah:], box(width: 100%, height: 0.9em, stroke: (bottom: 0.6pt + color-rule-dark)),
  )
]

#ex(titulo: "Pré-amp ou power amp?")[
  Explique com suas palavras a diferença entre o pré-amp e o power amp, e por que ligar uma pedaleira com simulação de amp na entrada normal costuma soar mal.

  #linhas-resposta(3)
]

#ex(titulo: "Ficha de timbre")[
  No seu equipamento, monte um timbre *limpo* e um *distorcido* de que você goste e anote as regulagens. Guarde esta ficha para reproduzir os sons depois.

  #tabela-preencher(
    columns: (1.3fr, 1fr, 1fr, 1fr, 1fr, 2.2fr),
    ([Timbre], [Ganho], [Graves], [Médios], [Agudos], [Pedais usados]),
    (
      ([Limpo], none, none, none, none, none),
      ([Distorcido], none, none, none, none, none),
    ),
  )
]

=== Sugestão de prática

#rotina-estudo((
  ([Ligar e testar cada pedal sozinho, ouvindo o que ele muda], [10 min], [—]),
  ([Trocar a ordem de dois pedais (ex.: chorus e distorção) e comparar], [5 min], [—]),
  ([Ajustar o delay ao BPM de uma música e tocar junto], [5 min], [conforme a música]),
))

=== Autoavaliação

#checklist((
  [Sei explicar o caminho do sinal até o alto-falante],
  [Sei a diferença entre pré-amp e power amp],
  [Classifico os efeitos nos seus grupos],
  [Monto uma cadeia de pedais numa ordem lógica],
  [Sei quando usar a entrada, o FX loop e o FX Return],
))

#gabarito[
  #resposta(1)[
    Afinador (1) → Compressor (2) → Overdrive (3) → Chorus (4) → Delay (5) → Reverb (6).
  ]
  #resposta(2)[
    Fuzz: ganho · Phaser: modulação · Delay: tempo/ambiência · Wah: filtro · Tremolo: modulação · Compressor: dinâmica · Reverb: tempo/ambiência · Flanger: modulação · Distorção: ganho · Chorus: modulação.
  ]
  #resposta(3)[
    60 BPM = 1.000 ms · 80 BPM = 750 ms · 100 BPM = 600 ms · 120 BPM = 500 ms · 120 BPM em colcheias = 250 ms.
  ]
  #resposta(4)[
    a) FX Return · b) FX loop (Send → Return) · c) entrada do amp · d) entrada do amp.
  ]
  #resposta(5)[
    O pré-amp eleva o sinal fraco da guitarra e define ganho, equalização e caráter do som; o power amp apenas dá potência ao sinal pronto para mover o alto-falante. Uma pedaleira com simulação de amp já faz o papel do pré-amp; na entrada normal, o sinal passa por um segundo pré-amp, que acrescenta ganho e equalização desnecessários e deixa o som embolado.
  ]
  #resposta(6)[
    Resposta pessoal. Dica: anote os valores como as posições de um relógio (ex.: "ganho às 2 horas") ou de 0 a 10.
  ]
]
