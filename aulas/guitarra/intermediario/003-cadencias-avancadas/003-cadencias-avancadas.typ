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

// linha de resposta curta, alinhada à direita da célula
#let campo(w: 3.2cm) = box(width: w, line(length: 100%, stroke: 0.5pt + color-rule-light))

= Cadências Avançadas

Uma *cadência* é um movimento harmônico que cria sensação de chegada ou de repouso — o equivalente musical de uma vírgula ou de um ponto final. Neste material você vai revisar as cadências básicas e aprender três recursos que enriquecem qualquer progressão: os *dominantes secundários*, a *substituição de trítono* e a *cadência em tom menor*.

#objetivos((
  [Reconhecer as cadências autêntica, plagal, composta, interrompida e a meia cadência],
  [Construir o dominante secundário de qualquer grau do campo harmônico maior],
  [Aplicar a substituição de trítono (SubV) num II-V-I e entender por que ela funciona],
  [Tocar a cadência IIm7(b5) – V7 – Im do tom menor],
  [Analisar e rearmonizar progressões com algarismos romanos],
))

== 1. As cadências fundamentais

Os exemplos usam o *campo harmônico de Dó maior* — os acordes formados sobre cada grau da escala de Dó, só com notas da escala. Os algarismos romanos indicam o grau:

#tabela(
  columns: (1fr,) * 7,
  ([I], [IIm7], [IIIm7], [IV7M], [V7], [VIm7], [VIIm7(b5)]),
  (
    ([C7M], [Dm7], [Em7], [F7M], [G7], [Am7], [Bm7(b5)]),
  ),
)

#v(0.4em)

#tabela(
  columns: (1.3fr, 1.1fr, 1.3fr, 2.3fr),
  ([Cadência], [Fórmula], [Em Dó maior], [Efeito]),
  (
    ([Autêntica], [V7 → I], [G7 → C], [Conclusão máxima: o "ponto final".]),
    ([Plagal], [IV → I], [F → C], [Repouso suave, o "Amém" dos hinos.]),
    ([Composta (II-V-I)], [IIm7 – V7 – I], [Dm7 – G7 – C7M], [A autêntica com preparação; base do jazz e da bossa nova.]),
    ([Interrompida], [V7 → VIm], [G7 → Am], [Surpresa: o ouvido espera o I e recebe o VIm.]),
    ([Meia cadência], [… → V], [C – F – G], [Termina no V: soa como uma pergunta, "em suspenso".]),
  ),
)

#v(0.6em)

#acordes(
  chord: chord,
  columns: 3,
  gutter: 2.6em,
  (
    (tabs: "x,x,0,2,1,1", nome: "Dm7", titulo: "IIm7", detalhe: "D · F · A · C"),
    (tabs: "3,2,0,0,0,1", nome: "G7", titulo: "V7", detalhe: "G · B · D · F"),
    (tabs: "x,3,2,0,0,0", nome: "C7M", titulo: "I7M", detalhe: "C · E · G · B"),
  ),
)

#v(0.4em)

#caixa(tipo: "resumo", titulo: "Por que o V7 resolve")[
  O G7 contém um *trítono* — intervalo de 3 tons — entre a sua 3ª (B) e a sua 7ª (F). Esse intervalo é instável: o B sobe meio tom para C e o F desce meio tom para E, que são notas do acorde de C. Guarde essa ideia: ela explica todas as técnicas deste material.
]

== 2. Dominantes secundários

Um *dominante secundário* é um acorde dominante (7) que resolve num grau do campo *diferente do I*. Ele funciona como o V7 "emprestado" daquele grau: por um instante, o acorde-alvo soa como uma tônica local. Escreve-se *V7/II* ("cinco do dois"), *V7/V* e assim por diante.

=== Como construir

#passos((
  [Escolha o acorde-alvo (por exemplo, Dm7, o IIm7 de Dó).],
  [Suba uma *5ª justa* a partir da tônica do alvo: de Ré, chega-se a Lá.],
  [Monte um acorde *dominante* (7) sobre essa nota: A7 (A C\# E G). O C\# não pertence a Dó maior — é a sensível de Ré, e é ela que "aponta" para o Dm7.],
))

#v(0.4em)

