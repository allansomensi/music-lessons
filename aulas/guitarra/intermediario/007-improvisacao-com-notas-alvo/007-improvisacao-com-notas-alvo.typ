#import "/templates/layout.typ": *
#import "/templates/components.typ": *

#show: aula.with(
  instrumento: "Guitarra",
  nivel: "Intermediário",
)

#show heading: set block(sticky: true)
#show table: set par(justify: false)

// ─── Helpers locais ──────────────────────────────────────────
// caixas e exercícios nunca se dividem entre duas páginas
#let caixa-base = caixa
#let caixa(..args) = block(breakable: false, width: 100%, caixa-base(..args))
#let exercicio-base = exercicio
#let exercicio(..args) = block(breakable: false, width: 100%, exercicio-base(..args))

// mapa: braco-notas a partir de uma lista (corda, casa, rótulo).
// `raiz` documenta a tônica do acorde usada nos rótulos.
#let mapa(raiz: none, fs: 1, casas: 5, largura: 24pt, notas) = {
  let dados = range(6).map(_ => range(casas).map(_ => ""))
  for n in notas {
    let (corda, casa, rotulo) = n
    dados.at(6 - corda).at(casa - fs) = rotulo
  }
  braco-notas(dados, fs: fs, casa-largura: largura)
}

#let figura(titulo, sub, corpo) = block(breakable: false, align(center)[
  #corpo
  #v(0.25em)
  #text(size: 10pt, weight: "bold", fill: color-strong)[#titulo] \
  #text(size: 8pt, fill: color-muted)[#sub]
])

= Improvisação com Notas-Alvo

Mesmo dominando escalas, arpejos e campos harmônicos, ao improvisar a frase às vezes parece "solta", como se pudesse estar sobre qualquer acorde. O que falta não é mais uma escala: é *direção*. Nesta aula você vai aprender a escolher, antes de tocar, *onde* cada frase vai chegar — a nota-alvo — e a usar notas de passagem, aproximações cromáticas e envolvimentos para chegar lá no tempo certo. É a técnica que faz um solo "contar" a harmonia mesmo sem acompanhamento.

#objetivos((
  [Diferenciar notas do acorde de notas de passagem e posicioná-las nos tempos fortes e fracos],
  [Encontrar as guide tones (3ª e 7ª) de cada acorde e conduzi-las num II-V-I],
  [Usar aproximação cromática por baixo, por cima e por envolvimento (enclosure)],
  [Mirar a 3ª de cada acorde num blues usando a pentatônica menor como base],
  [Praticar com um método em etapas: notas do acorde → passagem → ritmo],
))

== 1. O problema: tocar a escala "sem rumo"

Sobre um II-V-I em Dó maior (Dm7 – G7 – C7M: os acordes dos graus II, V e I do tom, a cadência mais comum do jazz e da MPB), todas as notas da escala de Dó "funcionam". Por isso é comum o guitarrista subir e descer a escala inteira sem perceber que os acordes mudaram. O resultado tem três sintomas típicos:

#cartoes-info((
  (titulo: "Sem chegada", corpo: [
    A frase termina em qualquer nota, muitas vezes numa nota de tensão sobre o tempo forte. O ouvinte não sente conclusão.
  ]),
  (titulo: "Sem harmonia", corpo: [
    Tocada sozinha, a linha não revela os acordes: Dm7, G7 e C7M soam iguais, porque as mesmas sete notas são usadas do mesmo jeito.
  ]),
  (titulo: "Sem ritmo", corpo: [
    Sem um destino, as notas viram uma "esteira" de colcheias contínuas, sem pausas nem frases com começo, meio e fim.
  ]),
))

#v(0.6em)

A solução é inverter a lógica: em vez de pensar "que escala eu uso?", pense *"em que nota eu quero estar no tempo 1 do próximo acorde?"*. Essa nota é a *nota-alvo*. Todo o resto da frase existe para levar até ela.

#caixa(tipo: "resumo")[
  *Nota-alvo* = nota do acorde (de preferência a 3ª ou a 7ª) escolhida como ponto de chegada, colocada num tempo forte, de preferência no início do acorde.
]

== 2. Notas do acorde e notas de passagem

