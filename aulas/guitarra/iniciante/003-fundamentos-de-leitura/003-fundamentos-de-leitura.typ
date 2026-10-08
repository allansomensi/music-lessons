#import "/templates/layout.typ": *
#import "/templates/components.typ": *
#import "/templates/components.typ": caixa as caixa-modelo
#import "@preview/conchord:0.4.0": new-chordgen, overchord

#show: aula.with(
  instrumento: "Guitarra",
  nivel: "Iniciante",
)

#let chord = new-chordgen(number-to-left: true, use-shadow-barre: false, colors: (hold: black, barre: black))
#show <chord>: set text(fill: color-strong, weight: "bold")
#let och = overchord

// Texto de tabelas em 9,5pt (corpo do texto continua em 11pt)
#show table: set text(size: 9.5pt)

// Caixas com texto em 10pt (rótulo e corpo no mesmo tamanho)
#let caixa(..args) = {
  set text(size: 10pt)
  caixa-modelo(..args)
}

// Exercício que não se divide entre páginas (enunciado + área de resposta juntos)
#let ex(..args) = block(breakable: false, exercicio(..args))

#let legenda(body) = align(center, text(size: 8.5pt, fill: color-muted, body))

// ------------------------------------------------------------
// Notas cromáticas (com sustenidos), calculadas a partir da
// afinação de cada corda — evita erros de digitação.
// ------------------------------------------------------------
#let cromatica = ("C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B")
#let afinacao = (4, 9, 2, 7, 11, 4) // 6ª, 5ª, 4ª, 3ª, 2ª, 1ª corda (C = 0)
#let nota-em(corda-idx, casa) = cromatica.at(calc.rem(afinacao.at(corda-idx) + casa, 12))

= Fundamentos de Leitura

Antes de tocar músicas e montar acordes, você precisa dominar a *linguagem escrita* da guitarra: o nome das notas e das cifras, os símbolos \# e b, a afinação de cada corda, a localização das notas no braço e a leitura de diagramas de acordes e de cifras. Este material reúne tudo isso, com exercícios para fixar.

#objetivos((
  [Relacionar os nomes das notas em português (Dó, Ré, Mi…) com as letras da cifra (C, D, E…)],
  [Entender tom, semitom, sustenido (\#), bemol (b) e enarmonia],
  [Saber a nota de cada corda solta, encontrar notas no braço e afinar a guitarra],
  [Ler diagramas de acordes e cifras com segurança],
))

== 1. As notas musicais e a cifra

A música ocidental usa *7 notas naturais*. No Brasil usamos os nomes Dó, Ré, Mi…, mas a *cifra* — a escrita de acordes usada em revistas, sites e songbooks — usa *letras*, padrão internacional. Você precisa conhecer as duas formas.

#tabela(
  ([C], [D], [E], [F], [G], [A], [B]),
  (
    ([Dó], [Ré], [Mi], [Fá], [Sol], [Lá], [Si]),
  ),
)

A correspondência precisa ficar automática: ao ver "Am" numa cifra, você deve ler "Lá menor" sem pensar. Repare que a sequência das letras começa em Lá (A = Lá, B = Si, C = Dó…).

#caixa(tipo: "neutro", titulo: "Cifra × partitura")[
  A *cifra* mostra apenas os acordes e onde eles mudam: é um guia rápido da harmonia. A *partitura* é completa: registra a melodia exata, a duração de cada nota (o ritmo) e a intensidade (a dinâmica).
]

== 2. Tom, semitom, sustenido e bemol

O *semitom* é a menor distância entre duas notas na música ocidental. Na guitarra, *1 semitom = 1 casa*. Dois semitons formam *1 tom* (2 casas).

Entre as notas naturais, a distância é de 1 tom — *exceto* entre *Mi e Fá* e entre *Si e Dó*, que ficam a apenas 1 semitom. Nos espaços de 1 tom existe uma nota intermediária, e é para nomeá-la que existem os *acidentes*:

#block(breakable: false, cartoes-info((
  (titulo: [Sustenido (\#)], corpo: [*Sobe* a nota 1 semitom (1 casa em direção ao corpo da guitarra). \ Ex.: *F\#* (Fá sustenido) é a nota entre Fá e Sol.]),
  (titulo: [Bemol (b)], corpo: [*Desce* a nota 1 semitom (1 casa em direção à cabeça da guitarra). \ Ex.: *Bb* (Si bemol) é a nota entre Lá e Si.]),
)))


