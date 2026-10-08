#import "/templates/layout.typ": *
#import "/templates/components.typ": *

#show: aula.with(
  instrumento: "Teoria Musical",
  nivel: "Fundamentos",
)

// Exercício que não se divide entre páginas (enunciado + área de resposta juntos)
#let ex(..args) = block(breakable: false, above: 1.5em, below: 0.9em, exercicio(..args))

= O Som e a Música

Antes de tocar qualquer instrumento, vale entender a matéria-prima de toda música: o som. Neste material você vai ver como o som nasce, quais são as suas propriedades e por que um violão e um piano soam diferentes mesmo tocando a mesma nota.

#objetivos((
  [Reconhecer os três elementos da música: melodia, ritmo e harmonia.],
  [Entender o que é vibração e frequência (Hz) e como ela define o grave e o agudo.],
  [Distinguir as quatro propriedades do som: altura, duração, intensidade e timbre.],
  [Compreender a série harmônica e tocar harmônicos naturais no violão ou na guitarra.],
))

== 1. O que é música?

Música é a arte de organizar sons e silêncios no tempo. Ela se apoia em três elementos, que quase sempre aparecem juntos:

#cartoes-info((
  (titulo: "Melodia", corpo: [Sons tocados *um após o outro*, formando uma linha ou frase musical. É a parte que você canta ou assobia.]),
  (titulo: "Ritmo", corpo: [A *duração* e a *acentuação* dos sons e das pausas. É o que organiza a música no tempo e faz você bater o pé.]),
  (titulo: "Harmonia", corpo: [Sons tocados *ao mesmo tempo*. Três ou mais notas simultâneas formam um *acorde*.]),
))

Numa música de violão e voz, por exemplo, a voz canta a melodia, o violão faz a harmonia (os acordes) e a batida da mão direita define o ritmo.

== 2. Como o som é produzido

O som é a vibração de um corpo que se propaga pelo ar até o nosso ouvido. Todo instrumento tem uma *fonte sonora* que vibra: uma corda esticada (violão, piano, baixo), uma coluna de ar (flauta, trompete) ou uma membrana (bateria, pandeiro).

=== Frequência: o número de vibrações por segundo

Ao tocar uma corda, ela se movimenta de um lado para o outro muitas vezes por segundo. O número de vibrações completas em um segundo é a *frequência*, medida em *hertz (Hz)*: 440 Hz significa 440 vibrações por segundo.

- Quanto *maior* a frequência, mais *agudo* é o som; quanto *menor*, mais *grave*.
- Quando a frequência *dobra*, ouvimos a *mesma nota uma oitava acima* (220 Hz → 440 Hz são dois Lás). Quando cai pela metade, a nota desce uma oitava.
- O ouvido humano capta, aproximadamente, de *20 Hz a 20.000 Hz*. O limite agudo diminui com a idade.

#tabela(
  ([*Referência*], [*Frequência (aprox.)*]),
  (
    ([Limite grave da audição humana], [20 Hz]),
    ([Nota mais grave do piano (Lá)], [27,5 Hz]),
    ([6ª corda solta do violão (Mi grave)], [82 Hz]),
    ([5ª corda solta do violão (Lá)], [110 Hz]),
    ([Lá do diapasão, usado como referência de afinação], [440 Hz]),
    ([Nota mais aguda do piano (Dó)], [4.186 Hz]),
    ([Limite agudo da audição humana], [20.000 Hz]),
  ),
  columns: (2.4fr, 1fr),
  alinhamento: (left + horizon, center + horizon),
  width: 85%,
)

== 3. As quatro propriedades do som

Todo som musical pode ser descrito por quatro propriedades. Cada uma responde a uma pergunta diferente:

#tabela(
  ([*Propriedade*], [*Responde a*], [*Depende de*], [*Exemplo*]),
  (
    ([*Altura*], [É grave ou agudo?], [Frequência da vibração], [A 1ª corda do violão soa mais aguda que a 6ª.]),
    ([*Duração*], [É curto ou longo?], [Tempo que a vibração se mantém], [Uma nota sustentada × uma nota abafada logo após o toque.]),
    ([*Intensidade*], [É fraco ou forte?], [Amplitude (largura) da vibração], [Tocar a corda com mais força produz um som mais forte.]),
    ([*Timbre*], [Quem está tocando?], [Mistura de harmônicos e forma do ataque], [A mesma nota no violão e no piano soa diferente.]),
  ),
  columns: (0.9fr, 1fr, 1.2fr, 1.7fr),
  alinhamento: (left + horizon, left + horizon, left + horizon, left + horizon),
)

#caixa(tipo: "atencao")[
  No dia a dia dizemos "som alto" para falar de volume, mas em música *alto* significa *agudo* (altura) e *forte* significa *volume* (intensidade). Uma flauta pode tocar uma nota alta (aguda) bem fraquinho.
]

== 4. A série harmônica

