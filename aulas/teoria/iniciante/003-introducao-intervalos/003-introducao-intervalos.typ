#import "/templates/layout.typ": *
#import "/templates/components.typ": *

#show: aula.with(
  instrumento: "Teoria Musical",
  nivel: "Fundamentos",
)

// Exercício que não se divide entre páginas (enunciado + área de resposta juntos)
#let ex(..args) = block(breakable: false, above: 1.5em, below: 0.9em, exercicio(..args))

= Introdução aos Intervalos

O *semitom* (a menor distância entre duas notas — uma tecla vizinha no piano ou uma casa no braço) e o *tom* (dois semitons) formam a régua básica da música. Com essa régua você pode medir a distância entre duas notas quaisquer. Essa distância tem um nome — *intervalo* — e reconhecê-la de ouvido é uma das habilidades mais valiosas que um músico pode desenvolver.

#objetivos((
  [Entender o que é um intervalo e diferenciar intervalos melódicos e harmônicos.],
  [Conhecer o nome, o símbolo e o tamanho (em semitons) de todos os intervalos dentro de uma oitava.],
  [Encontrar qualquer intervalo a partir de uma nota, no papel e no instrumento.],
  [Usar músicas conhecidas como referência para reconhecer intervalos de ouvido.],
))

== 1. O que é um intervalo?

*Intervalo* é a distância entre duas notas, medida em tons e semitons. Ele pode aparecer de duas formas:

#cartoes-info((
  (titulo: "Intervalo melódico", corpo: [As duas notas soam *uma depois da outra*. É o "salto" entre uma nota e a próxima numa melodia.]),
  (titulo: "Intervalo harmônico", corpo: [As duas notas soam *ao mesmo tempo*. É a base dos acordes e das melodias a duas vozes.]),
))

O intervalo também tem uma *direção*: se a segunda nota é mais aguda, ele é *ascendente*; se é mais grave, *descendente*. Neste material trabalhamos com intervalos *ascendentes*, os mais fáceis de reconhecer no início.

Quanto ao tamanho, os intervalos podem ser:

- *Simples:* cabem dentro de uma oitava (até 12 semitons). São o foco deste material.
- *Compostos:* ultrapassam a oitava, como a 9ª e a 11ª. Todo intervalo composto é um intervalo simples somado a uma oitava: a 9ª é uma 2ª uma oitava acima; a 11ª, uma 4ª uma oitava acima.

#caixa(tipo: "neutro", titulo: "Por que os intervalos importam")[
  Uma nota isolada não carrega emoção. A sensação de alegria, melancolia, tensão ou repouso vem da *relação* entre as notas — ou seja, dos intervalos. É por isso que você reconhece uma música mesmo quando ela é cantada mais grave ou mais aguda: as notas mudam, mas os intervalos entre elas continuam os mesmos.
]

== 2. Os nomes dos intervalos

Cada intervalo tem um *número* e uma *qualidade*:

- O *número* conta as letras de nota envolvidas, incluindo a primeira e a última: de Dó a Mi temos Dó–Ré–Mi, três letras, portanto uma *terça*.
- A *qualidade* diz o tamanho exato em semitons: *menor* ou *maior* (2ª, 3ª, 6ª e 7ª), *justa* (4ª, 5ª e 8ª), *aumentada* (um semitom maior que a justa) ou *diminuta* (um semitom menor que a justa).

A tabela mostra todos os intervalos simples, medidos a partir de uma nota de referência chamada *tônica* (T), com o exemplo a partir de Dó:

#tabela(
  ([*Intervalo*], [*Símbolo*], [*Semitons*], [*Tons*], [*A partir de Dó*]),
  (
    ([Uníssono (a própria tônica)], [T], [0], [—], [Dó]),
    ([Segunda menor], [b2], [1], [ST], [Réb]),
    ([Segunda maior], [2], [2], [1 T], [Ré]),
    ([Terça menor], [b3], [3], [1 T + ST], [Mib]),
    ([Terça maior], [3], [4], [2 T], [Mi]),
    ([Quarta justa], [4], [5], [2 T + ST], [Fá]),
    ([Quarta aumentada / quinta diminuta], [\#4 / b5], [6], [3 T], [Fá\# / Solb]),
    ([Quinta justa], [5], [7], [3 T + ST], [Sol]),
    ([Sexta menor], [b6], [8], [4 T], [Láb]),
    ([Sexta maior], [6], [9], [4 T + ST], [Lá]),
    ([Sétima menor], [7], [10], [5 T], [Sib]),
    ([Sétima maior], [7M], [11], [5 T + ST], [Si]),
    ([Oitava justa], [8], [12], [6 T], [Dó (agudo)]),
  ),
  columns: (2.5fr, 0.9fr, 0.9fr, 0.9fr, 1.2fr),
  alinhamento: (left + horizon, center + horizon, center + horizon, center + horizon, center + horizon),
)

#caixa(tipo: "atencao", titulo: "Leia os símbolos assim")[
  O "b" indica a versão *menor* do intervalo (b3 = terça menor). Atenção à sétima: nesta notação, *7 sozinho é a sétima menor* (10 semitons) e *7M é a sétima maior* (11 semitons). O intervalo de 6 semitons tem dois nomes: \#4 (quarta aumentada) ou b5 (quinta diminuta), também chamado de *trítono* por ter exatamente três tons.
]

#block(breakable: false)[
=== Como encontrar um intervalo

Para achar a nota que está a um certo intervalo da tônica, conte os semitons e escolha o nome com a letra certa:

#passos((
  [*Conte a letra.* Para uma 3ª a partir de Ré, conte três letras: Ré – Mi – *Fá*. A nota será algum tipo de Fá.],
  [*Conte os semitons.* A terça maior tem 4 semitons: Ré → Ré\# → Mi → Fá → *Fá\#*.],
  [*Ajuste o acidente.* Fá natural daria só 3 semitons (terça menor); para a terça maior, precisamos de *Fá\#*.],
))
]

=== Intervalos no braço do instrumento

No violão, na guitarra e no baixo, *cada casa é um semitom*. Na mesma corda, o número de casas entre duas notas é o tamanho do intervalo em semitons. Exemplo na 6ª corda (Mi grave): solta = Mi; casa 4 = Sol\# (terça maior, 3); casa 5 = Lá (quarta justa, 4); casa 7 = Si (quinta justa, 5); casa 12 = Mi (oitava).

== 3. Reconhecendo intervalos de ouvido

Poucas pessoas têm *ouvido absoluto* (identificar uma nota isolada só de ouvi-la). Já o *ouvido relativo* — reconhecer a *distância* entre duas notas — qualquer músico pode desenvolver com treino.

A técnica mais eficiente é associar cada intervalo a uma música *muito familiar* cujo começo tenha exatamente aquele salto. Quando ouvir um intervalo desconhecido, compare-o com o início dessas músicas: aquela que "encaixa" revela o intervalo.

#caixa(tipo: "dica", titulo: "Exemplo")[
  Em "Parabéns pra Você", as sílabas "Pa-ra" estão na mesma nota e "-béns" sobe uma *segunda maior*. Se o salto que você ouviu tem a mesma sensação de "ra → béns", é uma segunda maior.
]

=== Músicas de referência (intervalos ascendentes)

Não tente decorar todas de uma vez: comece com três ou quatro e acrescente as outras aos poucos. Se não conhecer uma das músicas, troque-a por outra que você conheça bem com o mesmo intervalo.

