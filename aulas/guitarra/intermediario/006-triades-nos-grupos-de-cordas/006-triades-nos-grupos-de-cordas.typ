#import "/templates/layout.typ": *
#import "/templates/components.typ": *
#import "@preview/conchord:0.4.0": new-chordgen

#show: aula.with(
  instrumento: "Guitarra",
  nivel: "Intermediário",
)

#let chord = new-chordgen(number-to-left: true, use-shadow-barre: false, colors: (hold: black, barre: black))
#show <chord>: set text(fill: color-strong, weight: "bold")

#show heading: set block(sticky: true)
#show table: set par(justify: false)

// ─── Helpers locais ──────────────────────────────────────────
// caixas nunca se dividem entre duas páginas
#let caixa-base = caixa
#let caixa(..args) = block(breakable: false, width: 100%, caixa-base(..args))
// exercícios também não se dividem (evita cabeçalho órfão no pé da página)
#let exercicio-base = exercicio
#let exercicio(..args) = block(breakable: false, width: 100%, exercicio-base(..args))

// mapa: braco-notas a partir de uma lista (corda, casa, rótulo).
// `raiz` documenta a tônica usada nos rótulos.
// `grupo` (ex.: (3, 2, 1)) limita o desenho às cordas do grupo.
#let mapa(raiz: none, fs: 1, casas: 5, largura: 24pt, grupo: (6, 5, 4, 3, 2, 1), notas) = {
  let cordas = grupo.sorted().rev()
  let dados = cordas.map(_ => range(casas).map(_ => ""))
  for n in notas {
    let (corda, casa, rotulo) = n
    dados.at(cordas.position(c => c == corda)).at(casa - fs) = rotulo
  }
  braco-notas(dados, fs: fs, casa-largura: largura, cordas: cordas.map(str))
}

// grade de diagramas: o nome do acorde sai do próprio conchord,
// com a posição (detalhe) logo abaixo
#let acordes(items, columns: 6, gutter: 0.9em) = align(center, grid(
  columns: columns,
  column-gutter: gutter,
  row-gutter: 1em,
  align: center,
  ..items.map(item => block(breakable: false)[
    #box(chord(item.tabs, name: item.titulo))
    #if "detalhe" in item [
      #v(-0.35em)
      #text(size: 8pt, fill: color-muted)[#item.detalhe]
    ]
  ]),
))

// bloco de um grupo de cordas: diagramas + mapa, sem quebrar
#let bloco-grupo(itens, mapa-c, legenda) = block(breakable: false, width: 100%)[
  #acordes(itens)
  #v(0.5em)
  #align(center, mapa-c)
  #v(0.2em)
  #align(center, text(size: 8.5pt, fill: color-muted, legenda))
]

= Tríades nos Grupos de Cordas

Ouça com atenção a guitarra base de uma música funk, pop ou soul: quase nunca ela toca acordes de seis cordas. O que aparece são pequenos desenhos de *três notas em cordas vizinhas*, que se encaixam entre o baixo, a bateria e o teclado sem embolar o som. Nesta aula você vai aprender esses desenhos — as *tríades fechadas* — em todos os grupos de cordas, com todas as inversões, e usá-los para tocar progressões com movimento mínimo da mão.

#objetivos((
  [Entender o que é uma tríade fechada e por que ela é tão usada em funk, pop e acompanhamento],
  [Reconhecer posição fundamental, 1ª inversão e 2ª inversão pela nota mais grave],
  [Tocar tríades maiores e menores nos quatro grupos de três cordas vizinhas],
  [Entender por que a corda Si altera os desenhos],
  [Conectar as inversões ao longo do braço e harmonizar progressões com condução de vozes mínima],
))

== 1. Por que tríades fechadas?

Uma *tríade fechada* é uma tríade cujas três notas cabem dentro de uma oitava, sem nenhuma nota repetida. Na guitarra, isso significa um desenho de três cordas vizinhas, em geral com três dedos ou menos. Comparadas aos acordes cheios com pestana, elas trazem vantagens claras:

#cartoes-info((
  (titulo: "Som limpo", corpo: [
    Três notas soam definidas, sem dobras. Num arranjo com baixo e teclado, a guitarra ocupa só a sua faixa de frequência e não "briga" com os outros instrumentos.
  ]),
  (titulo: "Mobilidade", corpo: [
    Desenhos pequenos mudam de lugar rápido. Cada acorde aparece em vários pontos do braço, e você escolhe o mais próximo do acorde anterior.
  ]),
  (titulo: "Condução de vozes", corpo: [
    Trocando de acorde, as notas andam por graus conjuntos ou ficam paradas. O acompanhamento ganha uma "melodia interna" suave.
  ]),
))

