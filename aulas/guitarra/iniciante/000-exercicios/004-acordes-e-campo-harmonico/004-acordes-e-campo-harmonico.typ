#import "/templates/layout.typ": *
#import "/templates/components.typ": *
#import "@preview/conchord:0.4.0": new-chordgen

#show: aula.with(
  instrumento: "Guitarra",
  nivel: "Exercícios — Iniciante",
)

#let chord = new-chordgen(number-to-left: true, use-shadow-barre: false, colors: (hold: black, barre: black))
#let chord-vazio = new-chordgen(number-to-left: true, use-shadow-barre: false, scale-length: 1.45pt, colors: (hold: gray, barre: gray))
#show <chord>: set text(fill: color-strong, weight: "bold")

// ------------------------------------------------------------
// Helpers locais
// ------------------------------------------------------------

#set enum(numbering: "a)", spacing: 0.9em)

// Exercício que não se divide entre páginas.
#let ex(..args, body) = block(breakable: false, width: 100%, above: 1.5em, below: 0.9em, exercicio(..args, body))

// Quadro de abertura no mesmo estilo de `objetivos`.
#let quadro(titulo, body) = block(
  width: 100%,
  fill: color-subtle-bg,
  stroke: (left: 3pt + color-strong, rest: 0.5pt + color-rule-dark),
  inset: (x: 14pt, y: 11pt),
  radius: (right: 5pt),
  below: 1.2em,
  [
    #text(size: 9pt, weight: "bold", tracking: 1.2pt, fill: color-secondary)[#upper(titulo)]
    #v(0.2em)
    #set text(size: 9.5pt)
    #set par(justify: false, leading: 0.7em)
    #body
  ],
)

#let rotulo(body) = text(size: 9pt, weight: "bold", fill: color-secondary, body)

// Linha curta para escrever o nome de um acorde.
#let linha-nome(w: 1.8cm) = box(width: w, height: 1em, stroke: (bottom: 0.7pt + color-strong))

// Diagrama com pontos cinza (para escrever as notas) + linha para o nome.
#let diag-notas(tabs) = align(center)[
  #box(chord-vazio(tabs))
  #v(0.5em)
  #linha-nome()
]

// Diagrama de acorde em branco (6 cordas × 5 casas) para o aluno desenhar.
#let diagrama-branco(casas: 5) = {
  let w = 72pt
  let h = 75pt
  let dx = w / 5
  let dy = h / casas
  box(width: w + 24pt, height: h + 14pt, {
    place(top + left, dx: 20pt, dy: 12pt, {
      for i in range(6) {
        place(top + left, dx: dx * i, line(angle: 90deg, length: h, stroke: 0.6pt + color-rule-dark))
      }
      for j in range(casas + 1) {
        place(top + left, dy: dy * j, line(length: w, stroke: (if j == 0 { 1.6pt } else { 0.6pt }) + color-rule-dark))
      }
    })
    // espaço para o número da casa, à esquerda da primeira casa
    place(top + left, dx: 2pt, dy: 12pt + dy / 2 + 3pt, line(length: 13pt, stroke: 0.5pt + color-rule-light))
  })
}

#let diag-branco-nome(rotulo-txt) = align(center)[
  #diagrama-branco()
  #v(0.2em)
  #text(size: 9.5pt, weight: "bold")[#rotulo-txt]
]

= Acordes e Campo Harmônico

Este material trabalha a construção e a lógica dos acordes: tríades e tétrades, inversões, campo harmônico maior e menor, graus, funções, cadências, relativos, transposição, análise de progressões e tensões. Os exercícios vão do acorde isolado à harmonia de uma música inteira, e a dificuldade aumenta dentro de cada bloco. Resolva com lápis e, sempre que montar um acorde no papel, *toque-o na guitarra* — o ouvido confirma ou denuncia o erro na hora. Os exercícios de diagrama pedem que você escreva a nota de cada ponto: conte as casas a partir da nota da corda solta (da 6ª à 1ª: E – A – D – G – B – E), lembrando que cada casa vale um semitom. Confira tudo no *gabarito* ao final.

