#import "/templates/layout.typ": *
#import "/templates/components.typ": *
#import "@preview/conchord:0.4.0": new-chordgen

#show: aula.with(
  instrumento: "Guitarra",
  nivel: "Intermediário",
)

#let chord = new-chordgen(number-to-left: true, use-shadow-barre: false, colors: (hold: black, barre: black))
#show <chord>: set text(fill: color-strong, weight: "bold")

// ─── Helpers locais ──────────────────────────────────────────
// grade de diagramas sem quebra entre páginas (diagramas e legendas juntos)
#let acordes(..args) = block(breakable: false, width: 100%, grid-acordes(..args))
// exercícios curtos não se dividem entre páginas (enunciado e área de resposta juntos)
#let exercicio-base = exercicio
#let exercicio(..args) = block(breakable: false, width: 100%, exercicio-base(..args))

// mapa: braco-notas a partir de uma lista (corda, casa, rótulo).
// `raiz` documenta a nota de referência dos rótulos (intervalos).
#let mapa(raiz: none, fs: 1, casas: 5, largura: 22pt, notas) = {
  let dados = range(6).map(_ => range(casas).map(_ => ""))
  for n in notas {
    let (corda, casa, rotulo) = n
    dados.at(6 - corda).at(casa - fs) = rotulo
  }
  braco-notas(dados, fs: fs, casa-largura: largura)
}

= Campo Harmônico Menor Harmônico

A *escala menor harmônica* é a escala menor natural com o 7º grau elevado meio tom — em Lá: A B C D E F G\#. Esse G\#, a *sensível*, fica meio tom abaixo da tônica e "puxa" para ela. Neste material você vai montar os acordes que essa escala gera, tocar os mais característicos, conhecer os modos que nascem dela e aplicar tudo em progressões típicas.

#objetivos((
  [Montar o campo harmônico menor harmônico em tríades e tétrades],
  [Tocar e reconhecer os acordes característicos: Im(7M), V7, V7(b9) e VIIº7],
  [Usar o clichê cromático Im – Im(7M) – Im7 – Im6],
  [Conhecer os sete modos da menor harmônica, com destaque para o Frígio dominante],
  [Aplicar o campo em progressões de jazz, flamenco e música erudita],
))

== 1. O campo em Lá menor harmônico

Empilhando terças só com notas da escala sobre cada grau, obtêm-se os acordes abaixo. Nas fórmulas e cifras, *7* indica a sétima menor e *7M*, a sétima maior.

