#import "/templates/layout.typ": *
#import "/templates/components.typ": *
#import "@preview/conchord:0.4.0": new-chordgen

#show: aula.with(
  instrumento: "Violão",
  nivel: "Iniciante",
)

#let chord = new-chordgen(number-to-left: true, use-shadow-barre: false, colors: (hold: black, barre: black))
#show <chord>: set text(fill: color-strong, weight: "bold")

// Exercício que não se divide entre páginas (enunciado + área de resposta juntos)
#let ex(..args) = block(breakable: false, above: 1.5em, below: 0.9em, exercicio(..args))

= Dedilhado

No *dedilhado*, os dedos da mão direita tocam as cordas individualmente, cada um responsável por cordas específicas. O resultado é um som mais suave e melódico do que o da batida, essencial na bossa nova, na MPB, no folk e na música erudita. Neste material você vai aprender a notação dos dedos, a postura da mão direita e os padrões de dedilhado mais usados.

#objetivos((
  [Conhecer a notação p-i-m-a e qual dedo toca cada corda.],
  [Posicionar a mão direita de forma relaxada e eficiente.],
  [Ler e tocar três padrões de dedilhado em tablatura.],
  [Tocar o desenho rítmico básico da bossa nova.],
))

== 1. A notação p-i-m-a

Os dedos da mão direita são indicados pelas iniciais dos seus nomes em espanhol, uma convenção usada no mundo todo:

#tabela(
  ([*Letra*], [*Dedo*], [*Em espanhol*], [*Cordas que toca*]),
  (
    ([*p*], [Polegar], [_pulgar_], [6ª, 5ª e 4ª (graves) — toca o *baixo*]),
    ([*i*], [Indicador], [_índice_], [3ª]),
    ([*m*], [Médio], [_medio_], [2ª]),
    ([*a*], [Anelar], [_anular_], [1ª]),
  ),
  columns: (0.6fr, 0.9fr, 1.1fr, 2.2fr),
  alinhamento: (center + horizon, center + horizon, center + horizon, left + horizon),
  width: 92%,
)

O polegar toca *para baixo*, em direção ao chão, nas cordas graves. Os dedos i, m e a puxam as cordas *para cima*, em direção à palma da mão. O dedo mínimo normalmente não é usado.

== 2. A postura da mão direita

#block(breakable: false, comparativo(
  titulo-esquerda: "Faça assim",
  titulo-direita: "Evite",
  [
    - *Mão arredondada:* uma curva natural, como se segurasse uma bola pequena; o pulso fica levemente afastado do tampo.
    - *Dedos curvados:* depois de tocar, o dedo segue para *dentro da mão*, num movimento de "pinça".
    - *Polegar à frente dos dedos*, para que um não esbarre no outro.
  ],
  [
    - *Pulso apoiado no tampo:* limita o movimento e cansa rápido.
    - *Dedos esticados* puxando a corda para fora, o que gera um som estalado.
    - *Mão tensa.* Apoiar levemente o dedo mínimo no tampo é aceitável, mas não faça força nele.
  ],
))

#caixa(tipo: "dica", titulo: "Sobre as unhas")[
  Violonistas clássicos costumam manter as unhas da mão direita um pouco compridas, para um som mais brilhante e controlado. Não é obrigatório, mas muda o timbre. Se usar unhas, lixe-as em curva suave para que não "enganchem" na corda.
]

== 3. Padrões de dedilhado

Toque cada padrão com um único acorde até ficar fluido; depois troque de acorde mantendo o padrão. Nas tabs abaixo, a linha de cima é a 1ª corda (Mi agudo) e a de baixo, a 6ª (Mi grave); a última linha indica o dedo que toca cada nota. Cada nota dura meio tempo (colcheia): conte "1 e 2 e 3 e 4 e".

#grid-acordes(
  chord: chord,
  columns: 4,
  gutter: 2em,
  (
    (tabs: "x,0,2,2,1,0", nome: " ", titulo: "Am"),
    (tabs: "0,2,2,0,0,0", nome: " ", titulo: "Em"),
    (tabs: "3,2,0,0,0,3", nome: " ", titulo: "G"),
    (tabs: "x,3,2,0,1,0", nome: " ", titulo: "C"),
  ),
)

