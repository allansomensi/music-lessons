#import "/templates/layout.typ": *
#import "/templates/components.typ": *

#show: aula.with(
  instrumento: "Guitarra",
  nivel: "Intermediário",
)

// Texto das tabelas em 10pt
#show table: set text(size: 10pt)

// Tabelas e exercícios não se dividem entre páginas
#show table: it => block(breakable: false, it)
#let ex(..args) = block(breakable: false, width: 100%, exercicio(..args))

// Legenda padrão das tablaturas desta aula
#let leg-palhetada = [D = palhetada para baixo (↓) · U = palhetada para cima (↑)]

= Técnicas de Palhetada

Velocidade, clareza e timbre na guitarra dependem muito mais da mão da palheta do que se costuma imaginar. Duas pessoas podem tocar exatamente as mesmas notas com resultados completamente diferentes só porque organizam os movimentos da palheta de outro jeito. Nesta aula você vai revisar a palhetada alternada, entender as trocas de corda (_outside_ e _inside_), aprender a palhetada *econômica*, a palhetada *híbrida* e dar os primeiros passos no *sweep picking* — sempre com um método de estudo que aumenta a velocidade sem criar tensão ou lesões.

#objetivos((
  [Tocar palhetada alternada estável em notas isoladas e em trocas de corda],
  [Diferenciar trocas de corda _outside_ e _inside_ e treinar as duas],
  [Aplicar a regra da palhetada econômica em escalas de três notas por corda],
  [Usar a palhetada híbrida (palheta + dedos médio e anelar) em padrões de country e funk],
  [Executar um arpejo de sweep em 3 e em 5 cordas com abafamento correto, seguindo um plano de BPM],
))

== 1. Revisão: palhetada alternada

Na palhetada alternada a palheta *sempre alterna* entre para baixo (D, ↓) e para cima (U, ↑), independentemente da corda. Assim o movimento da mão acompanha a subdivisão: em colcheias, o D cai no tempo e o U no contratempo ("e"); em semicolcheias, o D cai no tempo e no contratempo, e o U nas semicolcheias entre eles. É o sistema mais previsível e o ponto de partida para todos os outros.

#tab(
  titulo: "Exemplo 1 — Cromático 1-2-3-4 (dedo por casa, casas 5 a 8)",
  legenda: leg-palhetada,
  "e|--------------|--------------|--------------|--------------|\nB|--------------|--------------|--------------|--------------|\nG|--------------|--------------|--------------|--5--6--7--8--|\nD|--------------|--------------|--5--6--7--8--|--------------|\nA|--------------|--5--6--7--8--|--------------|--------------|\nE|--5--6--7--8--|--------------|--------------|--------------|\n    D  U  D  U     D  U  D  U     D  U  D  U     D  U  D  U",
)


#cartoes-info((
  (titulo: "Pegada", corpo: [Entre o polegar e a lateral do indicador, com 2–3 mm de ponta para fora. Firme, mas sem apertar.]),
  (titulo: "Movimento", corpo: [Do *pulso* (e um pouco do antebraço), não do cotovelo. Curto: a palheta mal sai da corda.]),
  (titulo: "Apoio", corpo: [A lateral da mão encosta de leve nas cordas graves para abafar. Não "ancore" o mindinho com força.]),
))


#tab(
  titulo: "Exemplo 2 — Pentatônica de Lá menor, posição 1 (duas notas por corda)",
  legenda: leg-palhetada,
  "e|--------------|--------------|--------5--8--|\nB|--------------|--------------|--5--8--------|\nG|--------------|--------5--7--|--------------|\nD|--------------|--5--7--------|--------------|\nA|--------5--7--|--------------|--------------|\nE|--5--8--------|--------------|--------------|\n    D  U  D  U     D  U  D  U     D  U  D  U",
)


Repare que no exemplo 2 toda troca de corda acontece depois de um U: a palheta sobe na corda de cima e desce na corda de baixo. Esse tipo de troca se chama _inside_ — e é o assunto da próxima seção.

== 2. Trocas de corda: _outside_ × _inside_