#quadro("Conteúdos cobertos")[
  #grid(
    columns: (1.25fr, 2.6fr, auto),
    column-gutter: 1em,
    row-gutter: 0.85em,
    align: (left + top, left + top, right + top),
    text(size: 8.5pt, weight: "bold", fill: color-secondary)[BLOCO],
    text(size: 8.5pt, weight: "bold", fill: color-secondary)[TEMAS],
    text(size: 8.5pt, weight: "bold", fill: color-secondary)[EXERCÍCIOS],
    [*1.* Tríades, tétrades e inversões], [Tríades maiores, menores, diminutas e aumentadas · tétrades · notas em diagramas · inversões], [1–6],
    [*2.* Campo harmônico maior], [Campo harmônico maior em tríades e tétrades · graus romanos · funções e cadências], [7–10],
    [*3.* Relativos e tons menores], [Acordes relativos · campo harmônico menor natural], [11–12],
    [*4.* Transposição, análise e tensões], [Transposição · análise de progressões (incluindo o II-V-I) · tensões · composição], [13–16],
  )
  #v(0.3em)
  #line(length: 100%, stroke: 0.4pt + color-rule-light)
  #v(-0.2em)
  #text(size: 8.5pt, fill: color-secondary)[*Níveis:* _Fácil_ — aplicação direta de uma regra · _Médio_ — raciocínio em etapas · _Desafio_ — combina vários conceitos; vale errar e refazer. \
  *Cifragem:* `C` maior · `Cm` menor · `Cº` diminuta (= `Cm(b5)`) · `C+` aumentada · `C7M` · `C7` · `Cm7` · `Cm7(b5)` (= `Cø`). Graus em algarismos romanos: `I`, `IIm7`, `V7`, `VIIm7(b5)`; em tom menor, `bIII`, `bVI`, `bVII`.]
]

#pagebreak()

// ============================================================
== 1. Tríades, tétrades e inversões
// ============================================================

