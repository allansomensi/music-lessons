#import "/templates/layout.typ": *
#import "/templates/components.typ": *
#import "@preview/conchord:0.4.0": new-chordgen

#show: aula.with(
  instrumento: "Guitarra",
  nivel: "Avançado",
)

#let chord = new-chordgen(number-to-left: true, use-shadow-barre: false, colors: (hold: black, barre: black))
#show <chord>: set text(fill: color-strong, weight: "bold")
#let junto(body) = block(width: 100%, breakable: false, body)
#let legenda(body) = align(center, text(size: 8.5pt, fill: color-muted, body))

// Estrutura superior em notação de fração: tríade sobre o acorde
#let fracao(sup, inf) = box(baseline: 0.55em, stack(
  dir: ttb,
  spacing: 2.5pt,
  align(center, text(weight: "bold", sup)),
  line(length: 2.6em, stroke: 0.7pt + color-strong),
  align(center, text(weight: "bold", inf)),
))

= Harmonia Quartal e Estruturas Superiores

Quase todos os acordes do repertório tonal são construídos em *terças* empilhadas. Nesta aula você vai sair desse padrão de duas maneiras. Primeiro, empilhando *quartas*: o som aberto e ambíguo do jazz modal de Miles Davis, Bill Evans e McCoy Tyner, também muito presente na MPB instrumental. Depois, colocando uma *tríade inteira* acima de um acorde dominante — as *estruturas superiores*, o jeito mais rápido e organizado de tocar tensões como 9, \#11, 13, b9 e \#9 sem decorar centenas de shapes.

#objetivos((
  [Construir acordes por 4ªs justas e entender por que eles soam "modais"],
  [Tocar o voicing *So What* e harmonizar a escala dórica em quartas, com movimento paralelo],
  [Calcular as estruturas superiores (UST) de um dominante e as tensões que cada uma gera],
  [Ler e escrever a notação em fração (tríade sobre acorde) e tocá-la na guitarra],
))

== 1. Acordes em quartas

Um *acorde quartal* empilha 4ªs justas (5 semitons) em vez de 3ªs. A partir de Ré: *D – G – C – F – Bb…* Três notas já formam um acorde completo; quatro ou cinco deixam o som mais denso.

#tabela(
  columns: (1fr, 1.4fr, 2.6fr),
  ([*Pilha*], [*Notas*], [*Leituras possíveis*]),
  (
    ([3 notas], [D – G – C], [D7sus4 sem 5ª · Gsus4/D · Csus2/D]),
    ([4 notas], [D – G – C – F], [Dm7(11) · G7sus4/D · Bb6(9) sem fundamental]),
    ([5 notas], [D – G – C – F – Bb], [Gm7(11)/D · Bb6(9)/D · Eb7M(9,13) sem fund.]),
  ),
)

Repare na terceira coluna: como as 4ªs são todas iguais, *qualquer nota pode ser ouvida como fundamental* e o acorde não tem 3ª que defina maior ou menor. É exatamente essa ambiguidade que serve à música *modal*, em que a harmonia fica parada num modo por muitos compassos e o que importa é a cor, não a função tonal.

#caixa(tipo: "atencao", titulo: "Quartas diatônicas")[
  Numa escala maior (ou em qualquer modo dela), as 4ªs são todas justas, *exceto* Fá – Si (em Dó maior), que é aumentada. Ao harmonizar a escala em pilhas de 3 notas, as que começam em Fá (F – B – E) e em Dó (C – F – B) soam mais tensas — uma característica, não um erro.
]

== 2. O voicing "So What"

O voicing mais famoso do jazz modal tem *três 4ªs justas e uma 3ª maior no topo*. Sobre Mi: *E – A – D – G – B*. Lido a partir da nota mais grave, ele é um *Em7(11)*: T – 11 – 7 – b3 – 5. No tema de "So What" (Miles Davis, 1959), o piano e os sopros respondem ao baixo com esse voicing a partir de Mi e logo depois um tom abaixo (D – G – C – F – A), os dois dentro de Ré dórico.

