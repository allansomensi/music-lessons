#import "/templates/layout.typ": *
#import "/templates/components.typ": *

#show: aula.with(
  instrumento: "Baixo",
  nivel: "Iniciante",
)

// Exercício que não se divide entre páginas (enunciado + área de resposta juntos)
#let ex(..args) = block(breakable: false, above: 1.5em, below: 0.9em, exercicio(..args))

// ============================================================
// HELPERS LOCAIS — notas do braço calculadas a partir da afinação
// ============================================================
// Afinação padrão do baixo de 4 cordas (E A D G), classes de altura 0 = C.
// A primeira linha é a 4ª corda (Mi grave), como no componente braco-notas.
#let nomes-notas = ("C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B")
#let afinacao-baixo = (4, 9, 2, 7)
#let mapa-baixo(ini, fim, filtro) = afinacao-baixo.map(a => range(ini, fim + 1).map(c => filtro(calc.rem(a + c, 12))))
#let so-naturais = pc => if nomes-notas.at(pc).len() == 1 { nomes-notas.at(pc) } else { "" }
#let todas = pc => nomes-notas.at(pc)

// Cartão de tipo de baixo: imagem à esquerda, texto à direita.
#let tipo-baixo(img, titulo, corpo) = block(
  width: 100%,
  fill: color-subtle-bg,
  stroke: 0.5pt + color-rule-dark,
  radius: 5pt,
  inset: 10pt,
  grid(
    columns: (auto, 1fr),
    column-gutter: 10pt,
    align: (center + horizon, left + top),
    image(img, height: 4.4cm),
    [
      #text(weight: "bold", size: 10.5pt, titulo)
      #v(0.2em)
      #set text(size: 9pt)
      #set par(justify: false)
      #corpo
    ],
  ),
)

= Anatomia do Baixo

O contrabaixo elétrico — ou simplesmente baixo — é o instrumento que une o ritmo da bateria à harmonia da banda. Antes de tocar, vale conhecer bem o seu instrumento: o nome de cada parte, como as cordas são afinadas, que tipos de baixo existem e como escolher e cuidar das cordas.

#objetivos((
  [Identificar as partes do baixo e a função de cada uma.],
  [Conhecer o nome e a nota de cada corda na afinação padrão (Mi – Lá – Ré – Sol).],
  [Localizar as notas naturais no braço e afinar o baixo pela casa 5.],
  [Diferenciar os principais tipos de encordoamento e de baixo.],
))

== 1. As partes do baixo

#align(center)[
  #image("attachments/anatomia-baixo.jpg", width: 62%)
  #v(-0.6em)
  #text(size: 8pt, fill: color-muted)[Ilustração: contrabaixoeletrico.com.br]
]

#tabela(
  ([*Parte*], [*Função*]),
  (
    ([*Mão* (_headstock_)], [Extremidade do braço onde ficam as tarraxas.]),
    ([*Tarraxas*], [Prendem e esticam as cordas. Girá-las deixa a corda mais aguda ou mais grave: é assim que se afina.]),
    ([*Pestana*], [Peça com pequenos sulcos, entre a mão e o braço, onde as cordas se apoiam.]),
    ([*Braço*], [Parte longa por onde a mão esquerda se desloca. Dentro dele há o *tensor* (_truss rod_), uma barra de aço que corrige a curvatura.]),
    ([*Escala*], [Face do braço onde os dedos pressionam as cordas.]),
    ([*Trastes*], [Filetes de metal fixados na escala.]),
    ([*Casas*], [Espaços entre dois trastes. Cada casa equivale a *um semitom*: subir uma casa deixa a nota meio tom mais aguda.]),
    ([*Marcadores*], [Bolinhas na escala (casas 3, 5, 7, 9 e 12, esta com marcação dupla) que ajudam a se localizar no braço.]),
    ([*Corpo*], [Base de madeira onde ficam os captadores, os controles e a ponte.]),
    ([*Captadores*], [Ímãs envoltos em fio que captam a vibração das cordas e a transformam em sinal elétrico.]),
    ([*Controles* (_knobs_)], [Botões de volume e de tonalidade (mais ou menos agudos). Com dois captadores, permitem dosar cada um.]),
    ([*Ponte*], [Prende as cordas no corpo e permite regular a altura das cordas e a afinação ao longo do braço.]),
    ([*Entrada do cabo* (_jack_)], [Onde se conecta o cabo que leva o som ao amplificador.]),
  ),
  columns: (1.3fr, 3.7fr),
  alinhamento: (left + horizon, left + horizon),
)

