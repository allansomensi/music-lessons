#import "/templates/layout.typ": *
#import "/templates/components.typ": *
#import "@preview/conchord:0.4.0": new-chordgen

#show: aula.with(
  instrumento: "Guitarra",
  nivel: "Avançado",
)

#let chord = new-chordgen(number-to-left: true, use-shadow-barre: false, colors: (hold: black, barre: black))
#show <chord>: set text(fill: color-strong, weight: "bold")

#show table: set par(justify: false)

// Caixa que não se parte entre duas páginas.
#let caixa-f(..args) = block(breakable: false, width: 100%, caixa(..args))

// Tabela que não se separa do cabeçalho na quebra de página.
#let tabela-f(..args) = block(breakable: false, width: 100%, tabela(..args))

// Grade compacta de diagramas: acorde (nome no diagrama), título e vozes.
#let acordes(items, columns: 4) = align(center, grid(
  columns: (1fr,) * columns,
  row-gutter: 1.1em,
  align: center,
  ..items.map(item => block(breakable: false)[
    #box(chord(item.tabs, name: item.nome))
    #v(0.15em)
    #text(size: 9.5pt, weight: "bold")[#item.titulo] \
    #text(size: 8pt, fill: color-muted)[#item.detalhe]
  ]),
))

// Linha de diagramas com título (H3) que nunca se separa dos acordes.
#let grupo(titulo, items, columns: 4) = block(breakable: false, width: 100%, below: 1.1em)[
  === #titulo
  #acordes(items, columns: columns)
]

// Legenda curta e centralizada abaixo de diagramas.
#let legenda(body) = align(center, text(size: 8.5pt, fill: color-muted, body))

= Voicings Drop 2 e Drop 3

Quem acompanha jazz, bossa nova e MPB não pensa em "shapes" soltos: pensa em *vozes*. Cada acorde é um conjunto de quatro notas que precisa caminhar até o próximo com o menor movimento possível, como quatro cantores de um coral. Na guitarra, o sistema que torna isso viável tem nome: *voicings drop 2 e drop 3*. Eles são a base do acompanhamento de nomes como Wes Montgomery, Joe Pass e Toninho Horta — e, depois desta aula, serão a sua também.

#objetivos((
  [Entender o que é a *posição fechada* e por que ela é pouco prática na guitarra],
  [Aplicar as regras *drop 2* e *drop 3* a qualquer tétrade, passo a passo],
  [Tocar as quatro inversões de C7M, C7, Cm7 e Cm7(b5) em drop 2 (dois grupos de cordas) e em drop 3 (baixo na 6ª e na 5ª corda)],
  [Encadear um II-V-I com *condução de vozes*, sem sair da mesma região do braço],
  [Saber qual nota fica na voz mais aguda de cada inversão, para tocar a melodia no topo],
))

== 1. Posição fechada (close voicing)

Um acorde está em *posição fechada* quando as suas quatro notas cabem dentro de uma oitava, empilhadas sem "buracos": entre duas vozes vizinhas não sobra nenhuma outra nota do acorde. O C7M em posição fechada, do grave para o agudo, é *C – E – G – B*. Girando a nota mais grave para cima, obtemos as outras três posições fechadas: E – G – B – C, G – B – C – E e B – C – E – G.

Para falar das regras *drop*, numeramos as vozes *de cima para baixo*: a voz 1 é a mais aguda (soprano), a voz 2 é a segunda de cima, a voz 3 é a terceira e a voz 4 é o baixo.

#v(0.4em)

#tabela-f(
  columns: (1.1fr, 1.5fr, 1.4fr, 1.6fr),
  ([Posição fechada], [Vozes (grave → agudo)], [Casas nas cordas 4-3-2-1], [Abertura da mão]),
  (
    ([Fundamental], [C E G B · T 3 5 7M], [10 – 9 – 8 – 7], [4 casas, em diagonal]),
    ([1ª inversão], [E G B C · 3 5 7M T], [14 – 12 – 12 – 8], [7 casas]),
    ([2ª inversão], [G B C E · 5 7M T 3], [5 – 4 – 1 – 0], [só com corda solta; móvel, 6 casas]),
    ([3ª inversão], [B C E G · 7M T 3 5], [9 – 5 – 5 – 3], [7 casas]),
  ),
)

#v(0.4em)

*Por que não funciona?* A guitarra é afinada (quase toda) em *quartas justas*: cada corda soa 5 semitons acima da anterior, exceto o par Sol–Si, que está a 4 semitons. Na posição fechada, as vozes vizinhas estão a uma 2ª ou a uma 3ª de distância — intervalos *menores* que o intervalo entre as cordas. Para tocar uma 2ª maior em duas cordas vizinhas afinadas em quarta, a nota de cima precisa ficar 3 casas *atrás* da de baixo; uma 2ª menor exige recuar 4 casas. Somadas, essas compensações abrem a mão muito além do alcance, como mostra a tabela.