Quando você alterna duas cordas vizinhas, a palheta pode atacá-las de *fora* do par ou de *dentro* do espaço entre elas. Em toda esta seção, "corda de cima" é a mais grave (mais perto do seu rosto) e "corda de baixo" é a mais aguda.

#cartoes-info((
  (titulo: "Outside picking", corpo: [*D na corda de cima e U na corda de baixo.* Os dois ataques vêm de fora do par: a palheta "contorna" as duas cordas. Para a maioria das pessoas é a troca mais confortável.]),
  (titulo: "Inside picking", corpo: [*U na corda de cima e D na corda de baixo.* Os dois ataques partem do espaço entre as cordas: a palheta fica "presa" entre elas. Exige um movimento mais preciso e costuma ser o ponto fraco.]),
))


#tab(
  titulo: "Exemplo 3 — As duas trocas nas cordas Sol e Si (toque cada linha de palhetada separadamente)",
  legenda: [Out = outside (D na 3ª, U na 2ª) · In = inside (U na 3ª, D na 2ª)],
  "e|--------------|--------------|\nB|-----5-----5--|-----5-----5--|\nG|--5-----5-----|--5-----5-----|\nD|--------------|--------------|\nA|--------------|--------------|\nE|--------------|--------------|\nOut D  U  D  U     D  U  D  U\nIn  U  D  U  D     U  D  U  D",
)


#caixa(tipo: "dica")[
  Descubra qual das duas é a sua troca "fraca": toque o exemplo 3 nas duas versões a 80 BPM em semicolcheias. A versão que soa mais irregular (ou que faz a palheta enroscar) é a que precisa de mais horas. Um bom guitarrista domina as duas, porque a música não escolhe a troca por você.
]

== 3. Palhetada econômica (_economy picking_)

A palhetada econômica mistura a alternada com pequenos "arrastes" na troca de corda. A regra é uma só:

#caixa(tipo: "resumo", titulo: "Regra da econômica")[
  *Ao trocar de corda, se a palheta já está se movendo na direção da nova corda, continue na mesma direção.* Subindo para uma corda mais aguda depois de um D, a próxima nota também é D. Descendo para uma corda mais grave depois de um U, a próxima nota também é U. Dentro de uma mesma corda, alterne normalmente.
]


Com escalas de *três notas por corda*, a diferença fica evidente. Compare a alternada (Alt) com a econômica (Eco) na escala de Sol maior:

#tab(
  titulo: "Exemplo 4 — Sol maior, três notas por corda (subida)",
  legenda: [Alt = alternada estrita · Eco = econômica (D – D na troca de corda)],
  "e|-----------|-----------|-----------|\nB|-----------|-----------|-----------|\nG|-----------|-----------|-----------|\nD|-----------|-----------|--4--5--7--|\nA|-----------|--3--5--7--|-----------|\nE|--3--5--7--|-----------|-----------|\nAlt D  U  D     U  D  U     D  U  D\nEco D  U  D     D  U  D     D  U  D",
)


#tab(
  titulo: "Exemplo 5 — A mesma escala na descida (econômica)",
  legenda: [Na descida a palheta "arrasta" para cima: U – U em cada troca de corda.],
  "e|-----------|-----------|-----------|\nB|-----------|-----------|-----------|\nG|-----------|-----------|-----------|\nD|--7--5--4--|-----------|-----------|\nA|-----------|--7--5--3--|-----------|\nE|-----------|-----------|--7--5--3--|\nEco U  D  U     U  D  U     U  D  U",
)


Na alternada, metade das trocas de corda é _inside_; na econômica, a palheta atravessa duas cordas num único gesto, como se fosse uma única nota mais longa. O resultado é menos movimento e mais velocidade em linhas que percorrem várias cordas.

#caixa(tipo: "atencao")[
  O "arraste" da econômica *não* é um strum: são duas notas separadas, cada uma no seu lugar rítmico. O erro mais comum é apressar a segunda nota da troca. Toque sempre com metrônomo e escute se as semicolcheias continuam iguais. Com número *par* de notas por corda (começando em D), a econômica coincide com a alternada na subida; nesse caso, simplesmente alterne.
]