#caixa(tipo: "atencao", titulo: "Traste ou casa?")[
  *Traste* é a peça de metal; *casa* é o espaço entre dois trastes. Ao tocar, você pressiona a corda *dentro da casa*, logo atrás do traste — e é pela casa que contamos as posições (casa 1, casa 2…).
]

== 2. As cordas e a afinação padrão

O baixo mais comum tem *quatro cordas*. Elas são numeradas da mais fina (1ª) para a mais grossa (4ª) e afinadas, da mais grave para a mais aguda, em *Mi – Lá – Ré – Sol* (E – A – D – G):

#tabela(
  ([*Corda*], [*Nota (corda solta)*], [*Cifra*], [*Espessura*]),
  (
    ([4ª], [Mi grave], [E], [a mais grossa]),
    ([3ª], [Lá], [A], [grossa]),
    ([2ª], [Ré], [D], [fina]),
    ([1ª], [Sol], [G], [a mais fina]),
  ),
  columns: (0.8fr, 1.4fr, 0.8fr, 1.3fr),
  width: 80%,
)

As cordas do baixo têm as mesmas notas das quatro cordas mais graves do violão e da guitarra, mas soam *uma oitava abaixo*. Para memorizar a ordem, da 4ª para a 1ª: *Mi, Lá, Ré, Sol* — cada corda está cinco casas (uma quarta justa) acima da anterior.

=== As notas naturais no braço

O diagrama mostra as *notas naturais* (sem sustenido ou bemol) das casas 1 a 12. A linha de cima é a *4ª corda (Mi grave)*; a de baixo, a *1ª corda (Sol)*. Lembre-se de que entre Mi–Fá e Si–Dó não há nota intermediária (a distância é de uma casa só); entre as outras notas naturais há sempre uma casa vazia, que é o sustenido/bemol.

#align(center)[
  #braco-notas(mapa-baixo(1, 12, so-naturais), fs: 1, cordas: ("E", "A", "D", "G"))
]

Na *casa 12* cada corda repete a nota da corda solta, uma oitava acima — por isso essa casa tem a marcação dupla.

=== Afinando pela casa 5

Repare no diagrama: a *casa 5* de cada corda tem a mesma nota da corda solta seguinte (Mi casa 5 = Lá; Lá casa 5 = Ré; Ré casa 5 = Sol). Isso permite conferir a afinação de ouvido:

#passos((
  [Afine a *4ª corda (Mi)* com um afinador eletrônico ou aplicativo — ela será a referência.],
  [Toque a *casa 5 da 4ª corda* e, em seguida, a *3ª corda solta*. As duas devem soar iguais; se não, gire a tarraxa da 3ª corda até igualar.],
  [Repita com a *casa 5 da 3ª corda* e a *2ª corda solta*, e depois com a *casa 5 da 2ª corda* e a *1ª corda solta*.],
))

Ao afinar, comece sempre *abaixo* da nota e suba até ela: assim a corda se acomoda na tarraxa e a afinação dura mais.

== 3. Encordoamento

As cordas definem boa parte do timbre, do ataque e do conforto ao tocar. Dois aspectos importam na escolha: o tipo de enrolamento e o calibre (espessura).

=== Tipo de enrolamento