Com os acidentes, temos as *12 notas* da música ocidental. As colunas escuras são as notas intermediárias — cada uma tem dois nomes:

#align(center, block(
  stroke: 0.5pt + color-rule-dark,
  radius: 4pt,
  clip: true,
  table(
    columns: (1fr,) * 12,
    align: center + horizon,
    stroke: 0.5pt + color-rule-dark,
    inset: (x: 3pt, y: 7pt),
    fill: (c, r) => if c in (1, 3, 6, 8, 10) { color-rule-dark } else { white },
    ..(
      [C], [C\# \ Db], [D], [D\# \ Eb], [E], [F], [F\# \ Gb], [G], [G\# \ Ab], [A], [A\# \ Bb], [B],
    ).enumerate().map(((i, n)) => text(
      weight: "bold",
      fill: if i in (1, 3, 6, 8, 10) { white } else { color-strong },
      n,
    )),
  ),
))

#caixa(tipo: "resumo", titulo: "Enarmonia")[
  A mesma nota pode ter dois nomes: *C\# e Db* soam exatamente iguais e ocupam a mesma casa do braço. Isso se chama *enarmonia*. O nome correto depende da tonalidade (do tom) da música — por enquanto, basta saber que os dois nomes indicam o mesmo som.
]

== 3. As cordas soltas e a afinação padrão

A afinação mais usada na guitarra de 6 cordas é a *afinação padrão* (_standard tuning_ ou _E standard_). Da corda mais grave (6ª, a mais grossa) para a mais aguda (1ª, a mais fina):

#tabela(
  columns: (1fr, 0.8fr, 1.1fr, 0.9fr, 1fr),
  ([Corda], [Cifra], [Nota], [Oitava], [Frequência]),
  (
    ([*6ª* (a mais grossa)], [*E*], [Mi grave], [E2], [82,4 Hz]),
    ([*5ª*], [*A*], [Lá], [A2], [110,0 Hz]),
    ([*4ª*], [*D*], [Ré], [D3], [146,8 Hz]),
    ([*3ª*], [*G*], [Sol], [G3], [196,0 Hz]),
    ([*2ª*], [*B*], [Si], [B3], [246,9 Hz]),
    ([*1ª* (a mais fina)], [*E*], [Mi agudo], [E4], [329,6 Hz]),
  ),
)

Frequências com o Lá de referência em 440 Hz. O número da oitava (E2, E4…) indica a altura: a 1ª e a 6ª corda são ambas Mi, mas a 1ª está *duas oitavas acima*. Para memorizar a ordem E – A – D – G – B – E, use uma frase como "#strong[E]u #strong[A]mo #strong[D]ormir #strong[G]ostoso #strong[B]em #strong[E]ncolhido".

== 4. As notas no braço

Cada casa sobe 1 semitom. Partindo da nota da corda solta e andando casa por casa, você encontra todas as notas. Na *12ª casa* a nota da corda solta se repete, uma oitava acima — e a partir dali tudo recomeça.

#align(center, block(
  stroke: 0.5pt + color-rule-dark,
  radius: 4pt,
  clip: true,
  breakable: false,
  table(
    columns: (44pt,) + (1fr,) * 13,
    align: center + horizon,
    stroke: 0.4pt + color-rule-light,
    inset: (x: 2pt, y: 5.5pt),
    fill: (c, r) => {
      if r == 0 or c == 0 { color-subtle-bg-alt } else if nota-em(r - 1, c - 1).ends-with("#") { color-rule-dark } else {
        white
      }
    },
    text(weight: "bold")[Corda],
    ..range(13).map(i => text(weight: "bold")[#if i == 0 [Solta] else [#i]]),
    ..range(6)
      .map(ci => (
        text(weight: "bold")[#("6ª (E)", "5ª (A)", "4ª (D)", "3ª (G)", "2ª (B)", "1ª (E)").at(ci)],
        ..range(13).map(f => {
          let n = nota-em(ci, f)
          text(
            fill: if n.ends-with("#") { white } else { color-strong },
            weight: if n.ends-with("#") { "bold" } else { "regular" },
            size: 8.5pt,
            n,
          )
        }),
      ))
      .flatten(),
  ),
))

#legenda[Células escuras: notas com acidente (escritas aqui com \#; cada uma também tem o nome com b — C\# = Db, D\# = Eb…).]

#caixa(tipo: "dica", titulo: "Atalho")[
  Comece pelas notas naturais das duas cordas mais graves, que são as tônicas da maioria dos acordes. Na 6ª corda: F (1), G (3), A (5), B (7), C (8), D (10), E (12). Na 5ª corda: B (2), C (3), D (5), E (7), F (8), G (10), A (12).
]

