#import "/templates/layout.typ": *
#import "/templates/components.typ": *
#import "@preview/conchord:0.4.0": new-chordgen

#show: aula.with(
  instrumento: "Guitarra",
  nivel: "Iniciante",
)

#let chord = new-chordgen(number-to-left: true, use-shadow-barre: false, colors: (hold: black, barre: black))
#show <chord>: set text(fill: color-strong, weight: "bold")

// Tabelas, caixas e diagramas não se partem entre páginas (os blocos
// que precisam quebrar, como `exercicio`, já declaram breakable: true).
#set block(breakable: false)

// Exercício que não se divide entre páginas (enunciado + área de resposta juntos)
#let ex(..args) = block(breakable: false, above: 1.5em, below: 0.9em, exercicio(..args))

// ============================================================
// HELPERS LOCAIS — mapa de notas calculado a partir da afinação
// ============================================================
// As notas são calculadas (e não digitadas à mão) para eliminar
// erros: afinação padrão E A D G B E, classes de altura 0 = C.

#let nomes-notas = ("C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B")
#let afinacao = (4, 9, 2, 7, 11, 4) // 6ª, 5ª, 4ª, 3ª, 2ª, 1ª corda
#let naturais = (0, 2, 4, 5, 7, 9, 11)

// Gera as linhas de `braco-notas` para as cordas pedidas.
// `rotulo` recebe a classe de altura (0–11) e devolve o texto do círculo.
#let mapa(fs, fe, rotulo, cordas: (6, 5, 4, 3, 2, 1)) = cordas.map(c => range(fs, fe + 1).map(f => rotulo(
  calc.rem(afinacao.at(6 - c) + f, 12),
)))

#let so-naturais = pc => if pc in naturais { nomes-notas.at(pc) } else { "" }
#let so-nota(alvo) = pc => if pc == alvo { nomes-notas.at(pc) } else { "" }

// Legenda pequena centralizada abaixo de diagramas
#let legenda(body) = align(center, text(size: 8.5pt, fill: color-muted, body))

= Notas no Braço

É comum aprender acordes, escalas e shapes como *desenhos*. Eles funcionam — mas só enquanto você está no lugar de sempre. No momento em que alguém pede "toca esse riff em Sib" ou "faz um Dó com pestana", o desenho sozinho não basta: você precisa saber *onde está cada nota*. Nesta aula vamos transformar o braço de um mapa sem nomes em um mapa com todas as ruas sinalizadas, com um método simples e gradual.

#objetivos((
  [Entender por que memorizar as notas do braço muda a forma como você toca],
  [Aplicar o padrão das notas naturais (Mi–Fá e Si–Dó sem casa entre elas) em qualquer corda],
  [Localizar rapidamente qualquer nota nas 6ª e 5ª cordas usando os marcadores do braço],
  [Usar os shapes de oitava para encontrar a mesma nota em todas as cordas],
  [Encontrar a casa certa para acordes com pestana a partir da tônica],
))

== 1. Por que memorizar as notas?

Muitos guitarristas tocam anos usando apenas desenhos. Saber o nome das notas não substitui os shapes: ele os torna *móveis e conscientes*. Veja o que muda na prática:

#cartoes-info((
  (
    titulo: "Acordes em qualquer tom",
    corpo: [Um shape com pestana só vira o acorde certo se você souber em qual casa está a tônica. Sabendo as notas, um único desenho serve para os 12 tons.],
  ),
  (
    titulo: "Escalas e solos",
    corpo: [A pentatônica de Lá começa onde está o Lá. Quem sabe onde estão as notas encaixa qualquer escala em qualquer tom em segundos.],
  ),
  (
    titulo: "Comunicação",
    corpo: [Ensaios, gravações e conversas entre músicos usam nomes de notas. "Começa no Ré da 5ª corda" é uma instrução que você precisa entender na hora.],
  ),
))

#v(0.6em)

#caixa(tipo: "atencao")[
  Não tente decorar as 132 casas (6 cordas × 22 casas) de uma vez. O segredo é aprender *poucas notas-âncora* e um punhado de *padrões* que levam de uma corda à outra. É isso que esta aula entrega.
]

== 2. As notas naturais e o padrão Mi–Fá / Si–Dó

