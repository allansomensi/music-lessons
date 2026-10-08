#import "/templates/layout.typ": *
#import "/templates/components.typ": *
#import "/templates/components.typ": caixa as caixa-modelo
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

// Exercício que não se divide entre páginas (enunciado + área de resposta juntos)
#let ex(..args) = block(breakable: false, exercicio(..args))

// Grade de diagramas que não se divide entre páginas
#let acordes(..args) = block(breakable: false, grid-acordes(chord: chord, ..args))

#let legenda(body) = align(center, text(size: 8.5pt, fill: color-muted, body))

= Primeiros Acordes

Um *acorde* é a combinação de três ou mais notas tocadas ao mesmo tempo. Os acordes formam a base harmônica da música — o "chão" sobre o qual a melodia acontece. Os primeiros acordes que todo guitarrista aprende são os *acordes abertos*: tocados perto da cabeça da guitarra e com cordas soltas, eles soam cheios e já permitem tocar centenas de músicas. Neste material você vai aprender os oito acordes abertos essenciais, os erros mais comuns e como trocar de um acorde para outro sem parar a música.

#objetivos((
  [Montar os acordes abertos Am, Em, Dm, E, A, D, G e C com a digitação correta],
  [Saber quais cordas tocar (e quais evitar) em cada acorde],
  [Diagnosticar e corrigir notas abafadas, ruídos e desafinação],
  [Trocar de acorde usando dedos-âncora, dedos-guia e movimentos em bloco],
  [Tocar a progressão Em – C – G – D com ritmo constante],
))

== 1. Como ler os diagramas

Cada diagrama abaixo mostra o acorde como se você olhasse o braço de frente: a linha da esquerda é a 6ª corda (Mi grave), *○* é corda solta e *✕* é corda que não deve soar. Embaixo de cada diagrama está a digitação: "2: 4ª corda, casa 2" significa *dedo 2 (médio) na 4ª corda, 2ª casa*. Os dedos são numerados de 1 (indicador) a 4 (mínimo).

== 2. Os acordes essenciais

=== Acordes menores

#acordes(
  columns: 3,
  gutter: 3em,
  (
    (tabs: "x,0,2,2,1,0", nome: "Am", titulo: "Lá menor", detalhe: [1: 2ª corda, casa 1 \ 2: 4ª corda, casa 2 \ 3: 3ª corda, casa 2 \ Toque da 5ª à 1ª corda]),
    (tabs: "0,2,2,0,0,0", nome: "Em", titulo: "Mi menor", detalhe: [2: 5ª corda, casa 2 \ 3: 4ª corda, casa 2 \ Toque as 6 cordas]),
    (tabs: "x,x,0,2,3,1", nome: "Dm", titulo: "Ré menor", detalhe: [1: 1ª corda, casa 1 \ 2: 3ª corda, casa 2 \ 3: 2ª corda, casa 3 \ Toque da 4ª à 1ª corda]),
  ),
)

=== Acordes maiores

#acordes(
  columns: 5,
  gutter: 1.3em,
  (
    (tabs: "0,2,2,1,0,0", nome: "E", titulo: "Mi maior", detalhe: [1: 3ª corda, casa 1 \ 2: 5ª corda, casa 2 \ 3: 4ª corda, casa 2 \ Toque as 6 cordas]),
    (tabs: "x,0,2,2,2,0", nome: "A", titulo: "Lá maior", detalhe: [1: 4ª corda, casa 2 \ 2: 3ª corda, casa 2 \ 3: 2ª corda, casa 2 \ Toque da 5ª à 1ª]),
    (tabs: "x,x,0,2,3,2", nome: "D", titulo: "Ré maior", detalhe: [1: 3ª corda, casa 2 \ 2: 1ª corda, casa 2 \ 3: 2ª corda, casa 3 \ Toque da 4ª à 1ª]),
    (tabs: "3,2,0,0,0,3", nome: "G", titulo: "Sol maior", detalhe: [2: 5ª corda, casa 2 \ 3: 6ª corda, casa 3 \ 4: 1ª corda, casa 3 \ Toque as 6 cordas]),
    (tabs: "x,3,2,0,1,0", nome: "C", titulo: "Dó maior", detalhe: [1: 2ª corda, casa 1 \ 2: 4ª corda, casa 2 \ 3: 5ª corda, casa 3 \ Toque da 5ª à 1ª]),
  ),
)

