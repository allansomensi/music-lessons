#import "/templates/layout.typ": *
#import "/templates/components.typ": *
#import "/templates/components.typ": caixa as caixa-modelo
#import "@preview/conchord:0.4.0": new-chordgen
#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node

#show: aula.with(
  instrumento: "Guitarra",
  nivel: "Iniciante",
)

#let chord = new-chordgen(number-to-left: true, use-shadow-barre: false, colors: (hold: black, barre: black))
#show <chord>: set text(fill: color-strong, weight: "bold")

// Texto de tabelas em 9,5pt (corpo do texto continua em 11pt)
#show table: set text(size: 9.5pt)

// Caixas com texto em 10pt (rótulo e corpo no mesmo tamanho)
#let caixa(..args) = {
  set text(size: 10pt)
  caixa-modelo(..args)
}

// Exercício que não se divide entre páginas (enunciado + área de resposta juntos)
#let ex(..args) = block(breakable: false, exercicio(..args))

// Grade de diagramas que não se divide entre páginas
#let acordes(..args) = block(breakable: false, grid-acordes(chord: chord, ..args))

#let legenda(body) = align(center, text(size: 8.5pt, fill: color-muted, body))

= Intervalos

Um *intervalo* é a distância entre duas notas. Ele funciona como a régua da música: é com intervalos que se constroem os acordes (a diferença entre um acorde maior e um menor é um único intervalo) e as escalas. Na guitarra, os intervalos têm uma grande vantagem: viram *desenhos fixos no braço*, que valem para qualquer tom. Neste material você vai aprender a medir, nomear, escrever e localizar os intervalos.

#objetivos((
  [Medir intervalos em tons e semitons (casas) e dar o nome correto a cada um],
  [Entender por que o nome de um intervalo depende de como a nota é escrita (enarmonia)],
  [Localizar os intervalos no braço a partir de uma tônica na 5ª ou na 6ª corda],
  [Reconhecer de ouvido os intervalos mais comuns],
))

== 1. Medindo distâncias: tom e semitom

A menor distância entre duas notas é o *semitom*, que na guitarra corresponde a *1 casa*. Dois semitons formam *1 tom* (2 casas). Na sequência das notas naturais, quase todas as distâncias são de 1 tom — as exceções são *Mi–Fá* e *Si–Dó*, separadas por apenas 1 semitom:

#align(center, block(breakable: false, diagram(
  spacing: (11mm, 10mm),
  node-stroke: 0.5pt,
  node-corner-radius: 2pt,
  node-shape: fletcher.shapes.rect,
  node-inset: 6pt,
  node((0, 0), [Dó], name: <C>),
  node((1, 0), [Ré], name: <D>),
  node((2, 0), [Mi], name: <E>),
  node((3, 0), [Fá], name: <F>),
  node((4, 0), [Sol], name: <G>),
  node((5, 0), [Lá], name: <A>),
  node((6, 0), [Si], name: <B>),
  node((7, 0), [Dó], name: <CC>),
  edge(<C>, <D>, "->", label: text(size: 8.5pt)[1 tom], bend: 40deg),
  edge(<D>, <E>, "->", label: text(size: 8.5pt)[1 tom], bend: 40deg),
  edge(<E>, <F>, "->", label: text(size: 8.5pt, weight: "bold")[semitom], bend: -40deg, label-side: right),
  edge(<F>, <G>, "->", label: text(size: 8.5pt)[1 tom], bend: 40deg),
  edge(<G>, <A>, "->", label: text(size: 8.5pt)[1 tom], bend: 40deg),
  edge(<A>, <B>, "->", label: text(size: 8.5pt)[1 tom], bend: 40deg),
  edge(<B>, <CC>, "->", label: text(size: 8.5pt, weight: "bold")[semitom], bend: -40deg, label-side: right),
)))

De um Dó ao próximo Dó há 6 tons (12 semitons): essa distância se chama *oitava*. As notas se repetem a cada oitava, com o mesmo nome, só que mais agudas.

== 2. Nome e qualidade de um intervalo

Todo intervalo tem um *nome* e uma *qualidade*:

- O *nome* (segunda, terça, quarta…) vem da contagem das *letras*, incluindo a primeira e a última. De Dó a Mi: Dó (1), Ré (2), Mi (3) → *terça*.
- A *qualidade* (maior, menor, justa, aumentada, diminuta) vem do número exato de *semitons*. De Dó a Mi são 4 semitons → *terça maior*. De Dó a Mib são 3 → *terça menor*.