Na guitarra há uma coincidência feliz: *as cinco cordas soltas mais graves (E A D G B) são exatamente o voicing So What*. Como a afinação padrão tem três 4ªs e depois uma 3ª maior entre as cordas 6 e 2, o shape é uma pestana reta em qualquer casa. Nas cordas 5 a 1, a 2ª corda sobe uma casa para compensar a afinação Sol – Si.

#grid-acordes(
  chord: chord,
  columns: 4,
  (
    (tabs: "0,0,0,0,0,x", titulo: "Em7(11)", nome: "", detalhe: "So What · cordas soltas"),
    (tabs: "10,10,10,10,10,x,*", titulo: "Dm7(11)", nome: "", detalhe: "So What · cordas 6-2"),
    (tabs: "x,7,7,7,8,7", titulo: "Em7(11)", nome: "", detalhe: "So What · cordas 5-1"),
    (tabs: "x,5,5,5,6,5", titulo: "Dm7(11)", nome: "", detalhe: "So What · cordas 5-1"),
  ),
)

#legenda[Fórmula: T – 11 – 7 – b3 – 5 (três 4ªs justas + uma 3ª maior). Notas: E A D G B (Em7(11)) e D G C F A (Dm7(11)).]

=== Voicings quartais de 3 e 4 notas

Para comping, voicings menores são mais úteis. Com 4ªs justas nas cordas de afinação em 4ª, o shape é reto; sempre que a pilha atravessa o par Sol – Si, as notas da 2ª corda (e da 1ª, se houver) sobem uma casa:

#grid-acordes(
  chord: chord,
  columns: 4,
  (
    (tabs: "3,3,3,3,x,x,*", titulo: "Gm7(11)", nome: "", detalhe: "G C F Bb · cordas 6-3"),
    (tabs: "x,5,5,5,6,x", titulo: "Dm7(11)", nome: "", detalhe: "D G C F · cordas 5-2"),
    (tabs: "x,x,7,7,8,8", titulo: "Am7(11)", nome: "", detalhe: "A D G C · cordas 4-1"),
    (tabs: "x,x,0,0,1,1", titulo: "Dm7(11)", nome: "", detalhe: "D G C F · com cordas soltas"),
  ),
)

#junto[
== 3. Harmonizando o modo dórico em quartas

O procedimento modal clássico é escolher *um* shape quartal de 3 notas e movê-lo *pela escala*, mantendo um pedal no baixo. Em Ré dórico (as notas de Dó maior), cada nota da escala ganha duas 4ªs diatônicas acima. Nas cordas 3-2-1, com a 4ª corda solta (Ré) como pedal:

#tab(
  "  Dm7 (pedal de Ré)\ne|-1--3--5--7--|-8--10-12-13-|\nB|-1--3--5--6--|-8--10-12-13-|\nG|-0--2--4--5--|-7--9--10-12-|\nD|-0--0--0--0--|-0--0--0--0--|\nA|-------------|-------------|\nE|-------------|-------------|",
  titulo: "Ré dórico em quartas com pedal de Ré (uma pilha por tempo)",
  legenda: [Pilhas: G-C-F, A-D-G, B-E-A, C-F-B, D-G-C, E-A-D, F-B-E, G-C-F. As pilhas C-F-B e F-B-E contêm a 4ª aumentada (Fá – Si) e deformam o shape: em C-F-B a 1ª corda sobe uma casa a mais; em F-B-E, a 2ª corda.],
)
]

Esse é o *movimento paralelo*: todas as vozes andam na mesma direção, com o mesmo intervalo. Evitado na harmonia tradicional, ele é o próprio estilo do jazz modal. Use-o em vamps longos (os 16 compassos de Ré dórico de "So What", seguidos de 8 em Mib dórico e 8 em Ré), alternando pilhas vizinhas com ritmo variado.

#caixa(tipo: "dica", titulo: "Cor do modo")[
  A pilha *B – E – A* contém a 6ª maior (Si), nota característica do dórico: repouse nela para o modo soar dórico, e não eólio (no eólio, o Si vira Sib).
]

== 4. Estruturas superiores (upper structure triads)