#caixa(tipo: "resumo", titulo: "Maior × menor")[
  Compare *E* e *Em*: o desenho é o mesmo, só o dedo 1 (3ª corda, casa 1) sai. Compare *D* e *Dm*: só a nota da 1ª corda muda, da casa 2 para a casa 1. Essa nota que muda é a *terça* do acorde — é ela que define se o som é maior (mais alegre e aberto) ou menor (mais melancólico).
]

== 3. Erros comuns e como corrigir

#caixa(tipo: "dica")[
  As cordas da guitarra elétrica são mais finas e macias que as do violão. Aperte só o necessário: força demais "puxa" a corda para cima (um pequeno _bend_) e desafina o acorde. Pressione com a *ponta dos dedos*, logo atrás do traste.
]

#tabela(
  columns: (1.15fr, 1.3fr, 1.9fr),
  alinhamento: (left + horizon, left + horizon, left + horizon),
  ([Problema], [Causa provável], [Solução]),
  (
    ([Nota abafada ou sem som], [Dedo longe do traste, pressão insuficiente ou dedo "deitado" encostando na corda vizinha], [Aproxime o dedo do traste e curve-o, tocando com a ponta. Toque corda por corda para achar a nota com problema.]),
    ([Ruído de cordas que não deveriam soar], [Palhetada atingindo cordas fora do acorde], [Comece a palhetada na corda certa (veja a digitação) e encoste levemente um dedo livre nas cordas que não fazem parte do acorde.]),
    ([D ou Dm soando "embolado" no grave], [6ª e 5ª cordas soando junto], [Comece a palhetada na 4ª corda. Se precisar, encoste de leve o polegar na 6ª corda para abafá-la.]),
    ([Acorde desafinado], [Força demais: a corda é empurrada para o lado ou para baixo], [Relaxe a mão. Use só a força necessária para a nota soar limpa.]),
    ([Troca de acorde lenta], [Dedos movidos um de cada vez], [Pense no desenho do próximo acorde e mova os dedos *juntos*, como um bloco.]),
  ),
)

== 4. Trocando de acorde

As trocas são o maior desafio no início. Três recursos tornam qualquer troca mais rápida:

- *Dedo-âncora*: um dedo que está no mesmo lugar nos dois acordes. Ele não sai da corda.
- *Dedo-guia*: um dedo que continua na mesma corda e só desliza para outra casa. Mantenha-o encostado na corda durante o movimento.
- *Movimento em bloco*: quando os dedos mantêm o mesmo desenho e só mudam de corda, mova a mão inteira de uma vez.

#align(center, block(breakable: false, grid(
  columns: (auto, auto, auto, 1fr),
  column-gutter: 1.6em,
  align: horizon,
  box(chord("x,3,2,0,1,0", name: "C")),
  text(size: 20pt, fill: color-strong)[→],
  box(chord("x,0,2,2,1,0", name: "Am")),
  [
    #set text(size: 10pt)
    #set align(left)
    *Exemplo: C → Am.* Os dedos 1 (2ª corda, casa 1) e 2 (4ª corda, casa 2) são *âncoras*: ficam exatamente onde estão. Só o dedo 3 se move, da 5ª corda (casa 3) para a 3ª corda (casa 2).
  ],
)))

