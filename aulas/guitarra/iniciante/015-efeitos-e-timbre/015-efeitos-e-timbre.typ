#import "../../../../templates/layout.typ": *
#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node

#show: aula.with(
  instrumento: "Guitarra",
  nivel: "Iniciante",
)

= Efeitos e Construção do Timbre

O timbre da guitarra elétrica raramente vem do instrumento sozinho. Ele é o resultado de uma *cadeia de decisões sonoras*, desde a guitarra até o alto-falante. Entender como esse caminho funciona é fundamental para criar sons intencionais e evitar erros que destroem o sinal.

#v(10em)

#align(center)[
  #image("attachments/amp-e-pedais.svg")]

#pagebreak()

= O Caminho do Sinal

Antes de qualquer efeito, é preciso entender o percurso que o sinal elétrico faz desde a guitarra até o ouvido. Cada elo da cadeia *adiciona cor e molda* o som de forma irreversível.

#v(1.5em)

#align(center)[
  #diagram(
    spacing: (10mm, 10mm),
    node-stroke: 0.5pt,
    node-fill: color-subtle-bg,
    node-shape: rect,

    node((0, 0), [*Guitarra* \ #text(size: 7.5pt, fill: color-muted)[sinal passivo]], name: <G>),
    node((1, 0), [*Pedais* \ #text(size: 7.5pt, fill: color-muted)[pré-sinal]], name: <P>),
    node((2, 0), [*Pré-Amp* \ #text(size: 7.5pt, fill: color-muted)[ganho + EQ]], name: <PRE>),
    node((3, 0), [*Power Amp* \ #text(size: 7.5pt, fill: color-muted)[amplificação]], name: <PWR>),
    node((4, 0), [*Caixa* \ #text(size: 7.5pt, fill: color-muted)[alto-falante]], name: <CAB>),
    node((5, 0), [*Ouvido*], name: <EAR>),

    edge(<G>, <P>, "->"),
    edge(<P>, <PRE>, "->"),
    edge(<PRE>, <PWR>, "->"),
    edge(<PWR>, <CAB>, "->"),
    edge(<CAB>, <EAR>, "->"),

    node(
      (2, 0.8),
      text(size: 8pt)[Aqui nascem \ o *ganho* e o *timbre*],
      stroke: 0.4pt + rgb("#86efac"),
      fill: rgb("#f0fdf4"),
      shape: fletcher.shapes.rect,
      name: <LA>,
    ),
    edge(<LA>, <PRE>, "-->", stroke: 0.5pt + rgb("#86efac")),
  )
]

== Pré-Amp vs. Power Amp

Esses dois estágios têm *funções completamente distintas*. Confundi-los é o erro mais comum ao montar um setup.

#v(0.8em)

#align(center)[
  #grid(
    columns: (1fr, 1fr),
    gutter: 1.2em,
    block(
      width: 100%,
      fill: color-brand-soft,
      stroke: 0.6pt + color-brand-soft,
      inset: 11pt,
      radius: 5pt,
      [
        #align(center)[#text(weight: "bold", size: 10.5pt)[🎚 Pré-Amplificador]]
        #v(0.5em)
        #set text(size: 9pt)
        Recebe o sinal *fraco* da guitarra e o amplifica para um nível de linha utilizável. É aqui que vivem o *ganho*, o *EQ de 3 bandas* e a *coloração tonal* do amplificador. O caráter sonoro — brilhante, quente, agressivo — nasce quase que inteiramente no pré-amp.

        #v(0.4em)
        #text(fill: color-muted)[_Exemplos: o canal de ganho de um Marshall JCM800, o drive de uma pedaleira._]
      ],
    ),
    block(
      width: 100%,
      fill: rgb("#fdf4ff"),
      stroke: 0.6pt + rgb("#d8b4fe"),
      inset: 11pt,
      radius: 5pt,
      [
        #align(center)[#text(weight: "bold", size: 10.5pt)[🔊 Power Amplificador]]
        #v(0.5em)
        #set text(size: 9pt)
        Recebe o sinal *já processado* do pré-amp e o amplifica em termos de *potência elétrica* (watts) para movimentar o cone do alto-falante. Ele não tem como objetivo colorir o som; ele apenas o torna *forte o suficiente* para mover o ar.

        #v(0.4em)
        #text(fill: color-muted)[_Exemplos: a seção de power do próprio amplificador, um power amp de rack._]
      ],
    ),
  )
]

#v(1.5em)

#align(center)[
  #diagram(
    spacing: (12mm, 9mm),
    node-stroke: 0.4pt,
    node-shape: rect,

    node(
      (0, 0),
      [Pedaleira \ #text(size: 7pt)[*simulando pré-amp*]],
      fill: rgb("#fef9c3"),
      stroke: 0.5pt + rgb("#eab308"),
      name: <PED>,
    ),
    node(
      (1, 0),
      [Entrada do Amp \ #text(size: 7pt)[*pré-amp interno*]],
      fill: rgb("#fef9c3"),
      stroke: 0.5pt + rgb("#eab308"),
      name: <AMP>,
    ),
    node((2, 0), [Power Amp], fill: rgb("#f0fdf4"), stroke: 0.5pt + rgb("#86efac"), name: <PWR>),
    node((3, 0), [Caixa], fill: rgb("#f0fdf4"), stroke: 0.5pt + rgb("#86efac"), name: <CAB>),

    edge(<PED>, <AMP>, "->"),
    edge(<AMP>, <PWR>, "->"),
    edge(<PWR>, <CAB>, "->"),

    node(
      (0.5, 0.8),
      text(size: 8pt, fill: rgb("#dc2626"))[⚠ Pré-amp em cima de pré-amp \ sinal distorcido e sem controle],
      fill: rgb("#fef2f2"),
      stroke: 0.5pt + rgb("#fca5a5"),
      shape: fletcher.shapes.rect,
      name: <WARN>,
    ),
    edge(<WARN>, <PED>, "-->", stroke: 0.5pt + rgb("#fca5a5")),
    edge(<WARN>, <AMP>, "-->", stroke: 0.5pt + rgb("#fca5a5")),
  )
]

Pré-amp em cima de pré-amp é um dos erros mais frequentes. Quando uma pedaleira está simulando um amplificador completo, ela já entregou o sinal com o caráter tonal final. Ligar esse sinal na entrada normal de um amplificador real significa passar por mais um estágio de ganho e EQ desnecessários.

O resultado é um som sem definição e excessivamente agressivo nos médios. Para contornar isso existem duas soluções: entrar pelo *FX Return* do amplificador (pulando o pré-amp dele) ou usar uma saída dedicada de *Power Amp In*.

#pagebreak()

= A Cadeia de Efeitos (Signal Chain)

A ordem dos pedais importa. Um chorus antes de uma distorção soa completamente diferente de uma distorção antes de um chorus. A cadeia abaixo é o padrão da indústria para uma pedalboard convencional.

#v(1.5em)

#align(center)[
  #diagram(
    spacing: (4mm, 12mm),
    node-stroke: 0.5pt,
    node-shape: rect,

    // Row 1: before amp
    node((0, 0), [*Guitarra*], name: <G>, fill: color-subtle-bg),
    node((1, 0), [*Afinador* \ #text(size: 7pt, fill: color-muted)[sempre primeiro]], name: <TUN>, fill: luma(245)),
    node((2, 0), [*Dinâmicos* \ #text(size: 7pt, fill: color-muted)[comp, boost]], name: <DYN>, fill: color-brand-soft),
    node((3, 0), [*Ganho* \ #text(size: 7pt, fill: color-muted)[od, dist, fuzz]], name: <GAI>, fill: rgb("#fee2e2")),
    node(
      (4, 0),
      [*Modulação* \ #text(size: 7pt, fill: color-muted)[chorus, flanger]],
      name: <MOD>,
      fill: rgb("#fef9c3"),
    ),
    node((5, 0), [*Delay* \ #text(size: 7pt, fill: color-muted)[eco, tape]], name: <DEL>, fill: color-accent-soft),
    node((6, 0), [*Reverb* \ #text(size: 7pt, fill: color-muted)[ambiente]], name: <REV>, fill: rgb("#f3e8ff")),
    node((7, 0), [*Amp*], name: <AMP>, fill: color-subtle-bg),

    edge(<G>, <TUN>, "->"),
    edge(<TUN>, <DYN>, "->"),
    edge(<DYN>, <GAI>, "->"),
    edge(<GAI>, <MOD>, "->"),
    edge(<MOD>, <DEL>, "->"),
    edge(<DEL>, <REV>, "->"),
    edge(<REV>, <AMP>, "->"),
  )
]

#v(1.5em)

#align(center)[
  #block(
    fill: color-subtle-bg,
    stroke: 0.5pt + color-rule-dark,
    inset: 11pt,
    radius: 5pt,
    width: 88%,
    [
      #text(weight: "bold")[Por que essa ordem?] Os pedais de *ganho* operam melhor com um sinal limpo e dinâmico chegando neles. Os pedais de *modulação e tempo* (delay, reverb) precisam receber o sinal *já distorcido e equalizado* para que os efeitos se repitam e decaiam de forma musical, sem criar caos sonoro.
    ],
  )
]

#pagebreak()

= Os Principais Grupos de Efeitos

== 1. Dinâmicos e Boost

#explainer-component(
  align(center)[
    #block(
      fill: color-brand-soft,
      stroke: 0.6pt + color-brand-soft,
      inset: 12pt,
      radius: 5pt,
      width: 100%,
      [
        #set text(size: 9pt)
        #grid(
          columns: (1fr, 1fr),
          gutter: 1em,
          block[
            #text(weight: "bold")[Compressor] \
            Reduz a diferença entre as notas mais fortes e mais fracas. Deixa o sinal mais *uniforme e sustentado*. Muito usado no Clean de Funk e Country.
          ],
          block[
            #text(weight: "bold")[Boost / Clean Boost] \
            Aumenta o nível do sinal sem adicionar distorção. Usado para *empurrar o pré-amp do amplificador* ou destacar um solo.
          ],
        )
      ],
    )
  ],
  [
    Esses pedais não adicionam notas novas, apenas gerenciam a energia do sinal. O compressor é especialmente útil para guitarristas que alternam entre frases suaves e agressivas na mesma música.
  ],
)

#v(1.5em)

== 2. Ganho (Drive, Distortion, Fuzz)

#v(0.5em)

#align(center)[
  #table(
    columns: (1fr, 1.8fr, 1.5fr),
    align: center + horizon,
    stroke: 0.5pt + color-rule-dark,
    fill: (col, row) => if row == 0 { color-subtle-bg } else if calc.odd(row) { white } else { color-subtle-bg },
    [*Tipo*], [*Característica*], [*Uso Típico*],
    [*Overdrive*], [Saturação suave, dinâmica. Responde à força da palheta.], [Blues, Rock Clássico, Country],
    [*Distortion*], [Clipping agressivo e consistente. Independe da dinâmica.], [Hard Rock, Metal],
    [*Fuzz*], [Saturação extrema e caótica, com harmônicos ricos e imprevisíveis.], [Psicodélico, Stoner, Alternativo],
  )
]

#v(1em)

#align(center)[
  #grid(
    columns: (1fr, 1fr, 1fr),
    gutter: 1em,
    block(
      fill: rgb("#fef2f2"),
      stroke: 0.5pt + rgb("#fca5a5"),
      inset: 9pt,
      radius: 5pt,
      [
        #align(center)[#text(weight: "bold", size: 9.5pt)[Overdrive]]
        #v(0.3em)
        #set text(size: 8.5pt)
        Imita um amp valvulado sendo empurrado além do seu limite. O sinal começa a *"dobrar"* de forma suave e musical. A guitarra responde à dinâmica: toque mais forte → mais saturação.
      ],
    ),
    block(
      fill: rgb("#fef2f2"),
      stroke: 0.5pt + rgb("#fca5a5"),
      inset: 9pt,
      radius: 5pt,
      [
        #align(center)[#text(weight: "bold", size: 9.5pt)[Distortion]]
        #v(0.3em)
        #set text(size: 8.5pt)
        Corta o topo da onda sonora de forma *agressiva e simétrica*. O resultado é um som mais comprimido e consistente, ideal para riffs pesados que precisam de definição.
      ],
    ),
    block(
      fill: rgb("#fef2f2"),
      stroke: 0.5pt + rgb("#fca5a5"),
      inset: 9pt,
      radius: 5pt,
      [
        #align(center)[#text(weight: "bold", size: 9.5pt)[Fuzz]]
        #v(0.3em)
        #set text(size: 8.5pt)
        Corta a onda de forma *assimétrica e caótica*, gerando harmônicos ímpares muito ricos. O som é veludo, estranho e viciante. Soa como um alto-falante rasgado.
      ],
    ),
  )
]

#pagebreak()

== 3. Filtros e Wah

#explainer-component(
  align(center)[
    #block(
      fill: luma(245),
      stroke: 0.5pt + color-rule-dark,
      inset: 12pt,
      radius: 5pt,
      width: 100%,
      [
        #set text(size: 9pt)
        #align(center)[#text(weight: "bold")[Como o Wah funciona]]
        #v(0.6em)
        O pedal Wah é essencialmente um *filtro passa-banda* cuja frequência central você controla com o pé. Ao mover o pedal para a frente, você eleva as frequências médias-altas — criando o som de vogal *"uaaa"* característico.

        #v(0.5em)

        #grid(
          columns: (1fr, 1fr),
          gutter: 0.8em,
          block(
            fill: rgb("#fef9c3"),
            stroke: 0.5pt + rgb("#eab308"),
            inset: 8pt,
            radius: 4pt,
            [
              *Calcanhar para baixo* \
              Frequências graves \
              Som aberto e encorpado
            ],
          ),
          block(
            fill: rgb("#fef9c3"),
            stroke: 0.5pt + rgb("#eab308"),
            inset: 8pt,
            radius: 4pt,
            [
              *Ponta do pé para baixo* \
              Frequências médias-altas \
              Som nasal e cortante
            ],
          ),
        )
      ],
    )
  ],
  [
    O Wah é um dos poucos efeitos que dialoga diretamente com a expressividade do guitarrista em tempo real. Hendrix, Clapton e Slash o usaram para criar frases que imitam a voz humana.

    Uma variação moderna é o *Auto-Wah* (envelope filter), que aciona o efeito automaticamente em resposta à dinâmica da palheta, sem necessidade do pedal de expressão.
  ],
)

== 4. Modulação

Os efeitos de modulação trabalham com *cópias do sinal original* que são levemente alteradas em afinação, fase ou tempo e misturadas de volta. A interação entre o sinal original e a cópia cria os efeitos característicos.

#v(0.8em)

#align(center)[
  #table(
    columns: (1fr, 2fr, 1.5fr),
    align: center + horizon,
    stroke: 0.5pt + color-rule-dark,
    fill: (col, row) => if row == 0 { color-subtle-bg } else if calc.odd(row) { white } else { color-subtle-bg },
    [*Efeito*], [*O que faz*], [*Som típico*],
    [*Chorus*],
    [Cópia levemente desafinada e com LFO. Som mais largo e "molhado".],
    [Pop dos anos 80, Clean do Nirvana],

    [*Flanger*], [Cópia com delay curtíssimo e feedback. Cria o efeito de "avião".], [Eddie Van Halen, intros de rock],
    [*Phaser*], [Desloca a fase de certas frequências. Som mais sutil e orgânico.], [Funk, Psicodélico, Pink Floyd],
    [*Tremolo*], [Variação rítmica do volume. Não altera a frequência.], [Surf Rock, Blues, Radiohead],
    [*Vibrato*], [Variação rítmica da afinação. Parece um braço trêmulo automático.], [Post-rock, Psicodélico],
  )
]

#pagebreak()

== 5. Efeitos de Tempo: Delay e Reverb

Esses dois efeitos criam a *sensação de espaço* do som. São os últimos da cadeia porque precisam processar o sinal *já finalizado* para que as repetições e o ambiente soem naturais.

#v(1em)

#align(center)[
  #grid(
    columns: (1fr, 1fr),
    gutter: 1.5em,
    block(
      fill: color-accent-soft,
      stroke: 0.6pt + rgb("#86efac"),
      inset: 11pt,
      radius: 5pt,
      [
        #align(center)[#text(weight: "bold", size: 10.5pt)[Delay (Eco)]]
        #v(0.5em)
        #set text(size: 9pt)
        Grava o sinal e o reproduz após um tempo definido (*Time*). Você controla quantas vezes ele se repete (*Feedback*) e o quão alto está o eco em relação ao original (*Mix*).

        #v(0.5em)

        #table(
          columns: (1fr, 1fr),
          align: center + horizon,
          stroke: 0.4pt + color-rule-dark,
          fill: color-subtle-bg,
          inset: 6pt,
          [*Digital*], [*Tape/Analog*],
          [Eco limpo e preciso], [Eco quente e que degenera],
        )

        #v(0.4em)

        *Dica:* Sincronize o delay com o BPM da música. Um delay de *♩ = 500ms* em 120 BPM cria repetições que caem no tempo, tornando o efeito musical.
      ],
    ),
    block(
      fill: rgb("#f3e8ff"),
      stroke: 0.6pt + rgb("#d8b4fe"),
      inset: 11pt,
      radius: 5pt,
      [
        #align(center)[#text(weight: "bold", size: 10.5pt)[Reverb (Ambiência)]]
        #v(0.5em)
        #set text(size: 9pt)
        Simula o comportamento do som em um *ambiente físico*, onde as reflexões se acumulam e decaem. O Decay controla por quanto tempo o reverb sustenta.

        #v(0.5em)

        #table(
          columns: (1fr, 1fr),
          align: center + horizon,
          stroke: 0.4pt + color-rule-dark,
          fill: color-subtle-bg,
          inset: 6pt,
          [*Room / Hall*], [*Spring / Plate*],
          [Ambiente natural], [Metálico, vintage],
        )

        #v(0.4em)

        *Cuidado:* Reverb excessivo *destrói a definição* do som, especialmente com distorção. Use com parcimônia e sempre *após* o delay.
      ],
    ),
  )
]