As 7 notas naturais são *Dó, Ré, Mi, Fá, Sol, Lá e Si* (C D E F G A B). Na guitarra, cada casa corresponde a *1 semitom*. Entre quase todas as notas naturais existe uma casa intermediária — com *duas exceções*: entre *Mi e Fá* e entre *Si e Dó* a distância é de apenas um semitom, ou seja, *não existe casa entre elas*.

#v(0.4em)

#tabela(
  columns: (1.3fr,) + (1fr,) * 7,
  ([*Intervalo*], [C → D], [D → E], [*E → F*], [F → G], [G → A], [A → B], [*B → C*]),
  (
    ([Distância], [1 tom], [1 tom], [*semitom*], [1 tom], [1 tom], [1 tom], [*semitom*]),
    ([Na guitarra], [2 casas], [2 casas], [*1 casa*], [2 casas], [2 casas], [2 casas], [*1 casa*]),
  ),
)

#v(0.6em)

Observe o padrão na 6ª corda (Mi grave), da corda solta até a casa 12. As casas vazias são as notas com sustenido ou bemol; repare que *Mi–Fá* (casas 0–1) e *Si–Dó* (casas 7–8) ficam coladas:

#v(0.3em)

#align(center, block(breakable: false)[
  #braco-notas(mapa(0, 12, so-naturais, cordas: (6,)), fs: 0, cordas: ("6",))
])
#legenda[6ª corda (Mi grave): somente as notas naturais.]

#v(0.4em)

=== Sustenidos e bemóis

Cada casa vazia tem *dois nomes*: é o sustenido (\#) da nota de baixo e o bemol (b) da nota de cima. A casa 2 da 6ª corda, por exemplo, é *F\#* (Fá sustenido) *ou* *Gb* (Sol bemol) — o mesmo som, com nomes diferentes (notas *enarmônicas*). Qual nome usar depende do tom da música (a escrita segue a escala do tom); para localizar no braço, os dois nomes apontam para a mesma casa.

#caixa(tipo: "dica")[
  Para o trabalho de localização, pense assim: *depois do Mi vem o Fá* e *depois do Si vem o Dó*, sempre na casa seguinte. Todo o resto anda de duas em duas casas.
]

== 3. Os marcadores do braço

Os pontos (ou desenhos) incrustados no braço não são enfeite: eles ficam nas casas *3, 5, 7, 9 e 12* (esta com marcador duplo) e se repetem depois da 12 (15, 17, 19, 21). Associar uma nota a cada marcador nas duas cordas graves cria as suas *notas-âncora*:

#v(0.3em)