#v(0.6em)

Onde você vai usar: no *funk* (acordes curtos e percussivos nas cordas agudas), no *pop* e no *rock* (riffs com tríades, segunda guitarra que complementa a primeira), no *reggae* (contratempos secos), e no *comping* de jazz e MPB, onde as tríades servem de base para voicings mais ricos.

== 2. As três inversões

Uma tríade tem três notas; qualquer uma delas pode ficar no grave. O nome da inversão depende *apenas da nota mais grave*:

#tabela(
  columns: (1.4fr, 1fr, 1.4fr, 1fr, 1.6fr),
  ([Posição], [Nota no grave], [Ordem (grave → agudo)], [Cifra], [Em Dó maior]),
  (
    ([Fundamental], [Tônica], [T · 3 · 5], [C], [C · E · G]),
    ([1ª inversão], [3ª], [3 · 5 · T], [C/E], [E · G · C]),
    ([2ª inversão], [5ª], [5 · T · 3], [C/G], [G · C · E]),
  ),
)

#v(0.4em)

Para a tríade menor vale o mesmo, trocando a 3 pela b3: Cm (C · Eb · G), Cm/Eb (Eb · G · C) e Cm/G (G · C · Eb). Na cifra, a barra indica a nota do baixo: C/E se lê "Dó com baixo em Mi".

== 3. Os quatro grupos de cordas

Com seis cordas há *quatro grupos de três cordas vizinhas*. Os grupos são nomeados pelos números das cordas (1 = Mi agudo):

#tabela(
  columns: (0.9fr, 1.4fr, 1.2fr, 2.6fr),
  ([Grupo], [Cordas], [Região], [Uso típico]),
  (
    ([1-2-3], [Mi · Si · Sol], [Aguda], [Funk, pop, frases de segunda guitarra; soa brilhante e não disputa espaço com o baixo.]),
    ([2-3-4], [Si · Sol · Ré], [Média], [O grupo mais versátil para acompanhamento; corpo e clareza ao mesmo tempo.]),
    ([3-4-5], [Sol · Ré · Lá], [Média-grave], [Riffs de rock, acompanhamento mais encorpado, guitarra solo sem banda.]),
    ([4-5-6], [Ré · Lá · Mi], [Grave], [Uso pontual: soa "embolado" com distorção e invade a região do baixo.]),
  ),
)

#v(0.4em)

#caixa(tipo: "dica")[
  Comece pelos grupos *1-2-3* e *2-3-4*: são os mais usados em acompanhamento. Os grupos graves ficam para quando você estiver tocando sozinho ou quiser um som mais pesado.
]

#pagebreak()

== 4. As tríades em cada grupo

Em cada grupo, os seis diagramas mostram C maior e C menor nas três posições, na ordem em que aparecem *subindo o braço*. O mapa abaixo de cada grupo reúne as três formas de C maior no braço, com o intervalo dentro de cada nota. Abafe as cordas que não fazem parte do desenho com as pontas dos dedos que sobram e com a lateral da mão da palheta.

=== Grupo 1-2-3 (Mi · Si · Sol)

#bloco-grupo(
  (
    (tabs: "x,x,x,5,5,3", titulo: "C", detalhe: "fundamental", verif: "C-E-G"),
    (tabs: "x,x,x,9,8,8", titulo: "C/E", detalhe: "1ª inversão", verif: "E-G-C"),
    (tabs: "x,x,x,12,13,12", titulo: "C/G", detalhe: "2ª inversão", verif: "G-C-E"),
    (tabs: "x,x,x,5,4,3", titulo: "Cm", detalhe: "fundamental", verif: "C-Eb-G"),
    (tabs: "x,x,x,8,8,8", titulo: "Cm/Eb", detalhe: "1ª inversão", verif: "Eb-G-C"),
    (tabs: "x,x,x,12,13,11", titulo: "Cm/G", detalhe: "2ª inversão", verif: "G-C-Eb"),
  ),
  mapa(raiz: "C", fs: 2, casas: 14, grupo: (3, 2, 1), (
    (3, 5, "T"), (2, 5, "3"), (1, 3, "5"),
    (3, 9, "3"), (2, 8, "5"), (1, 8, "T"),
    (3, 12, "5"), (2, 13, "T"), (1, 12, "3"),
  )),
  [C maior no grupo 1-2-3: fundamental (casas 3–5), 1ª inversão (8–9) e 2ª inversão (12–13). A 2ª inversão também existe na região das cordas soltas: 0-1-0.],
)

