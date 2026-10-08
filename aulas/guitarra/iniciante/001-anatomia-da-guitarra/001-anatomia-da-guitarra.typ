#import "/templates/layout.typ": *
#import "/templates/components.typ": *
#import "/templates/components.typ": caixa as caixa-modelo

#show: aula.with(
  instrumento: "Guitarra",
  nivel: "Iniciante",
)

// Texto de tabelas em 9,5pt (corpo do texto continua em 11pt)
#show table: set text(size: 9.5pt)

// Caixas com texto em 10pt (rótulo e corpo no mesmo tamanho)
#let caixa(..args) = {
  set text(size: 10pt)
  caixa-modelo(..args)
}

// Exercício que não se divide entre páginas (enunciado + área de resposta juntos)
#let ex(..args) = block(breakable: false, exercicio(..args))

// Imagem + texto lado a lado, com espaçamento uniforme entre os itens
#let item-imagem(img, corpo, invertido: false) = block(
  breakable: false,
  above: 1.6em,
  below: 1.6em,
  explainer-component(img, corpo, inverted: invertido),
)

= Anatomia da Guitarra

Conhecer o instrumento pelo nome de cada parte facilita tudo o que vem depois: entender uma explicação, ajustar o timbre, escolher cordas e conversar com um luthier. Neste material você vai conhecer as partes da guitarra elétrica, os principais tipos de captador e de ponte e como o calibre das cordas influencia o som e o conforto.

#objetivos((
  [Identificar as partes da guitarra e a função de cada uma],
  [Diferenciar *traste* (a peça de metal) de *casa* (o espaço onde o dedo pressiona)],
  [Reconhecer os tipos de captador (single coil, humbucker, ativo e P90) e o som de cada um],
  [Comparar ponte fixa, tremolo e Floyd Rose],
  [Escolher um calibre de cordas adequado ao seu momento de estudo],
))

== 1. As partes da guitarra

#align(center, block(breakable: false)[
  #image("attachments/anatomia-guitarra.jpg", width: 54%)
  #v(-0.5em)
  #text(size: 8pt, fill: color-muted)[Imagem: wesleylylycaesar.net/anatomia-da-guitarra]
])

Muitos termos de guitarra são usados em inglês no dia a dia. A tabela abaixo reúne os nomes em português, o equivalente em inglês e a função de cada parte.

#tabela(
  columns: (1.25fr, 1fr, 2.6fr),
  alinhamento: (left + horizon, left + horizon, left + horizon),
  ([Parte], [Em inglês], [Função]),
  (
    ([*Cabeça*], [_headstock_], [Extremidade do braço onde ficam as tarraxas.]),
    ([*Tarraxas*], [_tuners_], [Esticam ou afrouxam cada corda para afiná-la.]),
    ([*Capotraste*], [_nut_], [Peça com sulcos na ponta do braço que guia as cordas e marca o início da escala. Não confunda com a _pestana_, técnica em que um dedo pressiona várias cordas.]),
    ([*Braço*], [_neck_], [Parte longa de madeira por onde a mão esquerda se desloca.]),
    ([*Escala*], [_fingerboard_], [Superfície do braço, dividida em casas, onde os dedos pressionam as cordas.]),
    ([*Trastes*], [_frets_], [Filetes de metal cravados na escala. Ao pressionar a corda, ela encosta no traste e a nota muda.]),
    ([*Casas*], [—], [Espaço entre dois trastes. É aqui que o dedo fica: "3ª casa" é o espaço entre o 2º e o 3º traste.]),
    ([*Corpo*], [_body_], [Base de madeira que sustenta captadores, ponte e controles.]),
    ([*Captadores*], [_pickups_], [Transformam a vibração das cordas em sinal elétrico.]),
    ([*Chave seletora*], [_pickup selector_], [Escolhe qual captador (ou combinação) está ligado.]),
    ([*Volume e tonalidade*], [_knobs_], [Controlam a intensidade do sinal e o brilho (agudos) do som.]),
    ([*Ponte*], [_bridge_], [Prende as cordas no corpo e ajusta altura e afinação de cada uma.]),
    ([*Alavanca*], [_tremolo arm_], [Presente em pontes móveis: altera a afinação de todas as cordas ao mesmo tempo.]),
    ([*Pino de correia*], [_strap button_], [Onde se prende a correia (o _strap lock_ é uma trava para ela não soltar).]),
  ),
)