A solução é afastar uma das vozes uma oitava. O acorde deixa de caber numa oitava (passa a ser um voicing *aberto*) e cada voz cai naturalmente numa corda, com a mão dentro de quatro casas. É exatamente isso que as regras drop fazem.

#caixa-f(tipo: "atencao")[
  A posição fechada não é "errada": pianistas a usam o tempo todo e, na guitarra, ela funciona muito bem em *tríades* e em acordes de três notas. Para tétrades completas em cordas vizinhas, porém, o padrão profissional são os voicings drop 2 e drop 3.
]

== 2. A regra do drop 2

#caixa-f(tipo: "resumo", titulo: "Regra")[
  *Drop 2:* parta de um acorde em posição fechada e *abaixe uma oitava a voz 2* (a segunda nota contando de cima). Ela passa a ser o novo baixo.
]

Veja a regra aplicada ao C7M, passo a passo:

#passos((
  [Escreva C7M em posição fechada, do grave para o agudo: *C – E – G – B*.],
  [Numere as vozes de cima para baixo: voz 1 = B, voz 2 = G, voz 3 = E, voz 4 = C.],
  [Desça a voz 2 (G) uma oitava. Ela fica abaixo do C e vira o baixo do acorde.],
  [Resultado, do grave para o agudo: *G – C – E – B* (5 T 3 7M). Esse voicing ocupa quatro cordas vizinhas sem esforço: nas cordas 4-3-2-1, fica *x,x,5,5,5,7*.],
))

#v(0.4em)

Repetindo o processo a partir de cada posição fechada, obtemos as quatro inversões drop 2 (todas escritas do grave para o agudo). Repare que a inversão é sempre nomeada pela *nota que ficou no baixo* depois do drop, e não pela posição fechada de origem:

#v(0.4em)

#tabela-f(
  columns: (1.3fr, 0.8fr, 1.3fr, 1.2fr, 1.1fr),
  ([Posição fechada], [Voz 2], [Drop 2], [Intervalos], [Inversão]),
  (
    ([C – E – G – B], [G], [*G – C – E – B*], [5 T 3 7M], [2ª inversão]),
    ([E – G – B – C], [B], [*B – E – G – C*], [7M 3 5 T], [3ª inversão]),
    ([G – B – C – E], [C], [*C – G – B – E*], [T 5 7M 3], [Fundamental]),
    ([B – C – E – G], [E], [*E – B – C – G*], [3 7M T 5], [1ª inversão]),
  ),
)

#v(0.4em)

#caixa-f(tipo: "dica")[
  Depois do drop, a distância entre o baixo e a voz mais aguda passa a ser uma 9ª ou uma 10ª. Essa abertura é o que dá ao drop 2 o som "de big band" — e é por isso que ele cabe tão bem na afinação em quartas.
]

== 3. Drop 2 nas cordas 1-2-3-4

Nas cordas mais agudas (Ré, Sol, Si e Mi), cada inversão fica uma região acima da anterior. Os diagramas estão em ordem de altura no braço: depois da 3ª inversão vem a fundamental, e a partir dela o ciclo se repete uma oitava acima. Abaixo de cada diagrama estão as vozes *do grave para o agudo*.

#grupo([C7M — C E G B], (
  (tabs: "x,x,2,4,1,3", nome: "C7M/E", titulo: "1ª inversão", detalhe: "3 · 7M · T · 5"),
  (tabs: "x,x,5,5,5,7", nome: "C7M/G", titulo: "2ª inversão", detalhe: "5 · T · 3 · 7M"),
  (tabs: "x,x,9,9,8,8", nome: "C7M/B", titulo: "3ª inversão", detalhe: "7M · 3 · 5 · T"),
  (tabs: "x,x,10,12,12,12", nome: "C7M", titulo: "Fundamental", detalhe: "T · 5 · 7M · 3"),
))

#grupo([C7 — C E G Bb], (
  (tabs: "x,x,2,3,1,3", nome: "C7/E", titulo: "1ª inversão", detalhe: "3 · b7 · T · 5"),
  (tabs: "x,x,5,5,5,6", nome: "C7/G", titulo: "2ª inversão", detalhe: "5 · T · 3 · b7"),
  (tabs: "x,x,8,9,8,8", nome: "C7/Bb", titulo: "3ª inversão", detalhe: "b7 · 3 · 5 · T"),
  (tabs: "x,x,10,12,11,12", nome: "C7", titulo: "Fundamental", detalhe: "T · 5 · b7 · 3"),
))