#tabela(
  columns: (0.75fr, 2.6fr, 0.75fr),
  alinhamento: (center + horizon, left + horizon, center + horizon),
  ([Troca], [Como fazer], [Nível]),
  (
    ([C → Am], [Dedos 1 e 2 são âncoras; só o dedo 3 muda de corda.], [Fácil]),
    ([E → Am], [Movimento em bloco: o desenho inteiro (dedos 1, 2 e 3) desce uma corda.], [Fácil]),
    ([Em → Am], [Dedos 2 e 3 descem juntos uma corda; o dedo 1 entra na 2ª corda, casa 1.], [Fácil]),
    ([G → C], [Dedos 3 e 2 descem juntos uma corda (6ª → 5ª e 5ª → 4ª); o dedo 4 sai e o dedo 1 entra na 2ª corda.], [Média]),
    ([A → D], [O dedo 3 é guia: desliza na 2ª corda da casa 2 para a casa 3; os dedos 1 e 2 sobem uma corda cada.], [Média]),
    ([D → G], [Troca completa de desenho. Leve primeiro o dedo 3 à 6ª corda (casa 3) e encaixe os outros em seguida.], [Difícil]),
  ),
)

== 5. Progressão Em – C – G – D

Hora de tocar música. A sequência *Em – C – G – D* é uma das mais usadas no pop e no rock — é a base, por exemplo, de "Zombie", do The Cranberries.

#acordes(
  columns: 4,
  gutter: 2.5em,
  (
    (tabs: "0,2,2,0,0,0", nome: "Em", titulo: "Mi menor", detalhe: "4 palhetadas ↓"),
    (tabs: "x,3,2,0,1,0", nome: "C", titulo: "Dó maior", detalhe: "4 palhetadas ↓"),
    (tabs: "3,2,0,0,0,3", nome: "G", titulo: "Sol maior", detalhe: "4 palhetadas ↓"),
    (tabs: "x,x,0,2,3,2", nome: "D", titulo: "Ré maior", detalhe: "4 palhetadas ↓"),
  ),
)

#caixa(tipo: "neutro", titulo: "Como praticar")[
  Ligue o metrônomo em 60 BPM e toque *4 palhetadas para baixo* em cada acorde, uma por clique. A troca mais difícil é *G → D*: comece a mover os dedos no 4º tempo do G para chegar ao D no tempo 1. O mais importante é *não parar a mão direita* — se o acorde ainda não estiver pronto, continue palhetando as cordas soltas e encaixe os dedos no caminho.
]

#caixa(tipo: "dica", titulo: "Técnica de memorização")[
  Monte o acorde corretamente. Tire a mão do braço da guitarra, abra e feche a mão algumas vezes e desvie o olhar. Volte e monte o acorde de novo, de uma vez só. Esse "reset" obriga o cérebro a recriar o desenho do zero e acelera a memória muscular.

  #align(center, image("attachments/tecnica-memorizacao.svg", width: 82%))
]

== 6. Exercícios

#ex(titulo: "Qual é o acorde?")[
  Cada acorde está escrito em forma de texto, da 6ª corda para a 1ª (x = corda abafada, 0 = solta). Escreva a cifra.

  #tabela-preencher(
    columns: (1.6fr, 1fr, 1.6fr, 1fr),
    ([Casas (6ª → 1ª)], [Acorde], [Casas (6ª → 1ª)], [Acorde]),
    (
      ([x 0 2 2 1 0], none, [3 2 0 0 0 3], none),
      ([x x 0 2 3 2], none, [0 2 2 1 0 0], none),
      ([x 3 2 0 1 0], none, [x 0 2 2 2 0], none),
    ),
  )
]

#ex(titulo: "Escreva de memória")[
  Sem olhar os diagramas, escreva a casa de cada corda (x = não toca, 0 = solta).

  #tabela-preencher(
    columns: (1.1fr,) + (1fr,) * 6,
    ([Acorde], [6ª], [5ª], [4ª], [3ª], [2ª], [1ª]),
    (
      ([Em], none, none, none, none, none, none),
      ([Dm], none, none, none, none, none, none),
      ([A], none, none, none, none, none, none),
      ([C], none, none, none, none, none, none),
    ),
  )
]