#tabela(
  columns: (1.4fr, 1fr, 1fr, 1fr, 1fr, 1fr),
  ([*Marcador (casa)*], [*3*], [*5*], [*7*], [*9*], [*12*]),
  (
    ([6ª corda (Mi)], [G — Sol], [A — Lá], [B — Si], [C\# / Db], [E — Mi]),
    ([5ª corda (Lá)], [C — Dó], [D — Ré], [E — Mi], [F\# / Gb], [A — Lá]),
  ),
)

#v(0.5em)

Com as âncoras, qualquer outra nota fica a uma ou duas casas de distância. Exemplo: quer o *Fá na 5ª corda*? A âncora da casa 7 é Mi; como *depois do Mi vem o Fá* na casa seguinte, o Fá está na *casa 8*.

== 4. As notas da 6ª e da 5ª cordas

As duas cordas mais graves são as mais importantes para memorizar primeiro: é nelas que ficam as *tônicas* dos acordes com pestana (shapes E e A — as formas abertas de Mi e Lá levadas para o braço com pestana), dos power chords e das posições principais das escalas.

#v(0.4em)

#align(center, block(breakable: false)[
  #braco-notas(mapa(0, 12, so-naturais, cordas: (6, 5)), fs: 0, cordas: ("6", "5"))
])
#legenda[Notas naturais nas cordas 6 e 5, da corda solta (0) até a casa 12.]

#v(0.5em)

A tabela abaixo mostra *todas* as notas, incluindo sustenidos e bemóis:

#v(0.3em)

#let enarm(a, b) = [#a\ #text(size: 7pt, fill: color-secondary, b)]
#block(width: 100%)[
  #set text(size: 8.5pt)
  #tabela(
    columns: (1.2fr,) + (1fr,) * 13,
    ([*Casa*],) + range(0, 13).map(i => [*#i*]),
    (
      (
        [*6ª*],
        [E],
        [F],
        enarm[F\#][Gb],
        [G],
        enarm[G\#][Ab],
        [A],
        enarm[A\#][Bb],
        [B],
        [C],
        enarm[C\#][Db],
        [D],
        enarm[D\#][Eb],
        [E],
      ),
      (
        [*5ª*],
        [A],
        enarm[A\#][Bb],
        [B],
        [C],
        enarm[C\#][Db],
        [D],
        enarm[D\#][Eb],
        [E],
        [F],
        enarm[F\#][Gb],
        [G],
        enarm[G\#][Ab],
        [A],
      ),
    ),
  )
]

#v(0.5em)

#caixa(tipo: "resumo")[
  *6ª corda:* G na 3 · A na 5 · B na 7 · C na 8 · D na 10 · E na 12. \
  *5ª corda:* C na 3 · D na 5 · E na 7 · F na 8 · G na 10 · A na 12. \
  *Bônus:* a *1ª corda* também é Mi — as notas dela são *idênticas às da 6ª*, duas oitavas acima.
]

== 5. A casa 12 é a oitava

Na casa 12 a corda vibra exatamente na metade do seu comprimento e soa *uma oitava acima* da corda solta — por isso o marcador é duplo. A partir dela, *tudo se repete*: a casa 13 tem a mesma nota da casa 1, a 15 a mesma da 3, a 17 a mesma da 5, e assim por diante.

#cartoes-info((
  (titulo: "Regra", corpo: align(center)[casa *n* + 12 = casa *n*]),
  (titulo: "Exemplo na 6ª", corpo: align(center)[casa 15 = casa 3 = *G (Sol)*]),
  (titulo: "Exemplo na 5ª", corpo: align(center)[casa 17 = casa 5 = *D (Ré)*]),
))

#v(0.4em)

Ou seja, aprender as casas 0 a 12 é aprender o braço inteiro. Acima da casa 12, subtraia 12 e use o que você já sabe.

== 6. Shapes de oitava: a mesma nota em outras cordas

Uma *oitava* é a mesma nota, mais aguda. No braço, as oitavas formam desenhos fixos: em todos eles a oitava fica *duas cordas acima* (pulando uma corda); o que muda é quantas casas você avança. São quatro shapes — e os dois últimos têm uma "pegadinha" causada pela afinação da corda Si.

#v(0.4em)

#let shape-oitava(titulo, dados, fs, texto) = block(breakable: false, width: 100%)[
  #align(center)[
    #text(size: 9.5pt, weight: "bold")[#titulo]
    #v(0.2em)
    #braco-notas(dados, fs: fs)
    #v(0.1em)
    #text(size: 8.5pt, fill: color-secondary)[#texto]
  ]
]

#grid(
  columns: (1fr,) * 4,
  column-gutter: 0.6em,
  shape-oitava(
    "6ª → 4ª",
    (
      ("G", "", ""),
      ("", "", ""),
      ("", "", "G"),
      ("", "", ""),
      ("", "", ""),
      ("", "", ""),
    ),
    3,
    [*+2 casas*\ G: 6ª casa 3 → 4ª casa 5],
  ),
  shape-oitava(
    "5ª → 3ª",
    (
      ("", "", ""),
      ("C", "", ""),
      ("", "", ""),
      ("", "", "C"),
      ("", "", ""),
      ("", "", ""),
    ),
    3,
    [*+2 casas*\ C: 5ª casa 3 → 3ª casa 5],
  ),
  shape-oitava(
    "4ª → 2ª",
    (
      ("", "", "", ""),
      ("", "", "", ""),
      ("G", "", "", ""),
      ("", "", "", ""),
      ("", "", "", "G"),
      ("", "", "", ""),
    ),
    5,
    [*+3 casas*\ G: 4ª casa 5 → 2ª casa 8],
  ),
  shape-oitava(
    "3ª → 1ª",
    (
      ("", "", "", ""),
      ("", "", "", ""),
      ("", "", "", ""),
      ("C", "", "", ""),
      ("", "", "", ""),
      ("", "", "", "C"),
    ),
    5,
    [*+3 casas*\ C: 3ª casa 5 → 1ª casa 8],
  ),
)

#v(0.6em)

#caixa(tipo: "atencao", titulo: "A exceção da corda Si")[
  Entre cordas vizinhas a distância é de 5 semitons (uma 4ª justa) — *exceto entre a 3ª (Sol) e a 2ª (Si)*, que estão a apenas 4 semitons (uma 3ª maior). Por isso, todo desenho que *atravessa* a fronteira entre a 3ª e a 2ª corda precisa avançar *uma casa a mais*. É a mesma razão pela qual os shapes de escala "entortam" nas cordas agudas.
]

#v(0.4em)

Há ainda um atalho valioso: a *6ª e a 1ª corda têm as mesmas notas na mesma casa* (duas oitavas de distância). Combinando tudo, encontramos todas as ocorrências de uma nota entre as casas 0 e 12. Veja todas as notas *Sol (G)*:

#v(0.3em)

#align(center, block(breakable: false)[
  #braco-notas(mapa(0, 12, so-nota(7)), fs: 0, cordas: ("6", "5", "4", "3", "2", "1"))
])
#legenda[Todas as notas G entre as casas 0 e 12. Siga a corrente: 6ª (3) → 4ª (5) → 2ª (8); 5ª (10) → 3ª (12, ou solta); 1ª (3), igual à 6ª.]

== 7. Método de memorização por etapas

Memorizar o braço é como aprender vocabulário: pouco de cada vez, com repetição em voz alta, rende muito mais do que uma maratona. Siga as etapas na ordem, sem pular:

#v(0.3em)

#passos((
  [*Etapa 1 — notas naturais da 6ª corda.* Toque da casa 0 à 12 dizendo o nome de cada nota em voz alta. Depois, sorteie notas e encontre-as sem contar casas a partir do zero (use as âncoras 3, 5, 7, 12).],
  [*Etapa 2 — notas naturais da 5ª corda.* O mesmo processo. Ao final, alterne: "Dó na 6ª, Dó na 5ª, Ré na 6ª, Ré na 5ª…".],
  [*Etapa 3 — sustenidos e bemóis nas duas cordas graves.* Diga os dois nomes: "Fá sustenido ou Sol bemol".],
  [*Etapa 4 — uma nota de cada vez em todas as cordas.* Escolha uma nota (sugestão de ordem: C, G, D, A, E, B, F) e encontre-a nas 6 cordas usando os shapes de oitava, da 6ª para a 1ª e de volta. Só passe para a próxima nota da lista quando a atual estiver segura.],
  [*Teste de 5 minutos.* Metrônomo a 40–60 BPM: a cada clique, toque a nota escolhida na corda seguinte. Quando conseguir sem errar, suba 5 BPM.],
))

