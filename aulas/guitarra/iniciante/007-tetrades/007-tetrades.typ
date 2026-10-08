#import "/templates/layout.typ": *
#import "/templates/components.typ": *
#import "/templates/components.typ": caixa as caixa-modelo, tabela as tabela-modelo
#import "@preview/conchord:0.4.0": new-chordgen

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

// Tabelas curtas que não se dividem entre páginas
#let tabela(..args) = block(breakable: false, tabela-modelo(..args))

// Exercício que não se divide entre páginas (enunciado + área de resposta juntos)
#let ex(..args) = block(breakable: false, exercicio(..args))

// Grade de diagramas que não se divide entre páginas
#let acordes(..args) = block(breakable: false, grid-acordes(chord: chord, ..args))

// Inversões de uma tétrade (cordas 6, 4, 3 e 2; a 5ª corda é abafada).
// O ",*" no fim da tab evita que o diagrama desenhe pestana sobre a 5ª corda.
#let inversoes(cifra, tabs, baixos) = acordes(
  columns: 4,
  gutter: 2em,
  range(4).map(i => (
    tabs: tabs.at(i) + ",*",
    nome: if i == 0 { cifra } else { cifra + "/" + baixos.at(i) },
    titulo: ("Estado fundamental", "1ª inversão", "2ª inversão", "3ª inversão").at(i),
    detalhe: [Baixo: #baixos.at(i) (#("tônica", "terça", "quinta", "sétima").at(i))],
  )),
)

= Tétrades

A *tétrade* é uma tríade com mais uma terça empilhada sobre a quinta: a *sétima*. Enquanto a tríade define o caráter básico do acorde (maior, menor…), a sétima acrescenta cor e tensão. As tétrades são a base da harmonia do jazz, do blues, da bossa nova e de boa parte da música popular brasileira. Neste material você vai construir os quatro tipos principais, tocá-los no braço, entender o acorde dominante e usar inversões para ligar acordes com suavidade.

#objetivos((
  [Construir as tétrades 7M, 7, m7 e m7(b5) a partir de qualquer tônica],
  [Diferenciar a sétima menor (7) da sétima maior (7M) na cifra e no som],
  [Entender por que o acorde dominante (V7) "pede" resolução na tônica],
  [Tocar as quatro posições (estado fundamental e três inversões) de cada tipo],
  [Ligar acordes com condução de vozes numa progressão IIm7 – V7 – I7M],
))

== 1. Da tríade à tétrade

Para formar uma tétrade, continue empilhando terças: depois de Dó – Mi – Sol vem *Si*. A nota nova é a *sétima* do acorde, e pode ser de dois tamanhos:

- *Sétima menor* — símbolo *7* — fica 10 semitons acima da tônica. De Dó: *Sib*.
- *Sétima maior* — símbolo *7M* — fica 11 semitons acima da tônica. De Dó: *Si*.

A diferença é de apenas 1 semitom, mas o efeito é enorme: C7M (com Si) soa suave e sofisticado; C7 (com Sib) soa tenso, com cara de blues.

== 2. Os quatro tipos principais

#tabela(
  columns: (1.5fr, 0.95fr, 1.25fr, 1.55fr, 1.4fr),
  alinhamento: (left + horizon, center + horizon, center + horizon, center + horizon, left + horizon),
  ([Tipo], [Cifra], [Fórmula], [Notas em Dó], [Sonoridade]),
  (
    ([*Maior com sétima maior*], [C7M], [T – 3 – 5 – 7M], [Dó – Mi – Sol – Si], [Suave, luminosa]),
    ([*Dominante* (maior com sétima menor)], [C7], [T – 3 – 5 – 7], [Dó – Mi – Sol – Sib], [Tensa; pede resolução]),
    ([*Menor com sétima menor*], [Cm7], [T – b3 – 5 – 7], [Dó – Mib – Sol – Sib], [Melancólica, macia]),
    ([*Meio-diminuta* (menor com sétima e quinta diminuta)], [Cm7(b5)], [T – b3 – b5 – 7], [Dó – Mib – Solb – Sib], [Instável, sombria]),
  ),
)