Sobre cada acorde, as notas da escala se dividem em dois grupos. As *notas do acorde* (chord tones: T, 3, 5, 7) são estáveis e podem ficar nos tempos fortes. As outras são *notas de passagem*: ligam uma nota do acorde à seguinte e soam melhor nos tempos fracos. Sobre C7M:

#tabela(
  columns: (0.8fr, 0.8fr, 1.3fr, 2.6fr),
  ([Nota], [Grau], [Função], [Comportamento]),
  (
    ([C], [T], [Nota do acorde], [Estável, conclusiva.]),
    ([D], [9], [Passagem / tensão], [Colore; soa bem também sustentada.]),
    ([E], [3], [Nota do acorde], [Define o acorde como maior — ótima nota-alvo.]),
    ([F], [4 (11)], [Passagem], [Choca com a 3ª (E): evite sustentá-la no tempo forte.]),
    ([G], [5], [Nota do acorde], [Estável, mas neutra.]),
    ([A], [6 (13)], [Passagem / tensão], [Colore; funciona de passagem.]),
    ([B], [7M], [Nota do acorde], [Define o C7M — ótima nota-alvo.]),
  ),
)

=== Tempos fortes e tempos fracos

Numa linha de colcheias em 4/4, os *tempos* (1, 2, 3, 4) são fortes e os *contratempos* ("&") são fracos. A regra prática: *notas do acorde nos tempos, notas de passagem nos contratempos*. Veja como o mesmo trecho de escala muda de efeito só por começar numa nota diferente:

#grid(
  columns: (1fr, 1fr),
  column-gutter: 1em,
  tab(
    titulo: "Linha A — escala descendo a partir de C",
    tamanho: 8pt,
    legenda: [Nos tempos: C, A, F, D. Só uma nota do acorde (C).],
    "   C7M\ne|-8--7--------------------|\nB|-------10-8--------------|\nG|-------------10-9--7-----|\nD|----------------------10-|\nA|-------------------------|\nE|-------------------------|\n   1  &  2  &  3  &  4  &",
  ),
  tab(
    titulo: "Linha B — a mesma escala a partir de B",
    tamanho: 8pt,
    legenda: [Nos tempos: B, G, E, C — as quatro notas do C7M.],
    "   C7M                       C7M\ne|-7-----------------------|----|\nB|----10-8-----------------|----|\nG|----------10-9--7--------|----|\nD|-------------------10-9--|-10-|\nA|-------------------------|----|\nE|-------------------------|----|\n   1  &  2  &  3  &  4  &    1",
  ),
)

#v(0.4em)

A linha A soa como "exercício de escala". A linha B soa como *C7M*: as notas do acorde caem nos tempos e as notas de passagem (A, F, D) ficam nos contratempos — e ela ainda resolve na tônica no tempo 1 seguinte.

#caixa(tipo: "dica")[
  Se uma linha de escala está "desencaixada", você não precisa trocar de notas: desloque o início em uma colcheia ou comece por outra nota do acorde, até que as notas do acorde caiam nos tempos.
]

#pagebreak()

== 3. Guide tones: a 3ª e a 7ª

Das quatro notas de uma tétrade, duas definem o acorde: a *3ª* diz se ele é maior ou menor, e a *7ª* diz se é 7M, 7 (dominante) ou m7. A tônica e a 5ª costumam estar no baixo ou soam neutras. Por isso a 3ª e a 7ª são chamadas de *guide tones* (notas-guia): uma linha feita só delas já "desenha" a progressão inteira.

#tabela(
  columns: (1fr, 1fr, 1fr, 1fr),
  ([Acorde], [3ª], [7ª], [Notas do acorde]),
  (
    ([Dm7 (IIm7)], [F (b3)], [C (b7)], [D · F · A · C]),
    ([G7 (V7)], [B (3)], [F (b7)], [G · B · D · F]),
    ([C7M (I)], [E (3)], [B (7M)], [C · E · G · B]),
  ),
)

=== A linha de condução 7ª → 3ª

Num II-V-I, os acordes andam por quartas (D → G → C). Nesse movimento acontece algo notável: *a 7ª de cada acorde desce meio tom e vira a 3ª do acorde seguinte*, enquanto *a 3ª fica parada e vira a 7ª do seguinte*.