#v(0.4em)

#caixa(tipo: "dica")[
  *Fale sempre o nome da nota em voz alta* enquanto toca. Associar o som, o lugar e a palavra fixa a memória muito mais rápido do que apenas olhar para o braço.
]

== 8. Aplicação: a tônica dos acordes com pestana

A aplicação mais imediata deste conteúdo está nos acordes com pestana, em que o dedo indicador prende várias cordas na mesma casa e os outros dedos montam o desenho de um acorde aberto. Os dois shapes principais — os desenhos abertos de Mi (E) e de Lá (A) deslocados pelo braço — têm a *tônica na corda mais grave tocada*:

- *Shape E:* tônica na *6ª corda*. A pestana fica na casa da tônica.
- *Shape A:* tônica na *5ª corda*. A pestana fica na casa da tônica.

Para tocar um *G (Sol maior)*, por exemplo, procure o Sol na 6ª corda (casa 3) e monte o shape E ali — ou procure o Sol na 5ª corda (casa 10) e monte o shape A. Para *C (Dó maior)*: casa 8 no shape E, ou casa 3 no shape A.

#v(0.3em)

#grid-acordes(
  chord: chord,
  columns: 4,
  (
    (tabs: "3,5,5,4,3,3", nome: " ", titulo: "G — shape E", detalhe: "tônica na 6ª corda, casa 3"),
    (tabs: "x,10,12,12,12,10", nome: " ", titulo: "G — shape A", detalhe: "tônica na 5ª corda, casa 10"),
    (tabs: "8,10,10,9,8,8", nome: " ", titulo: "C — shape E", detalhe: "tônica na 6ª corda, casa 8"),
    (tabs: "x,3,5,5,5,3", nome: " ", titulo: "C — shape A", detalhe: "tônica na 5ª corda, casa 3"),
  ),
)

#v(0.4em)

