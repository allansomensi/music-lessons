#import "/templates/layout.typ": *
#import "/templates/components.typ": *

#show: aula.with(
  instrumento: "Violão",
  nivel: "Iniciante",
)

// Exercício que não se divide entre páginas (enunciado + área de resposta juntos)
#let ex(..args) = block(breakable: false, above: 1.5em, below: 0.9em, exercicio(..args))

// ============================================================
// HELPERS LOCAIS — notas do braço calculadas a partir da afinação
// ============================================================
// Afinação padrão (E A D G B E), classes de altura 0 = C.
// A primeira linha é a 6ª corda (Mi grave), como no componente braco-notas.
#let nomes-notas = ("C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B")
#let afinacao = (4, 9, 2, 7, 11, 4)
#let mapa(ini, fim, filtro) = afinacao.map(a => range(ini, fim + 1).map(c => filtro(calc.rem(a + c, 12))))
#let so-naturais = pc => if nomes-notas.at(pc).len() == 1 { nomes-notas.at(pc) } else { "" }

// Cartão de tipo de violão: imagem acima, texto abaixo.
#let tipo-violao(img, titulo, corpo) = block(
  width: 100%,
  breakable: false,
  fill: color-subtle-bg,
  stroke: 0.5pt + color-rule-dark,
  radius: 5pt,
  inset: 10pt,
  [
    #align(center, image(img, height: 2.6cm))
    #v(0.2em)
    #text(weight: "bold", size: 10.5pt, titulo)
    #v(0.1em)
    #set text(size: 9pt)
    #set par(justify: false)
    #corpo
  ],
)

= Anatomia do Violão

Conhecer o seu instrumento é o primeiro passo para tocar bem e conversar com professores e outros músicos. Neste material você vai aprender o nome e a função de cada parte do violão, a afinação das seis cordas, os principais tipos de violão e de cordas e os cuidados básicos com o instrumento.

#objetivos((
  [Identificar as partes do violão e a função de cada uma.],
  [Conhecer o número, a nota e a afinação de cada corda (Mi – Lá – Ré – Sol – Si – Mi).],
  [Localizar as notas naturais nas primeiras casas e afinar o violão pela casa 5.],
  [Diferenciar os principais tipos de violão e de encordoamento.],
))

== 1. As partes do violão

#align(center)[
  #image("attachments/anatomia-violao.png", width: 84%)
  #v(-0.6em)
  #text(size: 8pt, fill: color-muted)[Ilustração: feh-lipe-dev.github.io/guitarpedia]
]

#tabela(
  ([*Parte*], [*Função*]),
  (
    ([*Mão*], [Extremidade do braço onde ficam as tarraxas.]),
    ([*Tarraxas*], [Prendem e esticam as cordas. Girá-las deixa a corda mais aguda ou mais grave: é assim que se afina o violão.]),
    ([*Pestana* (peça)], [Peça com sulcos, entre a mão e o braço, onde as cordas se apoiam. Não confunda com a _pestana_ técnica, em que um dedo pressiona várias cordas ao mesmo tempo.]),
    ([*Braço* e *escala*], [O braço é a peça longa por onde a mão esquerda se desloca; a escala é a face dele onde os dedos pressionam as cordas.]),
    ([*Trastes*], [Filetes de metal fixados na escala.]),
    ([*Casas*], [Espaços entre dois trastes. Cada casa equivale a *um semitom*: subir uma casa deixa a nota meio tom mais aguda.]),
    ([*Marcadores*], [Pontos na lateral ou na escala (casas 3, 5, 7, 9 e 12) que ajudam a se localizar no braço.]),
    ([*Corpo* (caixa acústica)], [Caixa oca formada pelo *tampo* (a frente), pelas laterais e pelo fundo. Ela amplia a vibração das cordas e dá volume ao som.]),
    ([*Boca*], [Abertura no tampo por onde o som projetado pela caixa sai.]),
    ([*Cavalete* e *rastilho*], [O cavalete prende as cordas no tampo; o rastilho é a peça fina sobre ele onde as cordas se apoiam e transmitem a vibração.]),
  ),
  columns: (1.3fr, 3.7fr),
  alinhamento: (left + horizon, left + horizon),
)

#caixa(tipo: "atencao", titulo: "Traste ou casa?")[
  *Traste* é a peça de metal; *casa* é o espaço entre dois trastes. Ao tocar, você pressiona a corda *dentro da casa*, logo atrás do traste — e é pela casa que contamos as posições (casa 1, casa 2…).
]

== 2. As cordas e a afinação padrão

O violão tem *seis cordas*, numeradas da *mais fina* (1ª) para a *mais grossa* (6ª). Na afinação padrão, da mais grave para a mais aguda:

#tabela(
  ([*Corda*], [*6ª*], [*5ª*], [*4ª*], [*3ª*], [*2ª*], [*1ª*]),
  (
    ([Nota], [Mi grave], [Lá], [Ré], [Sol], [Si], [Mi agudo]),
    ([Cifra], [E], [A], [D], [G], [B], [E]),
  ),
  columns: (1fr,) + (1fr,) * 6,
)