#tabela(
  columns: (1.2fr, 1fr, 0.5fr, 1fr, 0.5fr, 1fr),
  ([Voz], [Dm7], [], [G7], [], [C7M]),
  (
    ([Linha 1], [C (b7)], [↘ ½], [B (3)], [=], [B (7M)]),
    ([Linha 2], [F (b3)], [=], [F (b7)], [↘ ½], [E (3)]),
  ),
)

#v(0.4em)

Confira: C → B é a 7ª do Dm7 resolvendo na 3ª do G7; F → E é a 7ª do G7 resolvendo na 3ª do C7M. Os diagramas abaixo mostram as guide tones na posição VII; os círculos cinza são as 7ªs que vão descer meio tom (uma casa) na troca seguinte.

#align(center, grid(
  columns: 3,
  column-gutter: 16pt,
  figura([Dm7], [b3 = F · b7 = C], mapa(raiz: "D", fs: 7, casas: 4, (
    (6, 8, "*b7"), (5, 8, "b3"), (4, 10, "*b7"), (3, 10, "b3"), (1, 8, "*b7"),
  ))),
  figura([G7], [3 = B · b7 = F], mapa(raiz: "G", fs: 7, casas: 4, (
    (6, 7, "3"), (5, 8, "*b7"), (4, 9, "3"), (3, 10, "*b7"), (1, 7, "3"),
  ))),
  figura([C7M], [3 = E · 7M = B], mapa(raiz: "C", fs: 7, casas: 4, (
    (6, 7, "7M"), (5, 7, "3"), (4, 9, "7M"), (3, 9, "3"), (1, 7, "7M"),
  ))),
))

#v(0.4em)

#tab(
  titulo: "Exemplo 1 — Pares de guide tones em duas regiões",
  tamanho: 8.2pt,
  legenda: [Toque os pares como acordes de duas notas (um compasso cada). Em cada troca, uma voz desce uma casa e a outra fica parada.],
  "   Dm7        G7         C7M        Dm7        G7         C7M\ne|----------|----------|----------|-8--------|-7--------|-7--------|\nB|----------|----------|----------|----------|----------|----------|\nG|-5--------|-4--------|-4--------|-10-------|-10-------|-9--------|\nD|-3--------|-3--------|-2--------|----------|----------|----------|\nA|----------|----------|----------|----------|----------|----------|\nE|----------|----------|----------|----------|----------|----------|",
)

#v(0.4em)

#caixa(tipo: "dica")[
  Os mesmos pares de 3ª e 7ª são a base dos acordes "shell" usados no jazz e na bossa nova. Ao improvisar, cante mentalmente uma das linhas (C → B → B ou F → F → E) e construa a frase em volta dela: a harmonia aparece sozinha.
]

== 4. Aproximação cromática e envolvimento

Uma vez escolhida a nota-alvo, você pode "preparar" a chegada com notas que *não pertencem ao acorde*, desde que caiam no tempo fraco e resolvam no alvo. São três recursos principais, mostrados aqui com o alvo E (3ª do C7M):