#tabela(
  ([*Intervalo*], [*Símb.*], [*Música de referência*], [*Onde ouvir o salto*]),
  (
    ([Segunda menor], [b2], [_Tubarão_ (tema) \ _A Pantera Cor-de-Rosa_], [As duas primeiras notas]),
    ([Segunda maior], [2], [_Parabéns pra Você_ · _Asa Branca_], [ra → "béns" · Quan → "do"]),
    ([Terça menor], [b3], [_Smoke on the Water_ · _Seven Nation Army_], [As duas primeiras notas diferentes do riff]),
    ([Terça maior], [3], [_When the Saints Go Marching In_], [Oh → "when"]),
    ([Quarta justa], [4], [_Marcha Nupcial_ (Wagner) · tema de _Harry Potter_], [As duas primeiras notas]),
    ([Trítono], [\#4 / b5], [Abertura de _Os Simpsons_ · _Maria_ (West Side Story)], [The → "Simp-" · Ma → "-ri-"]),
    ([Quinta justa], [5], [_Brilha, Brilha, Estrelinha_ · tema de _Star Wars_], [Bri-lha → "bri-lha" · as duas notas longas do início]),
    ([Sexta menor], [b6], [_The Entertainer_ (Scott Joplin)], [Da 3ª para a 4ª nota do tema]),
    ([Sexta maior], [6], [_My Bonnie Lies Over the Ocean_ · Noturno op. 9 nº 2 (Chopin)], [My → "Bon-" · as duas primeiras notas]),
    ([Sétima menor], [7], [_Somewhere_ (West Side Story) · tema de _Star Trek_ (série clássica)], [There's → "a place" · as duas primeiras notas]),
    ([Sétima maior], [7M], [Pense na oitava e desça um semitom], [Cante a oitava, depois a nota logo abaixo]),
    ([Oitava justa], [8], [_Over the Rainbow_ · _Sweet Child O' Mine_], [Some → "-where" · as duas primeiras notas do riff]),
  ),
  columns: (1.15fr, 0.6fr, 2.1fr, 1.8fr),
  alinhamento: (left + horizon, center + horizon, left + horizon, left + horizon),
)

== 4. Como praticar

#passos((
  [Escolha *um único intervalo*. Cante ou toque a música de referência algumas vezes, prestando atenção só nas duas notas do salto.],
  [No instrumento, toque a *tônica* e depois a nota do intervalo, isoladas. Compare com a música: a sensação deve ser a mesma.],
  [Peça para alguém — ou use um aplicativo de treino auditivo — tocar o intervalo a partir de notas aleatórias. Identifique qual música "gruda" naquele salto.],
  [Só acrescente um intervalo novo quando reconhecer os anteriores com segurança. Treine em pares parecidos: 2ª menor e 2ª maior; 3ª menor e 3ª maior; 4ª justa e trítono; e assim por diante.],
))

=== Use a voz

Mesmo que você não seja cantor, *cantarolar* os intervalos é o melhor atalho para a percepção. Toque a tônica, pense na música de referência e *cante* a segunda nota. Só então toque essa nota no instrumento para conferir. Quando você consegue prever a nota com a voz antes de tocá-la, o intervalo está realmente internalizado.

#caixa(tipo: "dica", titulo: "Onde treinar sozinho")[
  O site gratuito *musictheory.net* tem um treino de intervalos em _Exercises → Ear Training → Interval Ear Training_. Nas configurações, selecione só os intervalos que está estudando e a direção (ascendente). Aplicativos de treino auditivo para celular funcionam da mesma forma. Passe para o próximo intervalo quando acertar cerca de 20 seguidos.
]

== 5. Exercícios

#ex(titulo: "Qual é o intervalo?", nivel: "Escrita")[
  Conte os semitons entre as notas (sempre subindo da primeira para a segunda) e escreva o símbolo do intervalo.

  #v(0.3em)
  #tabela-preencher(
    ([*Notas*], [*C–G*], [*C–A*], [*D–F*], [*E–G\#*], [*A–D*], [*C–Bb*], [*F–B*], [*G–F\#*]),
    (
      ([Semitons], none, none, none, none, none, none, none, none),
      ([Intervalo], none, none, none, none, none, none, none, none),
    ),
    columns: (1.3fr,) + (1fr,) * 8,
  )
]

#ex(titulo: "Encontre a nota", nivel: "Escrita")[
  Escreva a nota que está no intervalo pedido, acima da tônica. Lembre-se de contar a letra *e* os semitons.

  #v(0.3em)
  #tabela-preencher(
    ([*Tônica*], [*C*], [*A*], [*D*], [*E*], [*G*], [*F*], [*B*], [*Bb*]),
    (
      ([Intervalo], [3], [b3], [3], [4], [6], [7], [b3], [5]),
      ([Nota], none, none, none, none, none, none, none, none),
    ),
    columns: (1.3fr,) + (1fr,) * 8,
  )
]

#ex(titulo: "Intervalos na 6ª corda", nivel: "Escrita + prática")[
  Toque a 6ª corda solta (Mi) e depois a casa indicada, na mesma corda. Escreva a nota da casa e o intervalo que ela forma com o Mi solto. Depois, toque e cante cada intervalo.

  #v(0.3em)
  #tabela-preencher(
    ([*Casa*], [*3*], [*4*], [*5*], [*7*], [*10*], [*12*]),
    (
      ([Nota], none, none, none, none, none, none),
      ([Intervalo], none, none, none, none, none, none),
    ),
    columns: (1.3fr,) + (1fr,) * 6,
  )
]