#grupo([Cm7 — C Eb G Bb], (
  (tabs: "x,x,1,3,1,3", nome: "Cm7/Eb", titulo: "1ª inversão", detalhe: "b3 · b7 · T · 5"),
  (tabs: "x,x,5,5,4,6", nome: "Cm7/G", titulo: "2ª inversão", detalhe: "5 · T · b3 · b7"),
  (tabs: "x,x,8,8,8,8", nome: "Cm7/Bb", titulo: "3ª inversão", detalhe: "b7 · b3 · 5 · T"),
  (tabs: "x,x,10,12,11,11", nome: "Cm7", titulo: "Fundamental", detalhe: "T · 5 · b7 · b3"),
))

#grupo([Cm7(b5) — C Eb Gb Bb], (
  (tabs: "x,x,1,3,1,2", nome: "Cm7(b5)/Eb", titulo: "1ª inversão", detalhe: "b3 · b7 · T · b5"),
  (tabs: "x,x,4,5,4,6", nome: "Cm7(b5)/Gb", titulo: "2ª inversão", detalhe: "b5 · T · b3 · b7"),
  (tabs: "x,x,8,8,7,8", nome: "Cm7(b5)/Bb", titulo: "3ª inversão", detalhe: "b7 · b3 · b5 · T"),
  (tabs: "x,x,10,11,11,11", nome: "Cm7(b5)", titulo: "Fundamental", detalhe: "T · b5 · b7 · b3"),
))

#caixa-f(tipo: "dica", titulo: "Pense em famílias")[
  Os quatro tipos de acorde usam a *mesma disposição de vozes*: de C7M para C7 só a 7ª desce um semitom; de C7 para Cm7, a 3ª; de Cm7 para Cm7(b5), a 5ª. Aprenda a inversão de C7M e derive as outras movendo um dedo de cada vez.
]

== 4. Drop 2 nas cordas 2-3-4-5

O mesmo raciocínio vale para o grupo Lá–Ré–Sol–Si. O som é mais encorpado, ideal para acompanhar em trio ou duo. Aqui a fundamental aparece primeiro, na 3ª casa, e as inversões sobem a partir dela. A 1ª corda nunca é tocada: abafe-a com a polpa do dedo que está na 2ª corda.

#grupo([C7M], (
  (tabs: "x,3,5,4,5,x,*", nome: "C7M", titulo: "Fundamental", detalhe: "T · 5 · 7M · 3"),
  (tabs: "x,7,9,5,8,x,*", nome: "C7M/E", titulo: "1ª inversão", detalhe: "3 · 7M · T · 5 (5 casas)"),
  (tabs: "x,10,10,9,12,x,*", nome: "C7M/G", titulo: "2ª inversão", detalhe: "5 · T · 3 · 7M"),
  (tabs: "x,14,14,12,13,x,*", nome: "C7M/B", titulo: "3ª inversão", detalhe: "7M · 3 · 5 · T"),
))

#grupo([C7], (
  (tabs: "x,3,5,3,5,x,*", nome: "C7", titulo: "Fundamental", detalhe: "T · 5 · b7 · 3"),
  (tabs: "x,7,8,5,8,x,*", nome: "C7/E", titulo: "1ª inversão", detalhe: "3 · b7 · T · 5"),
  (tabs: "x,10,10,9,11,x,*", nome: "C7/G", titulo: "2ª inversão", detalhe: "5 · T · 3 · b7"),
  (tabs: "x,13,14,12,13,x,*", nome: "C7/Bb", titulo: "3ª inversão", detalhe: "b7 · 3 · 5 · T"),
))

#grupo([Cm7], (
  (tabs: "x,3,5,3,4,x,*", nome: "Cm7", titulo: "Fundamental", detalhe: "T · 5 · b7 · b3"),
  (tabs: "x,6,8,5,8,x,*", nome: "Cm7/Eb", titulo: "1ª inversão", detalhe: "b3 · b7 · T · 5"),
  (tabs: "x,10,10,8,11,x,*", nome: "Cm7/G", titulo: "2ª inversão", detalhe: "5 · T · b3 · b7"),
  (tabs: "x,13,13,12,13,x,*", nome: "Cm7/Bb", titulo: "3ª inversão", detalhe: "b7 · b3 · 5 · T"),
))