=== Grupo 2-3-4 (Si · Sol · Ré)

#bloco-grupo(
  (
    (tabs: "x,x,5,5,5,x", titulo: "C/G", detalhe: "2ª inversão", verif: "G-C-E"),
    (tabs: "x,x,10,9,8,x", titulo: "C", detalhe: "fundamental", verif: "C-E-G"),
    (tabs: "x,x,14,12,13,x", titulo: "C/E", detalhe: "1ª inversão", verif: "E-G-C"),
    (tabs: "x,x,5,5,4,x", titulo: "Cm/G", detalhe: "2ª inversão", verif: "G-C-Eb"),
    (tabs: "x,x,10,8,8,x", titulo: "Cm", detalhe: "fundamental", verif: "C-Eb-G"),
    (tabs: "x,x,13,12,13,x", titulo: "Cm/Eb", detalhe: "1ª inversão", verif: "Eb-G-C"),
  ),
  mapa(raiz: "C", fs: 2, casas: 14, grupo: (4, 3, 2), (
    (4, 5, "5"), (3, 5, "T"), (2, 5, "3"),
    (4, 10, "T"), (3, 9, "3"), (2, 8, "5"),
    (4, 14, "3"), (3, 12, "5"), (2, 13, "T"),
  )),
  [C maior no grupo 2-3-4: 2ª inversão (casa 5), fundamental (8–10) e 1ª inversão (12–14). A 1ª inversão também existe uma oitava abaixo: 2-0-1, o "C aberto".],
)

=== Grupo 3-4-5 (Sol · Ré · Lá)

#bloco-grupo(
  (
    (tabs: "x,7,5,5,x,x", titulo: "C/E", detalhe: "1ª inversão", verif: "E-G-C"),
    (tabs: "x,10,10,9,x,x", titulo: "C/G", detalhe: "2ª inversão", verif: "G-C-E"),
    (tabs: "x,15,14,12,x,x", titulo: "C", detalhe: "fundamental", verif: "C-E-G"),
    (tabs: "x,6,5,5,x,x", titulo: "Cm/Eb", detalhe: "1ª inversão", verif: "Eb-G-C"),
    (tabs: "x,10,10,8,x,x", titulo: "Cm/G", detalhe: "2ª inversão", verif: "G-C-Eb"),
    (tabs: "x,15,13,12,x,x", titulo: "Cm", detalhe: "fundamental", verif: "C-Eb-G"),
  ),
  mapa(raiz: "C", fs: 2, casas: 14, grupo: (5, 4, 3), (
    (5, 7, "3"), (4, 5, "5"), (3, 5, "T"),
    (5, 10, "5"), (4, 10, "T"), (3, 9, "3"),
    (5, 15, "T"), (4, 14, "3"), (3, 12, "5"),
  )),
  [C maior no grupo 3-4-5: 1ª inversão (casas 5–7), 2ª inversão (9–10) e fundamental (12–15). A fundamental também existe uma oitava abaixo: 3-2-0, com a 3ª corda solta.],
)

=== Grupo 4-5-6 (Ré · Lá · Mi)

#bloco-grupo(
  (
    (tabs: "3,3,2,x,x,x", titulo: "C/G", detalhe: "2ª inversão", verif: "G-C-E"),
    (tabs: "8,7,5,x,x,x", titulo: "C", detalhe: "fundamental", verif: "C-E-G"),
    (tabs: "12,10,10,x,x,x", titulo: "C/E", detalhe: "1ª inversão", verif: "E-G-C"),
    (tabs: "3,3,1,x,x,x", titulo: "Cm/G", detalhe: "2ª inversão", verif: "G-C-Eb"),
    (tabs: "8,6,5,x,x,x", titulo: "Cm", detalhe: "fundamental", verif: "C-Eb-G"),
    (tabs: "11,10,10,x,x,x", titulo: "Cm/Eb", detalhe: "1ª inversão", verif: "Eb-G-C"),
  ),
  mapa(raiz: "C", fs: 2, casas: 14, grupo: (6, 5, 4), (
    (6, 3, "5"), (5, 3, "T"), (4, 2, "3"),
    (6, 8, "T"), (5, 7, "3"), (4, 5, "5"),
    (6, 12, "3"), (5, 10, "5"), (4, 10, "T"),
  )),
  [C maior no grupo 4-5-6: 2ª inversão (casas 2–3), fundamental (5–8) e 1ª inversão (10–12).],
)