#caixa(tipo: "neutro", titulo: "Outras tétrades")[
  Existem outras combinações, como a *diminuta* Cº7 (T – b3 – b5 – bb7; a bb7 é a sétima diminuta, que soa igual à 6ª) e a *menor com sétima maior* Cm(7M) (T – b3 – 5 – 7M). Os quatro tipos da tabela, porém, são os que aparecem naturalmente nos tons maiores e respondem pela grande maioria das cifras.
]

== 3. As tétrades de Dó no braço

#acordes(
  columns: 4,
  gutter: 2em,
  (
    (tabs: "x,3,2,0,0,0", nome: "C7M", titulo: "Maior com 7M", detalhe: "Dó · Mi · Sol · Si · Mi"),
    (tabs: "x,3,2,3,1,0", nome: "C7", titulo: "Dominante", detalhe: "Dó · Mi · Sib · Dó · Mi"),
    (tabs: "x,3,5,3,4,3", nome: "Cm7", titulo: "Menor com 7", detalhe: "Dó · Sol · Sib · Mib · Sol"),
    (tabs: "x,3,4,3,4,x", nome: "Cm7(b5)", titulo: "Meio-diminuta", detalhe: "Dó · Solb · Sib · Mib"),
  ),
)

#caixa(tipo: "dica", titulo: "Notas que podem faltar")[
  No C7 acima não há Sol (a quinta). Na guitarra, é comum omitir a quinta das tétrades maiores, menores e dominantes: ela é a nota que menos interfere no caráter do acorde. Tônica, terça e sétima são as notas essenciais. Na meio-diminuta, a b5 não pode faltar — é ela que define o acorde.
]

== 4. O acorde dominante

O acorde *dominante* (V7) é o acorde maior com sétima menor construído sobre o 5º grau de um tom — em Dó maior, *G7* (Sol – Si – Ré – Fá). Entre a terça (Si) e a sétima (Fá) há um *trítono* (3 tons), um dos intervalos mais instáveis da música. Essa tensão "puxa" o acorde para a tônica:

#block(breakable: false, grid(
  columns: (auto, auto, auto, 1fr),
  column-gutter: 1.6em,
  align: horizon,
  box(chord("3,2,0,0,0,1", name: "G7")),
  text(size: 20pt, fill: color-strong)[→],
  box(chord("x,3,2,0,1,0", name: "C")),
  [
    #set text(size: 10pt)
    Ao passar de G7 para C, *Si sobe meio tom para Dó* e *Fá desce meio tom para Mi*: o trítono se resolve e a tensão vira repouso. Esse movimento *V7 → I* é a cadência mais importante da música tonal.
  ],
))

Em qualquer tom maior, o V7 é o acorde dominante que leva à tônica: em Sol maior, *D7 → G*; em Fá maior, *C7 → F*; em Ré maior, *A7 → D*.

== 5. Inversões de tétrades

Com quatro notas, a tétrade tem *quatro posições*: o estado fundamental e três inversões, conforme a nota que vai para o baixo.

#tabela(
  columns: (1.3fr, 1fr, 1.6fr, 1fr),
  ([Posição], [Baixo], [Ordem das notas], [Exemplo]),
  (
    ([Estado fundamental], [Tônica], [T – 3 – 5 – 7], [C7]),
    ([1ª inversão], [Terça], [3 – 5 – 7 – T], [C7/E]),
    ([2ª inversão], [Quinta], [5 – 7 – T – 3], [C7/G]),
    ([3ª inversão], [Sétima], [7 – T – 3 – 5], [C7/Bb]),
  ),
)