Uma *estrutura superior* (UST, do inglês _upper structure triad_) é uma *tríade maior tocada sobre o trítono de um acorde dominante*. A parte de baixo (3ª e 7ª) garante a função de dominante; a tríade de cima fornece, de uma vez, três tensões (ou notas do acorde) bem organizadas. Para cada UST, conte o intervalo da *fundamental do dominante* até a *fundamental da tríade*.

=== Cálculo sobre C7 (C – E – G – Bb)

#tabela(
  columns: (0.8fr, 0.75fr, 1.15fr, 1.25fr, 1.45fr, 1.6fr),
  ([*UST*], [*Tríade*], [*Notas*], [*Sobre C7*], [*Resultado*], [*Escala-mãe*]),
  (
    ([*II*], [D], [D – F\# – A], [9 – \#11 – 13], [C7(9,\#11,13)], [lídio dominante]),
    ([*bIII*], [Eb], [Eb – G – Bb], [\#9 – 5 – 7], [C7(\#9)], [dom-dim (ou blues)]),
    ([*bV*], [Gb (F\#)], [Gb – Bb – Db], [\#11 – 7 – b9], [C7(b9,\#11)], [dom-dim ou alterada]),
    ([*bVI*], [Ab], [Ab – C – Eb], [b13 – T – \#9], [C7(\#9,b13)], [alterada]),
    ([*VI*], [A], [A – C\# – E], [13 – b9 – 3], [C7(b9,13)], [dom-dim]),
  ),
)

#junto[
Essas cinco são as estruturas superiores *de uso comum* sobre um dominante com 3ª. As demais tríades maiores ou repetem notas do acorde sem acrescentar nada, ou criam choques que o ouvido rejeita:

#tabela(
  columns: (0.8fr, 0.75fr, 1.15fr, 1.25fr, 3.05fr),
  ([*Grau*], [*Tríade*], [*Notas*], [*Sobre C7*], [*Por que não (ou só em sus)*]),
  (
    ([bII], [Db], [Db – F – Ab], [b9 – 11 – b13], [a 11 choca com a 3ª; serve para C7sus4(b9) (som frígio)]),
    ([bVII], [Bb], [Bb – D – F], [7 – 9 – 11], [a 11 choca com a 3ª; é o clássico Bb/C = C7sus4(9)]),
    ([IV], [F], [F – A – C], [11 – 13 – T], [11 contra a 3ª; soa como F/C, não como dominante]),
    ([III], [E], [E – G\# – B], [3 – \#5 – 7M], [7M contra a 7ª menor: choque]),
    ([V], [G], [G – B – D], [5 – 7M – 9], [7M contra a 7ª menor: choque]),
  ),
)
]

#caixa(tipo: "resumo", titulo: "Ligação com as escalas")[
  As UST bIII, bV e VI são tríades da *dom-dim* (escala diminuta semitom-tom: T, b9, \#9, 3, \#11, 5, 13, 7): sobre C7, as tríades a cada 3ª menor são C, Eb, F\# e A. A UST bVI é tríade da *alterada* (7º modo da menor melódica: T, b9, \#9, 3, \#11, b13, 7) e a UST II é a tríade do *lídio dominante* (lídio com 7ª menor, 4º modo da menor melódica: T, 9, 3, \#11, 5, 13, 7). Escolher a UST é, na prática, escolher a escala do improvisador.
]

#junto[
=== Notação em fração

Estruturas superiores se escrevem com um *traço horizontal*: a tríade em cima, o acorde-base embaixo — #fracao[D][C7] — e se leem "Ré tríade sobre Dó com sétima". Não confunda com a *barra diagonal* da cifra comum:

#comparativo(
  titulo-esquerda: [#fracao[D][C7] — estrutura superior],
  titulo-direita: [D/C — tríade com baixo],
  [Acorde completo de C7 (ou ao menos C, E e Bb) *mais* a tríade de Ré: C E Bb + D F\# A = *C7(9,\#11,13)*. Função de dominante.],
  [Apenas a tríade de Ré com Dó no baixo: C + D F\# A. Sem a 3ª e a 7ª de C7 (é a 3ª inversão de D7). Pode soar como C lídio, mas não é um dominante.],
)
]

Em cifras impressas, é comum ver a estrutura superior escrita só pelo resultado (C7(9,\#11,13), C7(\#9,b13)) ou como "D/C7". Quando você vê "D/C7", a leitura correta é a da fração: o acorde de baixo é *C7 completo*.

== 5. Estruturas superiores na guitarra

A receita: *3ª e 7ª nas cordas graves, tríade nas cordas agudas.* Abaixo, todas as cinco UST sobre C7 numa mesma região do braço. Nas quatro últimas, a mão mantém o trítono E – Bb nas cordas 5 e 4 (casas 7 e 8) e só a tríade muda em cima; na UST II, o trítono fica invertido nas cordas 6 e 5 (Bb na casa 6, E na casa 7) e a tríade vem nas cordas 4-3-2.

#grid-acordes(
  chord: chord,
  columns: 5,
  gutter: 1.3em,
  (
    (tabs: "6,7,7,7,7,x", titulo: "D / C7", nome: "", detalhe: "7 · 3 · 13 · 9 · #11"),
    (tabs: "x,7,8,8,8,6", titulo: "Eb / C7", nome: "", detalhe: "3 · 7 · #9 · 5 · 7"),
    (tabs: "x,7,8,6,7,6", titulo: "Gb / C7", nome: "", detalhe: "3 · 7 · b9 · #11 · 7"),
    (tabs: "x,7,8,8,9,8", titulo: "Ab / C7", nome: "", detalhe: "3 · 7 · #9 · b13 · T"),
    (tabs: "x,7,8,6,5,5", titulo: "A / C7", nome: "", detalhe: "3 · 7 · b9 · 3 · 13"),
  ),
)

#legenda[Graus da corda grave para a aguda. A fundamental (Dó) fica a cargo do baixista — ou é simplesmente omitida, como nos voicings "rootless".]

Digitação sugerida: em Eb/C7, o indicador fica na 1ª corda (casa 6), o médio na 5ª corda (casa 7) e o anelar faz uma pestana nas cordas 4-3-2 (casa 8); em Gb/C7, o indicador faz pestana nas cordas 3-2-1 (casa 6), o médio pega a 2ª corda (casa 7), o anelar a 5ª (casa 7) e o mínimo a 4ª (casa 8); em Ab/C7, o indicador fica na 5ª corda (casa 7), o anelar faz pestana na casa 8 das cordas 4 a 1 e o mínimo pega a 2ª corda (casa 9); em A/C7, o indicador faz pestana nas cordas 2-1 (casa 5). Em D/C7, o indicador fica na 6ª corda e o anelar faz pestana na casa 7 (cordas 5 a 2). Abafe sempre as cordas marcadas com ×.

=== Aplicação no II-V-I

Em Fá maior, o V7 é exatamente C7. Combine um voicing quartal no IIm7, uma UST no V7 e um 7M com 9 no I:

#grid-acordes(
  chord: chord,
  columns: 4,
  (
    (tabs: "3,3,3,3,x,x,*", titulo: "Gm7(11)", nome: "", detalhe: "quartal (G C F Bb)"),
    (tabs: "x,7,8,6,5,5", titulo: "A / C7", nome: "", detalhe: "= C7(b9,13)"),
    (tabs: "x,7,8,8,9,8", titulo: "Ab / C7", nome: "", detalhe: "= C7(#9,b13)"),
    (tabs: "x,8,7,9,8,x", titulo: "F7M(9)", nome: "", detalhe: "F A E G"),
  ),
)

Toque *Gm7(11) → A/C7 → F7M(9)* e depois *Gm7(11) → Ab/C7 → F7M(9)*. Na segunda versão, ouça a condução de vozes: as quatro vozes que continuam soando se movem por semitom — Mi → Fá, Sib → Lá, Mib → Mi e Láb → Sol. As tensões da UST resolvem nas notas do acorde seguinte. É esse tipo de detalhe que separa um voicing "bonito" de um voicing *funcional*.

#caixa(tipo: "dica", titulo: "Tríades menores também servem")[
  Uma tríade menor sobre o trítono também gera estruturas úteis: *Ebm sobre C7* (Eb – Gb – Bb) = \#9, b5 e 7, um C7 alterado bem escuro. Comece pelas cinco maiores; depois explore as menores com o mesmo método de contar intervalos.
]

== 6. Exercícios

#junto[
#exercicio(titulo: "Empilhe quartas", nivel: "Escrita")[
  a) Escreva pilhas de quatro 4ªs justas (4 notas) a partir de: *D*, *F\#*, *Bb* e *E*. \
  b) Harmonizando Sol mixolídio (as notas de Dó maior) em pilhas de 3 notas, quais pilhas contêm a 4ª aumentada?
  #linhas-resposta(3)
]
]

#junto[
#exercicio(titulo: "So What em vários tons", nivel: "Escrita / Braço")[
  Escreva o voicing So What (três 4ªs justas + 3ª maior) a partir de cada nota, diga de qual acorde m7 ele é o voicing (a nota mais grave é a fundamental) e indique a casa da pestana nas cordas 6-2.

  #tabela-preencher(
    ([*Nota grave*], [*Voicing (5 notas)*], [*Acorde m7*], [*Casa (cordas 6-2)*]),
    (
      ([F\#], none, none, none),
      ([A], none, none, none),
      ([Bb], none, none, none),
      ([C\#], none, none, none),
    ),
    columns: (0.9fr, 2fr, 1.1fr, 1.2fr),
    altura: 0.75cm,
  )
]
]

#junto[
#exercicio(titulo: "Estruturas superiores de G7 e Bb7", nivel: "Escrita")[
  Complete com a tríade e as tensões resultantes.

  #tabela-preencher(
    ([*UST*], [*Sobre G7: tríade*], [*Tensões*], [*Sobre Bb7: tríade*], [*Tensões*]),
    (
      ([II], none, none, none, none),
      ([bIII], none, none, none, none),
      ([bV], none, none, none, none),
      ([bVI], none, none, none, none),
      ([VI], none, none, none, none),
    ),
    columns: (0.7fr, 1.1fr, 1.4fr, 1.1fr, 1.4fr),
    altura: 0.75cm,
  )
]
]

#junto[
#exercicio(titulo: "Funciona sobre D7?", nivel: "Análise")[
  Para cada tríade sobre D7, escreva as tensões resultantes e diga se é uma estrutura superior utilizável (✓) ou não (✗).

  #grid(
    columns: (1fr, 1fr, 1fr, 1fr),
    column-gutter: 1em,
    row-gutter: 0.75em,
    [a) E sobre D7], [b) Ab sobre D7], [c) Bb sobre D7], [d) F sobre D7],
    [e) B sobre D7], [f) F\# sobre D7], [g) G sobre D7], [],
  )
  #linhas-resposta(3)
]
]