== 4. Palhetada híbrida

Na palhetada híbrida a palheta continua entre polegar e indicador, enquanto os dedos *médio (m)* e *anelar (a)* ficam livres para puxar as cordas mais agudas. Você ganha a precisão da palheta nas cordas graves e a capacidade de tocar cordas não vizinhas ao mesmo tempo, como num dedilhado.

#passos((
  [*Posicione os dedos* m e a curvados, apontando para as cordas 3 e 2 (ou 2 e 1). Eles puxam a corda para cima, em direção à palma, sem "arrancar".],
  [*Divida o trabalho*: a palheta toca as cordas graves (baixos e notas da melodia na região grave); m e a tocam as agudas.],
  [*Comece lento*: o desafio é o ataque da palheta e dos dedos soar com o mesmo volume.],
))


#tab(
  titulo: "Exemplo 6 — Arpejos com salto de corda: Am – C – G – Em",
  legenda: [D = palheta para baixo · m = dedo médio (3ª corda) · a = dedo anelar (2ª corda)],
  "e|--------------|--------------|--------------|--------------|\nB|--------1-----|--------1-----|--------0-----|--------0-----|\nG|-----2-----2--|-----0-----0--|-----0-----0--|-----0-----0--|\nD|--------------|--------------|--------------|--------------|\nA|--0-----------|--3-----------|--------------|--------------|\nE|--------------|--------------|--3-----------|--0-----------|\n    D  m  a  m     D  m  a  m     D  m  a  m     D  m  a  m",
)


#tab(
  titulo: "Exemplo 7 — Country “boom-chick” (C e G): baixo alternado com a palheta, acorde com os dedos",
  legenda: [ma = médio e anelar juntos (3ª e 2ª cordas), puxando ao mesmo tempo.],
  "e|------------------|------------------|------------------|------------------|\nB|------1-------1---|------0-------0---|------1-------1---|------0-------0---|\nG|------0-------0---|------0-------0---|------0-------0---|------0-------0---|\nD|----------2-------|----------0-------|----------2-------|----------0-------|\nA|--3---------------|------------------|--3---------------|------------------|\nE|------------------|--3---------------|------------------|--3---------------|\n    D   ma  D   ma     D   ma  D   ma     D   ma  D   ma     D   ma  D   ma",
)


#tab(
  titulo: "Exemplo 8 — Funk em Em7: palheta nos graves e notas mortas, dedos “estalando” a díade",
  legenda: [x = nota abafada (mão esquerda encostada, sem pressionar) · ma: a palheta faz o D "no ar", sem tocar.],
  "e|----------------------------------|----------------------------------|\nB|----------8---------------8-------|----------8---------------8-------|\nG|----------7---------------7-------|----------7---------------7-------|\nD|----------------------------------|----------------------------------|\nA|--7---x-------x---7---x-------x---|--7---x-------x---7---x-------x---|\nE|----------------------------------|----------------------------------|\n    D   U   ma  U   D   U   ma  U      D   U   ma  U   D   U   ma  U",
)


No country, a híbrida é a base do _chicken picking_: os dedos puxam a corda com força e soltam, produzindo um estalo percussivo. No funk e no soul, a mesma ideia permite tocar a díade aguda com um "pop" curto enquanto a palheta mantém as semicolcheias da mão direita nas cordas graves.

== 5. Introdução ao _sweep picking_

No _sweep_ (varredura), um arpejo com *uma nota por corda* é tocado com um único movimento contínuo da palheta: todas as notas da subida em D, todas as da descida em U. É a aplicação extrema da regra da econômica.

#cartoes-info((
  (titulo: "Uma nota por vez", corpo: [Não é um rasgueado. A mão esquerda deixa soar *só* a nota atual: levante cada dedo logo depois de tocar a sua nota.]),
  (titulo: "Abafamento", corpo: [A palma da mão direita encosta nas cordas que já foram tocadas (na subida); a mão esquerda abafa as que não estão em uso.]),
  (titulo: "Ritmo primeiro", corpo: [Cada nota precisa cair no seu lugar. Estude em tercinas ou semicolcheias, sempre com metrônomo, antes de pensar em velocidade.]),
))