#grupo([Cm7(b5)], (
  (tabs: "x,3,4,3,4,x,*", nome: "Cm7(b5)", titulo: "Fundamental", detalhe: "T · b5 · b7 · b3"),
  (tabs: "x,6,8,5,7,x,*", nome: "Cm7(b5)/Eb", titulo: "1ª inversão", detalhe: "b3 · b7 · T · b5"),
  (tabs: "x,9,10,8,11,x,*", nome: "Cm7(b5)/Gb", titulo: "2ª inversão", detalhe: "b5 · T · b3 · b7"),
  (tabs: "x,13,13,11,13,x,*", nome: "Cm7(b5)/Bb", titulo: "3ª inversão", detalhe: "b7 · b3 · b5 · T"),
))

#caixa-f(tipo: "atencao")[
  A 1ª inversão de C7M neste grupo (*x,7,9,5,8,x*) pede uma abertura de cinco casas, porque a 7ª maior (B) e a fundamental (C) ficam a um semitom de distância em cordas vizinhas. Se a mão não alcançar, use a mesma inversão nas cordas 1-2-3-4 (*x,x,2,4,1,3* ou *x,x,14,16,13,15*).
]

== 5. A regra do drop 3

#caixa-f(tipo: "resumo", titulo: "Regra")[
  *Drop 3:* parta de um acorde em posição fechada e *abaixe uma oitava a voz 3* (a terceira nota contando de cima). Como o baixo fica afastado das outras vozes, o voicing *pula uma corda*: grupos 6-4-3-2 e 5-3-2-1.
]

#passos((
  [Comece pela posição fechada B – C – E – G (3ª inversão fechada de C7M).],
  [Numere de cima para baixo: voz 1 = G, voz 2 = E, voz 3 = C, voz 4 = B.],
  [Desça a voz 3 (C) uma oitava: ela vira o baixo.],
  [Resultado: *C – B – E – G* (T 7M 3 5) — o clássico C7M com fundamental na 6ª corda, *8,x,9,9,8,x*, ou na 5ª corda, *x,3,x,4,5,3*.],
))

#v(0.4em)

#block(breakable: false)[
  A partir das quatro posições fechadas, o drop 3 gera as quatro inversões abaixo (do grave para o agudo):

  #v(0.2em)
  #tabela(
    columns: (1.3fr, 0.8fr, 1.3fr, 1.2fr, 1.1fr),
    ([Posição fechada], [Voz 3], [Drop 3], [Intervalos], [Inversão]),
    (
      ([C – E – G – B], [E], [*E – C – G – B*], [3 T 5 7M], [1ª inversão]),
      ([E – G – B – C], [G], [*G – E – B – C*], [5 3 7M T], [2ª inversão]),
      ([G – B – C – E], [B], [*B – G – C – E*], [7M 5 T 3], [3ª inversão]),
      ([B – C – E – G], [C], [*C – B – E – G*], [T 7M 3 5], [Fundamental]),
    ),
  )
]

#v(0.4em)

Os voicings drop 3 têm um baixo bem separado das três vozes de cima — o som típico do acompanhamento "baixo + acorde" do violão de bossa nova e da guitarra de big band. A corda pulada (5ª no grupo 6-4-3-2, 4ª no grupo 5-3-2-1) deve ser abafada pelo dedo que toca o baixo.

#grupo([Fundamental com baixo na 6ª corda (cordas 6-4-3-2)], (
  (tabs: "8,x,9,9,8,x,*", nome: "C7M", titulo: "C7M", detalhe: "T · 7M · 3 · 5"),
  (tabs: "8,x,8,9,8,x,*", nome: "C7", titulo: "C7", detalhe: "T · b7 · 3 · 5"),
  (tabs: "8,x,8,8,8,x,*", nome: "Cm7", titulo: "Cm7", detalhe: "T · b7 · b3 · 5"),
  (tabs: "8,x,8,8,7,x,*", nome: "Cm7(b5)", titulo: "Cm7(b5)", detalhe: "T · b7 · b3 · b5"),
))

#grupo([Fundamental com baixo na 5ª corda (cordas 5-3-2-1)], (
  (tabs: "x,3,x,4,5,3,*", nome: "C7M", titulo: "C7M", detalhe: "T · 7M · 3 · 5"),
  (tabs: "x,3,x,3,5,3,*", nome: "C7", titulo: "C7", detalhe: "T · b7 · 3 · 5"),
  (tabs: "x,3,x,3,4,3,*", nome: "Cm7", titulo: "Cm7", detalhe: "T · b7 · b3 · 5"),
  (tabs: "x,3,x,3,4,2,*", nome: "Cm7(b5)", titulo: "Cm7(b5)", detalhe: "T · b7 · b3 · b5"),
))