== 5. Afinando a guitarra

Afine *sempre* antes de tocar: uma guitarra desafinada atrapalha o ouvido, confunde a memória das notas e desmotiva o estudo.

=== Método 1 — afinador cromático (recomendado)

#passos((
  [Prenda o afinador na cabeça da guitarra ou abra um aplicativo de afinação no celular.],
  [Toque uma corda solta de cada vez. O afinador mostra a nota mais próxima do som tocado.],
  [Gire a tarraxa: *apertar* a corda deixa a nota mais *aguda*; *afrouxar* deixa mais *grave*. Se a nota passar do ponto, afrouxe um pouco e suba de novo até ela — afinar "subindo" segura melhor a afinação.],
  [Quando o ponteiro ficar centralizado na nota certa (E, A, D, G, B, E), a corda está afinada.],
  [Depois de afinar todas, confira de novo: a mudança de tensão de uma corda altera levemente as outras.],
))

=== Método 2 — afinação relativa (entre as cordas)

Sem afinador, você pode afinar as cordas umas pelas outras. Com a 6ª corda como referência, pressione a casa indicada e ajuste a corda solta seguinte até as duas soarem iguais:

#tabela(
  columns: (1.3fr, 0.9fr, 1.6fr),
  ([Pressione…], [Na casa], [Deve soar igual à…]),
  (
    ([6ª corda (E)], [5ª], [5ª corda solta (A)]),
    ([5ª corda (A)], [5ª], [4ª corda solta (D)]),
    ([4ª corda (D)], [5ª], [3ª corda solta (G)]),
    ([3ª corda (G)], [*4ª*], [2ª corda solta (B)]),
    ([2ª corda (B)], [5ª], [1ª corda solta (E)]),
  ),
)

#caixa(tipo: "atencao")[
  Da 3ª para a 2ª corda usa-se a *4ª casa*, e não a 5ª. Entre Sol e Si há 4 semitons (uma terça maior); entre os outros pares de cordas há 5 semitons (uma quarta justa).
]

== 6. Como ler um diagrama de acordes

O diagrama de acordes é um desenho do braço visto *de frente*, com a guitarra em pé e a cabeça para cima: as linhas verticais são as cordas e as horizontais são os trastes.

#align(center, block(breakable: false, grid(
  columns: (auto, auto),
  column-gutter: 2.5em,
  align: (center + horizon, left + horizon),
  box(chord("x,0,2,2,1,0", name: "Am")),
  {
    set text(size: 9.5pt)
    table(
      columns: (26pt, auto),
      stroke: none,
      inset: (x: 4pt, y: 4.5pt),
      align: (center + horizon, left + horizon),
      box(width: 11pt, height: 11pt, fill: black, radius: 5.5pt), [*Ponto preto*: pressione esta corda nesta casa],
      text(size: 12pt)[○], [*Círculo aberto* (acima do diagrama): corda solta — toca sem pressionar],
      text(size: 11pt)[✕], [*X*: corda abafada — não deve soar],
      box(width: 22pt, height: 3pt, fill: black), [*Linha grossa no topo*: o capotraste — o diagrama começa na 1ª casa],
      text(weight: "bold", size: 11pt)[3], [*Número à esquerda*: a casa em que o diagrama começa],
      box(width: 22pt, height: 5pt, fill: black, radius: 2.5pt), [*Barra sobre várias cordas*: pestana — um dedo pressiona todas elas],
    )
  },
)))

#tabela(
  columns: (1fr, 1.4fr),
  ([No diagrama], [Na guitarra]),
  (
    ([Linha vertical da esquerda], [6ª corda (Mi grave)]),
    ([Linha vertical da direita], [1ª corda (Mi agudo)]),
    ([Primeira fileira de casas, no topo], [1ª casa (a mais perto da cabeça)]),
    ([Fileiras de baixo], [Casas seguintes, em direção ao corpo]),
  ),
)

=== Numeração dos dedos da mão esquerda

#cartoes-info((
  (titulo: "1", corpo: align(center)[Indicador]),
  (titulo: "2", corpo: align(center)[Médio]),
  (titulo: "3", corpo: align(center)[Anelar]),
  (titulo: "4", corpo: align(center)[Mínimo]),
))