#ex(titulo: "Monte as tríades", nivel: "Fácil")[
  Escreva a tônica, a terça e a quinta de cada tríade. Fórmulas: maior *T – 3 – 5*; menor *T – b3 – 5*; diminuta *T – b3 – b5*; aumentada *T – 3 – \#5*. Empilhe terças pulando uma letra (C → E → G).

  #tabela-preencher(
    columns: (1fr, 0.8fr, 0.8fr, 0.8fr, 1fr, 0.8fr, 0.8fr, 0.8fr),
    ([Acorde], [T], [3ª], [5ª], [Acorde], [T], [3ª], [5ª]),
    (
      ([G], none, none, none, [F\#m], none, none, none),
      ([D], none, none, none, [Bb], none, none, none),
      ([Am], none, none, none, [Eb], none, none, none),
      ([Em], none, none, none, [Fm], none, none, none),
      ([Bº], none, none, none, [Ab], none, none, none),
      ([C+], none, none, none, [C\#º], none, none, none),
    ),
  )
]

#ex(titulo: "Identifique o tipo de tríade", nivel: "Médio")[
  Para cada grupo de notas, escreva o intervalo da terça (3 ou b3) e da quinta (5, b5 ou \#5) em relação à tônica e dê a cifra do acorde. Nas três últimas linhas as notas estão *fora de ordem*: descubra primeiro qual é a tônica (a nota a partir da qual as outras formam terças empilhadas).

  #tabela-preencher(
    columns: (1.5fr, 0.8fr, 0.8fr, 1fr, 1.5fr, 0.8fr, 0.8fr, 1fr),
    ([Notas], [3ª], [5ª], [Cifra], [Notas], [3ª], [5ª], [Cifra]),
    (
      ([D – F\# – A], none, none, none, [A – C\# – E], none, none, none),
      ([E – G – B], none, none, none, [F\# – A – C], none, none, none),
      ([F – A – C], none, none, none, [C\# – E – G\#], none, none, none),
      ([B – D – F], none, none, none, [A – F – D], none, none, none),
      ([C – E – G\#], none, none, none, [G\# – E – B], none, none, none),
      ([G – Bb – D], none, none, none, [Bb – Gb – Eb], none, none, none),
    ),
  )
]

#ex(titulo: "Monte as tétrades", nivel: "Médio")[
  Acrescente a sétima a cada tríade. Fórmulas: *7M* = T – 3 – 5 – 7M · *7* (dominante) = T – 3 – 5 – b7 · *m7* = T – b3 – 5 – b7 · *m7(b5)* = T – b3 – b5 – b7.

  #tabela-preencher(
    columns: (1.4fr, 0.75fr, 0.75fr, 0.75fr, 0.75fr, 1.4fr, 0.75fr, 0.75fr, 0.75fr, 0.75fr),
    ([Acorde], [T], [3ª], [5ª], [7ª], [Acorde], [T], [3ª], [5ª], [7ª]),
    (
      ([C7M], none, none, none, none, [A7], none, none, none, none),
      ([G7], none, none, none, none, [Em7], none, none, none, none),
      ([Dm7], none, none, none, none, [Eb7M], none, none, none, none),
      ([Bm7(b5)], none, none, none, none, [F\#m7(b5)], none, none, none, none),
      ([F7M], none, none, none, none, [Bb7], none, none, none, none),
      ([C\#m7], none, none, none, none, [Ab7M], none, none, none, none),
    ),
    altura: 1cm,
  )
]

#ex(titulo: "Identifique as tétrades", nivel: "Médio")[
  Escreva os intervalos de cada nota em relação à tônica (a primeira nota) e a cifra completa da tétrade.

  #tabela-preencher(
    columns: (1.8fr, 1.6fr, 1.2fr, 1.8fr, 1.6fr, 1.2fr),
    ([Notas], [Intervalos], [Cifra], [Notas], [Intervalos], [Cifra]),
    (
      ([G – B – D – F], none, none, [E – G\# – B – D\#], none, none),
      ([A – C – E – G], none, none, [C – Eb – G – Bb], none, none),
      ([F – A – C – E], none, none, [C\# – E – G – B], none, none),
      ([B – D – F – A], none, none, [Bb – D – F – A], none, none),
      ([D – F\# – A – C], none, none, [F\# – A – C\# – E], none, none),
    ),
    altura: 1cm,
  )
]

#ex(titulo: "Notas nos diagramas", nivel: "Médio")[
  Escreva ao lado de cada ponto cinza (e de cada corda solta) a nota que soa. Depois, com as notas em mãos, descubra o acorde e escreva a cifra na linha. Todos são tétrades.

  #v(0.6em)
  #grid(
    columns: (1fr,) * 4,
    row-gutter: 2.4em,
    align: center + horizon,
    diag-notas("x,0,2,0,2,0"),
    diag-notas("x,0,2,0,1,0"),
    diag-notas("x,3,2,0,0,0"),
    diag-notas("x,x,0,2,1,2"),
    diag-notas("0,2,2,0,3,0"),
    diag-notas("3,x,4,4,3,x,*"),
    diag-notas("x,2,3,2,3,x,*"),
    diag-notas("2,4,2,2,2,2"),
    diag-notas("x,3,5,3,4,3"),
    diag-notas("1,3,1,2,1,1"),
    diag-notas("x,2,1,2,0,2"),
    diag-notas("x,x,0,2,2,2"),
  )
]

#ex(titulo: "Inversões", nivel: "Desafio")[
  Lembre: *fundamental* = tônica no baixo; *1ª inversão* = terça no baixo; *2ª inversão* = quinta no baixo; *3ª inversão* (só em tétrades) = sétima no baixo. A cifra de uma inversão usa a barra: `C/E` = Dó maior com Mi no baixo.

  + As notas estão escritas *do baixo para o agudo*. Escreva a cifra com barra e a inversão.

    #tabela-preencher(
      columns: (1.6fr, 1fr, 1fr, 1.6fr, 1fr, 1fr),
      ([Notas], [Cifra], [Inversão], [Notas], [Cifra], [Inversão]),
      (
        ([E – G – C], none, none, [C – F – A], none, none),
        ([G – C – E], none, none, [B – C – E – G], none, none),
        ([F\# – A – D], none, none, [F – G – B – D], none, none),
        ([B – D – G], none, none, [G – A – C – E], none, none),
        ([A – D – F\#], none, none, [D – F – G – B], none, none),
      ),
    )

  + Escreva as notas de cada acorde, começando pelo baixo.

    #grid(
      columns: (1fr, 1fr, 1fr),
      row-gutter: 1.1em,
      column-gutter: 1em,
      [`Am/C` = #linha-nome(w: 2.6cm)], [`G/D` = #linha-nome(w: 2.6cm)], [`E/G#` = #linha-nome(w: 2.6cm)],
      [`D7/F#` = #linha-nome(w: 2.6cm)], [`Cm/Eb` = #linha-nome(w: 2.6cm)], [`F/A` = #linha-nome(w: 2.6cm)],
    )
]

// ============================================================
== 2. Campo harmônico maior
// ============================================================

#ex(titulo: "Campo harmônico em tríades", nivel: "Fácil")[
  Escreva a escala maior de cada tom e empilhe terças sobre cada grau. O padrão é sempre o mesmo: *I · IIm · IIIm · IV · V · VIm · VIIº*.

  #tabela-preencher(
    columns: (0.8fr,) + (1fr,) * 7,
    ([Tom], [I], [IIm], [IIIm], [IV], [V], [VIm], [VIIº]),
    (
      ([C], [C], [Dm], [Em], [F], [G], [Am], [Bº]),
      ([G],) + (none,) * 7,
      ([D],) + (none,) * 7,
      ([A],) + (none,) * 7,
      ([E],) + (none,) * 7,
      ([F],) + (none,) * 7,
      ([Bb],) + (none,) * 7,
    ),
  )
]

#ex(titulo: "Campo harmônico em tétrades", nivel: "Médio")[
  Agora com sétimas. Padrão: *I7M · IIm7 · IIIm7 · IV7M · V7 · VIm7 · VIIm7(b5)*. Repare que só existe *um* acorde dominante (7) em cada tom.

  #tabela-preencher(
    columns: (0.7fr,) + (1fr,) * 6 + (1.35fr,),
    ([Tom], [I7M], [IIm7], [IIIm7], [IV7M], [V7], [VIm7], [VIIm7(b5)]),
    (
      ([C], [C7M], [Dm7], [Em7], [F7M], [G7], [Am7], [Bm7(b5)]),
      ([D],) + (none,) * 7,
      ([A],) + (none,) * 7,
      ([Bb],) + (none,) * 7,
      ([E],) + (none,) * 7,
      ([Eb],) + (none,) * 7,
    ),
  )
]

#ex(titulo: "Graus romanos", nivel: "Médio")[
  + Escreva o grau (com o tipo de acorde) de cada acorde no tom indicado. Exemplo: Am7 em C = *VIm7*.

    #tabela-preencher(
      columns: (1.3fr, 0.7fr, 1.2fr, 1.3fr, 0.7fr, 1.2fr, 1.3fr, 0.7fr, 1.2fr),
      ([Acorde], [Tom], [Grau], [Acorde], [Tom], [Grau], [Acorde], [Tom], [Grau]),
      (
        ([Em], [G], none, [Gm7], [F], none, [A7], [D], none),
        ([D7], [G], none, [Dm], [F], none, [G7M], [D], none),
        ([C7M], [G], none, [Em7(b5)], [F], none, [Bm7], [D], none),
        ([F\#m7(b5)], [G], none, [C7], [F], none, [F\#m], [D], none),
      ),
    )

  + Agora o caminho inverso: escreva o acorde que ocupa o grau pedido.

    #tabela-preencher(
      columns: (1fr,) * 6,
      ([V7 de A], [IIm7 de Eb], [VIm de E], [IV7M de Bb], [IIIm7 de D], [VIIm7(b5) de C]),
      ((none,) * 6,),
    )
]

#ex(titulo: "Funções e cadências", nivel: "Médio")[
  + Classifique cada acorde como *T* (tônica), *S* (subdominante) ou *D* (dominante) no tom indicado.

    #tabela-preencher(
      columns: (1.1fr,) + (1fr,) * 7,
      ([Tom de C], [C7M], [Dm7], [Em7], [F7M], [G7], [Am7], [Bm7(b5)]),
      (([Função],) + (none,) * 7,),
    )
    #v(0.3em)
    #tabela-preencher(
      columns: (1.1fr,) + (1fr,) * 7,
      ([Tom de G], [G7M], [Am7], [Bm7], [C7M], [D7], [Em7], [F\#m7(b5)]),
      (([Função],) + (none,) * 7,),
    )

  + Dê o nome de cada cadência. Use: *autêntica* (V7 → I), *plagal* (IV → I), *composta* (IIm7 → V7 → I), *meia-cadência* (a frase para no V, deixando a tensão "no ar") ou *interrompida* (o V7 vai para o VIm em vez de ir para o I).

    #tabela-preencher(
      columns: (1.9fr, 0.6fr, 1.5fr, 1.9fr, 0.6fr, 1.5fr),
      alinhamento: (left + horizon, center + horizon, center + horizon, left + horizon, center + horizon, center + horizon),
      ([Movimento], [Tom], [Cadência], [Movimento], [Tom], [Cadência]),
      (
        ([D7 → G], [G], none, [G7 → Am], [C], none),
        ([Dm7 → G7 → C7M], [C], none, [Bb → F], [F], none),
        ([F → C], [C], none, [Em7 → A7 → D7M], [D], none),
        ([C → Am → F → G], [C], none, [C7 → F7M], [F], none),
      ),
    )
]

// ============================================================
== 3. Relativos e tons menores
// ============================================================

#ex(titulo: "Acordes relativos", nivel: "Fácil")[
  + O relativo menor de um acorde maior está *1,5 tom abaixo* (é o VIm do tom); o relativo maior de um acorde menor está *1,5 tom acima*. Complete.

    #tabela-preencher(
      columns: (1.3fr,) + (1fr,) * 8,
      ([Acorde], [C], [G], [F], [Bm], [A], [Gm], [E], [Cm]),
      (([Relativo],) + (none,) * 8,),
    )

  + Escreva as notas de C7M e de Am7. Quantas notas os dois acordes têm em comum? Por que essa semelhança permite que um substitua o outro em muitas músicas?
    #linhas-resposta(3)
]

#ex(titulo: "Campo harmônico menor natural", nivel: "Médio")[
  O campo menor natural tem as mesmas tétrades do seu relativo maior, só que começando pelo VI grau. Padrão: *Im7 · IIm7(b5) · bIII7M · IVm7 · Vm7 · bVI7M · bVII7*. Escreva primeiro o relativo maior de cada tom (coluna da direita) — ele ajuda a conferir.

  #tabela-preencher(
    columns: (0.7fr,) + (1fr,) + (1.3fr,) + (1fr,) * 5 + (0.9fr,),
    ([Tom], [Im7], [IIm7(b5)], [bIII7M], [IVm7], [Vm7], [bVI7M], [bVII7], [Rel.]),
    (
      ([Am], [Am7], [Bm7(b5)], [C7M], [Dm7], [Em7], [F7M], [G7], [C]),
      ([Em],) + (none,) * 8,
      ([Dm],) + (none,) * 8,
      ([Bm],) + (none,) * 8,
      ([Gm],) + (none,) * 8,
      ([Cm],) + (none,) * 8,
    ),
  )
]

// ============================================================
== 4. Transposição, análise e tensões
// ============================================================

#ex(titulo: "Transponha as progressões", nivel: "Médio")[
  Transpor é trocar o tom mantendo os graus. Pense primeiro nos graus, depois procure os acordes no novo tom.

  #tabela-preencher(
    columns: (0.6fr,) + (1fr,) * 4,
    ([], [I], [V], [VIm], [IV]),
    (
      ([C], [C], [G], [Am], [F]),
      ([G],) + (none,) * 4,
      ([D],) + (none,) * 4,
      ([A],) + (none,) * 4,
      ([E],) + (none,) * 4,
    ),
    altura: 0.75cm,
  )
  #v(0.3em)
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1em,
    tabela-preencher(
      columns: (0.6fr,) + (1fr,) * 3,
      ([], [IIm7], [V7], [I7M]),
      (
        ([C], [Dm7], [G7], [C7M]),
        ([F],) + (none,) * 3,
        ([Bb],) + (none,) * 3,
        ([A],) + (none,) * 3,
        ([Eb],) + (none,) * 3,
      ),
      altura: 0.75cm,
    ),
    tabela-preencher(
      columns: (0.6fr,) + (1fr,) * 4,
      ([], [Im], [bVI], [bIII], [bVII]),
      (
        ([Am], [Am], [F], [C], [G]),
        ([Em],) + (none,) * 4,
        ([Dm],) + (none,) * 4,
        ([Bm],) + (none,) * 4,
        ([Gm],) + (none,) * 4,
      ),
      altura: 0.75cm,
    ),
  )
]

#ex(titulo: "Analise as progressões", nivel: "Desafio")[
  As progressões abaixo são padrões que aparecem em centenas de músicas populares (pop, rock, MPB, baladas). Para cada uma, escreva os *graus* e as *funções* (T, S, D) no tom indicado. Na última coluna, diga se a progressão termina em repouso (tônica) ou em suspensão.

  #tabela-preencher(
    columns: (0.6fr, 2.3fr, 2fr, 1.4fr, 1.1fr),
    alinhamento: (center + horizon, left + horizon, center + horizon, center + horizon, center + horizon),
    ([Tom], [Progressão], [Graus], [Funções], [Termina em]),
    (
      ([G], [G – D – Em – C], none, none, none),
      ([C], [C – Am – F – G], none, none, none),
      ([G], [Am7 – D7 – G7M – C7M], none, none, none),
      ([F], [Dm – Bb – F – C], none, none, none),
      ([Em], [Em – C – G – D], none, none, none),
      ([Am], [Am – Dm – Em – Am], none, none, none),
      ([A], [F\#m7 – Bm7 – E7 – A7M], none, none, none),
    ),
    altura: 0.85cm,
  )
]

#ex(titulo: "Tensões", nivel: "Desafio")[
  Tensões são a 2ª, a 4ª e a 6ª uma oitava acima: *9* (= 2), *11* (= 4) e *13* (= 6), com suas alterações b9, \#9, \#11 e b13.

  + Escreva a nota da tensão pedida em cada acorde.

    #tabela-preencher(
      columns: (1fr,) * 6,
      ([C7M(9)], [F7M(\#11)], [G7(13)], [G7(9)], [Dm7(11)], [Am7(9)]),
      ((none,) * 6,),
    )
    #v(0.3em)
    #tabela-preencher(
      columns: (1fr,) * 6,
      ([A7(b9)], [D7(9)], [C7(13)], [Bb7M(9)], [E7(b9)], [Em7(11)]),
      ((none,) * 6,),
    )

  + No tom de C, o acorde G7 quase nunca recebe a 11ª justa. Qual é essa nota, por que ela soa mal sobre o G7 e qual tensão costuma ser usada no lugar dela (escreva a nota)?
    #linhas-resposta(3)
]

#ex(titulo: "Componha e desenhe", nivel: "Desafio")[
  Componha uma progressão de *8 compassos em Ré maior (D)*, com tétrades, que: (1) comece e termine no I7M; (2) contenha pelo menos um IIm7 – V7 – I7M; (3) use acordes das três funções; (4) inclua uma cadência interrompida *ou* plagal. Escreva a cifra e o grau em cada compasso.

  #tabela-preencher(
    columns: (0.8fr,) + (1fr,) * 4,
    ([], [Comp. 1], [Comp. 2], [Comp. 3], [Comp. 4]),
    (
      ([Cifra],) + (none,) * 4,
      ([Grau],) + (none,) * 4,
    ),
    altura: 0.95cm,
  )
  #v(0.3em)
  #tabela-preencher(
    columns: (0.8fr,) + (1fr,) * 4,
    ([], [Comp. 5], [Comp. 6], [Comp. 7], [Comp. 8]),
    (
      ([Cifra],) + (none,) * 4,
      ([Grau],) + (none,) * 4,
    ),
    altura: 0.95cm,
  )

  Desenhe nos diagramas quatro acordes diferentes da sua progressão (indique a casa inicial na linha à esquerda, se não for a 1ª) e escreva a cifra embaixo. Toque a progressão inteira com quatro batidas por compasso.

  #v(0.3em)
  #grid(
    columns: (1fr,) * 4,
    align: center,
    diag-branco-nome[#linha-nome()],
    diag-branco-nome[#linha-nome()],
    diag-branco-nome[#linha-nome()],
    diag-branco-nome[#linha-nome()],
  )
]

#block(breakable: false)[
  #set text(size: 10pt)
  == Autoavaliação

  Antes de conferir o gabarito, marque o que você já consegue fazer *sem consultar* nenhum material de apoio.

  #checklist((
    [Monto qualquer tríade (maior, menor, diminuta, aumentada) e qualquer tétrade a partir da fórmula.],
    [Reconheço o tipo de acorde pelos intervalos, mesmo com as notas fora de ordem.],
    [Leio e escrevo inversões com barra (`C/E`, `G7/F`).],
    [Escrevo o campo harmônico maior, em tríades e em tétrades, em qualquer tom.],
    [Dou o grau e a função (T, S, D) de qualquer acorde do campo e nomeio as cadências.],
    [Encontro relativos e escrevo o campo menor natural.],
    [Transponho e analiso uma progressão pensando em graus.],
    [Calculo a nota de qualquer tensão (9, 11, 13 e alterações).],
  ))
]

