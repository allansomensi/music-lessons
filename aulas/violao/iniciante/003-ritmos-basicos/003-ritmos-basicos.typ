#import "/templates/layout.typ": *
#import "/templates/components.typ": *

#show: aula.with(
  instrumento: "Violão",
  nivel: "Iniciante",
)

// Exercício que não se divide entre páginas (enunciado + área de resposta juntos)
#let ex(..args) = block(breakable: false, above: 1.5em, below: 0.9em, exercicio(..args))

// ============================================================
// HELPERS LOCAIS — grade de batidas
// ============================================================
// Símbolos: "D" = para baixo (↓) · "U" = para cima (↑)
//           "X" = abafado (✕) · "." = a mão passa sem tocar (·)
//           "" = célula vazia (para o aluno preencher)
#let simbolo(s) = {
  let (fundo, rotulo, cor) = if s == "D" {
    (color-subtle-bg-alt, "↓", color-strong)
  } else if s == "U" {
    (white, "↑", color-strong)
  } else if s == "X" {
    (luma(200), "✕", color-strong)
  } else if s == "." {
    (white, "·", color-muted)
  } else {
    (white, "", color-strong)
  }
  box(
    width: 26pt,
    height: 26pt,
    fill: fundo,
    radius: 3pt,
    stroke: 0.6pt + color-rule-dark,
    align(center + horizon, text(fill: cor, size: 13pt, weight: "bold", rotulo)),
  )
}

#let contagem-colcheias = ("1", "e", "2", "e", "3", "e", "4", "e")

// Grade com a contagem em cima e os símbolos embaixo. Os tempos (1 2 3 4)
// ficam em negrito; os contratempos ("e"), em cinza.
#let batida(padrao, contagem: contagem-colcheias) = align(center, grid(
  columns: padrao.len(),
  column-gutter: 4pt,
  row-gutter: 4pt,
  align: center + horizon,
  ..contagem.map(c => text(
    size: 9pt,
    weight: if c == "e" { "regular" } else { "bold" },
    fill: if c == "e" { color-muted } else { color-strong },
    c,
  )),
  ..padrao.map(simbolo),
))

= Ritmos e Batidas

No violão, a mão direita é a responsável pelo *ritmo* — o que mais define o estilo e a "cara" de uma música. A mesma sequência de acordes pode soar como pop, rock ou reggae dependendo apenas da batida. Neste material você vai aprender a contar o tempo, a manter o movimento da mão direita e a tocar as batidas mais usadas.

#objetivos((
  [Entender tempo, compasso 4/4 e a contagem "1 e 2 e 3 e 4 e".],
  [Usar o movimento de pêndulo da mão direita: para baixo nos tempos, para cima nos contratempos.],
  [Ler e tocar cinco batidas essenciais, incluindo o abafado e o reggae.],
  [Trocar de acorde sem interromper o ritmo.],
))

== 1. Tempo, compasso e contagem

O *tempo* (ou pulsação) é a batida regular que você sente ao bater o pé numa música. A velocidade do tempo é medida em *BPM* (batidas por minuto) — o número que você ajusta no metrônomo.

Os tempos se agrupam em *compassos*. O compasso mais comum é o *4/4*: quatro tempos por compasso, contados *1, 2, 3, 4*. Cada tempo pode ser dividido em duas metades: a primeira é o próprio *tempo* (1, 2, 3, 4) e a segunda, o *contratempo*, que contamos como *"e"*.

#tabela(
  ([*Figura*], [*Nome*], [*Duração no 4/4*], [*Quantas cabem num compasso*], [*Contagem*]),
  (
    ([#nota("seminima")], [Semínima], [1 tempo], [4], [*1* – *2* – *3* – *4*]),
    ([#grupo-notas(2)], [Colcheias], [½ tempo cada], [8], [*1* e *2* e *3* e *4* e]),
  ),
  columns: (0.8fr, 1fr, 1.1fr, 1.4fr, 1.6fr),
)

== 2. O movimento da mão direita

Pense na mão direita como um *pêndulo* que nunca para: ela *desce* em cada tempo (1, 2, 3, 4) e *sobe* em cada contratempo ("e"). Para criar batidas diferentes, você não muda esse movimento — apenas decide *em quais momentos a mão toca as cordas* e em quais ela passa sem tocar.

#block(breakable: false, cartoes-info((
  (titulo: [↓ Para baixo], corpo: [A mão (ou a palheta) passa pelas cordas da 6ª para a 1ª corda, do grave para o agudo. Acontece nos *tempos*.]),
  (titulo: [↑ Para cima], corpo: [A mão passa da 1ª em direção à 6ª corda. Não é preciso pegar todas: as cordas agudas bastam. Acontece nos *contratempos*.]),
  (titulo: [✕ Abafado], corpo: [A mão desce e encosta a lateral (ou a palma) nas cordas, cortando o som. Gera um "tchá" percussivo.]),
)))