=== Atalho: contando casas

Como *1 semitom = 1 casa*, numa mesma corda o intervalo é só uma questão de contar: a terça maior fica 4 casas acima da tônica, a quinta justa 7 casas acima, a oitava 12 casas acima (na 12ª casa da corda solta, por exemplo).

#block(breakable: false)[
A nota de partida é a *tônica* (T). Na tabela, os exemplos partem de Dó:

#tabela(
  columns: (1.7fr, 0.75fr, 0.85fr, 0.75fr, 2.2fr),
  alinhamento: (left + horizon, center + horizon, center + horizon, center + horizon, left + horizon),
  ([Intervalo], [Símbolo], [Semitons], [De Dó], [Sonoridade e uso]),
  (
    ([Uníssono (a própria tônica)], [*T*], [0], [C], [A mesma nota]),
    ([Segunda menor], [*b2*], [1], [Db], [Muito tensa; atrito forte]),
    ([Segunda maior], [*2*], [2], [D], [O "passo" das escalas; suave]),
    ([Terça menor], [*b3*], [3], [Eb], [Melancólica; define o acorde menor]),
    ([Terça maior], [*3*], [4], [E], [Alegre, aberta; define o acorde maior]),
    ([Quarta justa], [*4*], [5], [F], [Aberta; pede movimento]),
    ([Quarta aumentada / quinta diminuta], [*\#4 / b5*], [6], [F\# / Gb], [Muito instável: o *trítono* (3 tons)]),
    ([Quinta justa], [*5*], [7], [G], [Estável e forte; base do power chord]),
    ([Sexta menor], [*b6*], [8], [Ab], [Dramática, melancólica]),
    ([Sexta maior], [*6*], [9], [A], [Doce, luminosa]),
    ([Sétima menor], [*7*], [10], [Bb], [Tensão do acorde dominante; som de blues]),
    ([Sétima maior], [*7M*], [11], [B], [Suave e sofisticada; jazz e bossa nova]),
    ([Oitava], [*8*], [12], [C], [A mesma nota, mais aguda]),
  ),
)
]

#caixa(tipo: "atencao", titulo: "7 e 7M")[
  Na cifragem brasileira, *7* indica a *sétima menor* (10 semitons) e *7M* a *sétima maior* (11 semitons). É a mesma lógica das cifras de acordes: G7 tem sétima menor; C7M tem sétima maior.
]

== 3. Intervalos no braço

Na prática, em vez de andar numa corda só, usamos as *cordas vizinhas*: cada intervalo vira um *desenho fixo* em relação à tônica. No braço abaixo, a tônica é *Dó*, na 5ª corda, 3ª casa:

#block(breakable: false, grid(
  columns: (auto, 1fr),
  column-gutter: 1.8em,
  align: (center + horizon, left + horizon),
  [
    #braco-notas(
      fs: 1,
      cordas: ("5ª", "4ª", "3ª"),
      (
        ("", "", "T", "b2", "2"),
        ("b3", "3", "4", "b5", "5"),
        ("b6", "6", "7", "7M", "T"),
      ),
    )
    #v(0.2em)
    #text(size: 8.5pt, fill: color-muted)[Tônica Dó (C): 5ª corda, casa 3. \ O "T" da 3ª corda é a oitava. \ A casa b5 também é a \#4.]
  ],
  [
    #set text(size: 10pt)
    - *Terça maior (3)*: na corda de baixo (a 4ª), *uma casa antes* da tônica. *Terça menor (b3)*: duas casas antes.
    - *Quarta justa (4)*: na corda de baixo, *na mesma casa* da tônica.
    - *Quinta justa (5)*: na corda de baixo, *duas casas depois*. É o desenho do power chord.
    - *Oitava (8)*: *pulando uma corda*, duas casas depois.
  ],
))

Os mesmos desenhos valem com a tônica na *6ª corda* (as notas caem na 5ª e na 4ª corda) e em qualquer casa: mude a casa da tônica e todos os intervalos mudam junto.

#caixa(tipo: "atencao", titulo: "A 2ª corda (Si)")[
  Todas as cordas vizinhas estão a uma quarta justa (5 semitons) de distância, *menos a 3ª e a 2ª corda* (Sol e Si), que estão a uma terça maior (4 semitons). Por isso, sempre que um desenho passa para a 2ª corda, a nota fica *uma casa à frente* do que o desenho "normal" indicaria.
]