#grupo([Inversões de C7M com baixo na 6ª corda], (
  (tabs: "3,x,2,4,1,x,*", nome: "C7M/G", titulo: "2ª inversão", detalhe: "5 · 3 · 7M · T"),
  (tabs: "7,x,5,5,5,x,*", nome: "C7M/B", titulo: "3ª inversão", detalhe: "7M · 5 · T · 3"),
  (tabs: "8,x,9,9,8,x,*", nome: "C7M", titulo: "Fundamental", detalhe: "T · 7M · 3 · 5"),
  (tabs: "12,x,10,12,12,x,*", nome: "C7M/E", titulo: "1ª inversão", detalhe: "3 · T · 5 · 7M"),
))

#grupo([Inversões de C7 com baixo na 6ª corda], (
  (tabs: "3,x,2,3,1,x,*", nome: "C7/G", titulo: "2ª inversão", detalhe: "5 · 3 · b7 · T"),
  (tabs: "6,x,5,5,5,x,*", nome: "C7/Bb", titulo: "3ª inversão", detalhe: "b7 · 5 · T · 3"),
  (tabs: "8,x,8,9,8,x,*", nome: "C7", titulo: "Fundamental", detalhe: "T · b7 · 3 · 5"),
  (tabs: "12,x,10,12,11,x,*", nome: "C7/E", titulo: "1ª inversão", detalhe: "3 · T · 5 · b7"),
))

#caixa-f(tipo: "dica", titulo: "Baixo que caminha")[
  As inversões drop 3 com baixo na 6ª corda permitem linhas de baixo por grau conjunto. Para o baixo C – B – A – G, toque C7M (*8,x,9,9,8,x*) → #box[C7M/B] (*7,x,5,5,5,x*) → Am7 (*5,x,5,5,5,x*) → #box[Am7/G] (*3,x,2,2,1,x*). De #box[C7M/B] para Am7, as três vozes de cima (G C E) são idênticas: só o baixo anda.
]

== 6. Condução de vozes no II-V-I

Conduzir vozes é escolher, para cada acorde, a inversão que obriga as quatro vozes a se moverem o *mínimo possível* — de preferência por semitom, tom ou nota comum. No II-V-I, o motor do encadeamento são as *notas-guia* (3ª e 7ª):

#cartoes-info((
  (titulo: "Dm7 → G7", corpo: [A 7ª de Dm7 (C) desce um semitom e vira a 3ª de G7 (B). A 3ª de Dm7 (F) fica parada e vira a 7ª de G7.]),
  (titulo: "G7 → C7M", corpo: [A 7ª de G7 (F) desce um semitom e vira a 3ª de C7M (E). A 3ª de G7 (B) fica parada e vira a 7ª de C7M.]),
))

#v(0.6em)

Na prática, isso gera uma regra simples quando os três acordes estão no *mesmo grupo de cordas*: *o II e o I usam a mesma inversão; o V usa a inversão "oposta"* — fundamental ↔ 2ª inversão, 1ª ↔ 3ª inversão. Assim, os três acordes ficam na mesma região do braço. (No drop 3, trocar o baixo entre a 5ª e a 6ª corda é outra saída: aí dá para usar três fundamentais, como no último exemplo.)

#grupo([Drop 2, cordas 1-2-3-4, casas 8 a 10], columns: 3, (
  (tabs: "x,x,10,10,10,10", nome: "Dm7", titulo: "Dm7 — 3ª inversão", detalhe: "b7 · b3 · 5 · T"),
  (tabs: "x,x,9,10,8,10", nome: "G7", titulo: "G7 — 1ª inversão", detalhe: "3 · b7 · T · 5"),
  (tabs: "x,x,9,9,8,8", nome: "C7M", titulo: "C7M — 3ª inversão", detalhe: "7M · 3 · 5 · T"),
))

#legenda[Voz a voz (corda 4 → corda 1): C → B → B · F → F → E · A → G → G · D → D → C. Nenhuma voz anda mais que um tom.]

#v(0.4em)

#grupo([Drop 2, cordas 1-2-3-4, casas 5 a 8], columns: 3, (
  (tabs: "x,x,7,7,6,8", nome: "Dm7", titulo: "Dm7 — 2ª inversão", detalhe: "5 · T · b3 · b7"),
  (tabs: "x,x,5,7,6,7", nome: "G7", titulo: "G7 — Fundamental", detalhe: "T · 5 · b7 · 3"),
  (tabs: "x,x,5,5,5,7", nome: "C7M", titulo: "C7M — 2ª inversão", detalhe: "5 · T · 3 · 7M"),
))