#legenda[O polegar fica apoiado atrás do braço e não aparece nos diagramas.]

=== Diagrama em forma de texto

O mesmo acorde também pode ser escrito como uma sequência de 6 números, da *6ª corda para a 1ª*: o número é a casa, *0* é corda solta e *x* é corda abafada. O Am do diagrama acima fica *x 0 2 2 1 0*. Abaixo, um acorde na 3ª casa, com pestana:

#grid-acordes(
  chord: chord,
  columns: 1,
  (
    (tabs: "x,3,5,5,5,3", nome: "C", titulo: "x 3 5 5 5 3", detalhe: "Pestana do dedo 1 na 3ª casa (5ª à 1ª corda); dedos 2, 3 e 4 na 5ª casa"),
  ),
)

== 7. Como ler uma cifra

A *cifra* indica os acordes de uma música escrevendo seus nomes *acima da letra* (ou dos compassos), exatamente sobre a sílaba em que cada acorde começa. O acorde vale até aparecer o próximo.

#align(center, block(
  fill: white,
  stroke: 0.5pt + color-rule-dark,
  inset: (x: 18pt, y: 12pt),
  radius: 5pt,
  breakable: false,
  [
    #set align(left)
    #set par(leading: 1.6em)
    #och[C] Vou tocar meu vio #och[G]lão \
    #och[Am] Na luz do meu ve #och[F]rão
  ],
))

#legenda[Exemplo criado para este material: C (Dó maior) começa em "Vou", G (Sol maior) na sílaba "lão", Am (Lá menor) em "Na" e F (Fá maior) em "rão".]

=== O que significa cada símbolo

#tabela(
  columns: (0.85fr, 2fr, 1.9fr),
  alinhamento: (center + horizon, left + horizon, left + horizon),
  ([Símbolo], [Significado], [Exemplo]),
  (
    ([A a G], [A letra é a tônica do acorde. Só a letra = acorde maior], [C = Dó maior]),
    ([m], [Acorde menor], [Am = Lá menor]),
    ([\#], [Sustenido na tônica], [F\# = Fá sustenido maior]),
    ([b], [Bemol na tônica], [Bb = Si bemol maior]),
    ([7], [Acrescenta a sétima menor], [G7 = Sol com sétima]),
    ([7M], [Acrescenta a sétima maior], [C7M = Dó com sétima maior]),
    ([5], [_Power chord_: só tônica e quinta], [E5 = Mi5 (Mi + Si)]),
    ([sus4 / sus2], [A terça é substituída pela 4ª ou pela 2ª], [Dsus4 = Ré com quarta suspensa]),
    ([(add9)], [Acrescenta a nona sem tirar nenhuma nota], [C(add9) = Dó com nona adicionada]),
    ([/], [A nota depois da barra é o baixo (a nota mais grave)], [G/B = Sol com baixo em Si]),
    ([º], [Acorde diminuto], [Bº = Si diminuto]),
    ([+], [Acorde aumentado], [E+ = Mi aumentado]),
  ),
)

#caixa(tipo: "dica", titulo: "Outras grafias")[
  Em sites e songbooks você também vai encontrar o mesmo acorde escrito de outras formas: *maj7* (= 7M), *dim* (= º), *aug* (= +) e *A-* (= Am). Neste material usamos sempre 7M, º, + e m.
]

== 8. Exercícios

#ex(titulo: "Letras e nomes")[
  Complete a tabela: escreva a cifra das notas em português e o nome em português das cifras.

  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1.5em,
    tabela-preencher(
      ([Nome], [Cifra]),
      (([Sol], none), ([Si], none), ([Fá], none), ([Ré], none)),
    ),
    tabela-preencher(
      ([Cifra], [Nome]),
      (([A], none), ([E], none), ([C], none), ([B], none)),
    ),
  )
]

#ex(titulo: "Semitons e enarmonia")[
  a) Escreva o outro nome (enarmônico) de cada nota.

  #tabela-preencher(
    columns: (1.4fr,) + (1fr,) * 4,
    ([Nota], [C\#], [Eb], [G\#], [Bb]),
    (([Outro nome], none, none, none, none),),
  )

  b) Entre quais pares de notas naturais a distância é de apenas 1 semitom?

  #linhas-resposta(1)
]