#v(0.4em)

#caixa(tipo: "resumo")[
  Maior → menor: abaixe a *3ª* um semitom e mantenha as outras duas notas. Em todos os grupos, o desenho menor é o desenho maior com um único dedo recuado uma casa.
]

== 5. O efeito da corda Si

Se você comparar os grupos, vai notar que o *mesmo* acorde na *mesma* inversão muda de desenho conforme o grupo. O motivo é a afinação: entre cordas vizinhas o intervalo é sempre uma 4ª justa (5 semitons), *exceto entre a Sol e a Si*, que formam uma 3ª maior (4 semitons). Toda nota tocada na corda Si fica, portanto, *uma casa "adiantada"* em relação ao desenho dos grupos graves.

#tabela(
  columns: (1.3fr, 1fr, 1fr, 1fr, 1fr),
  ([C maior — casas (grave → agudo)], [4-5-6], [3-4-5], [2-3-4], [1-2-3]),
  (
    ([Fundamental (C)], [8-7-5], [15-14-12], [10-9-*8*], [5-*5*-*3*]),
    ([1ª inversão (C/E)], [12-10-10], [7-5-5], [14-12-*13*], [9-*8*-*8*]),
    ([2ª inversão (C/G)], [3-3-2], [10-10-9], [5-5-*5*], [12-*13*-*12*]),
  ),
)

#v(0.4em)

Leia a tabela pelos *desenhos* (a distância entre as casas), e não pelos números absolutos:

- *4-5-6 e 3-4-5* têm desenhos idênticos: nenhuma das duas inclui a corda Si.
- *2-3-4*: a nota mais aguda está na corda Si e sobe uma casa em relação ao desenho grave. A fundamental seria 10-9-7 se você copiasse o desenho 8-7-5; o correto é 10-9-8.
- *1-2-3*: duas notas estão depois da corda Sol (nas cordas Si e Mi), então *as duas* sobem uma casa.

#caixa(tipo: "atencao")[
  Não tente "copiar" um desenho de um grupo grave para um grupo que inclua a corda Si: o acorde sai errado. Sempre que o desenho atravessar a fronteira Sol–Si, as notas da Si para cima avançam uma casa.
]

== 6. Conectando as inversões subindo o braço

Em qualquer grupo, as inversões se sucedem sempre na mesma ordem quando você sobe o braço: *fundamental → 1ª inversão → 2ª inversão → fundamental (uma oitava acima)*. O mecanismo é sempre o mesmo: a nota mais grave salta uma oitava e vai para o topo, enquanto as outras duas continuam soando, só que uma corda abaixo. De C (C · E · G) para C/E (E · G · C), o Mi e o Sol permanecem — o Mi passa a ser o baixo — e o Dó reaparece em cima. Na prática:

#passos((
  [Toque a forma em que você está e identifique, na corda mais grave do grupo, qual nota do acorde ela tem (T, 3 ou 5).],
  [Suba nessa corda até a *próxima nota do acorde* (de T para 3, de 3 para 5, de 5 para T). Essa nota é o baixo da próxima inversão.],
  [Monte a nova forma a partir desse baixo, lembrando o desenho de cada inversão no grupo — e a correção da corda Si.],
))

#tab(
  titulo: "Exemplo 1 — Ciclo das inversões de C no grupo 1-2-3",
  legenda: [Toque cada acorde em semínimas, quatro vezes, e diga em voz alta o nome da posição. Depois faça o mesmo nos outros grupos.],
  "   C          C/E        C/G        C/E        C\ne|-3--------|-8--------|-12-------|-8--------|-3--------|\nB|-5--------|-8--------|-13-------|-8--------|-5--------|\nG|-5--------|-9--------|-12-------|-9--------|-5--------|",
)

#v(0.4em)

#caixa(tipo: "dica")[
  Você não precisa "pensar" em três notas ao mesmo tempo. Pense na *voz mais aguda*: ela percorre G → C → E → G (5 → T → 3 → 5) e transforma o ciclo numa pequena melodia. Muitos guitarristas memorizam as tríades assim, pela nota de cima.
]

== 7. Aplicação: progressões com condução de vozes