A 6ª e a 1ª corda têm o mesmo nome (Mi), mas a 1ª soa *duas oitavas acima*. Uma frase ajuda a memorizar a ordem, da 6ª para a 1ª: "*Eu Amo Dar Gargalhadas Bem Escandalosas*" (E – A – D – G – B – E).

=== As notas naturais nas primeiras casas

O diagrama mostra as *notas naturais* (sem sustenido ou bemol) da corda solta (casa 0) até a casa 5. A linha de cima é a *6ª corda (Mi grave)*; a de baixo, a *1ª corda (Mi agudo)* — a mesma orientação de quem olha o próprio braço tocando. Entre Mi–Fá e Si–Dó não há nota intermediária: por isso, nessas notas, a casa seguinte já é a próxima nota natural.

#align(center)[
  #braco-notas(mapa(0, 5, so-naturais), fs: 0, cordas: ("6", "5", "4", "3", "2", "1"), casa-largura: 34pt)
]

=== Afinando pela casa 5

Observe no diagrama: a *casa 5* de cada corda tem a mesma nota da corda solta seguinte — com *uma exceção*, a 3ª corda, em que a casa usada é a *4*:

#tabela(
  ([*Toque…*], [*6ª, casa 5*], [*5ª, casa 5*], [*4ª, casa 5*], [*3ª, casa 4*], [*2ª, casa 5*]),
  (([…e compare com], [5ª solta (Lá)], [4ª solta (Ré)], [3ª solta (Sol)], [2ª solta (Si)], [1ª solta (Mi)]),),
  columns: (1.3fr,) + (1fr,) * 5,
)

Afine primeiro a 6ª corda com um afinador eletrônico ou aplicativo. Depois, use a tabela: toque a casa indicada, em seguida a corda solta seguinte, e gire a tarraxa da corda solta até as duas soarem iguais. Ao afinar, comece *abaixo* da nota e suba até ela — a afinação se mantém por mais tempo.

== 3. Tipos de violão

Existem vários modelos de violão, cada um com um timbre e um uso mais comum. Os quatro principais:

#grid(
  columns: (1fr, 1fr),
  rows: auto,
  gutter: 0.9em,
  tipo-violao("attachments/violao-classico.png", "Clássico (nylon)", [
    O modelo mais tradicional: cordas de nylon e braço um pouco mais largo. Som aveludado e quente. É o mais indicado para iniciantes, pelo conforto das cordas, e a base da bossa nova, da MPB e da música erudita.
  ]),
  tipo-violao("attachments/violao-folk.png", "Folk (aço)", [
    Cordas de aço e corpo maior, com mais volume, brilho e graves marcantes. O braço costuma ser mais fino que o do clássico. Muito usado no pop, no rock acústico, no sertanejo e no country.
  ]),
  tipo-violao("attachments/violao-flat.png", "Flat", [
    Caixa acústica bem mais fina, com pouco volume sem amplificação: é feito para ser ligado a um amplificador. É confortável e gera menos microfonia no palco. Existe com cordas de nylon ou de aço.
  ]),
  tipo-violao("attachments/violao-7-cordas.png", "Violão de 7 cordas", [
    Tem uma corda grave extra, geralmente afinada em Dó ou Si. Na versão com cordas de nylon, é essencial no choro e no samba, onde faz as linhas graves que acompanham a harmonia — as famosas "baixarias".
  ]),
)

== 4. Encordoamento

As cordas definem boa parte do timbre e do conforto ao tocar.

#caixa(tipo: "atencao")[
  *Nunca coloque cordas de aço num violão feito para nylon.* A tensão das cordas de aço é muito maior e pode empenar o braço ou arrancar o cavalete.
]

#block(breakable: false, cartoes-info((
  (titulo: "Cordas de nylon", corpo: [
    Macias ao toque, com som suave e aveludado. São vendidas por *tensão*:
    - *Leve ou média:* mais fáceis de pressionar; as mais indicadas para quem está começando e formando calos. Volume um pouco menor.
    - *Alta:* mais ataque e projeção, mas exigem mais força dos dedos. Preferidas por violonistas clássicos e de flamenco.
  ]),
  (titulo: "Cordas de aço", corpo: [
    Timbre brilhante, ótimo com palheta. São vendidas por *calibre* (a espessura da 1ª corda, em milésimos de polegada):
    - *.010 (extra leve):* confortáveis, porém com menos volume e graves.
    - *.011 a .012 (leve):* as mais usadas; bom equilíbrio entre som e conforto.
    - *.013 ou mais (média/pesada):* som potente, mas cansam a mão mais rápido.
  ]),
)))

== 5. Cuidados com o instrumento

- *Clima:* o violão é feito de madeiras finas e sensíveis. Não o deixe no sol nem dentro de um carro quente: a madeira pode ressecar, rachar ou o cavalete pode descolar.
- *Madeira do tampo:* tampos *maciços* vibram mais livremente e o som melhora com o tempo de uso; tampos *laminados* soam menos, mas resistem melhor a variações de clima.
- *Limpeza:* passe uma flanela seca e limpa nas cordas e no braço depois de tocar. Retirar o suor prolonga bastante a vida das cordas.