Os diagramas a seguir usam as cordas 6, 4, 3 e 2. A *5ª corda não soa*: abafe-a encostando de leve o dedo que toca a 6ª corda, e não toque a 1ª corda.

=== Maior com sétima maior (C7M)

#inversoes("C7M", ("8,x,9,9,8,x", "12,x,10,12,12,x", "3,x,2,4,1,x", "7,x,5,5,5,x"), ("C", "E", "G", "B"))

=== Dominante (C7)

#inversoes("C7", ("8,x,8,9,8,x", "12,x,10,12,11,x", "3,x,2,3,1,x", "6,x,5,5,5,x"), ("C", "E", "G", "Bb"))

=== Menor com sétima menor (Cm7)

#inversoes("Cm7", ("8,x,8,8,8,x", "11,x,10,12,11,x", "3,x,1,3,1,x", "6,x,5,5,4,x"), ("C", "Eb", "G", "Bb"))

=== Meio-diminuta (Cm7(b5))

#inversoes("Cm7(b5)", ("8,x,8,8,7,x", "11,x,10,11,11,x", "2,x,1,3,1,x", "6,x,4,5,4,x"), ("C", "Eb", "Gb", "Bb"))

== 6. Condução de vozes: IIm7 – V7 – I7M

Na prática, ninguém fica saltando pelo braço tocando só acordes no estado fundamental. A grande utilidade das inversões é a *condução de vozes*: ligar os acordes movendo as notas o mínimo possível. Veja a progressão *IIm7 – V7 – I7M* em Dó maior (Dm7 – G7 – C7M), com o G7 *invertido*:

#acordes(
  columns: 3,
  gutter: 3em,
  (
    (tabs: "10,x,10,10,10,x,*", nome: "Dm7", titulo: "IIm7 — fundamental", detalhe: "Ré · Dó · Fá · Lá"),
    (tabs: "10,x,9,10,8,x,*", nome: "G7/D", titulo: "V7 — 2ª inversão", detalhe: "Ré · Si · Fá · Sol"),
    (tabs: "8,x,9,9,8,x,*", nome: "C7M", titulo: "I7M — fundamental", detalhe: "Dó · Si · Mi · Sol"),
  ),
)

De Dm7 para G7/D, o Ré do baixo e o Fá ficam parados; Dó desce para Si e Lá desce para Sol. De G7/D para C7M, Si e Sol ficam; Ré desce para Dó e Fá desce para Mi — exatamente a resolução do trítono. A mão quase não se desloca e a progressão soa ligada, como um naipe de vozes.

#caixa(tipo: "dica")[
  Não tente decorar tudo de uma vez. Escolha um tipo de tétrade (por exemplo, a dominante) e toque suas quatro posições subindo e descendo o braço, dizendo em voz alta qual nota está no baixo (T, 3, 5 ou 7).
]

== 7. Exercícios

#ex(titulo: "Monte as tétrades")[
  Escreva as quatro notas de cada acorde.

  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1.5em,
    tabela-preencher(
      ([Acorde], [T], [3ª], [5ª], [7ª]),
      (([G7], none, none, none, none), ([Am7], none, none, none, none), ([F7M], none, none, none, none)),
    ),
    tabela-preencher(
      ([Acorde], [T], [3ª], [5ª], [7ª]),
      (([Bm7(b5)], none, none, none, none), ([D7], none, none, none, none), ([Em7], none, none, none, none)),
    ),
  )
]