=== Exemplo: o power chord percorrendo o braço

#acordes(
  columns: 3,
  gutter: 3em,
  (
    (tabs: "1,3,x,x,x,x", nome: "F5", titulo: "Casa 1 — Fá"),
    (tabs: "3,5,x,x,x,x", nome: "G5", titulo: "Casa 3 — Sol"),
    (tabs: "5,7,x,x,x,x", nome: "A5", titulo: "Casa 5 — Lá"),
  ),
)

O desenho tônica + quinta justa nunca muda. Da casa 1 para a casa 3 a tônica sobe 1 tom (Fá → Sol); da 3 para a 5, mais 1 tom (Sol → Lá) — e o acorde inteiro sobe junto.

== 4. Enarmonia: o mesmo som, nomes diferentes

A 4ª casa da 4ª corda (Ré) pode ser chamada de *Fá sustenido* (F\#) ou de *Sol bemol* (Gb): as duas soam exatamente iguais. Isso é a *enarmonia*. Mas, como o *nome* do intervalo vem da contagem das letras, a escrita muda o intervalo:

#block(breakable: false, tabela(
  columns: (0.7fr, 1.2fr, 2.4fr, 1.6fr),
  ([Tônica], [Nota], [Contagem das letras], [Intervalo]),
  (
    ([C], [F\# (Fá sustenido)], [Dó (1) – Ré (2) – Mi (3) – *Fá (4)*], [Quarta aumentada (\#4)]),
    ([C], [Gb (Sol bemol)], [Dó (1) – Ré (2) – Mi (3) – Fá (4) – *Sol (5)*], [Quinta diminuta (b5)]),
  ),
))

Na guitarra o som é o mesmo, então por que se preocupar? Porque a escrita correta mostra a *função* da nota. Nas escalas de 7 notas, por exemplo, cada letra aparece *uma única vez*: a escala de Ré maior se escreve Ré, Mi, *Fá\#*, Sol, Lá, Si, *Dó\#* — e não Ré, Mi, Solb, Sol… Usar o nome certo de cada intervalo desde já evita confusões na leitura de cifras, escalas e acordes.

== 5. Treinando o ouvido

#block(breakable: false)[
Associar cada intervalo ao começo de uma melodia conhecida ajuda muito a reconhecê-lo de ouvido. Toque a tônica e o intervalo na guitarra e compare com a referência:

#tabela(
  columns: (1.3fr, 2.6fr),
  alinhamento: (left + horizon, left + horizon),
  ([Intervalo (subindo)], [Referência]),
  (
    ([Segunda menor (b2)], [Tema do filme _Tubarão_]),
    ([Segunda maior (2)], [Início de "Parabéns a Você"]),
    ([Terça menor (b3)], [Duas primeiras notas do riff de "Smoke on the Water" (Deep Purple)]),
    ([Terça maior (3)], [Início de "When the Saints Go Marching In"]),
    ([Quarta justa (4)], [Início da "Marcha Nupcial" de Wagner]),
    ([Trítono (\#4 / b5)], [Início de "Maria", do musical _West Side Story_]),
    ([Quinta justa (5)], [Início de "Brilha, Brilha, Estrelinha"]),
    ([Sexta maior (6)], [Início de "My Bonnie Lies Over the Ocean"]),
    ([Oitava (8)], [Início de "Somewhere Over the Rainbow"]),
  ),
)
]

== 6. Exercícios

#ex(titulo: "Meça e dê o nome")[
  Conte os semitons entre as notas e escreva o intervalo (nome e símbolo). A primeira nota é a tônica.

  #tabela-preencher(
    columns: (1fr, 1fr, 2.6fr, 1fr, 1fr, 2.6fr),
    ([Notas], [Semitons], [Intervalo], [Notas], [Semitons], [Intervalo]),
    (
      ([C – E], none, none, [A – G], none, none),
      ([C – Eb], none, none, [C – B], none, none),
      ([D – A], none, none, [G – C], none, none),
      ([E – F], none, none, [F – B], none, none),
    ),
  )
]