#grupo([Drop 2, cordas 2-3-4-5, casas 3 a 7], columns: 3, (
  (tabs: "x,5,7,5,6,x,*", nome: "Dm7", titulo: "Dm7 — Fundamental", detalhe: "T · 5 · b7 · b3"),
  (tabs: "x,5,5,4,6,x,*", nome: "G7", titulo: "G7 — 2ª inversão", detalhe: "5 · T · 3 · b7"),
  (tabs: "x,3,5,4,5,x,*", nome: "C7M", titulo: "C7M — Fundamental", detalhe: "T · 5 · 7M · 3"),
))

#grupo([Drop 3, baixo alternando 5ª e 6ª corda, casas 3 a 6], columns: 3, (
  (tabs: "x,5,x,5,6,5,*", nome: "Dm7", titulo: "Dm7 — Fundamental", detalhe: "T · b7 · b3 · 5"),
  (tabs: "3,x,3,4,3,x,*", nome: "G7", titulo: "G7 — Fundamental", detalhe: "T · b7 · 3 · 5"),
  (tabs: "x,3,x,4,5,3,*", nome: "C7M", titulo: "C7M — Fundamental", detalhe: "T · 7M · 3 · 5"),
))

#legenda[No drop 3 com fundamental no baixo, as notas-guia (3ª e 7ª) ficam sempre nas cordas 4 e 3 (baixo na 6ª) ou 3 e 2 (baixo na 5ª).]

#v(0.8em)

As quatro regiões de II-V-I em Dó maior com drop 2 nas cordas 1-2-3-4 (casas de cordas 4-3-2-1):

#v(0.3em)

#tabela-f(
  columns: (0.9fr, 1.4fr, 1.4fr, 1.4fr),
  ([Região], [Dm7], [G7], [C7M]),
  (
    ([casas 1–5], [3 – 5 – 3 – 5 (1ª inv.)], [3 – 4 – 3 – 3 (3ª inv.)], [2 – 4 – 1 – 3 (1ª inv.)]),
    ([casas 5–8], [7 – 7 – 6 – 8 (2ª inv.)], [5 – 7 – 6 – 7 (fund.)], [5 – 5 – 5 – 7 (2ª inv.)]),
    ([casas 8–10], [10 – 10 – 10 – 10 (3ª inv.)], [9 – 10 – 8 – 10 (1ª inv.)], [9 – 9 – 8 – 8 (3ª inv.)]),
    ([casas 10–14], [12 – 14 – 13 – 13 (fund.)], [12 – 12 – 12 – 13 (2ª inv.)], [10 – 12 – 12 – 12 (fund.)]),
  ),
)

#v(0.4em)

#caixa-f(tipo: "atencao", titulo: "Evite")[
  Tocar Dm7, G7 e C7M sempre na mesma inversão (por exemplo, três fundamentais) faz o acorde inteiro "pular" pelo braço. Funciona, mas soa como três blocos isolados — exatamente o que a condução de vozes quer evitar.
]

== 7. Qual voz está no topo?

Quando você acompanha um cantor ou toca um arranjo de *chord melody*, a nota mais aguda do voicing é a que o ouvinte percebe como melodia. A tabela abaixo resume, para cada inversão, a ordem das vozes (do grave para o agudo) e a nota do topo. Nela, "3ª", "5ª" e "7ª" valem para qualquer qualidade (em Cm7(b5), por exemplo, a 3ª é b3, a 5ª é b5 e a 7ª é b7).

#tabela-f(
  columns: (1fr, 1.5fr, 0.8fr, 1.5fr, 0.8fr),
  ([Inversão], [Drop 2], [Topo], [Drop 3], [Topo]),
  (
    ([Fundamental], [T · 5ª · 7ª · 3ª], [*3ª*], [T · 7ª · 3ª · 5ª], [*5ª*]),
    ([1ª inversão], [3ª · 7ª · T · 5ª], [*5ª*], [3ª · T · 5ª · 7ª], [*7ª*]),
    ([2ª inversão], [5ª · T · 3ª · 7ª], [*7ª*], [5ª · 3ª · 7ª · T], [*T*]),
    ([3ª inversão], [7ª · 3ª · 5ª · T], [*T*], [7ª · 5ª · T · 3ª], [*3ª*]),
  ),
)

#caixa-f(tipo: "dica")[
  Para harmonizar uma nota da melodia: descubra que grau ela é no acorde e escolha a inversão cujo topo é esse grau. Melodia E sobre C7M → E é a 3ª → drop 2 em fundamental (*x,x,10,12,12,12*) ou drop 3 em 3ª inversão (*7,x,5,5,5,x*).
]

== 8. Exercícios