#block(breakable: false)[
=== Padrão 1 — Arpejo p-i-m-a

As notas do acorde soam uma de cada vez, do grave para o agudo. O polegar alterna entre a tônica (5ª corda) e a 4ª corda.

#tab("e|----------0-----------0--|\nB|-------1-----------1-----|\nG|----2-----------2--------|\nD|-------------2-----------|\nA|-0-----------------------|\nE|-------------------------|\n   p  i  m  a  p  i  m  a", titulo: "Am")
]

#block(breakable: false)[
=== Padrão 2 — Baixo e pinça (p + ima)

O polegar toca o baixo; em seguida, i, m e a tocam *juntos* as três cordas agudas, como uma pinça. Muito usado em canções de MPB e folk. Repare que o baixo muda com o acorde: 5ª corda no Am e 6ª corda no Em.

#tab("   Am               Em\ne|-----0-------0---|-----0-------0---|\nB|-----1-------1---|-----0-------0---|\nG|-----2-------2---|-----0-------0---|\nD|-----------------|-----------------|\nA|-0-------0-------|-----------------|\nE|-----------------|-0-------0-------|\n   p   ima p   ima   p   ima p   ima")
]

#block(breakable: false)[
=== Padrão 3 — Baixo alternado (p-i-p-m-p-a-p-m)

O polegar alterna entre duas cordas graves (6ª e 4ª no G) em todos os tempos, enquanto os dedos tocam nos contratempos. O efeito lembra um baixo "caminhando" e é a base do estilo conhecido como _Travis picking_.

#tab("e|----------------3--------|\nB|----------0-----------0--|\nG|----0--------------------|\nD|-------0-----------0-----|\nA|-------------------------|\nE|-3-----------3-----------|\n   p  i  p  m  p  a  p  m", titulo: "G")
]

#caixa(tipo: "atencao", titulo: "O polegar comanda")[
  Em todos os padrões, o polegar marca o tempo e os outros dedos se encaixam entre os baixos. Se o padrão desandar, volte a tocar só os baixos no tempo e acrescente os dedos aos poucos.
]

== 4. Introdução à bossa nova

A batida da bossa nova, consagrada por *João Gilberto* no fim dos anos 1950, divide o trabalho entre os dedos da mão direita:

- O *polegar* marca *todos os tempos*, regular como o surdo do samba, alternando entre duas cordas graves.
- Os dedos *i-m-a*, juntos (em pinça), tocam um desenho *sincopado* — fora dos tempos — que se repete a cada *dois compassos*.

#align(center, block(breakable: false, width: 100%, {
  let cont = ("1", "e", "2", "e", "3", "e", "4", "e")
  let pol = ("p", "", "p", "", "p", "", "p", "")
  let ded1 = ("ima", "", "", "ima", "", "", "ima", "")
  let ded2 = ("", "", "ima", "", "", "ima", "", "")
  let hdr = ([*Compasso*],) + cont.map(c => text(weight: if c == "e" { "regular" } else { "bold" }, fill: if c == "e" { color-muted } else { color-strong }, c))
  tabela(
    hdr,
    (
      ([*1* — polegar],) + pol.map(x => [#x]),
      ([*1* — dedos],) + ded1.map(x => if x == "" { [] } else { [*#x*] }),
      ([*2* — polegar],) + pol.map(x => [#x]),
      ([*2* — dedos],) + ded2.map(x => if x == "" { [] } else { [*#x*] }),
    ),
    columns: (1.6fr,) + (1fr,) * 8,
    zebra: false,
  )
}))

No *compasso 1*, os dedos tocam no 1 (junto com o polegar), no "e" do 2 e no 4. No *compasso 2*, no 2 (junto com o polegar) e no "e" do 3. Comece devagar, a 50 BPM, com um acorde só (por exemplo, Am, alternando o polegar entre a 5ª e a 4ª cordas).

#caixa(tipo: "dica", titulo: "Para ouvir")[
  Escute as gravações de João Gilberto, como "Chega de Saudade" (Tom Jobim e Vinicius de Moraes), prestando atenção só no violão: o polegar regular e os acordes "escapando" do tempo.
]

== 5. Exercícios

#ex(titulo: "Qual dedo?", nivel: "Escrita")[
  Escreva a letra do dedo da mão direita (p, i, m ou a) que toca cada corda no dedilhado básico.

  #v(0.3em)
  #tabela-preencher(
    ([*Corda*], [*6ª*], [*5ª*], [*4ª*], [*3ª*], [*2ª*], [*1ª*]),
    (([Dedo], none, none, none, none, none, none),),
    columns: (1.2fr,) + (1fr,) * 6,
  )
]

#ex(titulo: "Postura", nivel: "Escrita")[
  a) Para onde vai o dedo i depois de tocar a 3ª corda? \
  b) Por que não se deve apoiar o pulso no tampo? \
  c) Na bossa nova, quem marca todos os tempos: o polegar ou os dedos?

  #linhas-resposta(3)
]