#tabela(
  columns: (1fr, 1fr, 1.1fr, 1.3fr, 2fr),
  ([Grau-alvo], [Acorde], [Dominante], [Cifra], [Nota de fora do tom]),
  (
    ([IIm7], [Dm7], [V7/II], [*A7*], [C\# (sensível de Ré)]),
    ([IIIm7], [Em7], [V7/III], [*B7*], [D\# (e F\#)]),
    ([IV7M], [F7M], [V7/IV], [*C7*], [Bb]),
    ([V7], [G7], [V7/V], [*D7*], [F\# (sensível de Sol)]),
    ([VIm7], [Am7], [V7/VI], [*E7*], [G\# (sensível de Lá)]),
  ),
)

#v(0.4em)

O VIIm7(b5) não recebe dominante secundário: como acorde meio-diminuto, ele não soa como uma tônica, nem mesmo por um instante.

#acordes(
  chord: chord,
  columns: 5,
  gutter: 1.6em,
  (
    (tabs: "x,3,2,0,0,0", nome: "C7M", titulo: "I7M"),
    (tabs: "x,0,2,0,2,0", nome: "A7", titulo: "V7/II"),
    (tabs: "x,x,0,2,1,1", nome: "Dm7", titulo: "IIm7"),
    (tabs: "3,2,0,0,0,1", nome: "G7", titulo: "V7"),
    (tabs: "x,3,2,0,0,0", nome: "C7M", titulo: "I7M"),
  ),
)

#v(0.4em)

#caixa(tipo: "dica")[
  Toque *C7M – Dm7 – G7 – C7M* e depois *C7M – A7 – Dm7 – G7 – C7M*. O A7 não muda o tom da música: ele apenas cria uma "gravidade local" que torna a chegada ao Dm7 mais forte. Para um efeito ainda maior, preceda o dominante secundário pelo seu próprio II: *Em7(b5) – A7 – Dm7* é um "II-V" que aponta para o Dm7.
]

== 3. Substituição de trítono (SubV)

A *substituição de trítono* troca um acorde dominante por outro dominante cuja tônica está a *3 tons* (um trítono) de distância. A troca funciona porque os dois acordes têm o *mesmo trítono interno*, com os papéis invertidos:

#tabela(
  columns: (1.2fr, 1fr, 1fr, 1.6fr),
  ([Acorde], [3ª], [7ª], [Trítono]),
  (
    ([G7 (G B D F)], [B], [F], [B – F]),
    ([Db7 (Db F Ab Cb)], [F], [Cb (= B)], [F – Cb, as mesmas duas notas]),
  ),
)

#v(0.4em)

Como o trítono é o que "puxa" para a resolução, o Db7 resolve no C tão bem quanto o G7 — e com um bônus: a tônica desce *por semitom* (Db → C), criando uma linha de baixo cromática.

#tabela(
  columns: (1.3fr, 1fr, 1fr, 1fr),
  ([Versão], [IIm7], [V7], [I7M]),
  (
    ([Original], [Dm7], [G7], [C7M]),
    ([Com SubV], [Dm7], [*Db7* (SubV7)], [C7M]),
    ([Linha do baixo], [D], [Db], [C]),
  ),
)

#v(0.6em)

#acordes(
  chord: chord,
  columns: 3,
  gutter: 2.6em,
  (
    (tabs: "x,5,7,5,6,5", nome: "Dm7", titulo: "IIm7", detalhe: "baixo na 5ª corda, casa 5"),
    (tabs: "x,4,6,4,6,4", nome: "Db7", titulo: "SubV7", detalhe: "baixo na 5ª corda, casa 4"),
    (tabs: "x,3,5,4,5,3", nome: "C7M", titulo: "I7M", detalhe: "baixo na 5ª corda, casa 3"),
  ),
)

#v(0.4em)

#caixa(tipo: "resumo", titulo: "Regra")[
  O SubV de um dominante está a 3 tons dele (6 semitons): SubV de G7 = *Db7*; de D7 = *Ab7*; de A7 = *Eb7*; de E7 = *Bb7*. Ele pode substituir qualquer dominante — inclusive os secundários.
]

== 4. Cadência em tom menor

No tom menor, o acorde do V grau da escala menor natural é menor (Em7, em Lá menor) e resolve com pouca força. Por isso, quase sempre se usa o *V7* da escala *menor harmônica*, que eleva o 7º grau (G → G\#) e cria a *sensível* — a nota meio tom abaixo da tônica. A cadência completa usa o IIm7(b5) como preparação:

#tabela(
  columns: (1fr,) * 7,
  ([Im7], [IIm7(b5)], [bIII7M], [IVm7], [Vm7 → *V7*], [bVI7M], [bVII7]),
  (
    ([Am7], [Bm7(b5)], [C7M], [Dm7], [Em7 → *E7*], [F7M], [G7]),
  ),
)

#v(0.6em)

#acordes(
  chord: chord,
  columns: 3,
  gutter: 2.6em,
  (
    (tabs: "x,2,3,2,3,x,*", nome: "Bm7(b5)", titulo: "IIm7(b5)", detalhe: "B · D · F · A"),
    (tabs: "0,2,0,1,0,0", nome: "E7", titulo: "V7", detalhe: "E · G# · B · D"),
    (tabs: "x,0,2,0,1,0", nome: "Am7", titulo: "Im7", detalhe: "A · C · E · G"),
  ),
)