#ex(titulo: "Treino auditivo", nivel: "Percepção")[
  Num site ou aplicativo de treino auditivo, selecione apenas *2ª maior, 3ª maior, 4ª justa e 5ª justa*, na direção ascendente. Faça uma rodada de 20 intervalos e anote quantos acertou: #box(width: 2cm, line(length: 100%, stroke: 0.5pt + color-rule-dark)) de 20.
]

#ex(titulo: "Simples ou composto?", nivel: "Escrita")[
  a) Um intervalo de 14 semitons é simples ou composto? A que intervalo simples ele corresponde? \
  b) Qual é a diferença entre um intervalo melódico e um harmônico? \
  c) Quantos tons tem o trítono? Escreva os seus dois símbolos.

  #linhas-resposta(3)
]

#ex(titulo: "Minhas músicas de referência", nivel: "Percepção")[
  Escolha, para cada intervalo, uma música que *você* conheça bem e que comece com esse salto (pode ser uma da tabela da seção 3). Confira tocando no instrumento.

  #v(0.3em)
  #tabela-preencher(
    ([*Intervalo*], [*Música de referência*]),
    (
      ([2 — segunda maior], none),
      ([3 — terça maior], none),
      ([4 — quarta justa], none),
      ([5 — quinta justa], none),
      ([8 — oitava justa], none),
    ),
    columns: (1.2fr, 3fr),
    alinhamento: (left + horizon, left + horizon),
  )
]

=== Sugestão de prática

#block(breakable: false, rotina-estudo((
  ([Cantar as músicas de referência dos intervalos que está estudando], [3 min], [—]),
  ([Tocar e cantar intervalos a partir de cordas soltas], [5 min], [—]),
  ([Encontrar intervalos no papel a partir de tônicas sorteadas], [5 min], [—]),
  ([Treino auditivo com 3 ou 4 intervalos (site ou aplicativo)], [5 min], [—]),
)))

#v(0.6em)

#checklist(
  (
    [Sei explicar a diferença entre intervalo melódico e harmônico, simples e composto.],
    [Digo quantos semitons tem cada intervalo, da b2 até a oitava.],
    [Sei que 7 é a sétima menor e 7M é a sétima maior.],
    [Encontro a nota de qualquer intervalo a partir de uma tônica, contando letras e semitons.],
    [Reconheço de ouvido pelo menos quatro intervalos usando músicas de referência.],
  ),
  titulo: "Autoavaliação",
)

#gabarito[
  #resposta(1)[C → G: 7, *5* · C → A: 9, *6* · D → F: 3, *b3* · E → G\#: 4, *3* · A → D: 5, *4* · C → Bb: 10, *7* · F → B: 6, *\#4* (trítono) · G → F\#: 11, *7M*.]
  #resposta(2)[C + 3 = E · A + b3 = C · D + 3 = F\# · E + 4 = A · G + 6 = E · F + 7 = Eb (e não D\#, pois a sétima de Fá precisa da letra E) · B + b3 = D · Bb + 5 = F.]
  #resposta(3)[Casa 3: Sol, b3 · casa 4: Sol\#, 3 · casa 5: Lá, 4 · casa 7: Si, 5 · casa 10: Ré, 7 · casa 12: Mi, 8 (oitava).]
  #resposta(4)[Exercício prático — critério de sucesso: 16 acertos ou mais em 20. Abaixo disso, volte a treinar com dois intervalos por vez.]
  #resposta(5)[
    a) Composto; 14 semitons = 12 (oitava) + 2, ou seja, uma 2ª maior uma oitava acima: a *9ª*. \
    b) No melódico as notas soam uma depois da outra; no harmônico, ao mesmo tempo. \
    c) Três tons (6 semitons); \#4 (quarta aumentada) ou b5 (quinta diminuta).
  ]
  #resposta(6)[Resposta pessoal. Critério: tocando a tônica e a nota do intervalo no instrumento, o salto deve ser igual ao início da música escolhida.]
]
