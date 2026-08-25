#import "/templates/layout.typ": *

#show: aula.with(
  instrumento: "Teoria Musical",
  nivel: "Fundamentos",
)

= O Som e a Música

Esta primeira aula introduz os conceitos fundamentais da música e a natureza física do som, estabelecendo a base teórica e perceptiva necessária para o estudo de qualquer instrumento.

#v(1em)

== 1. O que é Música?

Música é, essencialmente, a arte dos sons. Ela é construída através da combinação de três elementos fundamentais:

#align(center)[
  #grid(
    columns: (1fr, 1fr, 1fr),
    gutter: 1em,
    block(
      fill: color-subtle-bg,
      stroke: (top: 4pt + color-brand),
      inset: 15pt,
      radius: 4pt,
      [
        #text(weight: "bold", size: 14pt, fill: color-brand)[Melodia]

        #v(0.5em)
        Sucessão de sons musicais combinados (tocados um após o outro, formando uma linha ou frase musical).
      ],
    ),
    block(
      fill: color-subtle-bg,
      stroke: (top: 4pt + color-accent),
      inset: 15pt,
      radius: 4pt,
      [
        #text(weight: "bold", size: 14pt, fill: color-accent)[Ritmo]

        #v(0.5em)
        A duração e a acentuação dos sons e das pausas, organizando a música no tempo.
      ],
    ),
    block(
      fill: color-subtle-bg,
      stroke: (top: 4pt + color-brand-soft),
      inset: 15pt,
      radius: 4pt,
      [
        #text(weight: "bold", size: 14pt, fill: color-brand-soft)[Harmonia]

        #v(0.5em)
        A combinação de sons simultâneos (notas tocadas ao mesmo tempo, formando os acordes).
      ],
    ),
  )
]

#v(1.5em)

== 2. A Formação dos Sons

O som é o efeito audível produzido por movimentos de corpos vibratórios. Para produzir som musical, precisa-se de uma fonte sonora, como uma corda esticada (violão, piano), uma coluna de ar (flauta, trompete) ou uma membrana (tamborim).

#v(1em)

#block(
  stroke: 1pt + color-brand-soft,
  inset: 15pt,
  radius: 6pt,
  width: 100%,
  [
    #text(weight: "bold", size: 12pt)[Frequência e Hertz (Hz)]

    #v(0.5em)
    Ao tocar uma corda, ela se movimenta de um lado para outro um determinado número de vezes por segundo. Esse movimento é a vibração, medida em Hertz (Hz).

    - *Afinação:* Quanto maior o número de vibrações por segundo, mais *agudo* será o som. O Lá (A) do diapasão, por exemplo, tem exatos *440 Hz*.
    - *Percepção Audível:* O ouvido humano é capaz de captar sons que vão de *20 Hz a 18.000 Hz*.
    - *Sons Fundamentais:* Localizam-se, aproximadamente, numa faixa de 32 Hz a 4.000 Hz.


  ],
)

#pagebreak()

== 3. As Três Propriedades Físicas do Som

Todo som musical possui três características físicas intrínsecas que nos permitem distingui-lo e analisá-lo:

#block(
  fill: color-subtle-bg,
  stroke: (left: 4pt + color-brand),
  inset: (x: 15pt, y: 12pt),
  width: 100%,
  radius: (right: 4pt),
  [
    1. Altura

    É a propriedade de o som ser grave, médio ou agudo. Depende diretamente da frequência (Hz) da vibração gerada.
  ],
)

#block(
  fill: color-subtle-bg,
  stroke: (left: 4pt + color-accent),
  inset: (x: 15pt, y: 12pt),
  width: 100%,
  radius: (right: 4pt),
  [
    2. Intensidade

    É a propriedade de o som ser fraco ou forte (o nosso popular "volume"). Caracteriza-se pela amplitude da vibração. Ao tocar uma corda com mais força, a amplitude do movimento é maior e, consequentemente, o som será mais forte.
  ],
)

#block(
  fill: color-subtle-bg,
  stroke: (left: 4pt + color-brand-soft),
  inset: (x: 15pt, y: 12pt),
  width: 100%,
  radius: (right: 4pt),
  [
    3. Timbre

    É a "cor" ou a qualidade do som que nos permite reconhecer sua origem. É através do timbre que diferenciamos um violão de um piano, mesmo tocando a mesma nota. Ele é totalmente definido pela série harmônica.
  ],
)

== 4. A Série Harmônica

A série harmônica é o "código genético" do timbre. Todo som musical que ouvimos não é puro, mas sim uma sobreposição de várias frequências (subvibrações) soando simultaneamente junto com o som principal.

Quando tocamos uma corda, ela não vibra apenas em sua extensão total (gerando a frequência fundamental), mas também em frações exatas do seu comprimento:

#align(center)[
  #table(
    columns: (1fr, 2fr, 2fr),
    stroke: 0.5pt + color-rule-dark,
    fill: (col, row) => if row == 0 { color-subtle-bg } else if calc.odd(row) { white } else { color-subtle-bg },
    align: center + horizon,
    [Divisão da Corda], [Frequência Gerada], [Intervalo Resultante],
    [Inteira (1/1)], [Som Fundamental (1x Hz)], [Tônica (Ex: Dó)],
    [Metade (1/2)], [2º Harmônico (2x Hz)], [Oitava Justa (8J)],
    [Terço (1/3)], [3º Harmônico (3x Hz)], [Oitava + Quinta Justa],
    [Quarto (1/4)], [4º Harmônico (4x Hz)], [Duas Oitavas],
    [Quinto (1/5)], [5º Harmônico (5x Hz)], [Duas Oitavas + Terça Maior],
  )
]

Nota: Teoricamente, a série harmônica é infinita, mas os 16 primeiros sons são suficientes para nossa compreensão e aplicação prática. Acima de 4.000 Hz encontram-se os harmônicos agudos, que enriquecem o instrumento dando mais "brilho". Sem a presença e a combinação específica desses harmônicos, não existiriam os timbres característicos de cada instrumento.

#v(1em)

#block(
  stroke: 1pt + color-secondary,
  inset: 15pt,
  radius: 6pt,
  width: 100%,
  fill: color-subtle-bg,
  [
    #text(weight: "bold", fill: color-brand)[Aplicação Prática no Violão (Técnica de Harmônicos)]

    #v(0.5em)
    Para reproduzir esses harmônicos isoladamente no instrumento, encostamos o dedo levemente em pontos específicos ("nós" de vibração) ao pulsar a corda:
    - No meio (12º traste): A corda passa a vibrar em duas metades (frequência 2x maior). Ouve-se o som uma oitava acima da fundamental.
    - Na terça parte (7º traste): A corda passa a vibrar em três partes (frequência 3x maior). Ouve-se o som correspondente a uma oitava e uma quinta acima.
  ],
)