#tab(
  titulo: "Exemplo 9 — Lá menor (A C E) em 3 cordas",
  legenda: [h = hammer-on · p = pull-off (notas sem palhetada) · dedos sugeridos: 14 anelar, 13 médio, 12 indicador, 17 mindinho],
  "e|----------12--h17-p12---------|----------12--h17-p12---------|\nB|------13--------------13------|------13--------------13------|\nG|--14----------------------14--|--14----------------------14--|\nD|------------------------------|------------------------------|\nA|------------------------------|------------------------------|\nE|------------------------------|------------------------------|\n    D   D   D           U   U      D   D   D           U   U",
)


#tab(
  titulo: "Exemplo 10 — Lá menor em 5 cordas (formato de Am com tônica na 5ª corda)",
  legenda: [As casas 14 da 4ª e da 3ª corda são feitas pelo mesmo dedo "rolando": a ponta toca uma corda e a outra fica abafada.],
  "e|------------------12--h17-p12-----------------|\nB|--------------13--------------13--------------|\nG|----------14----------------------14----------|\nD|------14------------------------------14------|\nA|--12--------------------------------------12--|\nE|----------------------------------------------|\n    D   D   D   D   D           U   U   U   U",
)


#caixa(tipo: "dica")[
  Primeiro faça o movimento devagar, *sem som na mão esquerda* (só abafando todas as cordas): você deve ouvir os "cliques" da palheta igualmente espaçados. Depois junte a mão esquerda. Se duas notas soarem juntas como num acorde, o problema é o abafamento, não a palheta.
]

== 6. Método: metrônomo, BPM, gravação e saúde

Velocidade é consequência de *precisão repetida*. O método abaixo funciona para todos os exemplos desta aula.

#tabela(
  columns: (0.8fr, 2.2fr, 2.2fr),
  alinhamento: (center + horizon, left + horizon, left + horizon),
  ([*Etapa*], [*O que fazer*], [*Critério para avançar*]),
  (
    ([1\. Lento], [Encontre o BPM em que você toca *sem nenhum erro*, relaxado], [3 repetições perfeitas seguidas]),
    ([2\. Subir], [Aumente de 4 em 4 BPM (ou 5 em 5)], [3 repetições limpas no novo BPM; caso contrário, fique nele]),
    ([3\. Teste], [Uma vez por sessão, tente +10 a +15 BPM acima], [Só para sentir o movimento; não conta como recorde]),
    ([4\. Volta], [Termine 8–10 BPM abaixo do seu limite do dia], [O cérebro fixa o movimento limpo e relaxado]),
  ),
)


#cartoes-info((
  (titulo: "Gravação para autoavaliação", corpo: [Grave 30 segundos de cada exercício no celular, com o metrônomo audível. Ao ouvir, verifique: as notas caem *em cima* do clique? O volume do D e do U é igual? Há cordas soltas soando onde não deveriam? Guarde as gravações e compare as mais recentes com as mais antigas.]),
  (titulo: "Prevenção de tensão e lesões", corpo: [Aqueça 3–5 minutos antes de acelerar. Faça uma pausa de 5 minutos a cada 25 de estudo. Ombros baixos, pulso reto, respiração solta. *Dor, formigamento ou queimação não são "parte do treino"*: pare e descanse; se persistir, procure um profissional de saúde.]),
))


#tabela(
  columns: (1.3fr, 1fr, 1fr, 1fr),
  ([*Subdivisão*], [*Notas por tempo*], [*Ex.: a 80 BPM*], [*Notas por segundo*]),
  (
    ([Colcheias], [2], [160 por minuto], [≈ 2,7]),
    ([Tercinas], [3], [240 por minuto], [4]),
    ([Semicolcheias], [4], [320 por minuto], [≈ 5,3]),
  ),
)