#block(breakable: false, cartoes-info((
  (titulo: [_Roundwound_ (fio redondo)], corpo: [As mais comuns e versáteis. Superfície levemente áspera, som brilhante, com bastante ataque e sustentação. Ótimas para rock, pop e _slap_.]),
  (titulo: [_Flatwound_ (fio liso)], corpo: [Superfície lisa e polida. Som mais abafado e "gordo", lembrando os baixos antigos. Muito usadas em jazz, soul e reggae; desgastam menos os trastes.]),
)))

=== Calibre

#block(breakable: false)[
O calibre é indicado em milésimos de polegada, normalmente pela corda mais fina (Sol) e pela mais grossa (Mi):

#tabela(
  ([*Calibre*], [*Jogo típico*], [*Características*]),
  (
    ([Leve], [.040 – .095], [Mais fácil de pressionar; bom para iniciantes e para técnicas rápidas. Um pouco menos de peso no grave.]),
    ([Médio], [.045 – .105], [O padrão mais vendido: bom equilíbrio entre grave definido, volume e conforto.]),
    ([Pesado], [.050 – .110 ou mais], [Som muito encorpado; usado em afinações mais graves. Exige mais força da mão esquerda.]),
  ),
  columns: (0.8fr, 1.2fr, 3fr),
  alinhamento: (left + horizon, center + horizon, left + horizon),
)
]

== 4. Tipos de baixo

Existem vários modelos de baixo, cada um com um timbre e um uso mais comum. Os quatro principais:

#grid(
  columns: (1fr, 1fr),
  gutter: 0.9em,
  tipo-baixo("attachments/precision-bass.jpg", "Precision Bass (P-Bass)", [
    O primeiro baixo elétrico produzido em larga escala (anos 1950). Tem um captador do tipo _split-coil_ (dividido em duas metades) e som encorpado, grave e com muito ataque. É um dos modelos mais usados no rock, no pop e na soul music.
  ]),
  tipo-baixo("attachments/jazz-bass.jpg", "Jazz Bass (J-Bass)", [
    Tem dois captadores (um perto do braço e outro perto da ponte), o que dá mais variedade de timbres. O braço é mais fino perto da pestana. Som mais definido e com médios presentes — muito usado no funk, no jazz e na técnica de _slap_.
  ]),
  tipo-baixo("attachments/baixo-acustico.jpg", "Baixo acústico (baixolão)", [
    Tem caixa de ressonância, como um violão, e soa sem amplificador — embora fique baixo perto de uma banda e normalmente seja ligado a um amplificador nas apresentações. Timbre amadeirado e quente, ideal para formações acústicas.
  ]),
  tipo-baixo("attachments/baixo-5-cordas.jpg", "Baixo de 5 cordas", [
    Acrescenta uma corda mais grave, geralmente afinada em *Si* (B – E – A – D – G). Amplia a extensão para o grave sem precisar reafinar o instrumento. Comum no gospel, no metal e no sertanejo atual.
  ]),
)

== 5. Cuidados com o instrumento

- *Baixo ativo:* muitos baixos têm um pré-amplificador interno alimentado por uma bateria de 9 V. Nesses instrumentos, o circuito liga quando o cabo está conectado — *desconecte o cabo quando não estiver tocando* para não gastar a bateria. Baixos *passivos* não usam bateria.
- *Correia:* o baixo é pesado. Uma correia larga e acolchoada distribui o peso e evita dores nas costas e nos ombros.
- *Limpeza das cordas:* encordoamento de baixo é caro. Passe uma flanela limpa e seca nas cordas depois de tocar para retirar suor e oleosidade; elas mantêm o brilho e duram muito mais.

== 6. Exercícios

#ex(titulo: "Qual é a parte?", nivel: "Escrita")[
  Escreva o nome da parte do baixo descrita em cada item.

  #v(0.3em)
  #tabela-preencher(
    ([*Descrição*], [*Parte*]),
    (
      ([a) Filetes de metal que dividem a escala.], none),
      ([b) Giram para afinar as cordas.], none),
      ([c) Transformam a vibração das cordas em sinal elétrico.], none),
      ([d) Espaço entre dois trastes, onde o dedo pressiona a corda.], none),
      ([e) Prende as cordas no corpo do instrumento.], none),
      ([f) Barra de aço dentro do braço que corrige a sua curvatura.], none),
    ),
    columns: (3fr, 1.3fr),
    alinhamento: (left + horizon, center + horizon),
  )
]