#junto[
#exercicio(titulo: "Fração × barra", nivel: "Escrita")[
  Escreva as notas de #fracao[A][Eb7] e de A/Eb. Qual dos dois é um acorde dominante? Qual é o nome completo (cifra com tensões) do primeiro?
  #linhas-resposta(2)
]
]

#junto[
#exercicio(titulo: "Lá dórico em quartas", nivel: "Tablatura")[
  Harmonize Lá dórico (notas de Sol maior) em pilhas quartais de 3 notas nas cordas 3-2-1, com a 5ª corda solta (Lá) como pedal, subindo pela escala a partir da pilha G – C – F\# (casas 0-1-2).

  #tab-vazia(sistemas: 1, compassos: 2, altura-linha: 12pt)
]
]

#junto[
#exercicio(titulo: "II-V-I com estruturas superiores", nivel: "Prática")[
  Toque Gm7(11) – C7 – F7M(9) em loop a 70 BPM, um acorde por compasso, trocando a UST do C7 a cada volta (D, Eb, Gb, Ab, A). Depois transponha o exercício para Bb maior (Cm7 – F7 – Bb7M), deslocando todos os shapes 5 casas acima.
]
]

#junto[
=== Sugestão de prática

#rotina-estudo((
  ([So What nas cordas 6-2 e 5-1 em todas as casas, dizendo o acorde], [5 min], [—]),
  ([Ré dórico em quartas com pedal (tab da seção 3), ritmo variado], [8 min], [60–90]),
  ([UST sobre C7: os cinco shapes da seção 5, nomeando as tensões], [7 min], [—]),
  ([II-V-I em Fá com UST diferente a cada volta], [7 min], [70]),
  ([Mesmo II-V-I em Bb e em Eb (transposição)], [8 min], [70]),
))
]

