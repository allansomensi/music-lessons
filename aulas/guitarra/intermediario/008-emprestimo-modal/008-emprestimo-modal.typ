#import "/templates/layout.typ": *
#import "/templates/components.typ": *
#import "@preview/conchord:0.4.0": new-chordgen

#show: aula.with(
  instrumento: "Guitarra",
  nivel: "Intermediário",
)

#let chord = new-chordgen(number-to-left: true, use-shadow-barre: false, colors: (hold: black, barre: black))

// Texto das tabelas em 10pt
#show table: set text(size: 10pt)

// Tabelas, grades de diagramas e exercícios não se dividem entre páginas
#show table: it => block(breakable: false, it)
#let acordes(..args) = block(breakable: false, width: 100%, grid-acordes(chord: chord, ..args))
#let ex(..args) = block(breakable: false, width: 100%, exercicio(..args))

= Empréstimo Modal

O campo harmônico maior explica a maior parte dos acordes de uma música em tom maior, e os dominantes secundários (acordes dominantes que preparam outros graus do campo) explicam boa parte dos que sobram. Mas basta ouvir um pouco de rock, pop, MPB ou trilha de cinema para encontrar acordes que não cabem em nenhuma dessas explicações: um *Fm* no meio de uma música em Dó maior, um *Bb* que soa "épico", um *Ab* que parece abrir a cena. Esses acordes são *emprestados* de outro campo harmônico com a mesma tônica. Nesta aula você vai aprender de onde eles vêm, que função cumprem e como usá-los sem criar conflitos com a melodia.

#objetivos((
  [Diferenciar tom *relativo* de tom *homônimo* e comparar os campos de C maior e C menor natural],
  [Reconhecer os acordes emprestados mais comuns (IVm, bVII, bVI, bIII, IIm7(b5), Vm) e sua função],
  [Tocar e ouvir progressões clássicas com empréstimo: I–IVm–I, cadência do Mario e I–bVII–IV–I],
  [Evitar choques entre o acorde emprestado e a nota da melodia],
  [Analisar uma música com acordes "de fora" usando um roteiro passo a passo],
))

== 1. Tom maior e homônimo menor

Todo tom maior tem um *relativo menor*, que começa no 6º grau da escala maior: Am é o relativo de C porque as duas escalas têm *as mesmas notas* e tônicas diferentes. O empréstimo modal usa a relação oposta: o *homônimo menor* (também chamado de *paralelo*), que tem *a mesma tônica* e notas diferentes.

#cartoes-info((
  (
    titulo: "Relativo (C × Am)",
    corpo: [Mesmas notas, tônicas diferentes. C D E F G A B × A B C D E F G. Trocar para o relativo muda o *centro* da música.],
  ),
  (
    titulo: "Homônimo (C × Cm)",
    corpo: [Mesma tônica, notas diferentes. C D E F G A B × C D Eb F G Ab Bb. O centro continua em Dó; muda a *cor*.],
  ),
))

Compare as duas escalas grau a grau. Apenas três notas mudam — a 3ª, a 6ª e a 7ª, que no menor ficam meio tom abaixo (b3, b6 e 7 = 7ª menor) — e são exatamente elas que dão a sonoridade dos acordes emprestados:

#tabela(
  columns: (2.2fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
  ([*Escala*], [*1*], [*2*], [*3*], [*4*], [*5*], [*6*], [*7*]),
  (
    ([C maior], [C], [D], [E], [F], [G], [A], [B]),
    ([C menor natural], [C], [D], [*Eb*], [F], [G], [*Ab*], [*Bb*]),
    ([Intervalos do menor], [T], [2], [*b3*], [4], [5], [*b6*], [*7*]),
  ),
)

#caixa(tipo: "resumo")[
  *Empréstimo modal* é usar, dentro de um tom maior, acordes do campo do *homônimo menor* (ou de outro modo com a mesma tônica). A tônica não muda: a música continua em Dó, apenas ganha por alguns compassos as notas *Eb*, *Ab* ou *Bb*.
]