#caixa(tipo: "resumo", titulo: "Numeração das cordas")[
  As cordas são contadas da *mais fina para a mais grossa*: a *1ª corda* é o Mi agudo (a mais fina, mais perto do chão quando você segura a guitarra) e a *6ª corda* é o Mi grave (a mais grossa). Da 6ª para a 1ª: *Mi – Lá – Ré – Sol – Si – Mi*.
]

== 2. Captadores

Os captadores (_pickups_) funcionam como microfones das cordas: um ímã envolto por uma bobina de fio de cobre transforma a vibração das cordas de aço em sinal elétrico, que segue pelo cabo até o amplificador. O tipo de captador é um dos fatores que mais definem o timbre da guitarra.

#item-imagem(
  image("attachments/captador-singlecoil.svg", width: 100%),
  [
    *Single coil.* Uma única bobina. Som brilhante, estalado e definido, muito usado em blues, rock, pop, funk e country. Por ter uma bobina só, capta também interferências elétricas e produz um leve zumbido (_hum_).
  ],
)

#item-imagem(
  image("attachments/captador-humbucker.svg", width: 100%),
  invertido: true,
  [
    *Humbucker.* Duas bobinas ligadas de forma a cancelar o zumbido — daí o nome (_hum_ = zumbido, _buck_ = combater). Som mais encorpado, quente e com mais volume, ideal para distorções pesadas. Comum no rock, no hard rock e no heavy metal.
  ],
)

#item-imagem(
  image("attachments/captador-ativo.svg", width: 100%),
  [
    *Captador ativo.* Tem um pré-amplificador interno alimentado por bateria (geralmente de 9 V). Entrega sinal forte, compressão natural e ruído muito baixo. Muito usado no metal moderno e em afinações mais graves. Quando a bateria acaba, a guitarra fica sem som — tenha sempre uma reserva.
  ],
)

#item-imagem(
  image("attachments/captador-p90.svg", width: 100%),
  invertido: true,
  [
    *P90.* Tecnicamente é um single coil, mas com bobina mais larga e baixa, o que lhe dá um som entre o single coil e o humbucker: mais gordo que o primeiro e mais "sujo" e expressivo que o segundo. Comum no punk rock, no rock alternativo e no blues.
  ],
)

#caixa(tipo: "dica", titulo: "Chave seletora na prática")[
  O captador *do braço* soa mais grave e suave (bom para bases limpas e solos melódicos); o captador *da ponte* soa mais agudo e incisivo (bom para riffs e distorção). Toque o mesmo acorde em cada posição da chave e compare.
]

== 3. Ponte

A ponte prende as cordas no corpo da guitarra. Ela influencia a estabilidade da afinação, o _sustain_ (quanto tempo a nota continua soando), a forma de tocar e a facilidade de trocar as cordas. Os principais tipos são:

#item-imagem(
  image("attachments/ponte-fixa.svg", width: 100%),
  [
    *Ponte fixa.* Não tem molas nem alavanca: a vibração passa direto para o corpo. É o tipo mais estável, com ótimo _sustain_ e troca de cordas simples. É a ponte das guitarras Les Paul e SG. \
    _Usada por: James Hetfield, Angus Young._
  ],
)

#item-imagem(
  image("attachments/ponte-tremolo.svg", width: 100%),
  invertido: true,
  [
    *Ponte tremolo.* A ponte da Fender Stratocaster. Um conjunto de molas na parte de trás do corpo permite usar a alavanca para baixar a afinação (e subir um pouco, se a ponte for regulada "flutuando"). É presa por 6 parafusos (modelo vintage) ou por 2 pivôs (modelo moderno). \
    _Usada por: Jimi Hendrix, Stevie Ray Vaughan, John Mayer._
  ],
)