A regra de ouro da condução de vozes é simples: *notas comuns ficam paradas; as outras andam para a nota mais próxima do acorde seguinte*. Com tríades num único grupo de cordas, isso significa escolher, para cada acorde, a inversão que está *mais perto* da anterior — e não sempre a posição fundamental. Os algarismos romanos indicam o grau da escala sobre o qual o acorde é montado (em Dó maior: I = C, IV = F, V = G, VIm = Am).

=== I–IV–V–I em Dó maior (grupo 1-2-3)

#acordes(
  (
    (tabs: "x,x,x,5,5,3", titulo: "C", detalhe: "fundamental", verif: "C-E-G"),
    (tabs: "x,x,x,5,6,5", titulo: "F/C", detalhe: "2ª inversão", verif: "C-F-A"),
    (tabs: "x,x,x,4,3,3", titulo: "G/B", detalhe: "1ª inversão", verif: "B-D-G"),
    (tabs: "x,x,x,5,5,3", titulo: "C", detalhe: "fundamental", verif: "C-E-G"),
  ),
  columns: 4,
  gutter: 2.4em,
)

#v(0.4em)

#tabela(
  columns: (1.2fr, 1fr, 1fr, 1fr),
  ([Voz], [C → F/C], [F/C → G/B], [G/B → C]),
  (
    ([Aguda (1ª corda)], [G → A (sobe 1 tom)], [A → G (desce 1 tom)], [G → G (fica)]),
    ([Meio (2ª corda)], [E → F (sobe ½ tom)], [F → D (desce 1½ tom)], [D → E (sobe 1 tom)]),
    ([Grave (3ª corda)], [C → C (fica)], [C → B (desce ½ tom)], [B → C (sobe ½ tom)]),
  ),
)

#v(0.4em)

A mão praticamente não sai das casas 3 a 6. Compare com tocar tudo em posição fundamental no mesmo grupo — C (5-5-3), F (10-10-8), G (12-12-10): o som "pula" de região a cada troca e a linha interna desaparece.

#tab(
  titulo: "Exemplo 2 — I–IV–V–I com ritmo pop",
  tamanho: 7.8pt,
  legenda: [Toques em 1, 2, 2&, 3& e 4. Ataques curtos e secos: alivie a pressão da mão esquerda logo após cada toque.],
  "   C                         F/C                       G/B                       C\ne|-3-----3--3-----3--3-----|-5-----5--5-----5--5-----|-3-----3--3-----3--3-----|-3-----------------------|\nB|-5-----5--5-----5--5-----|-6-----6--6-----6--6-----|-3-----3--3-----3--3-----|-5-----------------------|\nG|-5-----5--5-----5--5-----|-5-----5--5-----5--5-----|-4-----4--4-----4--4-----|-5-----------------------|\n   1  &  2  &  3  &  4  &    1  &  2  &  3  &  4  &    1  &  2  &  3  &  4  &    1  &  2  &  3  &  4  &",
)

=== I–VIm–IV–V em Dó maior (grupo 1-2-3)

A mesma lógica funciona na progressão mais usada do pop. Repare como C → Am/C → F/C mantém o Dó no grave e move *uma única nota* por troca:

#acordes(
  (
    (tabs: "x,x,x,5,5,3", titulo: "C", detalhe: "C · E · G", verif: "C-E-G"),
    (tabs: "x,x,x,5,5,5", titulo: "Am/C", detalhe: "C · E · A", verif: "C-E-A"),
    (tabs: "x,x,x,5,6,5", titulo: "F/C", detalhe: "C · F · A", verif: "C-F-A"),
    (tabs: "x,x,x,4,3,3", titulo: "G/B", detalhe: "B · D · G", verif: "B-D-G"),
  ),
  columns: 4,
  gutter: 2.4em,
)

#v(0.4em)

#tab(
  titulo: "Exemplo 3 — I–VIm–IV–V com o mesmo ritmo",
  tamanho: 7.8pt,
  legenda: [C → Am/C: só G → A. Am/C → F/C: só E → F. F/C → G/B: C → B, F → D, A → G. G/B → C (repetição): B → C, D → E.],
  "   C                         Am/C                      F/C                       G/B\ne|-3-----3--3-----3--3-----|-5-----5--5-----5--5-----|-5-----5--5-----5--5-----|-3-----3--3-----3--3-----|\nB|-5-----5--5-----5--5-----|-5-----5--5-----5--5-----|-6-----6--6-----6--6-----|-3-----3--3-----3--3-----|\nG|-5-----5--5-----5--5-----|-5-----5--5-----5--5-----|-5-----5--5-----5--5-----|-4-----4--4-----4--4-----|\n   1  &  2  &  3  &  4  &    1  &  2  &  3  &  4  &    1  &  2  &  3  &  4  &    1  &  2  &  3  &  4  &",
)