== 2. Os dois campos lado a lado

A tabela abaixo coloca o campo de C maior ao lado do campo de C menor natural (eólio), em tríades e tétrades. Repare que *nenhum* acorde é igual nos dois campos: mesmo quando a fundamental coincide, a qualidade muda.

#tabela(
  columns: (0.7fr, 1fr, 1fr, 0.25fr, 0.8fr, 1fr, 1fr),
  ([*Grau*], [*Tríade*], [*Tétrade*], [], [*Grau*], [*Tríade*], [*Tétrade*]),
  (
    ([I], [C], [C7M], [], [Im], [Cm], [Cm7]),
    ([IIm], [Dm], [Dm7], [], [IIº], [Dº], [Dm7(b5)]),
    ([IIIm], [Em], [Em7], [], [bIII], [Eb], [Eb7M]),
    ([IV], [F], [F7M], [], [IVm], [Fm], [Fm7]),
    ([V], [G], [G7], [], [Vm], [Gm], [Gm7]),
    ([VIm], [Am], [Am7], [], [bVI], [Ab], [Ab7M]),
    ([VIIº], [Bº], [Bm7(b5)], [], [bVII], [Bb], [Bb7]),
  ),
)

#align(center, text(size: 8.5pt, fill: color-muted)[À esquerda: campo de C maior. À direita: campo de C menor natural, com os graus escritos em relação ao Dó.])

Note a cifragem dos graus: *bIII*, *bVI* e *bVII* indicam que a fundamental está meio tom abaixo do grau correspondente da escala maior (Eb em vez de E, Ab em vez de A, Bb em vez de B). Já *IVm* e *Vm* têm a mesma fundamental do campo maior, mas são acordes menores.

#caixa(tipo: "atencao")[
  Nem todo acorde "de fora" é emprestado. Um *E7* em Dó maior, por exemplo, não existe em C menor: ele é o *V7/VI*, um *dominante secundário* — um acorde dominante (maior com 7ª menor) que resolve uma 5ª justa abaixo, aqui em Am. Antes de chamar um acorde de empréstimo, confira se ele não é um dominante preparando o acorde seguinte.
]

== 3. Os empréstimos mais comuns

Em tese, qualquer acorde do campo menor pode ser emprestado. Na prática, seis deles aparecem o tempo todo. A coluna *De fora* mostra a nota que não pertence a C maior — é ela que você ouve como "cor nova".

#tabela(
  columns: (0.9fr, 0.8fr, 1fr, 0.8fr, 1.6fr, 1.9fr),
  alinhamento: (center + horizon, center + horizon, center + horizon, center + horizon, left + horizon, left + horizon),
  ([*Grau*], [*Acorde*], [*Notas*], [*De fora*], [*Função*], [*Sonoridade*]),
  (
    ([IVm], [Fm], [F Ab C], [Ab], [Subdominante menor], [Melancólica, "saudade"; clássica antes do I]),
    ([bVII], [Bb], [Bb D F], [Bb], [Subdominante menor; "dominante" sem trítono], [Rock, hino, mixolídia]),
    ([bVI], [Ab], [Ab C Eb], [Ab, Eb], [Subdominante menor], [Grandiosa, cinematográfica]),
    ([bIII], [Eb], [Eb G Bb], [Eb, Bb], [Tônica menor (substitui o I)], [Sombria, rock e blues]),
    ([IIm7(b5)], [Dm7(b5)], [D F Ab C], [Ab], [Subdominante menor; prepara o V7], [Escura, jazz e bossa]),
    ([Vm], [Gm], [G Bb D], [Bb], [Dominante enfraquecida (sem sensível)], [Suave, modal, sem urgência]),
  ),
)

=== Os emprestados no braço (tom de C)