#tabela(
  columns: (1fr, 0.8fr, 1fr, 1.2fr, 1.8fr),
  ([Grau], [Tríade], [Tétrade], [Notas], [Tipo]),
  (
    ([Im(7M)], [Am], [Am(7M)], [A C E G\#], [Menor com 7ª maior]),
    ([IIm7(b5)], [Bº], [Bm7(b5)], [B D F A], [Meio-diminuto]),
    ([bIII7M(\#5)], [C+], [C7M(\#5)], [C E G\# B], [Aumentado com 7ª maior]),
    ([IVm7], [Dm], [Dm7], [D F A C], [Menor com 7]),
    ([*V7*], [*E*], [*E7*], [E G\# B D], [*Dominante*]),
    ([bVI7M], [F], [F7M], [F A C E], [Maior com 7ª maior]),
    ([VIIº7], [G\#º], [G\#º7], [G\# B D F], [Diminuto]),
  ),
)

#v(0.4em)

Os graus bIII e bVI levam bemol porque estão meio tom abaixo dos graus correspondentes da escala maior de Lá (C\# e F\#). O G\# aparece em quatro acordes — Im(7M), bIII7M(\#5), V7 e VIIº7 — e é ele que dá ao campo o seu som dramático.

== 2. Os acordes característicos

=== Im(7M) e o clichê cromático

O *Am(7M)* existe porque o G\# é a sétima maior de Lá. Sozinho ele soa tenso, quase "de suspense"; seu uso mais comum é como passagem no *clichê cromático*: sobre o acorde de Am, uma voz desce por semitons — Lá, Sol\#, Sol, Fá\# — formando Am, Am(7M), Am7 e Am6. Nos desenhos abaixo, essa voz está na 4ª corda (casas 7, 6, 5 e 4), enquanto a pestana na casa 5 e o Lá solto do baixo ficam parados.

#acordes(
  chord: chord,
  columns: 4,
  gutter: 2em,
  (
    (tabs: "x,0,7,5,5,5", nome: "Am", titulo: "Im", detalhe: "voz: A"),
    (tabs: "x,0,6,5,5,5", nome: "Am(7M)", titulo: "Im(7M)", detalhe: "voz: G#"),
    (tabs: "x,0,5,5,5,5", nome: "Am7", titulo: "Im7", detalhe: "voz: G"),
    (tabs: "x,0,4,5,5,5", nome: "Am6", titulo: "Im6", detalhe: "voz: F#"),
  ),
)

#v(0.4em)

O Am6 usa o F\#, que vem da escala menor melódica (a menor harmônica com o 6º grau também elevado). Esse clichê aparece em muitos standards de jazz, como "My Funny Valentine", e em incontáveis trilhas de cinema.

=== V7 e V7(b9): o dominante com sensível

O *E7* é a razão de existir da menor harmônica: a sua 3ª (G\#) resolve em Lá e a sua 7ª (D) resolve em Dó. Acrescentando a 9ª menor (F), outra nota da escala, obtém-se o *E7(b9)*, ainda mais tenso e característico do tom menor.

=== VIIº7: o dominante disfarçado

O *G\#º7* é formado só por terças menores (G\# B D F). Ele tem exatamente as mesmas notas do E7(b9) sem a tônica Mi, e por isso funciona como um *dominante*: resolve em Am do mesmo jeito que o E7. Como as quatro notas estão igualmente espaçadas, o mesmo desenho subindo 3 casas continua sendo o mesmo acorde (G\#º7 = Bº7 = Dº7 = Fº7).

#acordes(
  chord: chord,
  columns: 3,
  gutter: 2.6em,
  (
    (tabs: "0,2,0,1,0,0", nome: "E7", titulo: "V7", detalhe: "E · G# · B · D"),
    (tabs: "0,2,0,1,3,1", nome: "E7(b9)", titulo: "V7(b9)", detalhe: "E · G# · B · D · F"),
    (tabs: "4,x,3,4,3,x,*", nome: "G#º7", titulo: "VIIº7", detalhe: "G# · B · D · F"),
  ),
)

== 3. Os modos da menor harmônica

#block(breakable: false)[
Como na escala maior, cada grau da menor harmônica gera um modo — as mesmas sete notas, com outro centro. Os nomes descrevem a diferença em relação a um modo conhecido:

#tabela(
  columns: (0.55fr, 1.6fr, 1.75fr, 2fr, 1.1fr),
  ([Grau], [Modo], [Notas], [Fórmula], [Acorde]),
  (
    ([I], [Menor harmônica], [A B C D E F G\#], [T 2 b3 4 5 b6 7M], [Am(7M)]),
    ([II], [Lócrio 6], [B C D E F G\# A], [T b2 b3 4 b5 6 7], [Bm7(b5)]),
    ([III], [Jônico \#5], [C D E F G\# A B], [T 2 3 4 \#5 6 7M], [C7M(\#5)]),
    ([IV], [Dórico \#4], [D E F G\# A B C], [T 2 b3 \#4 5 6 7], [Dm7]),
    ([*V*], [*Frígio dominante*], [E F G\# A B C D], [T b2 3 4 5 b6 7], [*E7*]),
    ([VI], [Lídio \#2], [F G\# A B C D E], [T \#2 3 \#4 5 6 7M], [F7M]),
    ([VII], [Superlócrio bb7], [G\# A B C D E F], [T b2 b3 b4 b5 b6 bb7], [G\#º7]),
  ),
)
]

#v(0.4em)

#text(size: 9pt, fill: color-muted)[No Superlócrio bb7, a b4 (C) soa igual à 3ª maior e a bb7 (F) soa igual à 6ª; a grafia mantém uma letra para cada grau.]

=== Destaque: o Frígio dominante

O modo do V grau é o mais usado na guitarra. Ele também é chamado de *Mixolídio b9 b13*, porque é o Mixolídio (T 2 3 4 5 6 7) com a 2ª (9ª) e a 6ª (13ª) abaixadas. Sobre o E7, a combinação da b2 (F) com a 3ª maior (G\#) cria o salto de 1½ tom que dá o som "espanhol" do flamenco e do metal neoclássico.

O diagrama mostra um desenho da menor harmônica de Lá (casas 4 a 8), mas com os intervalos contados *a partir de Mi* — é assim que você o pensa quando toca sobre o E7. Os círculos pretos são o Mi.

#grid(
  columns: (auto, 1fr),
  column-gutter: 1.4em,
  align: (center + horizon, left + horizon),
  [
    #mapa(raiz: "E", fs: 4, (
      (6, 4, "3"), (6, 5, "4"), (6, 7, "5"), (6, 8, "b6"),
      (5, 5, "7"), (5, 7, "T"), (5, 8, "*b2"),
      (4, 6, "3"), (4, 7, "4"),
      (3, 4, "5"), (3, 5, "b6"), (3, 7, "7"),
      (2, 5, "T"), (2, 6, "*b2"),
      (1, 4, "3"), (1, 5, "4"), (1, 7, "5"), (1, 8, "b6"),
    ))
    #v(0.2em)
    #text(size: 8pt, fill: color-muted)[Mi Frígio dominante — casas 4 a 8]
  ],
  block(
    width: 100%,
    fill: color-subtle-bg,
    stroke: 0.5pt + color-rule-dark,
    inset: 11pt,
    radius: 5pt,
    [
      #set text(size: 9.5pt)
      #set par(justify: false, leading: 0.8em)
      *Notas:* E F G\# A B C D \
      *Fórmula:* T b2 3 4 5 b6 7 \
      *Use sobre:* E7 ou E7(b9) resolvendo em Am. \
      *Movimentos típicos:* F → E (b2 → T, em cinza → preto) e G\# → A (a sensível subindo para a tônica de Am). \
      *Onde ouvir:* Paco de Lucía, Yngwie Malmsteen, Ritchie Blackmore.
    ],
  ),
)

== 4. Progressões características

=== IIm7(b5) – V7 – Im: a cadência menor

#acordes(
  chord: chord,
  columns: 3,
  gutter: 2.6em,
  (
    (tabs: "x,2,3,2,3,x,*", nome: "Bm7(b5)", titulo: "IIm7(b5)", detalhe: "preparação"),
    (tabs: "0,2,0,1,0,0", nome: "E7", titulo: "V7", detalhe: "dominante"),
    (tabs: "x,0,2,2,1,0", nome: "Am", titulo: "Im", detalhe: "tônica"),
  ),
)

=== bVI7M – V7 – Im e a cadência andaluza

O *F7M → E7* desce por semitom no baixo (F → E) e é uma das resoluções mais "cinematográficas" do tom menor. A *cadência andaluza* — Am – G – F – E — prolonga essa descida: o G vem da menor natural (bVII) e o E, da menor harmônica (V). É a base harmônica do flamenco.

#acordes(
  chord: chord,
  columns: 4,
  gutter: 2em,
  (
    (tabs: "x,0,2,2,1,0", nome: "Am", titulo: "Im"),
    (tabs: "3,2,0,0,0,3", nome: "G", titulo: "bVII"),
    (tabs: "1,3,3,2,1,1", nome: "F", titulo: "bVI"),
    (tabs: "0,2,2,1,0,0", nome: "E", titulo: "V"),
  ),
)

#v(0.4em)

#tabela(
  columns: (1.3fr, 2fr, 1.9fr),
  ([Estilo], [Progressão típica (em Lá menor)], [Destaque]),
  (
    ([Flamenco], [Am – G – F – E (Im – bVII – bVI – V)], [Frígio dominante sobre o E]),
    ([Jazz], [Bm7(b5) – E7(b9) – Am(7M)], [Im(7M) como tônica]),
    ([Erudito / cinema], [Am – Am(7M) – Am7 – Am6], [Clichê cromático]),
    ([Metal neoclássico], [Am – E7 – Am – G\#º7 – Am], [VIIº7 no lugar do V7]),
  ),
)

#v(0.4em)

#caixa(tipo: "dica")[
  O G\# não precisa aparecer o tempo todo. Na maioria das músicas em tom menor, os acordes Im, IVm, bVI e bVII vêm da menor natural, e o G\# surge só no V7 e no VIIº7, na hora de "puxar" para a tônica. Escolher quando ativá-lo é o que dá expressividade ao tom menor.
]

#pagebreak()

== 5. Exercícios

#exercicio(titulo: "O campo de Ré menor harmônico", nivel: "Escrita")[
  Escreva a escala de Ré menor harmônica e, para cada grau, a tétrade e as suas notas.

  Escala: #box(width: 8cm, line(length: 100%, stroke: 0.5pt + color-rule-light))

  #tabela-preencher(
    ([Grau], [Tétrade], [Notas]),
    (
      ([Im(7M)], none, none),
      ([IIm7(b5)], none, none),
      ([bIII7M(\#5)], none, none),
      ([IVm7], none, none),
      ([V7], none, none),
      ([bVI7M], none, none),
      ([VIIº7], none, none),
    ),
    columns: (1fr, 1.2fr, 2fr),
  )
]

#exercicio(titulo: "Dominantes disfarçados", nivel: "Escrita")[
  *a)* Escreva as notas do A7(b9) e do C\#º7. *b)* Explique por que o C\#º7 pode substituir o A7 numa cadência para Dm.

  #linhas-resposta(3)
]

#exercicio(titulo: "Os modos da menor harmônica de Ré", nivel: "Escrita")[
  Escreva as notas de cada modo, a partir da escala de Ré menor harmônica.

  #tabela-preencher(
    ([Modo], [Notas]),
    (
      ([Lá Frígio dominante (V)], none),
      ([Mi Lócrio 6 (II)], none),
      ([Sol Dórico \#4 (IV)], none),
    ),
    columns: (1.4fr, 2.6fr),
  )
]

#exercicio(titulo: "Análise", nivel: "Escrita")[
  Escreva o grau de cada acorde em Ré menor: *Dm – Dm(7M) – Dm7 – Dm6 – Em7(b5) – A7 – Dm*.

  #linhas-resposta(1)
]

#exercicio(titulo: "O clichê em Ré menor", nivel: "Tablatura")[
  Escreva o clichê *Dm – Dm(7M) – Dm7 – Dm6* (um compasso cada) nas cordas 4, 3, 2 e 1, com a 4ª corda solta (Ré) no baixo e a voz cromática descendo na 3ª corda a partir da casa 7.

  #tab-vazia(sistemas: 1, compassos: 4, altura-linha: 10pt)
]

#exercicio(titulo: "Frígio dominante sobre o E7", nivel: "Prática")[
  Grave um vamp de *E7 – Am* (dois compassos cada, 80 BPM). Improvise com o desenho da seção 3, terminando as frases do E7 com F → E ou G\# → A no momento em que o Am entra.
]

#v(0.6em)

#block(breakable: false)[
  === Sugestão de prática

  #rotina-estudo((
    ([Clichê Am – Am(7M) – Am7 – Am6, um acorde por compasso], [5 min], [60–80]),
    ([Bm7(b5) – E7(b9) – Am(7M) e Am – E7 – Am – G\#º7 – Am], [7 min], [60–80]),
    ([Cadência andaluza Am – G – F – E com ritmo constante], [5 min], [70–90]),
    ([Desenho do Frígio dominante, dizendo os intervalos a partir de Mi], [5 min], [60–80]),
    ([Improviso sobre E7 – Am com o Frígio dominante], [8 min], [70–90]),
  ))
]

#v(0.6em)

#block(breakable: false)[
  #checklist(titulo: "Autoavaliação", (
    [Monto o campo menor harmônico em tríades e tétrades a partir de qualquer tônica.],
    [Toco o clichê cromático e sei de onde vem cada nota da voz que desce.],
    [Explico por que o VIIº7 funciona como dominante.],
    [Escrevo os modos da menor harmônica e reconheço o som do Frígio dominante.],
    [Toco a cadência IIm7(b5) – V7 – Im e a cadência andaluza.],
  ))
]

#gabarito[
  #resposta(1)[
    Escala: D E F G A Bb C\#.
    #grid(
      columns: (1fr, 1fr),
      row-gutter: 0.55em,
      [Im(7M): Dm(7M) — D F A C\#], [IIm7(b5): Em7(b5) — E G Bb D],
      [bIII7M(\#5): F7M(\#5) — F A C\# E], [IVm7: Gm7 — G Bb D F],
      [V7: A7 — A C\# E G], [bVI7M: Bb7M — Bb D F A],
      [VIIº7: C\#º7 — C\# E G Bb], [],
    )
  ]
  #resposta(2)[
    a) A7(b9): A C\# E G Bb · C\#º7: C\# E G Bb. b) O C\#º7 tem as mesmas notas do A7(b9) sem a tônica Lá — inclusive o trítono C\#–G e a sensível C\#, que resolve em Ré. Por isso resolve em Dm do mesmo modo que o A7.
  ]
  #resposta(3)[
    Lá Frígio dominante: A Bb C\# D E F G · Mi Lócrio 6: E F G A Bb C\# D · Sol Dórico \#4: G A Bb C\# D E F.
  ]
  #resposta(4)[
    Dm = Im · Dm(7M) = Im(7M) · Dm7 = Im7 · Dm6 = Im6 · Em7(b5) = IIm7(b5) · A7 = V7 · Dm = Im.
  ]
  #resposta(5)[
    Casas da 4ª à 1ª corda: Dm (0-7-6-5) → Dm(7M) (0-6-6-5) → Dm7 (0-5-6-5) → Dm6 (0-4-6-5). A voz da 3ª corda desce D → C\# → C → B; a 2ª corda (F) e a 1ª (A) ficam paradas.
    #tab(
      "   Dm         Dm(7M)     Dm7        Dm6\ne|-5--------|-5--------|-5--------|-5--------|\nB|-6--------|-6--------|-6--------|-6--------|\nG|-7--------|-6--------|-5--------|-4--------|\nD|-0--------|-0--------|-0--------|-0--------|",
    )
  ]
  #resposta(6)[
    Exercício prático — critério de sucesso: em todas as entradas do Am, a frase resolve por semitom (F → E ou G\# → A), exatamente no tempo 1.
  ]
]