#v(0.4em)

#comparativo(
  titulo-esquerda: "Com condução de vozes",
  titulo-direita: "Sem condução de vozes",
  [C (5-5-3) → Am/C (5-5-5) → F/C (5-6-5) → G/B (4-3-3). A mão fica entre as casas 3 e 6, as notas comuns sustentam a harmonia e a voz aguda forma a linha G → A → A → G.],
  [C (5-5-3) → Am (14-13-12) → F (10-10-8) → G (12-12-10). Todas em posição fundamental: saltos grandes a cada troca, risco de atraso e nenhuma linha interna — o acompanhamento soa "picado".],
)

=== Tríades no funk: um groove de dois acordes

No funk, a mão da palheta não para: ela sobe e desce em semicolcheias o tempo todo, e a mão esquerda decide quais golpes soam (acorde) e quais saem abafados (x), apenas aliviando a pressão sobre as cordas. Com tríades no grupo 1-2-3, um IIm–V de Dó (Dm – G/D) cabe em duas casas:

#tab(
  titulo: "Exemplo 4 — Groove funk com Dm e G/D (grupo 1-2-3)",
  tamanho: 8pt,
  legenda: [x = golpe abafado (mão esquerda apoiada sem pressionar). O Ré da 3ª corda fica parado nos dois acordes; só as duas vozes de cima se movem.],
  "   Dm                                G/D\n   ↓ ↑ ↓ ↑ ↓ ↑ ↓ ↑ ↓ ↑ ↓ ↑ ↓ ↑ ↓ ↑   ↓ ↑ ↓ ↑ ↓ ↑ ↓ ↑ ↓ ↑ ↓ ↑ ↓ ↑ ↓ ↑\ne|-5-x-x-5-x-x-5-x-5-x-x-5-x-x-5-x-|-7-x-x-7-x-x-7-x-7-x-x-7-x-x-7-x-|\nB|-6-x-x-6-x-x-6-x-6-x-x-6-x-x-6-x-|-8-x-x-8-x-x-8-x-8-x-x-8-x-x-8-x-|\nG|-7-x-x-7-x-x-7-x-7-x-x-7-x-x-7-x-|-7-x-x-7-x-x-7-x-7-x-x-7-x-x-7-x-|\n   1 e & a 2 e & a 3 e & a 4 e & a   1 e & a 2 e & a 3 e & a 4 e & a",
)

#v(0.4em)

#caixa(tipo: "dica")[
  Para harmonizar qualquer progressão num grupo: (1) escolha a forma do primeiro acorde na região em que quer ficar; (2) para cada acorde seguinte, procure no mesmo grupo a inversão cujas notas estejam a no máximo um tom das notas atuais; (3) toque a sequência e confira se a voz aguda forma uma linha melódica agradável.
]

#v(0.8em)

== 8. Exercícios

#exercicio(titulo: "Identifique o acorde e a inversão", nivel: "Leitura")[
  Escreva, abaixo de cada diagrama, a cifra (com baixo, quando houver) e a posição: fundamental, 1ª ou 2ª inversão.

  #v(0.3em)
  #let linha = box(width: 2.8cm, height: 2em, stroke: (bottom: 0.5pt + color-rule-light))
  #acordes(
    (
      (tabs: "x,x,x,7,8,7", titulo: "a)", detalhe: linha, verif: "D-G-B"),
      (tabs: "x,x,7,7,7,x", titulo: "b)", detalhe: linha, verif: "A-D-F#"),
      (tabs: "x,5,4,2,x,x", titulo: "c)", detalhe: linha, verif: "D-F#-A"),
      (tabs: "5,3,2,x,x,x", titulo: "d)", detalhe: linha, verif: "A-C-E"),
      (tabs: "x,x,x,2,1,1", titulo: "e)", detalhe: linha, verif: "A-C-F"),
      (tabs: "x,x,3,2,3,x", titulo: "f)", detalhe: linha, verif: "F-A-D"),
      (tabs: "x,x,x,9,10,8", titulo: "g)", detalhe: linha, verif: "E-A-C"),
      (tabs: "8,7,7,x,x,x", titulo: "h)", detalhe: linha, verif: "C-E-A"),
    ),
    columns: 4,
    gutter: 3em,
  )
]