#acordes(
  columns: 4,
  (
    (tabs: "1,3,3,1,1,1", nome: "Fm", titulo: "IVm", detalhe: "F · Ab · C"),
    (tabs: "1,3,1,1,1,1", nome: "Fm7", titulo: "IVm7", detalhe: "F · Ab · C · Eb"),
    (tabs: "x,1,3,3,3,1", nome: "Bb", titulo: "bVII", detalhe: "Bb · D · F"),
    (tabs: "x,1,3,1,3,1", nome: "Bb7", titulo: "bVII7", detalhe: "Bb · D · F · Ab"),
    (tabs: "4,6,6,5,4,4", nome: "Ab", titulo: "bVI", detalhe: "Ab · C · Eb"),
    (tabs: "x,6,8,8,8,6", nome: "Eb", titulo: "bIII", detalhe: "Eb · G · Bb"),
    (tabs: "x,5,6,5,6,x,*", nome: "Dm7(b5)", titulo: "IIm7(b5)", detalhe: "D · F · Ab · C"),
    (tabs: "3,5,5,3,3,3", nome: "Gm", titulo: "Vm", detalhe: "G · Bb · D"),
  ),
)

#caixa(tipo: "dica")[
  O shape aberto *x-x-0-1-1-1* (Ré, Láb, Dó, Fá) pode ser lido como *Dm7(b5)* ou como *Fm6* — são as mesmas quatro notas. Os dois têm função de subdominante menor em Dó, por isso se substituem com naturalidade.
]

=== Empréstimos de outros modos

O homônimo menor (eólio) é a fonte principal, mas não a única. Os *modos gregos* são as sete escalas obtidas ao começar a escala maior em cada um de seus graus; cada um tem uma *nota característica* que o diferencia do maior ou do menor natural. Qualquer modo com tônica Dó pode emprestar acordes, mas basta reconhecer os três casos mais frequentes:

#tabela(
  columns: (1fr, 1.3fr, 0.9fr, 2.4fr),
  alinhamento: (center + horizon, center + horizon, center + horizon, left + horizon),
  ([*Modo de C*], [*Nota característica*], [*Acorde*], [*Observação*]),
  (
    ([Mixolídio], [Bb (7ª menor)], [Bb, Gm], [Fonte do bVII e do Vm; som de rock e de música nordestina]),
    ([Frígio], [Db (b2)], [Db (bII)], [bII maior, muito usado como cadência bII → I]),
    ([Lídio], [F\# (\#4)], [D7 (II7)], [II maior/II7 que *não* resolve em G: volta ao I e soa "flutuante", típico de trilhas de cinema]),
  ),
)

O *II7 lídio* merece atenção: em Dó, D7 também é o *V7/V* (dominante secundário de G). A diferença está no destino. Se D7 vai para G, é dominante secundário; se D7 volta para C (C – D7 – C), sem resolver, ele está colorindo a tônica com o \#4 (Fá\#) do modo lídio.

== 4. Progressões famosas com empréstimo

#tabela(
  columns: (1.5fr, 1.3fr, 1.4fr, 2.3fr),
  alinhamento: (left + horizon, center + horizon, center + horizon, left + horizon),
  ([*Progressão*], [*Graus*], [*Em C*], [*Onde ouvir*]),
  (
    ([Plagal menor], [I – IVm – I], [C – Fm – C], [Finais de baladas, MPB, Beatles]),
    ([IV que vira IVm], [I – IV – IVm – I], [C – F – Fm – C], [Mesmo recurso em "Creep" (Radiohead): I – III – IV – IVm]),
    ([Cadência do Mario], [I – bVI – bVII – I], [C – Ab – Bb – C], [Fanfarra de fim de fase de _Super Mario Bros._; rock de arena]),
    ([Rock mixolídio], [I – bVII – IV – I], [C – Bb – F – C], [Coda de "Hey Jude" (em F); "Sweet Child O' Mine" (em D)]),
    ([Back-door], [IVm7 – bVII7 – I7M], [Fm7 – Bb7 – C7M], [Standards de jazz e bossa nova]),
    ([II–V menor no maior], [IIm7(b5) – V7 – I], [Dm7(b5) – G7 – C], [Jazz, choro, samba-canção]),
  ),
)