#pagebreak()

= O Loop FX Send/Return

A maioria dos amplificadores possui uma entrada chamada *FX Loop* (ou Effects Loop), composta por um *Send* e um *Return*. Entender esse recurso muda completamente as possibilidades do seu setup.

#v(1.5em)

#align(center)[
  #diagram(
    spacing: (3mm, 12mm),
    node-stroke: 0.5pt,
    node-shape: rect,

    node((0, 0), [*Guitarra*], name: <G>, fill: color-subtle-bg),
    node((1, 0), [*OD / Dist*\ #text(size: 7pt)[ganho]], name: <DRV>, fill: rgb("#fee2e2")),
    node((2, 0), [*Pré-Amp* \ #text(size: 7pt)[amp input]], name: <PRE>, fill: color-brand-soft),
    node((3, 0), [→ *Send* →], name: <SND>, fill: color-subtle-bg),
    node(
      (4, 0),
      [*Chorus* \ *Delay* \ *Reverb* \ #text(size: 7pt)[modulação/tempo]],
      name: <LOOP>,
      fill: color-accent-soft,
    ),
    node((5, 0), [→ *Return* →], name: <RET>, fill: color-subtle-bg),
    node((6, 0), [*Power Amp* \ + *Caixa*], name: <PWR>, fill: rgb("#f3e8ff")),

    edge(<G>, <DRV>, "->"),
    edge(<DRV>, <PRE>, "->"),
    edge(<PRE>, <SND>, "->"),
    edge(<SND>, <LOOP>, "->"),
    edge(<LOOP>, <RET>, "->"),
    edge(<RET>, <PWR>, "->"),
  )
]

#v(1.5em)

#explainer-component(
  align(center)[
    #block(
      fill: luma(245),
      stroke: 0.5pt + color-rule-dark,
      inset: 10pt,
      radius: 5pt,
      width: 90%,
      [
        #set text(size: 9pt)
        #grid(
          columns: (1fr, 1fr),
          gutter: 0.8em,
          block(
            fill: rgb("#fef2f2"),
            stroke: 0.5pt + rgb("#fca5a5"),
            inset: 8pt,
            radius: 4pt,
            [
              *Antes do FX Loop* \
              (entrada do amp) \
              OD, Distortion, Fuzz, Wah, Compressor, Boost
            ],
          ),
          block(
            fill: rgb("#f0fdf4"),
            stroke: 0.5pt + rgb("#86efac"),
            inset: 8pt,
            radius: 4pt,
            [
              *Dentro do FX Loop* \
              (send → return) \
              Chorus, Flanger, Phaser, Delay, Reverb, Tremolo
            ],
          ),
        )
      ],
    )
  ],
  [
    O FX Loop permite que os pedais de *tempo e modulação* sejam inseridos *entre o pré-amp e o power amp*, ou seja, esses efeitos processam o som já colorido e equalizado do amplificador. O delay e o reverb soam de forma muito mais limpa e controlada quando colocados aqui do que na entrada do amplificador.

    O *FX Return* sozinho (sem usar o Send) também serve como *entrada de power amp*, ideal para quem usa uma pedaleira multi-efeitos com simulação de pré-amp e não quer passar pelo pré-amp do amplificador real.
  ],
)