#tabela(
  columns: (1.5fr, 1.2fr, 2.8fr),
  ([Recurso], [Notas → alvo E], [Como funciona]),
  (
    ([Aproximação por baixo], [D\# → E], [Meio tom abaixo do alvo. Cria a sensação de "subir para dentro" da nota.]),
    ([Aproximação por cima], [F → E], [Meio tom (ou um grau da escala) acima do alvo. Soa como resolução descendente.]),
    ([Envolvimento (enclosure)], [F → D\# → E], [Nota de cima e nota de baixo, "cercando" o alvo antes de tocá-lo.]),
    ([Envolvimento invertido], [D\# → F → E], [O mesmo cerco, começando por baixo.]),
  ),
)

#v(0.4em)

#tab(
  titulo: "Exemplo 2 — As quatro aproximações para o alvo E (3ª corda, casa 9)",
  legenda: [Toque as notas de aproximação nos contratempos e o alvo no tempo forte seguinte.],
  "   a)      b)      c)         d)\ne|-------|-------|----------|----------|\nB|-------|-------|----------|----------|\nG|-8--9--|-10-9--|-10-8--9--|-8--10-9--|\nD|-------|-------|----------|----------|\nA|-------|-------|----------|----------|\nE|-------|-------|----------|----------|",
)

#v(0.4em)

#caixa(tipo: "atencao")[
  A nota cromática é tensão "emprestada": ela só funciona se resolver *imediatamente* no alvo e no tempo forte. Parar numa nota de aproximação ou colocá-la no tempo 1 soa como erro, e não como intenção.
]

== 5. Pentatônica no blues: mirando a 3ª de cada acorde

No blues em Lá (a forma de 12 compassos construída com os acordes dominantes dos graus I, IV e V), a pentatônica menor de Lá (A · C · D · E · G) funciona sobre os três acordes — A7, D7 e E7 —, mas *nenhuma 3ª desses acordes está na escala*. É exatamente por isso que o solo de pentatônica pura pode soar igual do primeiro ao último compasso. A saída é acrescentar, nos momentos certos, a 3ª de cada acorde como nota-alvo:

#tabela(
  columns: (0.9fr, 1fr, 1fr, 2.6fr),
  ([Acorde], [3ª (alvo)], [b7], [Relação com a pentatônica de Lá menor]),
  (
    ([A7 (I)], [C\#], [G], [O C, b3 do acorde e nota da escala, sobe meio tom até a 3ª (C\#): o clássico "b3 → 3" do blues.]),
    ([D7 (IV)], [F\#], [C], [F\# não está na escala; a b7 (C) está. Chegue no F\# vindo do G (meio tom acima).]),
    ([E7 (V)], [G\#], [D], [G\# não está na escala; a b7 (D) está. Chegue no G\# vindo do G (meio tom abaixo).]),
  ),
)

#v(0.4em)

Os diagramas mostram a forma 1 da pentatônica (casas 5 a 8) com o intervalo de cada nota *em relação ao acorde do momento*, e as 3ªs acrescentadas em cinza. Repare como a mesma nota muda de papel: o C é b3 sobre A7, b7 sobre D7 e b13 sobre E7.

#align(center, grid(
  columns: 3,
  column-gutter: 12pt,
  figura([Sobre A7], [alvo: C\# (3)], mapa(raiz: "A", fs: 4, casas: 5, largura: 21pt, (
    (6, 5, "T"), (6, 8, "b3"), (5, 4, "*3"), (5, 5, "4"), (5, 7, "5"), (4, 5, "b7"), (4, 7, "T"),
    (3, 5, "b3"), (3, 6, "*3"), (3, 7, "4"), (2, 5, "5"), (2, 8, "b7"), (1, 5, "T"), (1, 8, "b3"),
  ))),
  figura([Sobre D7], [alvo: F\# (3)], mapa(raiz: "D", fs: 4, casas: 5, largura: 21pt, (
    (6, 5, "5"), (6, 8, "b7"), (5, 5, "T"), (5, 7, "9"), (4, 4, "*3"), (4, 5, "4"), (4, 7, "5"),
    (3, 5, "b7"), (3, 7, "T"), (2, 5, "9"), (2, 7, "*3"), (2, 8, "4"), (1, 5, "5"), (1, 8, "b7"),
  ))),
  figura([Sobre E7], [alvo: G\# (3)], mapa(raiz: "E", fs: 4, casas: 5, largura: 21pt, (
    (6, 4, "*3"), (6, 5, "4"), (6, 8, "b13"), (5, 5, "b7"), (5, 7, "T"), (4, 5, "b3"), (4, 6, "*3"),
    (4, 7, "4"), (3, 5, "b13"), (3, 7, "b7"), (2, 5, "T"), (2, 8, "b3"), (1, 4, "*3"), (1, 5, "4"), (1, 8, "b13"),
  ))),
))

#v(0.4em)

#caixa(tipo: "dica")[
  Sobre o A7, o movimento C → C\# (3ª corda, casas 5 → 6) pode ser um hammer-on, um slide ou um bend de meio tom: é o som mais característico do blues. Sobre o D7 e o E7, use a b7 do acorde (C e D, que já estão na pentatônica) como ponto de apoio e a 3ª como chegada.
]

== 6. Frases que resolvem na nota-alvo

Os exemplos a seguir aplicam tudo o que foi visto. Antes de tocar, localize em cada um a nota-alvo (sempre no tempo 1 de um acorde novo) e o recurso usado para chegar até ela.

#tab(
  titulo: "Exemplo 3 — II-V-I em Dó: 7ª → 3ª e envolvimento",
  tamanho: 8.2pt,
  legenda: [Dm7 sobe pelas notas da escala com as notas do acorde nos tempos e termina em C (b7). C → B (3ª do G7) no tempo 1. No G7, F – D\# envolvem o alvo E (3ª do C7M).],
  "   Dm7                       G7                        C7M\ne|----------------7--8-----|-7-----------------------|-------------------------|\nB|----------8--10----------|----10-8-----------------|-------------------------|\nG|-7--9--10----------------|----------9--7--9--10-8--|-9-----------------------|\nD|-------------------------|-------------------------|-------------------------|\nA|-------------------------|-------------------------|-------------------------|\nE|-------------------------|-------------------------|-------------------------|\n   1  &  2  &  3  &  4  &    1  &  2  &  3  &  4  &    1  &  2  &  3  &  4  &",
)

#tab(
  titulo: "Exemplo 4 — Blues em Lá, compassos 4 e 5 (A7 → D7)",
  tamanho: 8.2pt,
  legenda: [No A7, C → C\# (b3 → 3) cai no tempo 3. O G (b7 do A7) desce meio tom até F\#, a 3ª do D7, no tempo 1 do compasso seguinte.],
  "   A7                        D7\ne|-5-----------------------|-------------------------|\nB|----8--5--------5--8-----|-7-----------------------|\nG|----------5--6-----------|-------7-----5-----------|\nD|-------------------------|----------------7--4-----|\nA|-------------------------|-------------------------|\nE|-------------------------|-------------------------|\n   1  &  2  &  3  &  4  &    1  &  2  &  3  &  4  &",
)

#tab(
  titulo: "Exemplo 5 — Blues em Lá, compassos 8 a 11 (A7 → E7 → D7 → A7)",
  tamanho: 7.8pt,
  legenda: [Alvos: G\# (3ª do E7) vindo de G por baixo; F\# (3ª do D7) vindo de G por cima; C\# (3ª do A7) vindo de C por baixo.],
  "   A7      E7                        D7                        A7\ne|-------|-------------------------|-------------------------|-------------------5-----|\nB|-------|----------------------8--|-7-----------------------|-------------5-----------|\nG|-------|-------------4-----7-----|-------------------7--5--|-6-----------------------|\nD|-7--5--|-6-----------------------|-------------7-----------|-------------------------|\nA|-------|-------------------------|-------------------------|-------------------------|\nE|-------|-------------------------|-------------------------|-------------------------|\n   4  &    1  &  2  &  3  &  4  &    1  &  2  &  3  &  4  &    1  &  2  &  3  &  4  &",
)

#block(breakable: false)[
== 7. Método de prática em três etapas

Notas-alvo são um hábito de escuta, e não uma fórmula para decorar. Construa esse hábito em etapas, sempre sobre uma base gravada (ou um looper) do II-V-I e do blues:

#cartoes-info((
  (titulo: "1. Só notas do acorde", corpo: [
    Improvise apenas com T, 3, 5 e 7 de cada acorde, em semínimas. Na troca de acorde, toque a 3ª ou a 7ª do acorde novo no tempo 1, escolhendo a mais próxima da nota anterior.
  ]),
  (titulo: "2. Acrescente passagem", corpo: [
    Passe para colcheias: notas do acorde nos tempos, notas da escala e cromatismos nos contratempos. Antes de cada troca, use uma aproximação ou um envolvimento para cair no alvo.
  ]),
  (titulo: "3. Libere o ritmo", corpo: [
    Mantenha os alvos, mas varie: pausas, notas longas, antecipações, frases curtas que se repetem. O alvo continua sendo o "chão" da frase.
  ]),
))
]