#block(breakable: false)[#exercicio(titulo: "Aplique as regras", nivel: "Escrita")[
  Escreva o drop 2 e o drop 3 (grave → agudo) de cada posição fechada de F7M e diga qual nota ficou no baixo.

  #tabela-preencher(
    ([Posição fechada], [Drop 2], [Drop 3]),
    (
      ([F – A – C – E], none, none),
      ([A – C – E – F], none, none),
      ([C – E – F – A], none, none),
      ([E – F – A – C], none, none),
    ),
    columns: (1fr, 1.4fr, 1.4fr),
    altura: 0.75cm,
  )
]]

#block(breakable: false)[#exercicio(titulo: "Drop 3 no grupo 5-3-2-1", nivel: "Construção")[
  C7 em drop 3 com baixo na 5ª corda é *x,3,x,3,5,3*. Encontre as outras três inversões no grupo 5-3-2-1, dentro de quatro casas.

  #tabela-preencher(
    ([Inversão], [Notas (grave → agudo)], [Casas (6ª → 1ª)]),
    (
      ([1ª inversão], none, none),
      ([2ª inversão], none, none),
      ([3ª inversão], none, none),
    ),
    columns: (1fr, 1.3fr, 1.3fr),
    altura: 0.75cm,
  )
]]

#block(breakable: false)[#exercicio(titulo: "F7M drop 2 no braço", nivel: "Construção")[
  Encontre as quatro inversões drop 2 de F7M nas cordas 1-2-3-4. Escreva as notas (grave → agudo) e as casas das cordas 4-3-2-1. Dica: a fundamental é *x,x,3,5,5,5*.

  #tabela-preencher(
    ([Inversão], [Notas], [Casas (cordas 4-3-2-1)]),
    (
      ([Fundamental], [F – C – E – A], [3 – 5 – 5 – 5]),
      ([1ª inversão], none, none),
      ([2ª inversão], none, none),
      ([3ª inversão], none, none),
    ),
    columns: (1fr, 1.3fr, 1.3fr),
    altura: 0.75cm,
  )
]]

#block(breakable: false)[#exercicio(titulo: "Identifique o voicing", nivel: "Análise")[
  Para cada voicing (casas da 6ª para a 1ª corda), escreva o nome do acorde, se é drop 2 ou drop 3, a inversão e a nota do topo.

  #tabela-preencher(
    ([Casas], [Acorde], [Drop], [Inversão], [Topo]),
    (
      ([a) x,x,7,8,6,8], none, none, none, none),
      ([b) x,5,7,5,6,x], none, none, none, none),
      ([c) 10,x,10,10,10,x], none, none, none, none),
      ([d) x,x,6,8,7,8], none, none, none, none),
      ([e) 4,x,2,4,3,x], none, none, none, none),
    ),
    columns: (1.3fr, 1fr, 0.8fr, 1fr, 0.8fr),
    altura: 0.75cm,
  )
]]

#block(breakable: false)[#exercicio(titulo: "II-V-I pelo ciclo", nivel: "Prática")[
  Com metrônomo a 60 BPM (um acorde por compasso, 4 tempos), toque o II-V-I das casas 8 a 10 em Dó maior e depois transporte o *mesmo desenho* para Fá, Sib e Mib (ciclo de quartas), sempre em drop 2 nas cordas 1-2-3-4. Em seguida, repita usando o desenho da região das casas 5 a 8. Grave-se e confira se nenhuma voz salta mais que um tom.
]]

#block(breakable: false)[#exercicio(titulo: "II-V-I em Fá maior", nivel: "Condução de vozes")[
  Usando a regra "II e I na mesma inversão, V na inversão oposta", escreva o II-V-I *Gm7 – C7 – F7M* em drop 2 nas cordas 1-2-3-4 em duas regiões diferentes do braço (casas das cordas 4-3-2-1).

  #tabela-preencher(
    ([Região], [Gm7], [C7], [F7M]),
    (
      ([A], none, none, none),
      ([B], none, none, none),
    ),
    columns: (0.6fr, 1.2fr, 1.2fr, 1.2fr),
    altura: 0.75cm,
  )
]]

#block(breakable: false)[#exercicio(titulo: "Melodia no topo", nivel: "Aplicação")[
  Escolha a inversão drop 2 (cordas 1-2-3-4) que coloca a nota pedida na voz mais aguda e escreva as casas das cordas 4-3-2-1.

  #tabela-preencher(
    ([Acorde], [Melodia], [Grau da melodia], [Inversão], [Casas]),
    (
      ([C7M], [E], none, none, none),
      ([C7M], [B], none, none, none),
      ([Cm7], [G], none, none, none),
      ([C7], [C], none, none, none),
      ([Cm7(b5)], [Bb], none, none, none),
    ),
    columns: (0.9fr, 0.8fr, 1fr, 1fr, 1.3fr),
    altura: 0.75cm,
  )
]]


#v(0.6em)