// ============================================================
#gabarito[
  #set par(leading: 0.8em)

  #resposta(1)[
    G = G B D · D = D F\# A · Am = A C E · Em = E G B · Bº = B D F · C+ = C E G\# · F\#m = F\# A C\# · Bb = Bb D F · Eb = Eb G Bb · Fm = F Ab C · Ab = Ab C Eb · C\#º = C\# E G.
  ]

  #resposta(2)[
    D–F\#–A: 3, 5 → *D* · E–G–B: b3, 5 → *Em* · F–A–C: 3, 5 → *F* · B–D–F: b3, b5 → *Bº* · C–E–G\#: 3, \#5 → *C+* · G–Bb–D: b3, 5 → *Gm* · A–C\#–E: 3, 5 → *A* · F\#–A–C: b3, b5 → *F\#º* · C\#–E–G\#: b3, 5 → *C\#m* · A–F–D: tônica D (D–F–A), b3, 5 → *Dm* · G\#–E–B: tônica E (E–G\#–B), 3, 5 → *E* · Bb–Gb–Eb: tônica Eb (Eb–Gb–Bb), b3, 5 → *Ebm*.
  ]

  #resposta(3)[
    C7M = C E G B · G7 = G B D F · Dm7 = D F A C · Bm7(b5) = B D F A · F7M = F A C E · C\#m7 = C\# E G\# B · A7 = A C\# E G · Em7 = E G B D · Eb7M = Eb G Bb D · F\#m7(b5) = F\# A C E · Bb7 = Bb D F Ab · Ab7M = Ab C Eb G.
  ]

  #resposta(4)[
    G B D F: T 3 5 b7 → *G7* · A C E G: T b3 5 b7 → *Am7* · F A C E: T 3 5 7M → *F7M* · B D F A: T b3 b5 b7 → *Bm7(b5)* · D F\# A C: T 3 5 b7 → *D7* · E G\# B D\#: T 3 5 7M → *E7M* · C Eb G Bb: T b3 5 b7 → *Cm7* · C\# E G B: T b3 b5 b7 → *C\#m7(b5)* · Bb D F A: T 3 5 7M → *Bb7M* · F\# A C\# E: T b3 5 b7 → *F\#m7*.
  ]

  #resposta(5)[
    Notas da 6ª para a 1ª corda (x = não toca): \
    1) x A E G C\# E → *A7* · 2) x A E G C E → *Am7* · 3) x C E G B E → *C7M* · 4) x x D A C F\# → *D7* · \
    5) E B E G D E → *Em7* · 6) G x F\# B D x → *G7M* · 7) x B F A D x → *Bm7(b5)* · 8) F\# C\# E A C\# F\# → *F\#m7* (pestana na casa 2) · \
    9) x C G Bb Eb G → *Cm7* (pestana na casa 3) · 10) F C Eb A C F → *F7* (pestana na casa 1) · 11) x B D\# A B F\# → *B7* · 12) x x D A C\# F\# → *D7M*.
  ]

  #resposta(6)[
    a) E–G–C = *C/E* (1ª inv.) · G–C–E = *C/G* (2ª) · F\#–A–D = *D/F\#* (1ª) · B–D–G = *G/B* (1ª) · A–D–F\# = *D/A* (2ª) · C–F–A = *F/C* (2ª) · B–C–E–G = *C7M/B* (3ª) · F–G–B–D = *G7/F* (3ª) · G–A–C–E = *Am7/G* (3ª) · D–F–G–B = *G7/D* (2ª). \
    b) Am/C = C – E – A · G/D = D – G – B · E/G\# = G\# – B – E · D7/F\# = F\# – A – C – D · Cm/Eb = Eb – G – C · F/A = A – C – F.
  ]

  #resposta(7)[
    *G:* G · Am · Bm · C · D · Em · F\#º \
    *D:* D · Em · F\#m · G · A · Bm · C\#º \
    *A:* A · Bm · C\#m · D · E · F\#m · G\#º \
    *E:* E · F\#m · G\#m · A · B · C\#m · D\#º \
    *F:* F · Gm · Am · Bb · C · Dm · Eº \
    *Bb:* Bb · Cm · Dm · Eb · F · Gm · Aº
  ]

  #resposta(8)[
    *D:* D7M · Em7 · F\#m7 · G7M · A7 · Bm7 · C\#m7(b5) \
    *A:* A7M · Bm7 · C\#m7 · D7M · E7 · F\#m7 · G\#m7(b5) \
    *Bb:* Bb7M · Cm7 · Dm7 · Eb7M · F7 · Gm7 · Am7(b5) \
    *E:* E7M · F\#m7 · G\#m7 · A7M · B7 · C\#m7 · D\#m7(b5) \
    *Eb:* Eb7M · Fm7 · Gm7 · Ab7M · Bb7 · Cm7 · Dm7(b5)
  ]

  #resposta(9)[
    a) Em/G = *VIm* · D7/G = *V7* · C7M/G = *IV7M* · F\#m7(b5)/G = *VIIm7(b5)* · Gm7/F = *IIm7* · Dm/F = *VIm* · Em7(b5)/F = *VIIm7(b5)* · C7/F = *V7* · A7/D = *V7* · G7M/D = *IV7M* · Bm7/D = *VIm7* · F\#m/D = *IIIm*. \
    b) V7 de A = *E7* · IIm7 de Eb = *Fm7* · VIm de E = *C\#m* · IV7M de Bb = *Eb7M* · IIIm7 de D = *F\#m7* · VIIm7(b5) de C = *Bm7(b5)*.
  ]

  #resposta(10)[
    a) Em C: C7M *T* · Dm7 *S* · Em7 *T* · F7M *S* · G7 *D* · Am7 *T* · Bm7(b5) *D*. Em G: G7M *T* · Am7 *S* · Bm7 *T* · C7M *S* · D7 *D* · Em7 *T* · F\#m7(b5) *D*. (III e VI são tônicas relativas; VII é dominante relativa.) \
    b) D7 → G *autêntica* · Dm7 → G7 → C7M *composta* · F → C *plagal* · C → Am → F → G *meia-cadência* · G7 → Am *interrompida* · Bb → F *plagal* · Em7 → A7 → D7M *composta* · C7 → F7M *autêntica*.
  ]

  #resposta(11)[
    a) C → *Am* · G → *Em* · F → *Dm* · Bm → *D* · A → *F\#m* · Gm → *Bb* · E → *C\#m* · Cm → *Eb*. \
    b) C7M = C E G B; Am7 = A C E G. Têm *três notas em comum* (C, E, G) e pertencem à mesma escala (Dó maior / Lá menor natural); por isso ambos exercem função de tônica e um pode substituir o outro sem quebrar a harmonia.
  ]

  #resposta(12)[
    #tabela(
      columns: (0.6fr,) + (1fr,) + (1.3fr,) + (1fr,) * 5 + (0.6fr,),
      ([Tom], [Im7], [IIm7(b5)], [bIII7M], [IVm7], [Vm7], [bVI7M], [bVII7], [Rel.]),
      (
        ([Em], [Em7], [F\#m7(b5)], [G7M], [Am7], [Bm7], [C7M], [D7], [G]),
        ([Dm], [Dm7], [Em7(b5)], [F7M], [Gm7], [Am7], [Bb7M], [C7], [F]),
        ([Bm], [Bm7], [C\#m7(b5)], [D7M], [Em7], [F\#m7], [G7M], [A7], [D]),
        ([Gm], [Gm7], [Am7(b5)], [Bb7M], [Cm7], [Dm7], [Eb7M], [F7], [Bb]),
        ([Cm], [Cm7], [Dm7(b5)], [Eb7M], [Fm7], [Gm7], [Ab7M], [Bb7], [Eb]),
      ),
    )
  ]

  #resposta(13)[
    I – V – VIm – IV: G = G D Em C · D = D A Bm G · A = A E F\#m D · E = E B C\#m A. \
    IIm7 – V7 – I7M: F = Gm7 C7 F7M · Bb = Cm7 F7 Bb7M · A = Bm7 E7 A7M · Eb = Fm7 Bb7 Eb7M. \
    Im – bVI – bIII – bVII: Em = Em C G D · Dm = Dm Bb F C · Bm = Bm G D A · Gm = Gm Eb Bb F.
  ]

  #resposta(14)[
    #tabela(
      columns: (0.5fr, 2fr, 2fr, 1.3fr, 1fr),
      ([Tom], [Progressão], [Graus], [Funções], [Termina]),
      (
        ([G], [G – D – Em – C], [I – V – VIm – IV], [T – D – T – S], [suspensão]),
        ([C], [C – Am – F – G], [I – VIm – IV – V], [T – T – S – D], [suspensão]),
        ([G], [Am7 – D7 – G7M – C7M], [IIm7 – V7 – I7M – IV7M], [S – D – T – S], [suspensão]),
        ([F], [Dm – Bb – F – C], [VIm – IV – I – V], [T – S – T – D], [suspensão]),
        ([Em], [Em – C – G – D], [Im – bVI – bIII – bVII], [T – S – T – D], [suspensão]),
        ([Am], [Am – Dm – Em – Am], [Im – IVm – Vm – Im], [T – S – D – T], [repouso]),
        ([A], [F\#m7 – Bm7 – E7 – A7M], [VIm7 – IIm7 – V7 – I7M], [T – S – D – T], [repouso]),
      ),
    )
    Em tom menor natural: bIII = tônica; IVm e bVI = subdominante; Vm e bVII = dominante (fraca, sem a sensível). Progressões que terminam fora da tônica "pedem" repetição — por isso viram ciclos de refrão.
  ]

  #resposta(15)[
    a) C7M(9) = *D* · F7M(\#11) = *B* · G7(13) = *E* · G7(9) = *A* · Dm7(11) = *G* · Am7(9) = *B* · A7(b9) = *Bb* · D7(9) = *E* · C7(13) = *A* · Bb7M(9) = *C* · E7(b9) = *F* · Em7(11) = *A*. \
    b) A 11ª justa de G7 é *Dó (C)*. Ela fica meio tom acima da terça do acorde (Si), criando um choque que apaga o caráter maior/dominante e soa como um acorde suspenso. No lugar dela usa-se a *\#11*, que é *Dó\# (C\#)*.
  ]

  #resposta(16)[
    Resposta pessoal. Um exemplo que cumpre todos os critérios: \
    *D7M* (I) | *Bm7* (VIm) | *Em7* (IIm7) | *A7* (V7) | *Bm7* (VIm7 — cadência interrompida A7 → Bm7) | *G7M* (IV7M) | *Em7 – A7* (IIm7 – V7) | *D7M* (I7M). \
    Critério de sucesso: começa e termina em D7M; tem IIm7 – V7 – I7M (Em7 – A7 – D7M); usa T (D7M, Bm7), S (Em7, G7M) e D (A7); tem cadência interrompida (A7 → Bm7). Diagramas: D7M `x,x,0,2,2,2` · Bm7 `x,2,4,2,3,2` · Em7 `0,2,2,0,3,0` · A7 `x,0,2,0,2,0` · G7M `3,x,4,4,3,x`.
  ]
]
