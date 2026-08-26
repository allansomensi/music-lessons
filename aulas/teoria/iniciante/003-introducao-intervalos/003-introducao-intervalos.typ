#import "/templates/layout.typ": *

#show: aula.with(
  instrumento: "Teoria Musical",
  nivel: "Fundamentos",
)

= Introdução aos Intervalos Musicais

O *tom* e o *semitom* formam a régua básica da música. O segredo para dominar a percepção musical é usar essa régua para medir a distância entre duas notas quaisquer. Essa distância tem um nome, e reconhecê-la *de ouvido* é uma das habilidades mais valiosas que um músico pode desenvolver.

#v(1em)

== 1. O Que é um Intervalo?

*Intervalo* é o nome que damos à distância entre duas notas, medida em tons e semitons. Ele pode se apresentar de duas formas:

#v(0.8em)

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  block(
    fill: color-subtle-bg,
    stroke: (top: 4pt + color-brand),
    inset: 15pt,
    radius: 4pt,
    [
      #text(weight: "bold", size: 13pt, fill: color-brand)[Intervalo Melódico]
      #v(0.5em)
      As duas notas soam *uma de cada vez*, em sequência. É o intervalo que forma uma melodia, o "salto" entre uma nota e a próxima.
    ],
  ),
  block(
    fill: color-subtle-bg,
    stroke: (top: 4pt + color-accent),
    inset: 15pt,
    radius: 4pt,
    [
      #text(weight: "bold", size: 13pt, fill: color-accent)[Intervalo Harmônico]
      #v(0.5em)
      As duas notas soam *ao mesmo tempo*, simultaneamente. É o intervalo que forma a base de um acorde ou de uma dupla de vozes.
    ],
  ),
)

#v(0.8em)

Um intervalo também tem uma *direção*: se a segunda nota é mais aguda, o intervalo é *ascendente*; se é mais grave, é *descendente*. Vamos focar nos intervalos *melódicos ascendentes*, por serem os mais fáceis de reconhecer no início.

#v(1.2em)

Além da direção, os intervalos também são classificados pelo seu tamanho total:

- *Intervalos Simples:* São aqueles contidos dentro de uma oitava (distância máxima de 12 semitons).
- *Intervalos Compostos:* São aqueles que ultrapassam o limite de uma oitava (como uma Nona, Décima, etc.).

Focaremos exclusivamente nos *intervalos simples*. Eles são a base de toda a harmonia. Qualquer intervalo composto nada mais é do que um intervalo simples somado a uma oitava.

#v(1.5em)

#align(center)[
  #block(
    fill: color-subtle-bg,
    stroke: 0.5pt + color-rule-dark,
    inset: 14pt,
    radius: 6pt,
    width: 90%,
    [
      #set text(size: 9.5pt)
      Uma nota isolada não carrega emoção própria. O que cria a sensação de alegria, melancolia, tensão ou repouso é justamente a relação (o *intervalo*) entre as notas. É por isso que podemos reconhecer uma mesma música tocada mais grave ou mais aguda: as notas exatas mudam, mas os intervalos entre elas continuam rigorosamente os mesmos.
    ],
  )
]

#pagebreak()

== 2. Os Nomes dos Intervalos

Cada distância possível dentro de uma oitava tem um nome próprio, medido em semitons a partir da nota de referência (a *tônica*):

#v(0.8em)

#align(center)[
  #table(
    columns: (1.6fr, 0.7fr, 1.2fr),
    align: center + horizon,
    stroke: 0.5pt + color-rule-dark,
    fill: (col, row) => if row == 0 { color-subtle-bg } else if calc.odd(row) { white } else { color-subtle-bg },
    [*Intervalo*], [*Cifra*], [*Distância (semitons)*],
    [Segunda Menor], [b2], [1],
    [Segunda Maior], [2], [2],
    [Terça Menor], [b3], [3],
    [Terça Maior], [3], [4],
    [Quarta Justa], [4], [5],
    [Quarta Aumentada / Quinta Diminuta], [\#4 / b5], [6],
    [Quinta Justa], [5], [7],
    [Sexta Menor], [b6], [8],
    [Sexta Maior], [6], [9],
    [Sétima Menor], [7], [10],
    [Sétima Maior], [7M], [11],
    [Oitava Justa], [8], [12],
  )
]

#v(0.8em)