#item-imagem(
  image("attachments/ponte-floyd.svg", width: 100%),
  [
    *Floyd Rose (ponte flutuante).* Padrão das guitarras do tipo superstrato. Trava as cordas na ponte e no capotraste, o que permite alavancadas extremas para cima e para baixo sem desafinar. Em troca, trocar cordas e afinar é um processo mais demorado e técnico. \
    _Usada por: Eddie Van Halen, Steve Vai, Joe Satriani._
  ],
)

== 4. Encordoamento

O *calibre* é a espessura das cordas, indicado em milésimos de polegada pela corda mais fina: um jogo ".009" tem a 1ª corda com 0,009" de espessura. Quanto mais grosso o jogo, mais força você precisa fazer para pressionar as cordas e fazer _bends_ (puxar a corda para os lados para subir a nota) — e mais corpo e volume o som tende a ter.

#tabela(
  columns: (1.15fr, 2.6fr, 1.45fr),
  alinhamento: (left + horizon, left + horizon, left + horizon),
  ([Calibre], [Características], [Usado por]),
  (
    ([*Super leve* \ .007 e .008], [Tensão muito baixa: _bends_ e vibratos com pouquíssimo esforço e menos cansaço. Som mais fino, com menos corpo.], [Yngwie Malmsteen, Tony Iommi, Billy Gibbons]),
    ([*Leve* \ .009], [Padrão da indústria: a maioria das guitarras sai de fábrica com ele. Bom equilíbrio entre conforto para solos e firmeza para acordes. *Ideal para começar.*], [Eddie Van Halen, Steve Vai]),
    ([*Médio e pesado* \ .010, .011 ou mais], [Som mais encorpado, com mais graves e volume. Exige mais força nos _bends_. Indicado para escalas mais curtas e afinações mais graves.], [Stevie Ray Vaughan, Slash, James Hetfield]),
  ),
)

#caixa(tipo: "neutro", titulo: "Comprimento da escala")[
  O mesmo jogo .010 parece mais macio numa Gibson (escala de 24,75", cerca de 62,9 cm) do que numa Fender (25,5", cerca de 64,8 cm). Em uma escala mais longa, a corda precisa de mais tensão para chegar à mesma nota.
]

== 5. Cuidados com o instrumento

- *Temperatura e umidade.* O braço é de madeira e reage ao ambiente. Sol direto, carro fechado ou mudanças bruscas de clima podem empenar o braço, alterar a altura das cordas e prejudicar a afinação.
- *Zumbido que para ao tocar nas cordas.* Se a guitarra chia e o ruído diminui quando você encosta nas cordas ou na ponte, o aterramento está funcionando: seu corpo age como uma antena de ruído, e ao tocar nas partes metálicas esse ruído é descarregado para o terra do circuito.
- *Limpeza.* Passe um pano seco nas cordas e na escala depois de tocar. O suor oxida as cordas e deixa o som opaco.
- *Troca de cordas.* Quando as cordas perdem o brilho, ficam ásperas ou não seguram a afinação, é hora de trocar o jogo inteiro.

== 6. Exercícios

#ex(titulo: "Nomeie as partes")[
  Escreva o nome da parte da guitarra que corresponde a cada descrição.

  #tabela-preencher(
    columns: (2.6fr, 1.4fr),
    alinhamento: (left + horizon, left + horizon),
    ([Descrição], [Parte]),
    (
      ([a) Filete de metal cravado na escala], none),
      ([b) Gira para esticar ou afrouxar a corda], none),
      ([c) Transforma a vibração da corda em sinal elétrico], none),
      ([d) Escolhe qual captador está ligado], none),
      ([e) Prende as cordas no corpo da guitarra], none),
      ([f) Peça com sulcos que guia as cordas no início da escala], none),
    ),
  )
]

#ex(titulo: "Traste ou casa?")[
  Explique com suas palavras a diferença entre *traste* e *casa*. Depois responda: ao tocar "a 5ª casa", entre quais trastes fica o seu dedo?

  #linhas-resposta(3)
]