=== I – IV – IVm – I: a linha cromática escondida

O segredo do IVm é a *condução de vozes*: a terça de F (Lá) desce meio tom para Láb e depois mais meio tom para Sol, a quinta de C. Com os shapes abaixo, essa linha fica toda na *3ª corda*: casa 0 → 2 → 1 → 0.

#acordes(
  columns: 4,
  (
    (tabs: "x,3,2,0,1,0", nome: "C", titulo: "I", detalhe: "3ª corda: Sol"),
    (tabs: "x,x,3,2,1,1", nome: "F", titulo: "IV", detalhe: "3ª corda: Lá"),
    (tabs: "x,x,3,1,1,1", nome: "Fm", titulo: "IVm", detalhe: "3ª corda: Láb"),
    (tabs: "x,3,2,0,1,0", nome: "C", titulo: "I", detalhe: "3ª corda: Sol"),
  ),
)

=== A cadência do Mario: I – bVI – bVII – I

Aqui os acordes sobem por tons inteiros (Ab → Bb → C). O bVII chega ao I como um "dominante sem trítono": não tem a sensível Si, então a resolução é mais aberta e triunfal do que G7 → C. Toque Ab, Bb e C com a mesma pestana de tônica na 6ª corda, subindo de duas em duas casas:

#acordes(
  columns: 4,
  (
    (tabs: "x,3,5,5,5,3", nome: "C", titulo: "I", detalhe: "tônica na 5ª corda"),
    (tabs: "4,6,6,5,4,4", nome: "Ab", titulo: "bVI", detalhe: "casa 4"),
    (tabs: "6,8,8,7,6,6", nome: "Bb", titulo: "bVII", detalhe: "casa 6"),
    (tabs: "8,10,10,9,8,8", nome: "C", titulo: "I", detalhe: "casa 8"),
  ),
)

#caixa(tipo: "dica")[
  Ouça a diferença tocando *C – G – C* e logo depois *C – Bb – C*. O primeiro "fecha" a frase; o segundo soa como um refrão de estádio. Esse é o efeito do *bVII*: resolve sem a tensão do trítono.
]

== 5. Cuidado com a melodia

O acorde emprestado traz uma nota que *substitui* uma nota da escala maior. Se a melodia insiste na nota original naquele exato momento, as duas colidem a meio tom de distância (por exemplo, Lá na melodia contra Láb no acorde) e o resultado soa como erro, não como cor.

#passos((
  [*Verifique a nota da melodia* que soa sobre o acorde emprestado. Se ela for uma das notas da coluna "Melodia em choque" da tabela abaixo, há conflito.],
  [*Ajuste a melodia*: troque a nota pela versão emprestada (Lá → Láb, Si → Sib). Muitas melodias fazem exatamente isso e é daí que vem a emoção do trecho.],
  [*Ou mude o lugar do empréstimo*: use o acorde num momento em que a melodia repousa em nota comum (Dó sobre Fm ou Ab, Ré sobre Bb ou Gm).],
  [*No improviso*, durante o acorde emprestado toque as notas do campo de onde ele veio (C menor natural: C D Eb F G Ab Bb) e volte a C maior quando o acorde voltar ao campo.],
))

#block(breakable: false)[
Os choques mais comuns em Dó maior:

#tabela(
  columns: (0.9fr, 1.2fr, 1.2fr, 2.7fr),
  alinhamento: (center + horizon, center + horizon, center + horizon, left + horizon),
  ([*Acorde*], [*Nota emprestada*], [*Melodia em choque*], [*Por quê*]),
  (
    ([Fm], [Ab], [A], [Lá natural contra Láb: choque de meio tom]),
    ([Bb], [Bb], [B], [Si (sensível de C) contra Sib, a fundamental do acorde]),
    ([Ab], [Ab, Eb], [A, E], [Lá e Mi naturais chocam com Láb e Mib]),
    ([Eb], [Eb, Bb], [E, B], [Mi e Si (3ª e 7M de C) contra Mib e Sib]),
    ([Dm7(b5)], [Ab], [A], [Mesmo caso do Fm: Lá natural contra Láb]),
    ([Gm], [Bb], [B], [A sensível Si contra a terça menor de Gm]),
  ),
)
]

== 6. Como analisar uma música com acordes "de fora"

#passos((
  [*Encontre o tom*: qual acorde soa como repouso? Em geral é o primeiro e o último da música.],
  [*Escreva o campo harmônico maior* desse tom (tríades ou tétrades).],
  [*Marque os acordes que não pertencem ao campo.*],
  [*É um dominante?* Um acorde maior (ou com 7ª menor) que resolve uma 5ª justa abaixo é dominante secundário — não empréstimo. O mesmo vale para o *SubV*, o dominante substituto, que resolve meio tom abaixo (Db7 → C).],
  [*Está no homônimo menor?* Compare com o campo menor natural da mesma tônica e dê o grau (IVm, bVI, bVII…).],
  [*Não está?* Teste os outros modos (lídio, mixolídio, frígio). Se o novo acorde vira repouso por vários compassos, considere uma *modulação*, e não um empréstimo.],
))

#block(breakable: false)[
Exemplo: análise de G – Em – C – Cm – G – Eb – F – G (campo de G maior: G Am Bm C D Em F\#º). Cada acorde aparece uma vez na tabela.

#tabela(
  columns: (0.8fr, 1.4fr, 1.2fr, 2.2fr),
  alinhamento: (center + horizon, center + horizon, center + horizon, left + horizon),
  ([*Acorde*], [*Pertence a G maior?*], [*Grau*], [*Classificação*]),
  (
    ([G], [Sim], [I], [Tônica]),
    ([Em], [Sim], [VIm], [Tônica relativa]),
    ([C], [Sim], [IV], [Subdominante]),
    ([Cm], [Não], [IVm], [*Empréstimo* do homônimo G menor]),
    ([Eb], [Não], [bVI], [*Empréstimo* do homônimo G menor]),
    ([F], [Não], [bVII], [*Empréstimo* do homônimo G menor (cadência do Mario)]),
  ),
)
]


== 7. Exercícios

#ex(titulo: "Os dois campos de Sol", nivel: "Fácil")[
  Complete os campos de G maior e de G menor natural (tríades). Na coluna da direita, escreva o grau de cada acorde do campo menor em relação à tônica Sol (ex.: bIII).

  #tabela-preencher(
    ([*Grau maior*], [*G maior*], [*G menor natural*], [*Grau no menor*]),
    (
      ([I], none, none, none),
      ([II], none, none, none),
      ([III], none, none, none),
      ([IV], none, none, none),
      ([V], none, none, none),
      ([VI], none, none, none),
      ([VII], none, none, none),
    ),
    altura: 0.75cm,
  )
]

#ex(titulo: "Caça aos emprestados", nivel: "Médio")[
  Em cada progressão, identifique os acordes que não pertencem ao campo maior do tom indicado. Classifique cada um como *empréstimo* (com o grau) ou *dominante secundário*. Cuidado: há acordes diatônicos que parecem "de fora".

  #tabela-preencher(
    columns: (0.4fr, 2.2fr, 0.5fr, 2.4fr),
    ([], [*Progressão*], [*Tom*], [*Acordes de fora e classificação*]),
    (
      ([a)], [C – Am – Fm – C], [C], none),
      ([b)], [G – Eb – F – G], [G], none),
      ([c)], [D – C – G – D], [D], none),
      ([d)], [C – Dm7(b5) – G7 – C], [C], none),
      ([e)], [A – F\#m – D – Dm – A], [A], none),
      ([f)], [F – Ab – Bb – F], [F], none),
      ([g)], [C – E7 – Am – F – Fm – C], [C], none),
      ([h)], [E – G – A – E], [E], none),
    ),
    altura: 0.75cm,
  )
]