== 6. Exercícios

#ex(titulo: "Qual é a parte?", nivel: "Escrita")[
  Escreva o nome da parte do violão descrita em cada item.

  #v(0.3em)
  #tabela-preencher(
    ([*Descrição*], [*Parte*]),
    (
      ([a) Giram para afinar as cordas.], none),
      ([b) Filetes de metal que dividem a escala.], none),
      ([c) Abertura no tampo por onde o som sai.], none),
      ([d) Espaço entre dois trastes, onde o dedo pressiona a corda.], none),
      ([e) Prende as cordas no tampo do violão.], none),
      ([f) A frente da caixa acústica.], none),
    ),
    columns: (3fr, 1.3fr),
    alinhamento: (left + horizon, center + horizon),
  )
]

#ex(titulo: "As seis cordas", nivel: "Escrita")[
  Complete com o nome e a cifra da nota de cada corda solta.

  #v(0.3em)
  #tabela-preencher(
    ([*Corda*], [*6ª*], [*5ª*], [*4ª*], [*3ª*], [*2ª*], [*1ª*]),
    (
      ([Nome], none, none, none, none, none, none),
      ([Cifra], none, none, none, none, none, none),
    ),
    columns: (1fr,) + (1fr,) * 6,
  )
]

#ex(titulo: "As notas naturais nas primeiras casas", nivel: "Escrita")[
  Sem olhar o diagrama da seção 2, escreva as notas naturais (C, D, E, F, G, A, B) nas casas 0 a 5 de cada corda. Deixe em branco as casas de sustenido/bemol.

  #v(0.3em)
  #align(center)[#braco-vazio(casas: 6, fs: 0, num-cordas: 6, cordas: ("6", "5", "4", "3", "2", "1"), casa-largura: 34pt)]
]

#ex(titulo: "Tipos de violão e de cordas", nivel: "Escrita")[
  a) Qual tipo de violão é o mais indicado para iniciantes? Por quê? \
  b) Por que não se deve colocar cordas de aço num violão de nylon? \
  c) Qual violão é típico do choro e o que ele tem de diferente? \
  d) Na afinação pela casa 5, qual corda é a exceção e qual casa se usa nela?

  #linhas-resposta(4)
]

#ex(titulo: "Afinação pela casa 5", nivel: "Prática")[
  Afine a 6ª corda com um afinador. Depois, afine as outras cinco cordas usando apenas o método da seção 2. No fim, confira cada corda com o afinador e anote quantas estavam afinadas: #box(width: 2cm, line(length: 100%, stroke: 0.5pt + color-rule-dark)) de 5.
]

=== Sugestão de prática

#block(breakable: false, rotina-estudo((
  ([Dizer em voz alta o nome das partes do violão, apontando cada uma], [2 min], [—]),
  ([Tocar as cordas soltas da 6ª à 1ª, dizendo número, nome e cifra], [3 min], [60]),
  ([Afinar pela casa 5 (casa 4 na 3ª corda) e conferir com o afinador], [5 min], [—]),
  ([Tocar as notas naturais das casas 0 a 5, corda por corda, dizendo o nome], [5 min], [60]),
)))

#v(0.6em)

#checklist(
  (
    [Sei o nome e a função das principais partes do violão.],
    [Sei a diferença entre traste e casa.],
    [Digo a nota de cada corda solta, da 6ª à 1ª: Mi, Lá, Ré, Sol, Si, Mi.],
    [Afino o violão pela casa 5, lembrando da exceção na 3ª corda.],
    [Explico a diferença entre violão de nylon, de aço, flat e de 7 cordas.],
  ),
  titulo: "Autoavaliação",
)

#gabarito[
  #resposta(1)[a) tarraxas · b) trastes · c) boca · d) casa · e) cavalete · f) tampo.]
  #resposta(2)[6ª Mi (E) · 5ª Lá (A) · 4ª Ré (D) · 3ª Sol (G) · 2ª Si (B) · 1ª Mi (E).]
  #resposta(3)[
    #align(center)[#braco-notas(mapa(0, 5, so-naturais), fs: 0, cordas: ("6", "5", "4", "3", "2", "1"), casa-largura: 34pt)]
  ]
  #resposta(4)[
    a) O clássico (nylon): as cordas de nylon são macias e mais fáceis de pressionar. \
    b) A tensão do aço é muito maior e pode empenar o braço ou arrancar o cavalete. \
    c) O violão de 7 cordas: tem uma corda grave extra (Dó ou Si), usada nas "baixarias". \
    d) A 3ª corda (Sol): usa-se a casa 4 para comparar com a 2ª corda solta (Si).
  ]
  #resposta(5)[Exercício prático — critério de sucesso: as cinco cordas conferem afinadas no afinador (ou com desvio mínimo, corrigido em seguida).]
]