#v(0.4em)

No E7, o G\# (sensível) sobe para Lá e o D desce para Dó: o mesmo mecanismo do trítono do tom maior. O Bm7(b5) é o II "natural" do tom menor e prepara o E7 do mesmo modo que o Dm7 prepara o G7 em Dó maior.

== 5. Encadeando dominantes

=== O ciclo de quintas

Quando as tônicas dos acordes descem sucessivamente uma *5ª justa*, cada acorde prepara o seguinte e a progressão vira uma "cascata" de cadências. Com dominantes secundários, o ciclo soa ainda mais forte:

#align(center, block(
  fill: color-subtle-bg,
  stroke: 0.5pt + color-rule-dark,
  inset: (x: 16pt, y: 10pt),
  radius: 5pt,
  text(size: 11pt)[*Bm7(b5) → E7 → Am7 → D7 → G7 → C7M*],
))

#v(0.2em)

#align(center, text(size: 9pt, fill: color-muted)[VIIm7(b5) – V7/VI – VIm7 – V7/V – V7 – I7M · tônicas: B → E → A → D → G → C])

=== Progressões com dominantes secundários

#block(breakable: false, tabela(
  columns: (2.2fr, 2.6fr),
  ([Progressão em Dó maior], [Análise]),
  (
    ([C – E7 – Am – F], [I – V7/VI – VIm – IV]),
    ([C – A7 – Dm – G7 – C], [I – V7/II – IIm – V7 – I]),
    ([C – D7 – G7 – C], [I – V7/V – V7 – I]),
    ([C – B7 – Em – A7 – Dm – G7 – C], [I – V7/III – IIIm – V7/II – IIm – V7 – I]),
  ),
))

#v(0.4em)

#caixa(tipo: "dica")[
  Para inserir um dominante secundário: (1) escolha o acorde que você quer valorizar; (2) calcule o dominante uma 5ª justa acima dele; (3) toque esse dominante *imediatamente antes* do alvo. Se quiser, troque-o pelo seu SubV.
]

== 6. Exercícios

#exercicio(titulo: "Qual é a cadência?", nivel: "Escrita")[
  Identifique o tipo de cadência (autêntica, plagal, composta, interrompida ou meia cadência).

  #grid(
    columns: (1fr, 1fr),
    column-gutter: 2em,
    row-gutter: 1.2em,
    [a) G7 → C (Dó maior) #h(1fr) #campo()], [b) F → C (Dó maior) #h(1fr) #campo()],
    [c) G7 → Am (Dó maior) #h(1fr) #campo()], [d) C – F – G (Dó maior) #h(1fr) #campo()],
    [e) Am7 – D7 – G7M (Sol maior) #h(1fr) #campo()], [f) D7 → Em (Sol maior) #h(1fr) #campo()],
  )
]

#exercicio(titulo: "Dominantes secundários em Sol maior", nivel: "Escrita")[
  Escreva o dominante secundário de cada acorde do campo de Sol maior e a nota de fora do tom que ele contém.

  #tabela-preencher(
    ([Acorde-alvo], [Função], [Dominante secundário], [Nota de fora do tom]),
    (
      ([Am7], [V7/II], none, none),
      ([Bm7], [V7/III], none, none),
      ([C7M], [V7/IV], none, none),
      ([D7], [V7/V], none, none),
      ([Em7], [V7/VI], none, none),
    ),
    columns: (1fr, 0.9fr, 1.4fr, 1.4fr),
  )
]