#ex(titulo: "Lendo uma tab de dedilhado", nivel: "Escrita")[
  Observe a tab abaixo.

  #tab("e|----------2-----------2--|\nB|-------3-----------3-----|\nG|----2-----------2--------|\nD|-0-----------0-----------|\nA|-------------------------|\nE|-------------------------|")

  a) Qual acorde está sendo dedilhado? \
  b) Escreva o dedo (p, i, m, a) de cada uma das oito notas, na ordem. \
  c) Qual padrão da seção 3 ela segue?

  #linhas-resposta(3)
]

#ex(titulo: "Escreva o padrão", nivel: "Escrita + prática")[
  Escreva na tab o *Padrão 1 (p-i-m-a)* com o acorde *C* (Dó maior): polegar na 5ª corda (casa 3) e depois na 4ª corda (casa 2); i, m e a nas cordas 3, 2 e 1. Depois, toque-o.

  #tab-vazia(sistemas: 1, compassos: 1, altura-linha: 10pt)
]

#ex(titulo: "Troca de acordes no dedilhado", nivel: "Prática")[
  Toque o *Padrão 2* com a sequência *Am – Em – G – C*, um acorde por compasso, a 60 BPM. Lembre-se de mudar o baixo: 5ª corda em Am e C, 6ª corda em Em e G. Marque o que conseguiu:

  #v(0.3em)
  #checklist((
    [O polegar tocou a corda certa em todos os acordes.],
    [As três cordas da pinça soaram juntas e com o mesmo volume.],
    [Toquei quatro voltas seguidas sem parar.],
  ))
]

=== Sugestão de prática

#block(breakable: false, rotina-estudo((
  ([Polegar sozinho: baixos alternados nos tempos (Am, depois G)], [3 min], [60]),
  ([Padrão 1 (p-i-m-a) em Am e C], [4 min], [50–70]),
  ([Padrão 2 (p + ima) com Am – Em – G – C], [5 min], [50–70]),
  ([Padrão 3 (baixo alternado) em G], [4 min], [50–60]),
  ([Bossa nova: polegar sozinho, depois com os dedos (Am)], [4 min], [50]),
)))

#v(0.6em)

#checklist(
  (
    [Sei qual dedo (p, i, m, a) toca cada corda.],
    [Toco com a mão relaxada, o pulso afastado do tampo e os dedos curvados.],
    [Leio uma tab de dedilhado e identifico o dedo de cada nota.],
    [Toco os três padrões trocando de acorde sem parar.],
    [Toco o desenho da bossa nova com o polegar regular nos tempos.],
  ),
  titulo: "Autoavaliação",
)

#gabarito[
  #resposta(1)[6ª, 5ª e 4ª: *p* · 3ª: *i* · 2ª: *m* · 1ª: *a*.]
  #resposta(2)[a) Para dentro da mão, em direção à palma (movimento de pinça). · b) Porque limita o movimento dos dedos e cansa a mão. · c) O polegar; os dedos fazem o desenho sincopado.]
  #resposta(3)[a) D (Ré maior). · b) p – i – m – a – p – i – m – a (o polegar toca a 4ª corda solta, a tônica do D). · c) O Padrão 1 (arpejo p-i-m-a).]
  #resposta(4)[
    #tab("e|----------0-----------0--|\nB|-------1-----------1-----|\nG|----0-----------0--------|\nD|-------------2-----------|\nA|-3-----------------------|\nE|-------------------------|\n   p  i  m  a  p  i  m  a", titulo: "C")
  ]
  #resposta(5)[Exercício prático — critério de sucesso: as três caixas marcadas.]
]