#pagebreak()

= Resumo: Construindo o Seu Timbre

#v(1em)

#align(center)[
  #block(
    fill: color-subtle-bg,
    stroke: 0.5pt + color-rule-dark,
    inset: 14pt,
    radius: 5pt,
    width: 92%,
    [
      #table(
        columns: (0.3fr, 1.2fr, 2fr, 1fr),
        align: center + horizon,
        stroke: 0.5pt + color-rule-dark,
        fill: (col, row) => if row == 0 { luma(225) } else if calc.odd(row) { white } else { color-subtle-bg },
        [*\#*], [*Posição*], [*O que vai aqui*], [*Por quê*],
        [1], [Entrada do amp], [Afinador, Compressor, Wah, OD/Dist], [Precisam do sinal puro e dinâmico],
        [2], [FX Loop Send→Return], [Chorus, Flanger, Delay, Reverb], [Processam o som já "pronto" do pré-amp],
        [3], [FX Return (apenas)], [Pedaleira com simulação de amp], [Pula o pré-amp, evita empilhamento],
      )
    ],
  )
]

#v(1.5em)

#align(center)[
  #grid(
    columns: (1fr, 1fr),
    gutter: 1.2em,
    block(
      width: 100%,
      fill: rgb("#f0fdf4"),
      stroke: 0.6pt + rgb("#86efac"),
      inset: 10pt,
      radius: 5pt,
      [
        #align(center)[#text(weight: "bold", size: 10pt)[✓ Boas práticas]]
        #v(0.4em)
        #align(left)[
          #set text(size: 9pt)
          - Sempre teste pedal por pedal ao montar a cadeia
          - Sync do delay com o BPM da música
          - Reverb e delay com parcimônia na distorção
          - Pedaleiras com sim de amp → entrar pelo FX Return
          - Afinador sempre primeiro e em bypass verdadeiro (true bypass)
        ]
      ],
    ),
    block(
      width: 100%,
      fill: rgb("#fef2f2"),
      stroke: 0.6pt + rgb("#fca5a5"),
      inset: 10pt,
      radius: 5pt,
      [
        #align(center)[#text(weight: "bold", size: 10pt)[✗ Erros comuns]]
        #v(0.4em)
        #align(left)[
          #set text(size: 9pt)
          - Pedaleira com sim de amp na entrada do amp (pré em cima de pré)
          - Reverb antes do delay na cadeia
          - Compressor depois da distorção
          - Wah depois da distorção (perde a expressividade)
          - Delay desincronizado com o BPM
        ]
      ],
    ),
  )
]

#v(1.5em)

#align(center)[
  #block(
    fill: rgb("#fef3c7"),
    stroke: 0.5pt + rgb("#fde68a"),
    inset: 12pt,
    radius: 5pt,
    width: 88%,
    [
      *Regra de ouro do timbre:* A melhor cadeia de efeitos do mundo não compensa um som ruim na fonte. Comece sempre pela guitarra, pelas cordas e pelo amplificador. Efeitos são *temperos*, não a refeição.
    ],
  )
]