#exercicio(titulo: "Substituição de trítono", nivel: "Escrita")[
  Escreva o SubV de cada dominante e o trítono (3ª e 7ª) que os dois acordes têm em comum.

  #tabela-preencher(
    ([Dominante], [SubV], [Trítono comum]),
    (
      ([G7], none, none),
      ([D7], none, none),
      ([A7], none, none),
      ([E7], none, none),
      ([B7], none, none),
    ),
    columns: (1fr, 1fr, 1.6fr),
  )
]

#exercicio(titulo: "Análise harmônica", nivel: "Escrita")[
  Escreva o grau (algarismo romano) e a função de cada acorde.

  *a)* Em Dó maior: C7M – A7 – Dm7 – Db7 – C7M #linhas-resposta(1)
  *b)* Em Lá menor: Am7 – Bm7(b5) – E7 – Am7 #linhas-resposta(1)
]

#exercicio(titulo: "Rearmonize", nivel: "Escrita")[
  Reescreva a progressão *C – Am – Dm – G7 – C* inserindo um dominante secundário antes do Am e outro antes do Dm. Depois, troque o G7 pelo seu SubV.

  #linhas-resposta(2)
]

#exercicio(titulo: "Ouça a diferença", nivel: "Prática")[
  Toque, em semínimas a 70 BPM, um compasso por acorde: (1) *Dm7 – G7 – C7M*; (2) *Dm7 – Db7 – C7M* com os desenhos da seção 3; (3) *C7M – A7 – Dm7 – G7 – C7M*. Cante a nota mais grave de cada acorde e descreva o que muda em cada versão.

  #linhas-resposta(2)
]

#v(0.6em)

#block(breakable: false)[
  === Sugestão de prática

  #rotina-estudo((
    ([II-V-I em Dó com os desenhos abertos e com os da 5ª corda], [5 min], [60–80]),
    ([C7M – A7 – Dm7 – G7 e C7M – E7 – Am7 – Dm7 – G7], [7 min], [60–80]),
    ([Dm7 – Db7 – C7M, cantando a linha do baixo], [5 min], [60–80]),
    ([Bm7(b5) – E7 – Am7 em Lá menor], [5 min], [60–80]),
    ([Ciclo Bm7(b5) – E7 – Am7 – D7 – G7 – C7M sem parar], [8 min], [60–90]),
  ))
]

#v(0.6em)

#block(breakable: false)[
  #checklist(titulo: "Autoavaliação", (
    [Reconheço pelo ouvido e pela cifra as cinco cadências básicas.],
    [Construo o dominante secundário de qualquer grau do campo maior.],
    [Explico por que o SubV substitui o V7 (o trítono comum).],
    [Toco IIm7(b5) – V7 – Im em Lá menor e sei por que o V7 é maior.],
    [Analiso e rearmonizo progressões com algarismos romanos.],
  ))
]

#gabarito[
  #resposta(1)[
    a) autêntica · b) plagal · c) interrompida · d) meia cadência · e) composta (II-V-I de Sol) · f) interrompida (o D7 é o V7 de Sol, que resolve no VIm, Em).
  ]
  #resposta(2)[
    Am7 ← *E7* (G\#) · Bm7 ← *F\#7* (A\# e C\#) · C7M ← *G7* (F natural) · D7 ← *A7* (C\#) · Em7 ← *B7* (D\#).
  ]
  #resposta(3)[
    G7 → Db7 (B – F) · D7 → Ab7 (F\# – C) · A7 → Eb7 (C\# – G) · E7 → Bb7 (G\# – D) · B7 → F7 (D\# – A). Nos dois acordes de cada par, a 3ª de um é a 7ª do outro (escrita enarmonicamente: F\# = Gb, C\# = Db, G\# = Ab, D\# = Eb).
  ]
  #resposta(4)[
    a) C7M = I7M (tônica) · A7 = V7/II (dominante secundário) · Dm7 = IIm7 (preparação) · Db7 = SubV7 (substitui o G7) · C7M = I7M (resolução). \
    b) Am7 = Im7 (tônica) · Bm7(b5) = IIm7(b5) (preparação) · E7 = V7 (dominante, com a sensível G\#) · Am7 = Im7 (resolução).
  ]
  #resposta(5)[
    C – *E7* – Am – *A7* – Dm – G7 – C; com o SubV: C – E7 – Am – A7 – Dm – *Db7* – C.
  ]
  #resposta(6)[
    Resposta pessoal. Espera-se perceber: em (2), o baixo desce por semitom (D – Db – C) e a resolução fica mais suave; em (3), o A7 cria uma tensão nova (o C\#) que torna a chegada ao Dm7 mais forte.
  ]
]