#ex(titulo: "Encontre as notas no braço")[
  Sem olhar a tabela da seção 4, escreva a nota de cada posição. Depois confira contando as casas a partir da corda solta.

  #tabela-preencher(
    columns: (1.2fr,) + (1fr,) * 8,
    ([Corda], [6ª], [6ª], [5ª], [5ª], [4ª], [3ª], [2ª], [1ª]),
    (
      ([Casa], [3], [8], [3], [7], [5], [2], [1], [5]),
      ([Nota], none, none, none, none, none, none, none, none),
    ),
  )
]

#ex(titulo: "Afinação relativa")[
  Complete: para afinar cada corda solta pela anterior, qual casa você pressiona?

  #tabela-preencher(
    columns: (1.6fr, 1fr, 1.6fr),
    ([Pressione a…], [Casa], [Para afinar a…]),
    (
      ([6ª corda], none, [5ª corda solta]),
      ([4ª corda], none, [3ª corda solta]),
      ([3ª corda], none, [2ª corda solta]),
      ([2ª corda], none, [1ª corda solta]),
    ),
  )
]

#ex(titulo: "Leia os diagramas")[
  Escreva cada diagrama em forma de texto, da 6ª corda para a 1ª (número da casa, 0 = solta, x = abafada).

  #grid-acordes(
    chord: chord,
    columns: 3,
    gutter: 3em,
    (
      (tabs: "x,3,2,0,1,0", nome: " ", titulo: [1) #box(width: 3.2cm, repeat[\_])]),
      (tabs: "3,2,0,0,0,3", nome: " ", titulo: [2) #box(width: 3.2cm, repeat[\_])]),
      (tabs: "x,5,7,7,7,5", nome: " ", titulo: [3) #box(width: 3.2cm, repeat[\_])]),
    ),
  )
]

#ex(titulo: "Interprete as cifras")[
  Escreva o nome completo de cada acorde, em português.

  #tabela-preencher(
    columns: (0.8fr, 2.2fr, 0.8fr, 2.2fr),
    ([Cifra], [Nome], [Cifra], [Nome]),
    (
      ([Dm], none, [Bb7], none),
      ([F\#], none, [C7M], none),
      ([Asus4], none, [G/B], none),
      ([Bº], none, [E5], none),
    ),
  )
]

=== Sugestão de prática

#rotina-estudo((
  ([Afinar a guitarra com afinador e conferir pela afinação relativa], [5 min], [—]),
  ([Dizer em voz alta as notas da 6ª corda, casa por casa, até a 12ª], [5 min], [60]),
  ([Repetir o mesmo na 5ª corda], [5 min], [60]),
  ([Ler 3 diagramas novos e escrevê-los em forma de texto], [5 min], [—]),
))

#block(breakable: false, checklist(
  titulo: "Autoavaliação",
  (
    [Converto nomes de notas em cifras (e vice-versa) sem pensar.],
    [Sei o que são tom, semitom, sustenido, bemol e enarmonia.],
    [Sei as notas das cordas soltas e encontro notas nas 6ª e 5ª cordas.],
    [Afino a guitarra com afinador e pela afinação relativa.],
    [Leio diagramas de acordes e cifras sem ajuda.],
  ),
))

#gabarito[
  #resposta(1)[Sol = G · Si = B · Fá = F · Ré = D · A = Lá · E = Mi · C = Dó · B = Si.]
  #resposta(2)[a) C\# = Db · Eb = D\# · G\# = Ab · Bb = A\#. b) Mi–Fá (E–F) e Si–Dó (B–C).]
  #resposta(3)[6ª casa 3 = G · 6ª casa 8 = C · 5ª casa 3 = C · 5ª casa 7 = E · 4ª casa 5 = G · 3ª casa 2 = A · 2ª casa 1 = C · 1ª casa 5 = A.]
  #resposta(4)[6ª corda: 5ª casa · 4ª corda: 5ª casa · 3ª corda: *4ª casa* · 2ª corda: 5ª casa.]
  #resposta(5)[1) x 3 2 0 1 0 (é o acorde C) · 2) 3 2 0 0 0 3 (é o acorde G) · 3) x 5 7 7 7 5 (é o acorde D, com pestana na 5ª casa).]
  #resposta(6)[Dm = Ré menor · Bb7 = Si bemol com sétima · F\# = Fá sustenido maior · C7M = Dó com sétima maior · Asus4 = Lá com quarta suspensa · G/B = Sol com baixo em Si · Bº = Si diminuto · E5 = Mi5 (power chord: Mi + Si).]
]