Nenhum som de instrumento é "puro". Quando uma corda vibra, ela vibra inteira — produzindo a nota que ouvimos, chamada *fundamental* — e, ao mesmo tempo, em metades, terços, quartos e assim por diante. Cada uma dessas vibrações menores gera um som mais agudo e mais fraco, chamado *harmônico*. O conjunto de todos eles é a *série harmônica*.

#block(breakable: false)[
A frequência de cada harmônico é um múltiplo da fundamental. Veja a série da 5ª corda solta do violão (Lá, 110 Hz):

#tabela(
  ([*Harmônico*], [*A corda vibra em*], [*Frequência*], [*Nota*], [*Distância da fundamental*]),
  (
    ([1º (fundamental)], [1 parte (inteira)], [110 Hz], [Lá], [—]),
    ([2º], [2 partes (metades)], [220 Hz], [Lá], [1 oitava]),
    ([3º], [3 partes (terços)], [330 Hz], [Mi], [1 oitava + 5ª justa]),
    ([4º], [4 partes (quartos)], [440 Hz], [Lá], [2 oitavas]),
    ([5º], [5 partes (quintos)], [550 Hz], [Dó\#], [2 oitavas + 3ª maior]),
    ([6º], [6 partes (sextos)], [660 Hz], [Mi], [2 oitavas + 5ª justa]),
  ),
  columns: (1.15fr, 1.3fr, 0.85fr, 0.55fr, 1.85fr),
)
]

Repare que os primeiros harmônicos formam as notas Lá, Mi e Dó\# — justamente as notas do acorde de Lá maior (A). Por isso a série harmônica é considerada a base física dos acordes.

A série continua indefinidamente, com harmônicos cada vez mais agudos e mais fracos. A *quantidade* e a *força* de cada harmônico mudam de instrumento para instrumento — e é isso, junto com a forma do ataque, que cria o *timbre*. Um som com muitos harmônicos agudos soa "brilhante"; com poucos, soa "abafado" ou "aveludado".

=== Na prática: harmônicos naturais no violão e na guitarra

Você pode isolar os harmônicos de uma corda encostando o dedo de leve sobre pontos exatos dela, chamados *nós*. O dedo não aperta a corda contra o braço: ele apenas impede a vibração inteira e deixa soar só as partes menores.

#passos((
  [Escolha a 5ª corda (Lá). Encoste a ponta de um dedo da mão esquerda *exatamente sobre o traste da casa 12* (a peça de metal), sem apertar.],
  [Toque a corda com a mão direita e retire o dedo logo em seguida. Você ouvirá um som de sino: o *2º harmônico* (220 Hz, Lá uma oitava acima). A casa 12 fica na metade da corda.],
  [Repita sobre o traste da *casa 7* (um terço da corda): soa o *3º harmônico*, um Mi (330 Hz).],
  [Repita sobre o traste da *casa 5* (um quarto da corda): soa o *4º harmônico*, um Lá de 440 Hz — a mesma nota do diapasão.],
))

#caixa(tipo: "dica")[
  Se o harmônico não soar, o dedo provavelmente está apertando demais ou fora do ponto. Posicione-o bem em cima do traste, não no meio da casa.
]

== 5. Exercícios

#ex(titulo: "Os três elementos da música", nivel: "Escrita")[
  Escreva qual elemento (*melodia*, *ritmo* ou *harmonia*) está sendo descrito.

  #v(0.3em)
  #tabela-preencher(
    ([*Descrição*], [*Elemento*]),
    (
      ([a) Três notas tocadas ao mesmo tempo no violão.], none),
      ([b) A linha que o cantor canta no refrão.], none),
      ([c) A batida da mão direita, com acentos fortes e fracos.], none),
      ([d) Uma sequência de acordes acompanhando a voz.], none),
    ),
    columns: (3fr, 1.2fr),
    alinhamento: (left + horizon, center + horizon),
  )
]

#ex(titulo: "Qual propriedade do som?", nivel: "Escrita")[
  Indique qual propriedade (*altura*, *duração*, *intensidade* ou *timbre*) muda em cada situação.

  #v(0.3em)
  #tabela-preencher(
    ([*Situação*], [*Propriedade*]),
    (
      ([a) Você toca a mesma nota primeiro bem fraco e depois bem forte.], none),
      ([b) Você toca a 6ª corda e depois a 1ª corda, ambas soltas.], none),
      ([c) Um violão e uma flauta tocam o mesmo Lá.], none),
      ([d) Você deixa uma nota soar e depois abafa a corda logo após tocá-la.], none),
      ([e) Você toca a corda perto da ponte e depois perto da boca do violão.], none),
    ),
    columns: (3fr, 1.2fr),
    alinhamento: (left + horizon, center + horizon),
  )
]