#tabela(
  columns: (2.3fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
  ([*Acorde*], [*G*], [*Bb*], [*C*], [*D*], [*Eb*], [*F\#m*]),
  (
    ([Shape E (casa na 6ª)], [3], [6], [8], [10], [11], [2]),
    ([Shape A (casa na 5ª)], [10], [1], [3], [5], [6], [9]),
  ),
)

#v(0.3em)

O tipo do acorde (maior, menor, com sétima) muda apenas o desenho dos outros dedos; *a casa da pestana é sempre a casa da tônica*.

== 9. Exercícios

#ex(titulo: "Preencha as cordas graves", nivel: "Escrita")[
  Escreva, em cada casa, as *notas naturais* da 6ª e da 5ª cordas (casa 0 = corda solta). Deixe em branco as casas de sustenido/bemol. Faça de memória e só depois confira com a seção 4.

  #v(0.3em)
  #align(center)[#braco-vazio(casas: 13, fs: 0, num-cordas: 2, cordas: ("6", "5"))]
]

#ex(titulo: "Qual é a nota?", nivel: "Escrita")[
  Escreva a nota de cada posição. Para sustenidos/bemóis, escreva os dois nomes.

  #v(0.3em)
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1.2em,
    tabela-preencher(
      ([*Corda*], [*Casa*], [*Nota*]),
      (
        ([a) 6ª], [5], none),
        ([b) 5ª], [7], none),
        ([c) 6ª], [8], none),
        ([d) 5ª], [2], none),
        ([e) 6ª], [10], none),
      ),
      columns: (1fr, 1fr, 1.6fr),
    ),
    tabela-preencher(
      ([*Corda*], [*Casa*], [*Nota*]),
      (
        ([f) 5ª], [10], none),
        ([g) 6ª], [1], none),
        ([h) 5ª], [4], none),
        ([i) 6ª], [6], none),
        ([j) 5ª], [11], none),
      ),
      columns: (1fr, 1fr, 1.6fr),
    ),
  )
]

#ex(titulo: "Onde está a nota?", nivel: "Escrita")[
  Escreva em qual casa cada nota aparece na 6ª e na 5ª cordas (entre as casas 0 e 11).

  #v(0.3em)
  #tabela-preencher(
    ([*Nota*], [*C*], [*D*], [*F*], [*G*], [*Bb*], [*F\#*]),
    (
      ([Casa na 6ª corda], none, none, none, none, none, none),
      ([Casa na 5ª corda], none, none, none, none, none, none),
    ),
    columns: (2fr,) + (1fr,) * 6,
  )
]

#ex(titulo: "Encontre a oitava", nivel: "Escrita")[
  Use os shapes de oitava da seção 6 e complete com a casa onde está a *mesma nota* na corda indicada. Atenção ao deslocamento da corda Si!

  #v(0.3em)
  #tabela-preencher(
    ([*Ponto de partida*], [*Nota*], [*Destino*], [*Casa no destino*]),
    (
      ([a) 6ª corda, casa 5], none, [4ª corda], none),
      ([b) 5ª corda, casa 5], none, [3ª corda], none),
      ([c) 4ª corda, casa 7], none, [2ª corda], none),
      ([d) 3ª corda, casa 2], none, [1ª corda], none),
      ([e) 5ª corda, casa 7], none, [3ª corda], none),
      ([f) 4ª corda, casa 3], none, [2ª corda], none),
    ),
    columns: (1.6fr, 1fr, 1fr, 1.2fr),
  )
]

#ex(titulo: "O mapa de uma nota", nivel: "Escrita")[
  Marque no braço *todas as notas Lá (A)* entre a corda solta e a casa 12, nas seis cordas. Dica: comece pelas âncoras da 6ª e da 5ª cordas e use os shapes de oitava.

  #v(0.3em)
  #align(center)[#braco-vazio(casas: 13, fs: 0, cordas: ("6", "5", "4", "3", "2", "1"))]
]

#ex(titulo: "Casa da pestana", nivel: "Escrita")[
  Para cada acorde, indique a casa da pestana no *shape E* (tônica na 6ª) e no *shape A* (tônica na 5ª), usando casas de 1 a 11.

  #v(0.3em)
  #tabela-preencher(
    ([*Acorde*], [*B*], [*C\#m*], [*Eb*], [*F\#*], [*Gm*], [*Ab*]),
    (
      ([Shape E — casa], none, none, none, none, none, none),
      ([Shape A — casa], none, none, none, none, none, none),
    ),
    columns: (2fr,) + (1fr,) * 6,
  )
]