#ex(titulo: "Encontre a nota")[
  Escreva a nota que forma cada intervalo com a tônica indicada. Atenção à escrita: conte as letras.

  #tabela-preencher(
    columns: (1.1fr,) + (1fr,) * 6,
    ([Tônica], [3], [5], [7], [b3], [6], [7M]),
    (
      ([G (Sol)], none, none, none, none, none, none),
      ([A (Lá)], none, none, none, none, none, none),
    ),
  )
]

#ex(titulo: "Intervalos no braço")[
  A tônica é *Ré* (D), na 5ª corda, 5ª casa. Usando os desenhos da seção 3, escreva a nota, a corda e a casa de cada intervalo.

  #tabela-preencher(
    columns: (1.4fr, 1fr, 1fr, 1fr),
    ([Intervalo], [Nota], [Corda], [Casa]),
    (
      ([Terça menor (b3)], none, none, none),
      ([Terça maior (3)], none, none, none),
      ([Quinta justa (5)], none, none, none),
      ([Oitava (8)], none, none, none),
    ),
  )
]

#ex(titulo: "Enarmonia")[
  a) Em relação a Dó (C), qual nota é a quinta aumentada (\#5): G\# ou Ab? E qual é a sexta menor (b6)?

  #linhas-resposta(1)

  b) Em relação a Ré (D), a nota Fá (F) é uma terça menor ou uma segunda aumentada (\#2)? Justifique contando as letras.

  #linhas-resposta(2)
]

#ex(titulo: "Toque e cante", nivel: "Prática")[
  Escolha uma tônica na 5ª corda. Toque a tônica e, em seguida, cada intervalo da seção 3, cantando as duas notas. Depois repita com a tônica na 6ª corda. Quais intervalos você já reconhece só de ouvir?

  #linhas-resposta(1)
]

=== Sugestão de prática

#block(breakable: false, rotina-estudo((
  ([Dizer os intervalos a partir de uma tônica (ex.: de Sol: 3 = Si, 5 = Ré…)], [5 min], [—]),
  ([Tocar os desenhos da seção 3 com tônica na 5ª e na 6ª corda, em várias casas], [10 min], [60]),
  ([Treino de ouvido: tocar tônica + intervalo e comparar com as referências], [5 min], [—]),
)))

#block(breakable: false, checklist(
  titulo: "Autoavaliação",
  (
    [Meço intervalos em semitons, dou nome e qualidade e sei a diferença entre 7 e 7M.],
    [Encontro 3, b3, 4, 5 e 8 no braço a partir de uma tônica na 5ª ou 6ª corda.],
    [Entendo por que F\# e Gb formam intervalos diferentes com Dó.],
    [Reconheço de ouvido pelo menos a terça maior, a quinta e a oitava.],
  ),
))

#gabarito[
  #resposta(1)[C–E: 4 semitons, terça maior (3) · C–Eb: 3, terça menor (b3) · D–A: 7, quinta justa (5) · E–F: 1, segunda menor (b2) · A–G: 10, sétima menor (7) · C–B: 11, sétima maior (7M) · G–C: 5, quarta justa (4) · F–B: 6, quarta aumentada (\#4) — de Fá a Si há 4 letras (Fá, Sol, Lá, Si).]
  #resposta(2)[G: 3 = B, 5 = D, 7 = F, b3 = Bb, 6 = E, 7M = F\#. · A: 3 = C\#, 5 = E, 7 = G, b3 = C, 6 = F\#, 7M = G\#.]
  #resposta(3)[Terça menor: Fá (F), 4ª corda, casa 3 · Terça maior: Fá\# (F\#), 4ª corda, casa 4 · Quinta justa: Lá (A), 4ª corda, casa 7 · Oitava: Ré (D), 3ª corda, casa 7.]
  #resposta(4)[a) A quinta aumentada é G\# (Dó–Ré–Mi–Fá–*Sol*: 5 letras); a sexta menor é Ab (Dó–Ré–Mi–Fá–Sol–*Lá*: 6 letras). São a mesma casa, com nomes diferentes. b) Terça menor: Ré (1) – Mi (2) – Fá (3) são 3 letras, e a distância é de 3 semitons. Para ser segunda aumentada, a nota teria de se chamar Mi\# (E\#).]
  #resposta(5)[Exercício prático — critério de sucesso: tocar todos os desenhos sem consultar o diagrama, nas duas cordas, cantando as notas afinado; reconhecer de ouvido ao menos 3, 5 e 8.]
]