#block(breakable: false, above: 1.2em)[
  === Sugestão de prática

  #rotina-estudo((
    ([Drop 2 cordas 1-4: quatro inversões de C7M → C7 → Cm7 → Cm7(b5), subindo o braço], [10 min], [60]),
    ([Drop 2 cordas 2-5: mesmas famílias, uma inversão por tempo], [8 min], [60]),
    ([Drop 3 baixo na 6ª e na 5ª: fundamentais e inversões de C7M e C7], [8 min], [60–70]),
    ([II-V-I nas quatro regiões em Dó, depois em Fá e Sib], [10 min], [60–80]),
    ([Chord melody: harmonize uma melodia simples escolhendo a inversão pelo topo], [9 min], [livre]),
  ))
]

#block(breakable: false, above: 0.8em)[
  #checklist(titulo: "Autoavaliação", (
    [Sei explicar por que a posição fechada não é prática na guitarra.],
    [Aplico as regras drop 2 e drop 3 a qualquer tétrade, no papel e no braço.],
    [Toco drop 2 nos dois grupos de cordas e drop 3 com baixo na 6ª e na 5ª, sem cordas sobrando.],
    [Encadeio II-V-I em pelo menos duas regiões sem saltos, em três tonalidades.],
    [Escolho a inversão certa para colocar uma nota da melodia no topo.],
  ))
]

#gabarito[
  #resposta(1)[
    *F – A – C – E* → drop 2: C – F – A – E (5ª no baixo, 2ª inv.) · drop 3: A – F – C – E (3ª no baixo, 1ª inv.) \
    *A – C – E – F* → drop 2: E – A – C – F (7ª no baixo, 3ª inv.) · drop 3: C – A – E – F (5ª no baixo, 2ª inv.) \
    *C – E – F – A* → drop 2: F – C – E – A (fundamental) · drop 3: E – C – F – A (7ª no baixo, 3ª inv.) \
    *E – F – A – C* → drop 2: A – E – F – C (3ª no baixo, 1ª inv.) · drop 3: F – E – A – C (fundamental)
  ]
  #resposta(2)[
    1ª inv.: E – C – G – Bb → x,7,x,5,8,6 · 2ª inv.: G – E – Bb – C → x,10,x,9,11,8 · 3ª inv.: Bb – G – C – E → x,13,x,12,13,12 (ou x,1,x,0,1,0, com cordas soltas).
  ]
  #resposta(3)[
    1ª inv.: A – E – F – C → 7 – 9 – 6 – 8 · 2ª inv.: C – F – A – E → 10 – 10 – 10 – 12 · 3ª inv.: E – A – C – F → 2 – 2 – 1 – 1 (ou 14 – 14 – 13 – 13).
  ]
  #resposta(4)[
    a) A Eb F C → *F7*, drop 2, 1ª inversão, topo C (5ª). \
    b) D A C F → *Dm7*, drop 2 (cordas 2-5), fundamental, topo F (b3). \
    c) D C F A → *Dm7*, drop 3 (baixo na 6ª), fundamental, topo A (5ª). \
    d) Ab Eb Gb C → *Ab7*, drop 2, fundamental, topo C (3ª). \
    e) G\# E B D → *E7/G\#*, drop 3 (baixo na 6ª), 1ª inversão, topo D (b7).
  ]
  #resposta(5)[
    Exercício prático — critério de sucesso: os quatro tons tocados sem parar o metrônomo, com troca de acorde exatamente no tempo 1, todas as notas soando e nenhuma voz movendo-se mais que um tom entre acordes vizinhos.
  ]
  #resposta(6)[
    Qualquer par de regiões abaixo está correto (casas das cordas 4-3-2-1): \
    casas 1–3: 3-3-3-3 (3ª inv.) → 2-3-1-3 (1ª inv.) → 2-2-1-1 (3ª inv.) \
    casas 3–7: 5-7-6-6 (fund.) → 5-5-5-6 (2ª inv.) → 3-5-5-5 (fund.) \
    casas 6–10: 8-10-8-10 (1ª inv.) → 8-9-8-8 (3ª inv.) → 7-9-6-8 (1ª inv.) \
    casas 10–13: 12-12-11-13 (2ª inv.) → 10-12-11-12 (fund.) → 10-10-10-12 (2ª inv.)
  ]
  #resposta(7)[
    C7M com E no topo: 3ª → fundamental → 10-12-12-12 · C7M com B: 7M → 2ª inv. → 5-5-5-7 · Cm7 com G: 5ª → 1ª inv. → 1-3-1-3 · C7 com C: T → 3ª inv. → 8-9-8-8 · Cm7(b5) com Bb: b7 → 2ª inv. → 4-5-4-6.
  ]
]