#ex(titulo: "Transposição", nivel: "Médio")[
  Transponha cada progressão de C para G e para D, mantendo os mesmos graus.

  #tabela-preencher(
    columns: (1.1fr, 1.6fr, 1fr, 1fr),
    ([*Graus*], [*Em C*], [*Em G*], [*Em D*]),
    (
      ([I – bVI – bVII – I], [C – Ab – Bb – C], none, none),
      ([I – IV – IVm – I], [C – F – Fm – C], none, none),
      ([I – bVII – IV – I], [C – Bb – F – C], none, none),
      ([I7M – IVm7 – bVII7 – I7M], [C7M – Fm7 – Bb7 – C7M], none, none),
      ([I – IIm7(b5) – V7 – I], [C – Dm7(b5) – G7 – C], none, none),
    ),
  )
]

#ex(titulo: "Acorde emprestado × melodia", nivel: "Médio")[
  Tom de C maior. Para cada par acorde + nota da melodia, marque se há *conflito* (choque de meio tom com uma nota do acorde) ou se a combinação está *ok*. Justifique em poucas palavras.

  #tabela-preencher(
    columns: (0.4fr, 1fr, 1fr, 0.9fr, 2.4fr),
    ([], [*Acorde*], [*Melodia*], [*Conflito/ok*], [*Justificativa*]),
    (
      ([a)], [Fm], [A], none, none),
      ([b)], [Ab], [C], none, none),
      ([c)], [Bb], [B], none, none),
      ([d)], [Eb], [G], none, none),
      ([e)], [Dm7(b5)], [A], none, none),
      ([f)], [Gm], [D], none, none),
    ),
    altura: 0.7cm,
  )
]

#ex(titulo: "No instrumento", nivel: "Prática")[
  Toque, com metrônomo a 70 BPM e um acorde por compasso (4 tempos), as três progressões abaixo usando os shapes desta aula. Repita cada uma 8 vezes, depois transponha para G de ouvido.

  #tabela(
    columns: (1fr, 1.5fr, 2fr),
    alinhamento: (center + horizon, center + horizon, left + horizon),
    ([*Progressão*], [*Cifras*], [*Foco*]),
    (
      ([I – IV – IVm – I], [C – F – Fm – C], [Destaque a linha Sol–Lá–Láb–Sol na 3ª corda]),
      ([I – bVI – bVII – I], [C – Ab – Bb – C], [Pestanas nas casas 4, 6 e 8 sem soltar a mão]),
      ([I – bVII – IV – I], [C – Bb – F – C], [Palhetada de rock em colcheias, acentuando o tempo 1]),
    ),
  )
]

#ex(titulo: "Composição", nivel: "Desafio")[
  Componha uma progressão de 8 compassos em *G maior* que use pelo menos *dois* acordes emprestados diferentes e termine na tônica. Escreva as cifras, os graus e, para cada emprestado, a nota que "sai" da escala de G maior. Depois, grave a progressão e improvise por cima usando G maior nos acordes diatônicos e G menor natural nos emprestados.

  #tabela-preencher(
    columns: (1.1fr,) + (1fr,) * 8,
    ([*Compasso*], [*1*], [*2*], [*3*], [*4*], [*5*], [*6*], [*7*], [*8*]),
    (
      ([Cifra],) + (none,) * 8,
      ([Grau],) + (none,) * 8,
    ),
    altura: 0.9cm,
  )

  Notas emprestadas usadas:
  #linhas-resposta(2)
]

=== Sugestão de prática