#ex(titulo: "Jogo da nota sorteada", nivel: "Prática")[
  Escreva os nomes das 7 notas naturais em papeizinhos e sorteie um por vez. Para cada nota sorteada, toque-a na 6ª corda, depois na 5ª, e diga a casa em voz alta. Cronometre quanto tempo leva para as 7 notas e anote abaixo. Repita o jogo várias vezes e tente baixar o tempo pela metade.

  #v(0.3em)
  #tabela-preencher(
    ([*Tentativa*], [*1*], [*2*], [*3*], [*4*], [*5*], [*6*], [*7*]),
    (([Tempo (s)], none, none, none, none, none, none, none),),
    columns: (1.6fr,) + (1fr,) * 7,
  )
]

=== Sugestão de prática

#rotina-estudo((
  ([Notas naturais da 6ª corda em voz alta (0 → 12 → 0)], [3 min], [—]),
  ([Notas naturais da 5ª corda em voz alta (0 → 12 → 0)], [3 min], [—]),
  ([Jogo da nota sorteada (6ª e 5ª cordas)], [4 min], [—]),
  ([Nota escolhida em todas as cordas, um clique por corda], [5 min], [40–60]),
  ([Pestana: achar G, C, D, F e Bb nos shapes E e A], [5 min], [—]),
))

#v(0.6em)

#checklist(
  (
    [Sei explicar por que não existe casa entre Mi–Fá e entre Si–Dó.],
    [Digo a nota de qualquer casa da 6ª e da 5ª cordas em menos de 3 segundos.],
    [Uso as casas 3, 5, 7, 9 e 12 como âncoras nas duas cordas graves.],
    [Sei que a casa 12 repete a corda solta e que tudo se repete a partir dela.],
    [Aplico os quatro shapes de oitava, lembrando do deslocamento da corda Si.],
    [Encontro a casa da pestana de qualquer acorde nos shapes E e A.],
  ),
  titulo: "Autoavaliação",
)

=== Mapa de referência: notas naturais em todas as cordas

Use este mapa somente para *conferir* — o objetivo é chegar ao ponto em que você não precise mais dele. Observe como os pares Mi–Fá e Si–Dó aparecem colados em todas as cordas.

#align(center, block(breakable: false)[
  #braco-notas(mapa(0, 12, so-naturais), fs: 0, cordas: ("6", "5", "4", "3", "2", "1"))
])

#gabarito[
  #resposta(1)[
    *6ª corda:* 0 E · 1 F · 3 G · 5 A · 7 B · 8 C · 10 D · 12 E. \
    *5ª corda:* 0 A · 2 B · 3 C · 5 D · 7 E · 8 F · 10 G · 12 A.
  ]
  #resposta(2)[
    a) A · b) E · c) C · d) B · e) D · f) G · g) F · h) C\# / Db · i) A\# / Bb · j) G\# / Ab.
  ]
  #resposta(3)[
    *6ª corda:* C = 8 · D = 10 · F = 1 · G = 3 · Bb = 6 · F\# = 2. \
    *5ª corda:* C = 3 · D = 5 · F = 8 · G = 10 · Bb = 1 · F\# = 9.
  ]
  #resposta(4)[
    a) A → 4ª corda, casa 7 · b) D → 3ª corda, casa 7 · c) A → 2ª corda, casa 10 (três casas: atravessa a corda Si) ·
    d) A → 1ª corda, casa 5 (três casas) · e) E → 3ª corda, casa 9 · f) F → 2ª corda, casa 6 (três casas).
  ]
  #resposta(5)[
    Notas Lá (A): 6ª corda casa 5 · 5ª corda casas 0 e 12 · 4ª corda casa 7 · 3ª corda casa 2 · 2ª corda casa 10 · 1ª corda casa 5.

    #v(0.3em)
    #align(center)[#braco-notas(mapa(0, 12, so-nota(9)), fs: 0, cordas: ("6", "5", "4", "3", "2", "1"))]
  ]
  #resposta(6)[
    B: shape E casa 7, shape A casa 2 · C\#m: E 9, A 4 · Eb: E 11, A 6 · F\#: E 2, A 9 · Gm: E 3, A 10 · Ab: E 4, A 11.
  ]
  #resposta(7)[
    Exercício prático — critério de sucesso: encontrar as 7 notas naturais nas duas cordas graves, sem contar casas a partir da corda solta, em menos de 30 segundos no total.
  ]
]