#caixa-destaque(width: 85%)[
  Repare que essa tabela é exatamente a régua de *tons e semitons* que você já conhece, só que agora com um nome específico para cada distância. Saber o nome de um intervalo é o primeiro passo, reconhecê-lo *de ouvido* é o segundo.
]

== 3. Por Que Associar Intervalos a Músicas?

A maioria das pessoas não tem "ouvido absoluto" (a capacidade de identificar uma nota isolada só de ouvi-la). O que todo músico pode desenvolver é o *ouvido relativo*: a capacidade de reconhecer a *distância* entre duas notas, comparando-a com um som já conhecido.

A técnica mais eficiente para isso é simples: escolher uma música *muito familiar* cujas duas primeiras notas formem exatamente o intervalo que você quer memorizar. A partir daí, sempre que precisar identificar aquele intervalo, basta lembrar da música, o seu ouvido já vai saber "completar" o salto sozinho.

#v(0.8em)

#align(center)[
  #block(
    fill: color-subtle-bg,
    stroke: 0.5pt + color-rule-dark,
    inset: 12pt,
    radius: 5pt,
    width: 88%,
    [
      #set text(size: 9pt)
      *Exemplo prático:* Se você quer saber se um salto que acabou de ouvir foi uma *Segunda Maior*, pense em "Parabéns pra Você". As duas primeiras sílabas, "Pa-ra-BÉNS", sobem exatamente uma Segunda Maior. Se o salto que você ouviu "encaixa" nessa mesma sensação, é uma Segunda Maior.
    ],
  )
]

#pagebreak()

== 4. Tabela de Referência: Intervalos e Músicas Famosas

Abaixo está uma tabela com uma música de referência para cada intervalo ascendente, começando pela sua tônica. Você não precisa decorar todas de uma vez, comece pelas primeiras três ou quatro e vá expandindo aos poucos.

#align(center)[
  #block(
    stroke: 0.5pt + color-rule-dark,
    radius: 6pt,
    clip: true,
    [
      #table(
        columns: (1.3fr, 0.6fr, 1.6fr, 2.2fr),
        align: (center + horizon, center + horizon, left + horizon, left + horizon),
        stroke: 0.5pt + color-rule-light,
        fill: (_, row) => if row == 0 { color-subtle-bg } else if calc.odd(row) { white } else { luma(245) },
        inset: (x: 8pt, y: 7.3pt),
        [*Intervalo*], [*Cifra*], [*Música de Referência*], [*Onde ouvir*],

        [Segunda Menor],
        [b2],
        [Tubarão / A Pantera Cor-de-Rosa / Für Elise],
        [As duas notas repetidas e tensas do início / Duas primeiras notas da melodia],

        [Segunda Maior],
        [2],
        [Parabéns pra Você / Asa Branca],
        [As duas primeiras sílabas de "Pa-ra(T)-béns(2)" / As duas primeiras sílabas do canto em "Quan(T)-do o(2) sol(3)"],

        [Terça Menor], [b3], [Iron Man / Smoke on the Water / Seven Nation Army], [Duas primeiras notas do riff],
        [Terça Maior], [3], [Eu Sei Que Vou Te Amar], [Eu(T) SEI(3) que vou te amar],
        [Quarta Justa],
        [4],
        [Com Quem Será, Harry Potter, Hino Nacional Brasileiro],
        [Com(T) QUEM(4) será / Primeiras duas notas da melodia / Duas primeiras sílabas cantadas ("Ou(T)-vi(4)-ram do Ipiranga").],

        [Quarta Aumentada (Trítono)],
        [\#4 / b5],
        [Tema de abertura de Os Simpsons / Purple Haze],
        [The(T) Simp(\#4)-sooons(5) / Primeiras duas notas da introdução],

        [Quinta Justa], [5], [Top Gun / Brilha, Brilha, Estrelinha], [Duas primeiras notas da melodia],
        [Sexta Menor], [b6], [Manhã de Carnaval], [Duas primeiras notas da melodia],
        [Sexta Maior],
        [6],
        [My Bonnie Lies Over the Ocean / Nocturne Opus 9 No.2 / Ovelha Negra / My Way],
        [As duas primeiras sílabas de "My Bon-nie" / Duas primeiras notas da música / O salto logo no início da voz ("And(T) now(6)... the end is near").],

        [Sétima Menor], [7], [Arpejo Dominante, Nascente], [Acorde dominante, Primeiras duas notas da música],
        [Sétima Maior], [7M], [Tema do Superman], [O salto na melodia do tema principal],
        [Oitava Justa],
        [8],
        [Over the Rainbow / Sweet Child O' Mine],
        [De "Some-" para "-where" em "Somewhere over the rainbow" / Primeiras duas notas do riff],
      )
    ],
  )
]

#align(center)[
  #text(size: 8.5pt, fill: color-muted)[
    Algumas dessas músicas você provavelmente já conhece de cor sem nunca ter pensado nelas como "teoria musical", é exatamente por isso que funcionam tão bem como referência.
  ]
]