#rotina-estudo((
  ([Tocar os campos de C maior e C menor natural (tríades com pestana), ouvindo a diferença], [5 min], [60]),
  ([Shapes dos emprestados em C: Fm, Fm7, Bb, Bb7, Ab, Eb, Dm7(b5), Gm], [10 min], [—]),
  ([I – IV – IVm – I com a linha cromática na 3ª corda], [5 min], [70]),
  ([Cadência do Mario e I – bVII – IV – I em C, G e D], [10 min], [70–90]),
  ([Análise: escolher uma música conhecida e marcar os acordes de fora], [10 min], [—]),
  ([Improviso: C maior × C menor natural sobre C – Fm – C – Bb], [5 min], [80]),
))

#checklist(titulo: "Autoavaliação", (
  [Explico a diferença entre relativo (C × Am) e homônimo (C × Cm).],
  [Escrevo o campo menor natural de qualquer tônica e dou os graus bIII, bVI e bVII.],
  [Reconheço de ouvido o IVm e o bVII numa progressão em tom maior.],
  [Diferencio um acorde emprestado de um dominante secundário.],
  [Verifico a nota da melodia antes de inserir um empréstimo.],
  [Toco as três progressões desta aula em C, G e D sem parar o metrônomo.],
))

#gabarito[
  #resposta(1)[
    *G maior:* G · Am · Bm · C · D · Em · F\#º. \
    *G menor natural:* Gm (Im) · Aº (IIº) · Bb (bIII) · Cm (IVm) · Dm (Vm) · Eb (bVI) · F (bVII).
  ]
  #resposta(2)[
    a) Fm = IVm (empréstimo). \
    b) Eb = bVI e F = bVII (empréstimos — cadência do Mario em G). \
    c) C = bVII (empréstimo; progressão I – bVII – IV – I). \
    d) Dm7(b5) = IIm7(b5) (empréstimo). \
    e) Dm = IVm (empréstimo); F\#m é diatônico (VIm). \
    f) Ab = bIII (empréstimo). Bb é diatônico em F (IV). \
    g) E7 = V7/VI, *dominante secundário* (resolve em Am); Fm = IVm (empréstimo). \
    h) G = bIII (empréstimo). A é diatônico em E (IV).
  ]
  #resposta(3)[
    I – bVI – bVII – I: G – Eb – F – G · D – Bb – C – D. \
    I – IV – IVm – I: G – C – Cm – G · D – G – Gm – D. \
    I – bVII – IV – I: G – F – C – G · D – C – G – D. \
    I7M – IVm7 – bVII7 – I7M: G7M – Cm7 – F7 – G7M · D7M – Gm7 – C7 – D7M. \
    I – IIm7(b5) – V7 – I: G – Am7(b5) – D7 – G · D – Em7(b5) – A7 – D.
  ]
  #resposta(4)[
    a) Conflito: Lá contra Láb (3ª menor de Fm). \
    b) Ok: Dó é a 3ª de Ab. \
    c) Conflito: Si contra Sib (fundamental de Bb). \
    d) Ok: Sol é a 3ª de Eb. \
    e) Conflito: Lá contra Láb (5ª diminuta de Dm7(b5)). \
    f) Ok: Ré é a 5ª de Gm.
  ]
  #resposta(5)[
    Exercício prático — critério de sucesso: as três progressões soam sem cortes entre os acordes, a linha Sol–Lá–Láb–Sol fica audível e você consegue tocá-las em G sem consultar a apostila.
  ]
  #resposta(6)[
    Resposta pessoal. Exemplo: G – Em – C – Cm | G – Eb – F – G (I – VIm – IV – IVm | I – bVI – bVII – I). Notas emprestadas: Bb (b3, em Eb), Eb (b6, em Cm e em Eb) e F (7ª menor de Sol, em F). Confira se nenhuma nota da sua melodia choca com essas notas nos compassos dos emprestados.
  ]
]