#ex(titulo: "Maior e menor")[
  a) O que você muda na mão para transformar *E* em *Em*?

  #linhas-resposta(1)

  b) E para transformar *D* em *Dm*?

  #linhas-resposta(1)
]

#ex(titulo: "Onde começar a palhetada")[
  Escreva a corda em que a palhetada deve começar em cada acorde.

  #tabela-preencher(
    columns: (1.2fr,) + (1fr,) * 8,
    ([Acorde], [Am], [Em], [Dm], [E], [A], [D], [G], [C]),
    (([Corda], none, none, none, none, none, none, none, none),),
  )
]

#ex(titulo: "Planeje as trocas")[
  Para cada troca, diga qual recurso ajuda (dedo-âncora, dedo-guia ou movimento em bloco) e quais dedos ele envolve.

  a) C → Am #linhas-resposta(1)

  b) E → Am #linhas-resposta(1)

  c) A → D #linhas-resposta(1)
]

#ex(titulo: "Progressão com metrônomo", nivel: "Prática")[
  Toque Em – C – G – D quatro vezes seguidas a 60 BPM, com 4 palhetadas por acorde, sem parar a mão direita. Quando conseguir, faça com 2 palhetadas por acorde (a troca fica duas vezes mais rápida). Anote o andamento máximo em que todas as notas soam limpas:

  #linhas-resposta(1)
]

=== Sugestão de prática

#block(breakable: false, rotina-estudo((
  ([Montar cada acorde e tocar corda por corda, conferindo se todas soam], [5 min], [—]),
  ([Técnica de memorização (montar, soltar, remontar) nos acordes mais difíceis], [3 min], [—]),
  ([Trocas fáceis em loop: C ↔ Am, E ↔ Am, Em ↔ Am], [5 min], [60]),
  ([Trocas médias e difíceis: G ↔ C, A ↔ D, D ↔ G], [5 min], [50–60]),
  ([Progressão Em – C – G – D, 4 palhetadas por acorde], [5 min], [60–80]),
)))

#block(breakable: false, checklist(
  titulo: "Autoavaliação",
  (
    [Monto os oito acordes sem olhar o diagrama e todas as notas soam limpas.],
    [Sei em que corda começar a palhetada em cada acorde.],
    [Uso dedos-âncora, dedos-guia e movimentos em bloco nas trocas.],
    [Toco Em – C – G – D a 60 BPM sem parar a mão direita.],
  ),
))

#gabarito[
  #resposta(1)[x 0 2 2 1 0 = Am · 3 2 0 0 0 3 = G · x x 0 2 3 2 = D · 0 2 2 1 0 0 = E · x 3 2 0 1 0 = C · x 0 2 2 2 0 = A.]
  #resposta(2)[Em: 0 2 2 0 0 0 · Dm: x x 0 2 3 1 · A: x 0 2 2 2 0 · C: x 3 2 0 1 0.]
  #resposta(3)[a) Basta tirar o dedo 1 da 3ª corda (casa 1): a corda passa a soar solta. b) A nota da 1ª corda desce da casa 2 para a casa 1 (os outros dedos se reorganizam: no Dm, dedo 1 na 1ª corda casa 1, dedo 2 na 3ª corda casa 2 e dedo 3 na 2ª corda casa 3).]
  #resposta(4)[Am: 5ª · Em: 6ª · Dm: 4ª · E: 6ª · A: 5ª · D: 4ª · G: 6ª · C: 5ª.]
  #resposta(5)[a) Dedos-âncora: 1 e 2 ficam; só o 3 muda. b) Movimento em bloco: dedos 1, 2 e 3 descem uma corda juntos. c) Dedo-guia: o dedo 3 desliza na 2ª corda da casa 2 para a casa 3.]
  #resposta(6)[Exercício prático — critério de sucesso: quatro voltas seguidas sem parar a palhetada, com cada acorde soando limpo já no tempo 1.]
]