#exercicio(titulo: "G maior em todos os grupos", nivel: "Escrita")[
  Escreva as casas (da corda mais grave para a mais aguda do grupo) de G maior em cada posição. Use a região entre as casas 1 e 15 e lembre-se da corda Si.

  #tabela-preencher(
    ([Grupo], [Fundamental (G)], [1ª inversão (G/B)], [2ª inversão (G/D)]),
    (
      ([1-2-3], none, none, none),
      ([2-3-4], none, none, none),
      ([3-4-5], none, none, none),
      ([4-5-6], none, none, none),
    ),
    columns: (0.8fr, 1.2fr, 1.2fr, 1.2fr),
  )
]

#exercicio(titulo: "Mapa de Am no grupo 2-3-4", nivel: "Braço")[
  Marque todas as formas de Lá menor (A · C · E) no grupo 2-3-4 entre as casas 1 e 15, com o intervalo em cada nota (T, b3, 5), e escreva abaixo de cada forma a sua posição.

  #v(0.3em)
  #align(center, braco-vazio(casas: 15, fs: 1, num-cordas: 3, cordas: ("4", "3", "2")))
]

#exercicio(titulo: "A corda Si", nivel: "Escrita")[
  No grupo 4-5-6, a tríade de C em posição fundamental é tocada nas casas 8-7-5. No grupo 2-3-4, a mesma tríade fica em 10-9-8. Explique por que o desenho não é o mesmo (qual seria o desenho "copiado" e por que ele soaria errado).

  #linhas-resposta(3)
]

#exercicio(titulo: "I–IV–V–I em Sol maior no grupo 2-3-4", nivel: "Tablatura")[
  Harmonize *G – C – D – G* usando somente o grupo 2-3-4, entre as casas 2 e 7, com o menor movimento possível entre os acordes. Escreva a cifra com baixo de cada forma (por exemplo, C/G) acima da tablatura.

  #tab-vazia(sistemas: 1, compassos: 4)
]

#exercicio(titulo: "I–VIm–IV–V em Ré maior no grupo 3-4-5", nivel: "Tablatura")[
  Harmonize *D – Bm – G – A* usando somente o grupo 3-4-5, entre as casas 2 e 5. Dica: a nota Ré pode ficar parada no grave durante os três primeiros acordes.

  #tab-vazia(sistemas: 1, compassos: 4)
]

#exercicio(titulo: "Desafio: I–V–VIm–IV em Lá maior", nivel: "Tablatura")[
  Harmonize *A – E – F\#m – D* no grupo 2-3-4, entre as casas 4 e 7. Mantenha paradas as notas comuns: o Mi na troca A → E, e o Lá e o Fá\# na troca F\#m → D. Indique a inversão de cada acorde.

  #tab-vazia(sistemas: 1, compassos: 4)
]

#exercicio(titulo: "Ciclo das inversões", nivel: "Prática")[
  Com metrônomo a 70 BPM, toque o ciclo do Exemplo 1 (fundamental → 1ª → 2ª → fundamental e volta) em C maior e em C menor, nos quatro grupos de cordas. Cada acorde dura um compasso de quatro semínimas. Repita em G e em A.
]

#exercicio(titulo: "Ritmo e abafamento", nivel: "Prática")[
  Toque os Exemplos 2 e 3 a 80 BPM, depois a 100 BPM. Grave-se e ouça: os ataques devem ser curtos, nenhuma corda fora do grupo pode soar e as trocas não podem atrasar o tempo 1.
]

#v(0.6em)

#block(breakable: false)[
  === Sugestão de prática (35 min)

  #rotina-estudo((
    ([Ciclo das inversões de C e Cm — grupos 1-2-3 e 2-3-4], [8 min], [60–80]),
    ([Ciclo das inversões de C e Cm — grupos 3-4-5 e 4-5-6], [7 min], [60–80]),
    ([Transposição: G e A maior/menor um grupo de cada vez], [5 min], [60–70]),
    ([I–IV–V–I e I–VIm–IV–V com ritmo pop (Exemplos 2 e 3)], [10 min], [80–100]),
    ([Exercícios 5 e 6: progressões em outros tons e grupos], [5 min], [70–90]),
  ))
]

#v(0.6em)