#ex(titulo: "Frequências e oitavas", nivel: "Cálculo")[
  Lembre-se: subir uma oitava *dobra* a frequência; descer uma oitava a *divide pela metade*. Complete a tabela.

  #v(0.3em)
  #tabela-preencher(
    ([*Nota de partida*], [*1 oitava abaixo*], [*1 oitava acima*], [*2 oitavas acima*]),
    (
      ([Lá — 440 Hz], none, none, none),
      ([Mi — 82 Hz], none, none, none),
      ([Ré — 147 Hz], none, none, none),
    ),
    columns: (1.4fr, 1fr, 1fr, 1fr),
  )
]

#ex(titulo: "Série harmônica", nivel: "Cálculo")[
  A 6ª corda solta do violão (Mi) vibra a 82 Hz. Complete com os seus quatro primeiros harmônicos (modelo: tabela da seção 4).

  #v(0.3em)
  #tabela-preencher(
    ([*Harmônico*], [*1º*], [*2º*], [*3º*], [*4º*]),
    (
      ([Frequência (Hz)], none, none, none, none),
      ([Distância da fundamental], none, none, none, none),
    ),
    columns: (1.7fr, 1fr, 1fr, 1fr, 1fr),
  )
]

#ex(titulo: "Verdadeiro ou falso", nivel: "Escrita")[
  Marque *V* (verdadeiro) ou *F* (falso) e reescreva corretamente as afirmações falsas nas linhas abaixo.

  #v(0.3em)
  #tabela-preencher(
    ([*Afirmação*], [*V / F*]),
    (
      ([a) Um som de 880 Hz é mais grave que um som de 440 Hz.], none),
      ([b) Intensidade é o nome técnico para o volume do som.], none),
      ([c) Um som de instrumento é formado apenas pela fundamental, sem harmônicos.], none),
      ([d) O timbre é o que nos permite reconhecer qual instrumento está tocando.], none),
    ),
    columns: (4fr, 0.8fr),
    alinhamento: (left + horizon, center + horizon),
  )
  #linhas-resposta(3)
]

#ex(titulo: "Harmônicos naturais no instrumento", nivel: "Prática")[
  No violão ou na guitarra, toque os harmônicos das casas 12, 7 e 5 em *todas as seis cordas*. Depois, compare cada harmônico com a corda solta: qual deles soa na mesma nota da corda solta (uma ou duas oitavas acima) e qual soa numa nota diferente? Anote sua resposta.

  #linhas-resposta(3)
]

=== Sugestão de prática

#block(breakable: false, rotina-estudo((
  ([Tocar cordas soltas e descrever cada som: grave/agudo, forte/fraco, curto/longo], [3 min], [—]),
  ([Mesma nota em intensidades diferentes (muito fraco → muito forte)], [3 min], [—]),
  ([Harmônicos naturais nas casas 12, 7 e 5, corda por corda], [5 min], [—]),
  ([Ouvir uma música e identificar melodia, ritmo e harmonia], [5 min], [—]),
)))

#v(0.6em)

#checklist(
  (
    [Sei explicar a diferença entre melodia, ritmo e harmonia.],
    [Sei que uma frequência maior produz um som mais agudo e que dobrar a frequência sobe uma oitava.],
    [Diferencio altura (grave/agudo) de intensidade (fraco/forte).],
    [Explico por que dois instrumentos tocando a mesma nota soam diferentes.],
    [Toco harmônicos naturais limpos nas casas 12, 7 e 5.],
  ),
  titulo: "Autoavaliação",
)

#gabarito[
  #resposta(1)[a) harmonia · b) melodia · c) ritmo · d) harmonia.]
  #resposta(2)[a) intensidade · b) altura · c) timbre · d) duração · e) timbre (perto da ponte o som fica mais brilhante; perto da boca, mais aveludado — a nota é a mesma, muda a mistura de harmônicos).]
  #resposta(3)[
    Lá 440 Hz: 220 Hz · 880 Hz · 1.760 Hz. \
    Mi 82 Hz: 41 Hz · 164 Hz · 328 Hz. \
    Ré 147 Hz: 73,5 Hz · 294 Hz · 588 Hz.
  ]
  #resposta(4)[1º: 82 Hz (fundamental) · 2º: 164 Hz (1 oitava) · 3º: 246 Hz (1 oitava + 5ª justa, nota Si) · 4º: 328 Hz (2 oitavas, nota Mi).]
  #resposta(5)[
    a) F — 880 Hz é mais *agudo* (frequência maior; é o Lá uma oitava acima de 440 Hz). \
    b) V. \
    c) F — todo som de instrumento contém a fundamental e vários harmônicos. \
    d) V.
  ]
  #resposta(6)[Exercício prático — os harmônicos das casas 12 e 5 soam na mesma nota da corda solta (uma e duas oitavas acima, respectivamente); o da casa 7 soa uma nota diferente, a 5ª justa da nota da corda, uma oitava acima. Critério de sucesso: os 18 harmônicos soam limpos, como um sino, sem ruído de corda apertada.]
]
