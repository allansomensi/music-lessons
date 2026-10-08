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
#let todas = pc => nomes-notas.at(pc)

= Fundamentos de Leitura para o Baixo

Para tirar músicas, ler cifras e tablaturas ou conversar com outros músicos, você precisa da *linguagem escrita* do baixo: o nome das notas, a afinação das quatro cordas, onde cada nota fica no braço e como ler uma tablatura. Este material reúne essa base.

#objetivos((
  [Nomear as notas em português e em cifra e usar sustenido e bemol.],
  [Conhecer a afinação padrão do baixo e encontrar qualquer nota nas casas 0 a 12.],
  [Saber qual nota o baixo toca a partir de uma cifra de acorde, inclusive com baixo invertido (C/E).],
  [Ler e escrever tablaturas de baixo.],
))

== 1. As notas e a cifra

A música ocidental usa *sete notas naturais*. No Brasil falamos os nomes em português (Dó, Ré, Mi…), mas a *cifra* — usada em cifras de músicas, tablaturas e aplicativos — usa letras:

#tabela(
  ([*Cifra*], [*C*], [*D*], [*E*], [*F*], [*G*], [*A*], [*B*]),
  (([*Nome*], [Dó], [Ré], [Mi], [Fá], [Sol], [Lá], [Si]),),
  columns: (1.1fr,) + (1fr,) * 7,
  zebra: false,
)

Para memorizar, lembre que a cifra começa no Lá: *A* = Lá, *B* = Si, *C* = Dó, e assim por diante.

== 2. Semitom, tom, sustenido e bemol

No baixo, a régua para medir distâncias é a casa:

- *1 casa = 1 semitom* (ST), a menor distância entre duas notas;
- *2 casas = 1 tom* (T).

O *sustenido* (\#) *sobe* uma nota um semitom (uma casa para a frente); o *bemol* (b) *desce* uma nota um semitom (uma casa para trás). A casa entre Fá e Sol, por exemplo, pode se chamar *F\#* (Fá sustenido) ou *Gb* (Sol bemol): é o mesmo som com dois nomes.

#caixa(tipo: "atencao", titulo: "As duas exceções")[
  Entre *Mi–Fá* (E–F) e entre *Si–Dó* (B–C) a distância é de apenas *1 semitom*: não existe nota entre elas. Entre todas as outras notas naturais vizinhas há 1 tom (2 casas).
]

== 3. A afinação padrão

O baixo de 4 cordas é afinado, da corda mais grave para a mais aguda, em *Mi – Lá – Ré – Sol* (E – A – D – G). São as mesmas notas das quatro cordas mais graves do violão e da guitarra, mas *uma oitava abaixo*.

#tabela(
  ([*Corda*], [*Nota*], [*Cifra*], [*Altura exata*], [*Frequência*]),
  (
    ([4ª (a mais grossa)], [Mi grave], [E], [E1], [41,2 Hz]),
    ([3ª], [Lá], [A], [A1], [55,0 Hz]),
    ([2ª], [Ré], [D], [D2], [73,4 Hz]),
    ([1ª (a mais fina)], [Sol], [G], [G2], [98,0 Hz]),
  ),
  columns: (1.5fr, 1fr, 0.7fr, 1fr, 1fr),
  width: 90%,
)

O número ao lado da letra (E1, A1…) indica *em qual oitava* a nota está: quanto maior o número, mais aguda. As frequências valem para a afinação de referência Lá = 440 Hz, a mesma usada pelos afinadores.

== 4. As notas no braço

Como cada casa sobe um semitom, basta partir da corda solta e avançar pela sequência das 12 notas:

#align(center, text(weight: "bold")[C – C\# – D – D\# – E – F – F\# – G – G\# – A – A\# – B – (C)])

O diagrama mostra todas as notas das casas 0 (corda solta) a 12. A linha de cima é a *4ª corda (Mi grave)*; a de baixo, a *1ª corda (Sol)*. As notas com \# também podem ser lidas com bemol (C\# = Db, D\# = Eb, F\# = Gb, G\# = Ab, A\# = Bb).

#align(center)[
  #braco-notas(mapa-baixo(0, 12, todas), fs: 0, cordas: ("E", "A", "D", "G"))
]

Dois atalhos para se localizar:

- *Casa 12 = oitava:* ela repete a nota da corda solta, uma oitava acima. Depois dela, tudo se repete.
- *Casa 5 = próxima corda solta:* a casa 5 da 4ª corda é Lá (a 3ª corda solta); a casa 5 da 3ª corda é Ré; a casa 5 da 2ª corda é Sol. Esse é também o método mais comum de afinar o baixo de ouvido.

== 5. Lendo cifras como baixista

Numa cifra, cada acorde tem uma letra — a *tônica*, nota que dá nome ao acorde. Na maioria das músicas, o baixo toca justamente essa nota. O que vem depois da letra (m, 7, 7M…) descreve o acorde que o violão ou o teclado vai tocar, mas *não muda a tônica*.

#tabela(
  ([*Cifra*], [*Leitura*], [*Nota do baixo*]),
  (
    ([C], [Dó maior], [C (Dó)]),
    ([Am], [Lá menor], [A (Lá)]),
    ([G7], [Sol com sétima], [G (Sol)]),
    ([F\#m], [Fá sustenido menor], [F\# (Fá\#)]),
    ([*C/E*], [Dó maior com baixo em Mi], [*E (Mi)*]),
    ([*D/F\#*], [Ré maior com baixo em Fá\#], [*F\# (Fá\#)*]),
  ),
  columns: (0.7fr, 1.6fr, 1fr),
  width: 80%,
)

#caixa(tipo: "dica", titulo: "A barra é do baixista")[
  Quando a cifra tem uma barra (*C/E*), a nota *depois da barra* é a nota que o baixo deve tocar. É o chamado *baixo invertido* (ou inversão): o acorde continua sendo Dó maior, mas a nota mais grave passa a ser Mi.
]

== 6. Como ler uma tablatura de baixo

A *tablatura* (tab) mostra *onde* tocar cada nota. Ela tem uma linha para cada corda e números indicando as casas:

#grid(
  columns: (auto, 1fr),
  column-gutter: 1.5em,
  align: (center + horizon, left + horizon),
  tab("G|-----------------|\nD|-----------------|\nA|-------3---------|\nE|-0---3-----------|"),
  [
    - A linha de *cima* é a corda mais *aguda* (G); a de *baixo*, a mais *grave* (E) — como se você olhasse o baixo deitado no colo.
    - Os *números* indicam a *casa*; *0* é corda solta.
    - Leia *da esquerda para a direita*. No exemplo: Mi solto (E), casa 3 da 4ª corda (G) e casa 3 da 3ª corda (C).
  ],
)

Números *alinhados na mesma coluna* são tocados *ao mesmo tempo*. As barras verticais (|) separam os *compassos*. A tab básica não mostra a duração das notas: para o ritmo, ouça a gravação ou observe a partitura, quando houver.

=== Exemplo: tônicas de uma sequência de acordes

A sequência *C – G – Am – F*, uma das mais comuns da música popular, tocada com as tônicas (duas notas por acorde):

#tab(
  "G|--------|--------|--------|--------|\nD|--------|--------|--------|--------|\nA|-3---3--|--------|-0---0--|--------|\nE|--------|-3---3--|--------|-1---1--|",
  legenda: [C (3ª corda, casa 3) · G (4ª corda, casa 3) · A (3ª corda solta) · F (4ª corda, casa 1)],
)

== 7. Exercícios

#ex(titulo: "Qual é a nota?", nivel: "Escrita")[
  Escreva a nota (em cifra) de cada posição. Para notas com sustenido/bemol, escreva os dois nomes.

  #v(0.3em)
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1.2em,
    tabela-preencher(
      ([*Corda*], [*Casa*], [*Nota*]),
      (
        ([a) 4ª (E)], [3], none),
        ([b) 3ª (A)], [5], none),
        ([c) 2ª (D)], [7], none),
        ([d) 1ª (G)], [2], none),
      ),
      columns: (1.2fr, 0.8fr, 1.4fr),
    ),
    tabela-preencher(
      ([*Corda*], [*Casa*], [*Nota*]),
      (
        ([e) 4ª (E)], [8], none),
        ([f) 3ª (A)], [1], none),
        ([g) 2ª (D)], [4], none),
        ([h) 1ª (G)], [6], none),
      ),
      columns: (1.2fr, 0.8fr, 1.4fr),
    ),
  )
]