#v(0.6em)

#caixa(tipo: "dica")[
  Grave-se e ouça só o solo, sem a base. Se você consegue reconhecer onde cada acorde muda apenas ouvindo a guitarra, as notas-alvo estão funcionando.
]

== 8. Exercícios

#exercicio(titulo: "Guide tones em outros tons", nivel: "Escrita")[
  Complete a 3ª e a 7ª de cada acorde. Depois escreva as duas linhas de condução (7ª → 3ª) de cada progressão.

  #tabela-preencher(
    ([Progressão], [IIm7: 3ª / 7ª], [V7: 3ª / 7ª], [I7M: 3ª / 7ª]),
    (
      ([Gm7 – C7 – F7M], none, none, none),
      ([Cm7 – F7 – Bb7M], none, none, none),
      ([Am7 – D7 – G7M], none, none, none),
    ),
    columns: (1.5fr, 1fr, 1fr, 1fr),
  )
  #v(0.2em)
  Linhas de condução: #linhas-resposta(3)
]

#exercicio(titulo: "Tempo forte ou fraco?", nivel: "Escrita")[
  As duas linhas abaixo são tocadas em colcheias, a partir do tempo 1. Sublinhe as notas que caem nos tempos e responda: qual delas descreve melhor o acorde? Como você corrigiria a outra?

  #v(0.2em)
  #grid(
    columns: (auto, 1fr),
    column-gutter: 1em,
    row-gutter: 0.8em,
    [*a)* sobre G7:], [G · A · B · C · D · E · F · D],
    [*b)* sobre C7M:], [D · E · F · G · A · B · C · D],
  )
  #linhas-resposta(3)
]