#ex(titulo: "Qual é a tétrade?")[
  Dê a cifra de cada acorde. A primeira nota é a tônica.

  #tabela-preencher(
    columns: (1.5fr, 1fr, 1.5fr, 1fr),
    ([Notas], [Cifra], [Notas], [Cifra]),
    (
      ([C – E – G – B], none, [A – C\# – E – G], none),
      ([D – F – A – C], none, [E – G – Bb – D], none),
      ([F – A – C – Eb], none, [G – B – D – F\#], none),
    ),
  )
]

#ex(titulo: "7 ou 7M?")[
  Qual nota diferencia *A7* de *A7M*? Qual dos dois é o acorde dominante?

  #linhas-resposta(2)
]

#ex(titulo: "Inversões")[
  Indique a posição de cada acorde (fundamental, 1ª, 2ª ou 3ª inversão).

  #tabela-preencher(
    columns: (1fr,) * 6,
    ([Acorde], [C7/Bb], [G7/B], [Am7/E], [Dm7/C], [F7M/A]),
    (([Posição], none, none, none, none, none),),
  )
]

#ex(titulo: "O dominante")[
  a) Qual é o acorde dominante (V7) de *Fá maior*? Escreva suas notas.

  #linhas-resposta(1)

  b) Entre quais notas desse acorde está o trítono? Para quais notas do acorde de Fá (F) elas resolvem?

  #linhas-resposta(2)
]

#ex(titulo: "IIm7 – V7 – I7M", nivel: "Prática")[
  Toque Dm7 – G7/D – C7M (seção 6), quatro tempos cada, a 60 BPM, em loop. Depois toque a mesma progressão só com acordes no estado fundamental (Dm7 com tônica na 6ª corda, casa 10; G7 na casa 3; C7M na casa 8) e compare: qual versão soa mais ligada? Por quê?

  #linhas-resposta(2)
]

=== Sugestão de prática

#block(breakable: false, rotina-estudo((
  ([Dizer as notas de tétrades a partir de várias tônicas (ex.: D7 = Ré – Fá\# – Lá – Dó)], [5 min], [—]),
  ([Tocar C7M → C7 → Cm7 → Cm7(b5) ouvindo a diferença], [3 min], [60]),
  ([Quatro posições de um tipo de tétrade, subindo e descendo o braço], [5 min], [60]),
  ([Resolução G7 → C e D7 → G, ouvindo o trítono se resolver], [3 min], [60]),
  ([Progressão Dm7 – G7/D – C7M em loop], [5 min], [60–80]),
)))

#block(breakable: false, checklist(
  titulo: "Autoavaliação",
  (
    [Monto 7M, 7, m7 e m7(b5) a partir de qualquer tônica.],
    [Sei a diferença entre 7 e 7M na cifra e no som.],
    [Explico por que o V7 pede resolução na tônica.],
    [Toco as quatro posições de pelo menos um tipo de tétrade.],
    [Toco IIm7 – V7 – I7M com condução de vozes.],
  ),
))

#gabarito[
  #resposta(1)[G7: G – B – D – F · Am7: A – C – E – G · F7M: F – A – C – E · Bm7(b5): B – D – F – A · D7: D – F\# – A – C · Em7: E – G – B – D.]
  #resposta(2)[C – E – G – B = C7M · A – C\# – E – G = A7 · D – F – A – C = Dm7 · E – G – Bb – D = Em7(b5) · F – A – C – Eb = F7 · G – B – D – F\# = G7M.]
  #resposta(3)[A sétima: A7 tem *Sol* (sétima menor, 10 semitons acima de Lá); A7M tem *Sol\#* (sétima maior, 11 semitons). O dominante é o A7.]
  #resposta(4)[C7/Bb: 3ª inversão · G7/B: 1ª inversão · Am7/E: 2ª inversão · Dm7/C: 3ª inversão · F7M/A: 1ª inversão.]
  #resposta(5)[a) C7: Dó – Mi – Sol – Sib. b) O trítono está entre Mi (terça) e Sib (sétima). Mi sobe meio tom para Fá; Sib desce meio tom para Lá — as notas Fá e Lá são a tônica e a terça de F.]
  #resposta(6)[Exercício prático — a versão com G7/D soa mais ligada, porque as notas comuns ficam paradas e as demais se movem por meio tom ou um tom; no estado fundamental, a mão salta de região e todas as vozes pulam.]
]