#ex(titulo: "Onde está a nota?", nivel: "Escrita")[
  Escreva em que casa (de 0 a 11) cada nota aparece na 4ª e na 3ª cordas.

  #v(0.3em)
  #tabela-preencher(
    ([*Nota*], [*C*], [*D*], [*F*], [*G*], [*Bb*], [*F\#*]),
    (
      ([Casa na 4ª corda (E)], none, none, none, none, none, none),
      ([Casa na 3ª corda (A)], none, none, none, none, none, none),
    ),
    columns: (2fr,) + (1fr,) * 6,
  )
]

#ex(titulo: "Lendo cifras", nivel: "Escrita")[
  Escreva a nota que o baixo deve tocar em cada acorde.

  #v(0.3em)
  #tabela-preencher(
    ([*Cifra*], [*Em*], [*D7*], [*Bb*], [*G/B*], [*Am/C*], [*C\#m*]),
    (([Nota do baixo], none, none, none, none, none, none),),
    columns: (1.6fr,) + (1fr,) * 6,
  )
]

#ex(titulo: "Lendo uma tablatura", nivel: "Escrita + prática")[
  Escreva, embaixo da tab, o nome (em cifra) de cada nota, na ordem. Depois, toque a sequência devagar.

  #tab("G|-------------1-2-|\nD|-------0-2-4-----|\nA|-0-2-4-----------|\nE|-----------------|")
  #linhas-resposta(2)
]

#ex(titulo: "Escrevendo uma tablatura", nivel: "Escrita + prática")[
  Escreva na tab abaixo as tônicas da sequência *G – Em – C – D*, uma nota por compasso, usando apenas a 4ª e a 3ª cordas (casas 0 a 5). Depois, toque contando 4 tempos por nota.

  #tab-vazia(sistemas: 1, compassos: 4, cordas: 4, altura-linha: 11pt)
]

#ex(titulo: "Afinação e oitavas", nivel: "Escrita")[
  a) Que nota soa na casa 12 da 3ª corda? \
  b) Que casa da 2ª corda tem a mesma nota da 1ª corda solta? \
  c) Qual corda do baixo tem a mesma nota da 6ª corda do violão, uma oitava abaixo?

  #linhas-resposta(3)
]

=== Sugestão de prática

#block(breakable: false, rotina-estudo((
  ([Dizer o nome das notas da 4ª corda, casa por casa (0 → 12 → 0)], [3 min], [—]),
  ([O mesmo na 3ª corda], [3 min], [—]),
  ([Nota sorteada: achar na 4ª e na 3ª cordas sem contar desde a corda solta], [4 min], [—]),
  ([Tônicas de C – G – Am – F (tab da seção 6), duas notas por acorde], [5 min], [60–80]),
)))

#v(0.6em)

#checklist(
  (
    [Traduzo nomes de notas para cifra e vice-versa.],
    [Sei que 1 casa = 1 semitom e que entre E–F e B–C não há nota intermediária.],
    [Digo a nota de qualquer casa da 4ª e da 3ª cordas em poucos segundos.],
    [Sei qual nota tocar a partir de uma cifra, inclusive com barra (C/E).],
    [Leio e escrevo tablaturas de baixo.],
  ),
  titulo: "Autoavaliação",
)

#gabarito[
  #resposta(1)[a) G · b) D · c) A · d) A · e) C · f) A\# / Bb · g) F\# / Gb · h) C\# / Db.]
  #resposta(2)[
    *4ª corda (E):* C = 8 · D = 10 · F = 1 · G = 3 · Bb = 6 · F\# = 2. \
    *3ª corda (A):* C = 3 · D = 5 · F = 8 · G = 10 · Bb = 1 · F\# = 9.
  ]
  #resposta(3)[Em → E · D7 → D · Bb → Bb · G/B → B · Am/C → C · C\#m → C\#.]
  #resposta(4)[A – B – C\# – D – E – F\# – G\# – A (é a escala de Lá maior).]
  #resposta(5)[
    Uma solução: G = 4ª corda, casa 3 · E = 4ª corda solta · C = 3ª corda, casa 3 · D = 3ª corda, casa 5.
    #tab("G|--------|--------|--------|--------|\nD|--------|--------|--------|--------|\nA|--------|--------|-3------|-5------|\nE|-3------|-0------|--------|--------|")
  ]
  #resposta(6)[a) Lá (A), uma oitava acima da corda solta · b) casa 5 (Sol) · c) a 4ª corda (Mi).]
]