#junto(checklist(
  (
    [Construo pilhas de 4ªs justas a partir de qualquer nota.],
    [Toco o voicing So What em qualquer casa e sei qual m7 ele representa.],
    [Harmonizo um modo em quartas e identifico as pilhas com 4ª aumentada.],
    [Calculo as UST II, bIII, bV, bVI e VI de qualquer dominante.],
    [Sei explicar a diferença entre a fração e a barra diagonal.],
    [Toco as cinco UST sobre C7 mantendo o trítono nas cordas graves.],
  ),
  titulo: "Autoavaliação",
))

#gabarito[
  #resposta(1)[
    a) D – G – C – F · F\# – B – E – A · Bb – Eb – Ab – Db · E – A – D – G. b) As pilhas que começam em *Fá* (F – B – E) e em *Dó* (C – F – B): são as que contêm o par Fá – Si.
  ]
  #resposta(2)[
    F\#: F\# B E A C\# · F\#m7 · casa 2. — A: A D G C E · Am7 · casa 5. — Bb: Bb Eb Ab Db F · Bbm7 · casa 6. — C\#: C\# F\# B E G\# · C\#m7 · casa 9.
  ]
  #resposta(3)[
    *G7:* II = A (9, \#11, 13) · bIII = Bb (\#9, 5, 7) · bV = Db (b5/\#11, 7, b9) · bVI = Eb (b13, T, \#9) · VI = E (13, b9, 3). \
    *Bb7:* II = C (9, \#11, 13) · bIII = Db (\#9, 5, 7) · bV = Fb = E (b5/\#11, 7, b9) · bVI = Gb (b13, T, \#9) · VI = G (13, b9, 3).
  ]
  #resposta(4)[
    a) E – G\# – B = 9, \#11, 13 ✓ (UST II). b) Ab – C – Eb = \#11, 7, b9 ✓ (bV). c) Bb – D – F = b13, T, \#9 ✓ (bVI). d) F – A – C = \#9, 5, 7 ✓ (bIII). e) B – D\# – F\# = 13, b9, 3 ✓ (VI). f) F\# – A\# – C\# = 3, \#5, 7M ✗ (7M contra a 7ª menor). g) G – B – D = 11, 13, T ✗ (11 contra a 3ª; só em D7sus4).
  ]
  #resposta(5)[
    #fracao[A][Eb7] = Eb G Bb Db + A C\# E. Sobre Eb7, Lá = \#11 (b5), Dó\# = Réb = 7 e Mi = Fáb = b9: é a UST bV, *Eb7(b9,\#11)* — um dominante. A/Eb = Eb + A C\# E: falta a 3ª (Sol), então não há trítono e o acorde não funciona como dominante; soa como uma tríade de Lá com Mib no baixo.
  ]
  #resposta(6)[
    G-C-F\# (0-1-2) · A-D-G (2-3-3) · B-E-A (4-5-5) · C-F\#-B (5-7-7) · D-G-C (7-8-8) · E-A-D (9-10-10) · F\#-B-E (11-12-12) · G-C-F\# (12-13-14). As pilhas G-C-F\# e C-F\#-B contêm a 4ª aumentada (Dó – Fá\#).
  ]
  #resposta(7)[
    Exercício prático — critério de sucesso: troca de acorde no tempo, sem cordas indesejadas soando (atenção à 6ª corda abafada nos shapes da 5ª corda), e você consegue cantar a nota mais aguda de cada UST. Em Bb maior os shapes ficam 5 casas acima (ex.: Cm7(11) = 8,8,8,8,x,x; F7 com UST VI = x,12,13,11,10,10).
  ]
]