#ex(titulo: "As cordas soltas")[
  Complete a tabela com o nome da nota de cada corda solta (em português e em cifra).

  #tabela-preencher(
    columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
    ([Corda], [6ª], [5ª], [4ª], [3ª], [2ª], [1ª]),
    (
      ([Nota], none, none, none, none, none, none),
      ([Cifra], none, none, none, none, none, none),
    ),
  )
]

#ex(titulo: "Qual captador?")[
  Indique o tipo de captador (single coil, humbucker, ativo ou P90) que corresponde a cada descrição.

  #tabela-preencher(
    columns: (2.8fr, 1.2fr),
    alinhamento: (left + horizon, left + horizon),
    ([Descrição], [Captador]),
    (
      ([a) Precisa de bateria de 9 V para funcionar], none),
      ([b) Duas bobinas que cancelam o zumbido], none),
      ([c) Bobina única; som brilhante e estalado], none),
      ([d) Single coil de bobina larga, som entre os outros dois tipos passivos], none),
    ),
  )
]

#ex(titulo: "Escolhendo ponte e cordas")[
  Responda:

  a) Um guitarrista quer a máxima estabilidade de afinação e troca de cordas simples, sem usar alavanca. Qual ponte você indicaria?

  #linhas-resposta(1)

  b) Outro quer fazer alavancadas extremas para cima e para baixo. Qual ponte é a mais indicada? Qual a desvantagem dela?

  #linhas-resposta(2)

  c) Um aluno iniciante sente muita dor nos dedos com cordas .011. Que calibre você sugeriria e por quê?

  #linhas-resposta(2)
]

#ex(titulo: "Conhecendo a sua guitarra")[
  Observe o seu instrumento e anote: tipo de captadores (e quantos são), tipo de ponte, número de posições da chave seletora e, se souber, o calibre das cordas.

  #linhas-resposta(3)
]

=== Sugestão de prática

#rotina-estudo((
  ([Apontar e dizer em voz alta o nome de cada parte da sua guitarra], [5 min], [—]),
  ([Tocar as cordas soltas da 6ª à 1ª dizendo o nome de cada uma], [5 min], [—]),
  ([Tocar um acorde em cada posição da chave seletora e comparar os timbres], [5 min], [—]),
  ([Limpar cordas e escala ao terminar de tocar], [2 min], [—]),
))

#block(breakable: false, checklist(
  titulo: "Autoavaliação",
  (
    [Sei nomear as partes da guitarra e dizer para que serve cada uma.],
    [Sei a diferença entre traste e casa.],
    [Sei a numeração e o nome das cordas soltas.],
    [Reconheço o tipo de captador e de ponte da minha guitarra.],
    [Sei escolher um calibre de corda adequado para começar.],
  ),
))

#gabarito[
  #resposta(1)[a) Traste. #h(0.6em) b) Tarraxa. #h(0.6em) c) Captador. #h(0.6em) d) Chave seletora. #h(0.6em) e) Ponte. #h(0.6em) f) Capotraste (_nut_).]
  #resposta(2)[O *traste* é o filete de metal cravado na escala; a *casa* é o espaço entre dois trastes, onde o dedo pressiona a corda. Na 5ª casa, o dedo fica entre o 4º e o 5º traste (de preferência logo atrás do 5º).]
  #resposta(3)[6ª Mi (E) · 5ª Lá (A) · 4ª Ré (D) · 3ª Sol (G) · 2ª Si (B) · 1ª Mi (E).]
  #resposta(4)[a) Ativo. #h(0.6em) b) Humbucker. #h(0.6em) c) Single coil. #h(0.6em) d) P90.]
  #resposta(5)[a) Ponte fixa. b) Floyd Rose; a desvantagem é que trocar cordas e afinar é mais demorado e técnico. c) Um jogo .009 (ou até .008): exige menos força para pressionar as cordas, o que diminui a dor enquanto os dedos criam calos e a técnica se desenvolve.]
  #resposta(6)[Resposta pessoal. Confira com o professor se identificou corretamente os captadores e a ponte do seu instrumento.]
]