Nas grades deste material, cada quadrado é meio tempo. O ponto (·) indica que a mão *faz o movimento sem tocar* as cordas.

#caixa(tipo: "atencao", titulo: "Regra de ouro")[
  *A mão direita nunca para.* Mesmo quando não toca as cordas, ela continua subindo e descendo no tempo. Se a troca de acorde atrasar, mantenha o ritmo — é melhor um acorde incompleto do que uma batida fora do tempo.
]

== 3. Batidas essenciais

#block(breakable: false)[
=== Batida 1 — Tempos para baixo

Uma batida para baixo em cada tempo. É a base para sentir a pulsação e treinar trocas de acorde.

#batida(("D", ".", "D", ".", "D", ".", "D", "."))
]

#block(breakable: false)[
=== Batida 2 — Colcheias alternadas

Para baixo nos tempos, para cima nos contratempos, sem parar. É o pêndulo completo; toque as batidas para cima um pouco mais leves.

#batida(("D", "U", "D", "U", "D", "U", "D", "U"))
]

#block(breakable: false)[
=== Batida 3 — Pop

A batida mais usada no pop e no rock acústico. Repare que no *1 e* e no *3* a mão passa sem tocar — mas não para.

#batida(("D", ".", "D", "U", ".", "U", "D", "U"))
]

#block(breakable: false)[
=== Batida 4 — Com abafado

Igual às colcheias alternadas, mas com um abafado (✕) nos tempos 2 e 4, onde normalmente soa a caixa da bateria. Muito usada no pop, no funk e no samba-rock.

#batida(("D", "U", "X", "U", "D", "U", "X", "U"))
]

#block(breakable: false)[
=== Batida 5 — Reggae

No reggae, o acorde soa *só nos contratempos*, com um golpe curto e seco. Logo depois de tocar, alivie a pressão da mão esquerda (sem tirar os dedos das cordas) para cortar o som. É a exceção ao pêndulo: o golpe no contratempo é *para baixo*; nos tempos, a mão apenas sobe sem tocar.

#batida((".", "D", ".", "D", ".", "D", ".", "D"))
]

== 4. Como praticar

#passos((
  [*Sem o violão:* faça o movimento da batida no ar, contando em voz alta "1 e 2 e 3 e 4 e".],
  [*Com um acorde só* (por exemplo, Em): toque a batida com o metrônomo a 60 BPM até ela ficar automática.],
  [*Com dois acordes* (por exemplo, Em e C): troque de acorde a cada compasso, sem parar a mão direita.],
  [*Aumente a velocidade* aos poucos, de 5 em 5 BPM, só quando a troca estiver saindo limpa e no tempo.],
))

#caixa(tipo: "dica")[
  O erro mais comum é *olhar para a mão direita* durante a troca. Treine antes a troca de acorde sem batida, até os dedos da mão esquerda acharem o caminho sozinhos. Escolha uma batida de cada vez e use-a em músicas que você já conhece antes de passar para a próxima.
]

== 5. Exercícios

#ex(titulo: "Tempo ou contratempo?", nivel: "Escrita")[
  Observe a *Batida 3 (Pop)*. Responda:

  a) Quantas vezes a mão toca as cordas em cada compasso? \
  b) Em quais contagens a mão toca *para cima*? \
  c) Em quais contagens a mão passa *sem tocar*?

  #linhas-resposta(3)
]

#ex(titulo: "O pêndulo", nivel: "Escrita")[
  Escreva, em cada quadrado, a direção do movimento da mão direita (↓ ou ↑) — mesmo nos momentos em que ela não toca as cordas.

  #v(0.3em)
  #batida(("", "", "", "", "", "", "", ""))
]