#align(center, text(size: 8.5pt, fill: color-muted)[Mudar a subdivisão é outra forma de progredir: 80 BPM em semicolcheias é bem mais rápido que 120 BPM em colcheias.])

== 7. Exercícios

#ex(titulo: "Escreva a palhetada econômica", nivel: "Médio")[
  Escreva D ou U sob cada nota usando a regra da palhetada econômica (comece com D). Em seguida, escreva a versão em alternada estrita na linha abaixo da tablatura.

  #tab(
    "e|----------------------|--------------|\nB|----------------------|--5---6---8---|\nG|--------------5---7---|--------------|\nD|--5---7---9-----------|--------------|\nA|----------------------|--------------|\nE|----------------------|--------------|\n    __  __  __  __  __     __  __  __",
  )
  Alternada estrita:
  #linhas-resposta(1)
]

#ex(titulo: "Outside ou inside?", nivel: "Fácil")[
  Classifique cada troca de corda (duas notas, a primeira na corda indicada).

  #tabela-preencher(
    columns: (0.35fr, 2.6fr, 1.2fr),
    ([], [*Troca*], [*Outside / inside*]),
    (
      ([a)], [3ª corda com D → 2ª corda com U], none),
      ([b)], [3ª corda com U → 2ª corda com D], none),
      ([c)], [2ª corda com D → 3ª corda com U], none),
      ([d)], [5ª corda com D → 4ª corda com U], none),
      ([e)], [1ª corda com U → 2ª corda com D], none),
    ),
    altura: 0.68cm,
  )
]

#ex(titulo: "Alternada com metrônomo", nivel: "Prática")[
  Toque os exemplos 1, 2 e 3 em semicolcheias seguindo o método da seção 6. Anote o BPM em que começou, o BPM limpo que já alcançou e a próxima meta.

  #tabela-preencher(
    columns: (1.6fr,) + (1fr,) * 3,
    ([*Exemplo*], [*BPM inicial*], [*BPM limpo*], [*Próxima meta*]),
    (
      ([1 — Cromático], none, none, none),
      ([2 — Pentatônica], none, none, none),
      ([3 — Outside], none, none, none),
      ([3 — Inside], none, none, none),
    ),
    altura: 0.68cm,
  )
]

#ex(titulo: "Econômica × alternada", nivel: "Prática")[
  Toque o exemplo 4 subindo e o exemplo 5 descendo, sem parar (18 notas), primeiro com palhetada alternada e depois com a econômica, em tercinas a 60 BPM. Suba 4 BPM por vez até 90 BPM. Grave as duas versões no mesmo BPM e responda: qual soa mais regular? Em qual a mão direita se cansa menos?

  #linhas-resposta(2)
]

#ex(titulo: "Híbrida", nivel: "Prática")[
  Toque os exemplos 6, 7 e 8, quatro vezes cada, a 70 BPM (colcheias nos exemplos 6 e 7, semicolcheias no 8). Objetivo: o ataque dos dedos m e a com o mesmo volume da palheta. Depois aplique o padrão do exemplo 7 a uma progressão que você já toca (por exemplo, G – C – D – G) e anote qual foi:
  #linhas-resposta(1)
]

#ex(titulo: "Primeiro sweep", nivel: "Prática")[
  Estude o exemplo 9 e depois o 10 em tercinas, começando em 50 BPM. Antes de subir o BPM, grave e confira se nenhuma nota soa junto com a anterior. Meta: exemplo 9 a 80 BPM e exemplo 10 a 60 BPM, limpos. Anote o BPM limpo que você já alcançou em cada um:
  #linhas-resposta(1)
]

#ex(titulo: "Registro de gravação", nivel: "Autoavaliação")[
  A cada sessão de estudo, grave um exercício e preencha uma linha do registro. Seja específico nos problemas (ex.: "U mais fraco na 2ª corda", "6ª corda soando no sweep").

  #tabela-preencher(
    columns: (1.4fr, 0.8fr, 2.4fr, 0.9fr),
    ([*Exercício*], [*BPM limpo*], [*Problemas percebidos*], [*Novo BPM*]),
    (
      (none, none, none, none),
      (none, none, none, none),
      (none, none, none, none),
      (none, none, none, none),
      (none, none, none, none),
    ),
    altura: 0.75cm,
  )
]