#exercicio(titulo: "Aproximações", nivel: "Escrita")[
  Para cada nota-alvo, escreva a aproximação cromática por baixo, a aproximação cromática por cima e um envolvimento (cima → baixo → alvo).

  #tabela-preencher(
    ([Alvo], [Por baixo], [Por cima], [Envolvimento]),
    (
      ([C\# (3ª de A7)], none, none, none),
      ([F\# (3ª de D7)], none, none, none),
      ([G\# (3ª de E7)], none, none, none),
      ([B (3ª de G7)], none, none, none),
    ),
    columns: (1.4fr, 1fr, 1fr, 1.4fr),
  )
]

#exercicio(titulo: "Blues em Mi", nivel: "Escrita")[
  Num blues em Mi (E7 – A7 – B7), use a pentatônica menor de Mi (E · G · A · B · D). Para cada acorde, escreva a 3ª e a b7 e diga se cada uma está ou não na escala.

  #tabela-preencher(
    ([Acorde], [3ª], [Está na pentatônica?], [b7], [Está na pentatônica?]),
    (
      ([E7], none, none, none, none),
      ([A7], none, none, none, none),
      ([B7], none, none, none, none),
    ),
    columns: (0.8fr, 0.7fr, 1.2fr, 0.7fr, 1.2fr),
  )
]

#exercicio(titulo: "Componha frases com alvo", nivel: "Tablatura")[
  *a)* Escreva dois compassos de colcheias sobre *G7 – C7M* que terminem na 3ª do C7M (E) no tempo 1, usando um envolvimento. #h(0.3em) *b)* Escreva dois compassos sobre *A7 – D7* (blues em Lá) que cheguem ao F\# no tempo 1 do D7. Use os compassos 1–2 para o item a e os compassos 3–4 para o item b.

  #tab-vazia(sistemas: 1, compassos: 4)
]

#exercicio(titulo: "Linhas de guide tones", nivel: "Prática")[
  Com metrônomo a 60 BPM (um acorde por compasso), toque as duas linhas de guide tones do II-V-I em C, F e Bb, primeiro em semibreves e depois em semínimas, repetindo a nota. Cante cada linha enquanto toca.
]

#exercicio(titulo: "A 3ª em cada troca do blues", nivel: "Prática")[
  Sobre uma base de blues em Lá (12 compassos, 80 BPM), improvise livremente com a pentatônica, mas toque obrigatoriamente a 3ª do acorde novo (C\#, F\# ou G\#) no tempo 1 de cada troca de acorde.
]

#exercicio(titulo: "Método em três etapas", nivel: "Prática")[
  Escolha uma base de II-V-I em Dó e passe cinco minutos em cada etapa da seção 7. Na etapa 3, grave dois chorus e verifique, ouvindo só a guitarra, se cada troca de acorde é perceptível.
]