#ex(titulo: "Encontre o erro", nivel: "Escrita")[
  Uma destas batidas *quebra o pêndulo* (tem uma batida na direção errada para a contagem). Qual é ela, e em qual contagem está o erro?

  #v(0.3em)
  #grid(
    columns: (auto, 1fr),
    column-gutter: 1em,
    row-gutter: 0.8em,
    align: (left + horizon, center + horizon),
    [*a)*], batida(("D", "U", "D", ".", "D", "U", "D", "U")),
    [*b)*], batida(("D", ".", "U", "U", "D", ".", "D", "U")),
    [*c)*], batida(("D", "U", "X", "U", ".", "U", "X", "U")),
  )
  #linhas-resposta(1)
]

#ex(titulo: "Figuras e compasso", nivel: "Escrita")[
  a) Num compasso 4/4, quantas semínimas cabem? E quantas colcheias? \
  b) Se o metrônomo está a 60 BPM, quanto tempo dura cada tempo? E cada colcheia? \
  c) Qual é a diferença entre tempo e contratempo?

  #linhas-resposta(3)
]

#ex(titulo: "Crie a sua batida", nivel: "Criação + prática")[
  Crie uma batida usando ↓, ↑, ✕ e ·, respeitando o pêndulo (↓ só nos tempos e ↑ só nos contratempos). Depois, toque-a com a sequência *Em – C – G – D*, um acorde por compasso, a 60 BPM.

  #v(0.3em)
  #batida(("", "", "", "", "", "", "", ""))
]

#ex(titulo: "Troca sem parar", nivel: "Prática")[
  Toque a *Batida 3* com a sequência *Em – C – G – D* (um acorde por compasso) durante 2 minutos seguidos, a 60 BPM. Marque o resultado:

  #v(0.3em)
  #checklist((
    [Não parei a mão direita nenhuma vez.],
    [Todas as trocas caíram no tempo 1 do compasso.],
    [Consegui tocar sem olhar para a mão direita.],
  ))
]

=== Sugestão de prática

#block(breakable: false, rotina-estudo((
  ([Contar "1 e 2 e 3 e 4 e" com o metrônomo, batendo o pé nos tempos], [2 min], [60]),
  ([Batidas 1 e 2 com um acorde só (Em)], [3 min], [60–80]),
  ([Batida 3 (Pop) com Em – C, um acorde por compasso], [5 min], [60–80]),
  ([Batida 4 (abafado) com Am – G], [3 min], [60–80]),
  ([Batida 5 (reggae) com Am – D], [3 min], [60–70]),
)))

#v(0.6em)

#checklist(
  (
    [Conto "1 e 2 e 3 e 4 e" mantendo o tempo com o metrônomo.],
    [Mantenho o pêndulo da mão direita mesmo quando não toco as cordas.],
    [Toco as batidas 1 a 4 sem parar e sem olhar para a mão direita.],
    [Faço o abafado com som percussivo, sem notas soando.],
    [Troco de acorde no tempo 1 sem interromper a batida.],
  ),
  titulo: "Autoavaliação",
)

#gabarito[
  #resposta(1)[a) Seis vezes. · b) No "e" do 2, no "e" do 3 e no "e" do 4. · c) No "e" do 1 e no tempo 3.]
  #resposta(2)[↓ ↑ ↓ ↑ ↓ ↑ ↓ ↑ — para baixo em todos os tempos (1, 2, 3, 4) e para cima em todos os contratempos.]
  #resposta(3)[A batida *b*: no tempo 2 aparece uma batida para cima (↑), mas nos tempos a mão está descendo. O certo seria ↓ (ou · se a mão não tocar).]
  #resposta(4)[
    a) 4 semínimas ou 8 colcheias. \
    b) Cada tempo dura 1 segundo; cada colcheia, meio segundo. \
    c) O tempo é o início de cada pulsação (1, 2, 3, 4); o contratempo é a metade entre dois tempos (o "e").
  ]
  #resposta(5)[Resposta pessoal. Confira se todos os ↓ estão nas colunas 1, 2, 3, 4 e todos os ↑ nas colunas "e". O ✕ (abafado) é um movimento para baixo, então também deve ficar nos tempos.]
  #resposta(6)[Exercício prático — critério de sucesso: as três caixas marcadas.]
]