#pagebreak()

== 5. Como Praticar o Reconhecimento de Intervalos

#v(0.5em)

#align(center)[
  #block(
    fill: color-subtle-bg,
    stroke: 0.5pt + color-rule-dark,
    inset: 14pt,
    radius: 6pt,
    width: 92%,
    [
      #set text(size: 9.5pt)
      #grid(
        columns: (auto, 1fr),
        gutter: 0.8em,
        align: (center + top, left + top),
        text(weight: "bold", fill: color-strong, size: 12pt)[①],
        [Escolha *um único intervalo* para trabalhar. Cante ou toque a música de referência algumas vezes, prestando atenção apenas nas duas primeiras notas.],

        text(weight: "bold", fill: color-strong, size: 12pt)[②],
        [No seu instrumento, toque a *tônica* e depois o intervalo isolado (sem o resto da melodia). Compare a sensação com a música de referência — deve ser a mesma distância.],

        text(weight: "bold", fill: color-strong, size: 12pt)[③],
        [Peça para alguém (ou use um app de ear training) tocar o intervalo em notas aleatórias, fora de contexto. Tente identificar qual música "gruda" naquele salto.],

        text(weight: "bold", fill: color-strong, size: 12pt)[④],
        [Só depois de reconhecer 3 ou 4 intervalos com confiança, adicione um novo à lista. Reconhecimento de ouvido é uma habilidade cumulativa — ela se constrói devagar.],
      )
    ],
  )
]

#v(1em)

#caixa-destaque(width: 88%)[
  *Dica:* Treine por grupos de intervalos. Comece com segunda maior e segunda menor, depois passe para terça maior e terça menor, depois quarta justa e quarta aumentada etc. No fim treine todos juntos.
]

#v(1em)

== 6. Use a Voz

Pode parecer intimidador se você não é cantor, mas *cantarolar* os intervalos é o melhor atalho para a percepção musical. O instrumento é externo, mas a sua voz é interna. Quando você consegue prever e reproduzir a nota com a voz antes de tocá-la, significa que o seu cérebro internalizou a distância de verdade.

#v(0.8em)

#grid(
  columns: (1fr, 1fr),
  gutter: 1.2em,
  block(
    fill: white,
    stroke: 0.5pt + color-rule-light,
    inset: 12pt,
    radius: 4pt,
    [
      #text(weight: "bold", fill: color-brand)[Teste no instrumento] \
      #v(0.5em)
      #text(
        size: 9.5pt,
      )[Toque a nota tônica, pense na música de referência e *cante* a segunda nota. Só então toque a segunda nota no instrumento para checar sua afinação.]
    ],
  ),
  block(
    fill: white,
    stroke: 0.5pt + color-rule-light,
    inset: 12pt,
    radius: 4pt,
    [
      #text(weight: "bold", fill: color-accent)[Apps de Ear Training] \
      #v(0.5em)
      #text(
        size: 9.5pt,
      )[Para colocar o passo 3 em prática sem depender de outra pessoa, use aplicativos de celular como *Perfect Ear* ou *Functional Ear Trainer*.]
    ],
  ),
)

#v(1em)

#align(center)[
  #block(
    fill: color-subtle-bg,
    stroke: 0.5pt + color-rule-dark,
    inset: 14pt,
    radius: 6pt,
    width: 92%,
    align(left)[
      #set text(size: 9.5pt)
      #text(weight: "bold", size: 11pt, fill: color-strong)[Onde Praticar de Graça]

      #v(0.5em)

      Recomendo fortemente o site *musictheory.net* para treinar sozinho. No menu, acesse: \
      *Exercises* $->$ *Ear Training* $->$ *Interval Ear Training*

      #v(0.5em)

      Nas configurações (ícone de engrenagem), selecione apenas os intervalos que deseja treinar e escolha se quer ouvi-los na direção ascendente ou descendente.

      *Desafie-se:* Só passe para o próximo intervalo quando conseguir acertar uns 50 seguidos sem errar!
    ],
  )
]