#block(breakable: false)[
  #checklist(titulo: "Autoavaliação", (
    [Sei explicar o que é uma tríade fechada e onde ela é usada.],
    [Reconheço a inversão de uma tríade pela nota mais grave.],
    [Toco C e Cm nas três posições nos quatro grupos de cordas.],
    [Sei explicar por que a corda Si muda o desenho das tríades.],
    [Conecto as inversões subindo e descendo o braço sem parar o metrônomo.],
    [Harmonizo I–IV–V–I e I–VIm–IV–V num único grupo, com movimento mínimo.],
    [Toco os acordes curtos, sem cordas soltas indesejadas soando.],
  ))
]

#gabarito[
  #resposta(1)[
    #grid(
      columns: (1fr, 1fr),
      row-gutter: 0.55em,
      [a) G/D — 2ª inversão (D · G · B)], [b) D/A — 2ª inversão (A · D · F\#)],
      [c) D — fundamental (D · F\# · A)], [d) Am — fundamental (A · C · E)],
      [e) F/A — 1ª inversão (A · C · F)], [f) Dm/F — 1ª inversão (F · A · D)],
      [g) Am/E — 2ª inversão (E · A · C)], [h) Am/C — 1ª inversão (C · E · A)],
    )
  ]
  #resposta(2)[
    #tabela(
      columns: (0.8fr, 1.2fr, 1.2fr, 1.2fr),
      ([Grupo], [Fundamental (G)], [1ª inversão (G/B)], [2ª inversão (G/D)]),
      (
        ([1-2-3], [12-12-10], [4-3-3], [7-8-7]),
        ([2-3-4], [5-4-3], [9-7-8], [12-12-12 (ou 0-0-0)]),
        ([3-4-5], [10-9-7], [14-12-12 (ou 2-0-0)], [5-5-4]),
        ([4-5-6], [3-2-0 ou 15-14-12], [7-5-5], [10-10-9]),
      ),
    )
  ]
  #resposta(3)[
    #align(center, mapa(raiz: "A", fs: 1, casas: 15, grupo: (4, 3, 2), (
      (4, 2, "5"), (3, 2, "T"), (2, 1, "b3"),
      (4, 7, "T"), (3, 5, "b3"), (2, 5, "5"),
      (4, 10, "b3"), (3, 9, "5"), (2, 10, "T"),
      (4, 14, "5"), (3, 14, "T"), (2, 13, "b3"),
    )))
    Am/E — 2ª inversão (2-2-1) · Am — fundamental (7-5-5) · Am/C — 1ª inversão (10-9-10) · Am/E — 2ª inversão uma oitava acima (14-14-13).
  ]
  #resposta(4)[
    O desenho "copiado" do grupo 4-5-6 seria 10-9-7, que no grupo 2-3-4 dá C · E · F\# — um acorde errado. Entre as cordas Sol e Si o intervalo é uma 3ª maior (4 semitons), e não uma 4ª justa (5 semitons) como entre as outras cordas; por isso a nota tocada na corda Si precisa avançar uma casa (7 → 8) para continuar sendo Sol.
  ]
  #resposta(5)[
    Casas da corda mais grave para a mais aguda: G (5-4-3) → C/G (5-5-5) → D/F\# (4-2-3) → G (5-4-3). O Sol do grave fica parado de G para C/G; a 3ª de cada acorde anda por semitom ou tom.
  ]
  #resposta(6)[
    D (5-4-2) → Bm/D (5-4-4) → G/D (5-5-4) → A/C\# (4-2-2). O Ré fica no grave nos três primeiros acordes; em cada troca, só uma ou duas vozes se movem.
  ]
  #resposta(7)[
    A (7-6-5, fundamental) → E/G\# (6-4-5, 1ª inversão) → F\#m/A (7-6-7, 1ª inversão) → D/A (7-7-7, 2ª inversão). O Mi fica parado de A para E/G\#; de E/G\# para F\#m/A as três vozes sobem por grau conjunto (G\# → A, B → C\#, E → F\#); de F\#m/A para D/A, Lá e Fá\# ficam e só o Dó\# sobe para Ré.
  ]
  #resposta(8)[
    Exercício prático — critério de sucesso: completar o ciclo de ida e volta nos quatro grupos sem errar a inversão nem parar o metrônomo, dizendo o nome de cada posição.
  ]
  #resposta(9)[
    Exercício prático — critério de sucesso: na gravação, todos os ataques caem no tempo, soam curtos e só as três cordas do grupo aparecem.
  ]
]