=== Sugestão de prática

#rotina-estudo((
  ([Aquecimento: cromático 1-2-3-4 (exemplo 1), relaxado, mãos soltas], [4 min], [60–70]),
  ([Alternada: pentatônica (exemplo 2) em semicolcheias, método de BPM], [5 min], [70–100]),
  ([Trocas de corda: exemplo 3, versões outside e inside alternadas], [5 min], [70–90]),
  ([Econômica: exemplos 4 + 5 sem parar, em tercinas], [6 min], [60–90]),
  ([Híbrida: exemplos 6 e 7 (colcheias), 8 (semicolcheias)], [6 min], [60–80]),
  ([Sweep: exemplo 9; depois o 10, primeiro sem som e depois com som], [6 min], [50–80]),
  ([Pausa (alongamento leve de mãos e antebraços)], [3 min], [—]),
  ([Gravação de um exercício + registro (Exercício 7)], [5 min], [—]),
))


#checklist(titulo: "Autoavaliação", (
  [Toco a pentatônica em alternada estrita, em semicolcheias, sem acelerar nem atrasar.],
  [Sei qual é a minha troca de corda mais fraca (outside ou inside) e já a estudo à parte.],
  [Aplico a regra da econômica em escalas de três notas por corda, na subida e na descida.],
  [Os dedos m e a soam com o mesmo volume da palheta na palhetada híbrida.],
  [No sweep, cada nota soa sozinha: nenhuma nota "embola" com a anterior.],
  [Estudo sem dor, com pausas, e acompanho meu progresso por gravações.],
))

#gabarito[
  #resposta(1)[
    #set text(size: 9pt)
    Econômica: D U D | D U | D U D. A troca 4ª → 3ª corda começa com D (a palheta já descia); a troca 3ª → 2ª corda começa com D normalmente, pois a última nota da 3ª corda foi U (não há "arraste" possível). \
    Alternada estrita: D U D U D U D U.
    #tab("e|----------------------|--------------|\nB|----------------------|--5---6---8---|\nG|--------------5---7---|--------------|\nD|--5---7---9-----------|--------------|\nA|----------------------|--------------|\nE|----------------------|--------------|\n    D   U   D   D   U      D   U   D")
  ]
  #resposta(2)[
    Regra: a "corda de cima" do par é a mais grave. D nela (e U na de baixo) = outside; U nela (e D na de baixo) = inside. \
    a) Outside. b) Inside. c) Inside (a 3ª, corda de cima, recebe U). d) Outside (a 5ª, corda de cima, recebe D). e) Outside (a 2ª, corda de cima, recebe D; a 1ª recebe U).
  ]
  #resposta(3)[
    Exercício prático — critério de sucesso: os quatro exercícios sobem de BPM ao longo das sessões com três repetições limpas por etapa, e a diferença entre outside e inside diminui.
  ]
  #resposta(4)[
    Resposta pessoal. Em geral a econômica soa mais ligada e cansa menos a mão direita em escalas de três notas por corda; a alternada tende a soar mais "articulada". O importante é que, nas duas, as tercinas fiquem regulares na gravação.
  ]
  #resposta(5)[
    Exercício prático — critério de sucesso: as notas dos dedos e da palheta têm o mesmo volume, os baixos não param de alternar e as notas abafadas (x) do exemplo 8 soam percussivas, sem altura definida.
  ]
  #resposta(6)[
    Exercício prático — critério de sucesso: exemplo 9 a 80 BPM e exemplo 10 a 60 BPM em tercinas, com cada nota soando separada e nenhuma corda solta vibrando.
  ]
  #resposta(7)[
    Resposta pessoal. Um bom registro mostra o BPM limpo subindo aos poucos e problemas descritos de forma concreta, cada um ligado a uma correção (abafar com a palma, relaxar o polegar, voltar 8 BPM etc.).
  ]
]