#ex(titulo: "As cordas soltas e as primeiras casas", nivel: "Escrita")[
  Escreva em cada casa o nome (em cifra) da nota. Na coluna 0, escreva a nota da corda solta; nas casas 1 a 5, inclua os sustenidos (ex.: F\#). Lembre-se: cada casa sobe um semitom, e entre E–F e B–C não há nota intermediária. A linha de cima é a 4ª corda.

  #v(0.3em)
  #align(center)[#braco-vazio(casas: 6, fs: 0, num-cordas: 4, cordas: ("4ª", "3ª", "2ª", "1ª"), casa-largura: 34pt)]
]

#ex(titulo: "Tipos de baixo e de cordas", nivel: "Escrita")[
  Responda nas linhas abaixo.

  a) Qual tipo de baixo tem dois captadores e é muito usado no _slap_? \
  b) Qual nota costuma ter a corda extra do baixo de 5 cordas? Ela é mais grave ou mais aguda que o Mi? \
  c) Que tipo de corda você escolheria para um som mais abafado e "antigo"? \
  d) Por que é importante desconectar o cabo de um baixo ativo após tocar?

  #linhas-resposta(4)
]

#ex(titulo: "Afinação pela casa 5", nivel: "Prática")[
  Desafine levemente a 3ª, a 2ª e a 1ª cordas e afine-as de novo usando apenas o método da casa 5 (seção 2). No fim, confira cada corda com um afinador e anote quantas estavam afinadas: #box(width: 2cm, line(length: 100%, stroke: 0.5pt + color-rule-dark)) de 3.
]

=== Sugestão de prática

#block(breakable: false, rotina-estudo((
  ([Dizer em voz alta o nome das partes do baixo, apontando cada uma], [2 min], [—]),
  ([Tocar as cordas soltas da 4ª à 1ª, dizendo nome e cifra], [3 min], [60]),
  ([Afinar pela casa 5 e conferir com o afinador], [5 min], [—]),
  ([Tocar as notas naturais da 4ª corda, casa por casa, até a casa 12], [5 min], [60]),
)))

#v(0.6em)

#checklist(
  (
    [Sei o nome e a função das principais partes do baixo.],
    [Sei a diferença entre traste e casa.],
    [Digo a nota de cada corda solta, da 4ª à 1ª: Mi, Lá, Ré, Sol.],
    [Afino o baixo pela casa 5, usando a 4ª corda como referência.],
    [Explico a diferença entre P-Bass e J-Bass e entre cordas _roundwound_ e _flatwound_.],
  ),
  titulo: "Autoavaliação",
)

#gabarito[
  #resposta(1)[a) trastes · b) tarraxas · c) captadores · d) casa · e) ponte · f) tensor (_truss rod_).]
  #resposta(2)[
    Cordas soltas: 4ª Mi (E) · 3ª Lá (A) · 2ª Ré (D) · 1ª Sol (G).
    #align(center)[#braco-notas(mapa-baixo(0, 5, todas), fs: 0, cordas: ("4ª", "3ª", "2ª", "1ª"), casa-largura: 34pt)]
    #v(0.3em)
    As notas com sustenido também podem ser escritas com bemol (F\# = Gb, G\# = Ab, A\# = Bb, C\# = Db, D\# = Eb). A casa 5 de cada corda repete a corda solta seguinte.
  ]
  #resposta(3)[
    a) Jazz Bass (J-Bass). \
    b) Si (B), mais grave que o Mi. \
    c) _Flatwound_ (fio liso). \
    d) Porque, no baixo ativo, o cabo conectado liga o pré-amplificador, que consome a bateria.
  ]
  #resposta(4)[Exercício prático — critério de sucesso: as três cordas conferem afinadas no afinador (ou com desvio mínimo, corrigido em seguida).]
]