#v(0.6em)

#block(breakable: false)[
  === Sugestão de prática (35 min)

  #rotina-estudo((
    ([Pares de guide tones do II-V-I (Exemplo 1) em C, F e Bb], [5 min], [60–80]),
    ([Aproximações e envolvimentos em alvos de 3ª (Exemplo 2)], [5 min], [60–80]),
    ([Exemplos 3, 4 e 5 até tocar de memória], [10 min], [70–100]),
    ([Etapa 1 e 2 do método sobre II-V-I], [10 min], [70–90]),
    ([Blues em Lá mirando a 3ª de cada acorde], [5 min], [80]),
  ))
]

#v(0.6em)

#block(breakable: false)[
  #checklist(titulo: "Autoavaliação", (
    [Sei explicar a diferença entre nota do acorde e nota de passagem.],
    [Coloco as notas do acorde nos tempos fortes de uma linha de colcheias.],
    [Encontro a 3ª e a 7ª de qualquer tétrade e conduzo 7ª → 3ª num II-V-I.],
    [Uso aproximação por baixo, por cima e envolvimento para chegar a um alvo.],
    [No blues, toco a 3ª de A7, D7 e E7 nas trocas de acorde.],
    [Ouvindo só o meu solo, dá para perceber onde os acordes mudam.],
  ))
]

#gabarito[
  #resposta(1)[
    Gm7: Bb / F · C7: E / Bb · F7M: A / E. Linhas: F → E → E e Bb → Bb → A. \
    Cm7: Eb / Bb · F7: A / Eb · Bb7M: D / A. Linhas: Bb → A → A e Eb → Eb → D. \
    Am7: C / G · D7: F\# / C · G7M: B / F\#. Linhas: G → F\# → F\# e C → C → B.
  ]
  #resposta(2)[
    a) Nos tempos: G, B, D, F — as quatro notas do G7; a linha descreve bem o acorde. b) Nos tempos: D, F, A, C — só o C pertence ao C7M, e o F (4ª, que choca com a 3ª) cai no tempo 3. Correção: começar a linha em B (B · A · G · F · E · D · C · B, como a linha B da seção 2), deixando B, G, E e C nos tempos; ou começar em E subindo (E · F · G · A · B · C · D · E), com E, G e B nos tempos 1, 2 e 3.
  ]
  #resposta(3)[
    #tabela(
      columns: (1.4fr, 1fr, 1fr, 1.4fr),
      ([Alvo], [Por baixo], [Por cima], [Envolvimento]),
      (
        ([C\#], [C], [D], [D → C → C\#]),
        ([F\#], [F], [G], [G → F → F\#]),
        ([G\#], [G], [A], [A → G → G\#]),
        ([B], [A\# (Bb)], [C], [C → A\# → B]),
      ),
    )
  ]
  #resposta(4)[
    E7: 3ª G\# (não está) · b7 D (está). A7: 3ª C\# (não está) · b7 G (está). B7: 3ª D\# (não está) · b7 A (está). Como no blues em Lá, a pentatônica menor contém as b7 de todos os acordes, mas nenhuma das 3ªs.
  ]
  #resposta(5)[
    Há várias respostas corretas. Critérios: todas as notas do acorde nos tempos (ou passagem justificada nos contratempos); a nota-alvo exatamente no tempo 1 do segundo compasso; as notas de aproximação imediatamente antes dela. Modelos: o compasso de G7 e o de C7M do Exemplo 3; e o Exemplo 4.
  ]
  #resposta(6)[
    Exercício prático — critério de sucesso: tocar e cantar as duas linhas (C → B → B e F → F → E em Dó; F → E → E e Bb → Bb → A em Fá; Bb → A → A e Eb → Eb → D em Si bemol) sem errar a troca.
  ]
  #resposta(7)[
    Exercício prático — critério de sucesso: em todas as trocas do chorus, a 3ª do acorde novo soa no tempo 1 (compassos 2, 3, 5, 7, 9, 10, 11 e 12 na forma com IV no compasso 2).
  ]
  #resposta(8)[
    Exercício prático — critério de sucesso: na gravação da etapa 3, um ouvinte consegue apontar as trocas de acorde ouvindo apenas a guitarra.
  ]
]
