#import "/templates/layout.typ": *
#import "/templates/components.typ": *

#show: aula.with(
  instrumento: "Guitarra",
  nivel: "Iniciante",
)

// Tabelas, caixas e diagramas não se partem entre páginas (os blocos
// que precisam quebrar, como `exercicio`, já declaram breakable: true).
#set block(breakable: false)

// Texto de células de tabela sem justificação (evita espaços esticados)
#show table: set par(justify: false)

// Exercício que não se divide entre páginas (enunciado + área de resposta juntos)
#let ex(..args) = block(breakable: false, above: 1.5em, below: 0.9em, exercicio(..args))

// ============================================================
// HELPERS LOCAIS — escala no braço calculada a partir da afinação
// ============================================================
// As notas são calculadas (e não digitadas à mão): afinação padrão
// E A D G B E, classes de altura com 0 = C.

#let afinacao = (4, 9, 2, 7, 11, 4) // 6ª, 5ª, 4ª, 3ª, 2ª, 1ª corda
// Pentatônica maior: semitons a partir da tônica → rótulo.
// A 3 (nota que define o som maior) aparece em destaque cinza.
#let penta-maior = ("0": "T", "2": "2", "4": "*3", "7": "5", "9": "6")

// Linhas de `braco-notas` com as notas da escala entre as casas fs e fe
#let escala-braco(raiz, rotulos, fs, fe) = afinacao.map(a => range(fs, fe + 1).map(f => rotulos.at(
  str(calc.rem(a + f - raiz + 24, 12)),
  default: "",
)))

#let posicao(titulo, raiz, fs, fe, texto) = block(width: 100%)[
  #align(center)[
    #text(size: 10pt, weight: "bold")[#titulo]
    #v(0.15em)
    #braco-notas(escala-braco(raiz, penta-maior, fs, fe), fs: fs)
    #v(0.1em)
    #text(size: 8.5pt, fill: color-secondary)[#texto]
  ]
]

#let legenda(body) = align(center, text(size: 8.5pt, fill: color-muted, body))

= Escala Pentatônica Maior

A *pentatônica menor* (T – b3 – 4 – 5 – b7) é a escala mais usada do rock e do blues. Ela tem uma "irmã" de som luminoso e aberto: a *pentatônica maior*, ouvida em solos de country, no pop, no rock clássico e no sertanejo. A melhor notícia é que as duas *compartilham os desenhos*: as cinco posições são exatamente as mesmas da pentatônica menor. O que muda é *onde está a tônica* — e, com ela, o som de tudo o que você toca.

#objetivos((
  [Construir a pentatônica maior pela fórmula T – 2 – 3 – 5 – 6 e compará-la com a escala maior],
  [Entender a relação de relativas: a pentatônica maior e a menor relativa têm as mesmas notas],
  [Tocar as 5 posições da pentatônica maior em Dó, reconhecendo a tônica e a 3ª em cada uma],
  [Aplicar a regra prática "desloque 3 casas para baixo" para usar os shapes da penta menor],
  [Escolher entre pentatônica maior e menor de acordo com o acorde e o estilo],
))

== 1. A fórmula: T – 2 – 3 – 5 – 6

A pentatônica maior é a escala maior *sem o 4º e o 7º graus*. Essas duas notas são justamente as que formam *semitons* dentro da escala maior (Mi–Fá e Si–Dó, em Dó). Sem elas, sobram cinco notas separadas por tons e terças menores, que soam bem sobre praticamente qualquer acorde do tom — por isso a escala é tão "segura" para improvisar.

#v(0.3em)

#tabela(
  columns: (2.3fr,) + (1fr,) * 7,
  ([*Escala de C*], [*1*], [*2*], [*3*], [*4*], [*5*], [*6*], [*7*]),
  (
    ([Maior], [C — T], [D — 2], [E — 3], [F — 4], [G — 5], [A — 6], [B — 7M]),
    ([*Pentatônica maior*], [*C — T*], [*D — 2*], [*E — 3*], [—], [*G — 5*], [*A — 6*], [—]),
  ),
)

#v(0.4em)

Em semitons a partir da tônica, a fórmula é *0 – 2 – 4 – 7 – 9*. Veja-a em outros tons:

#v(0.3em)

#tabela(
  columns: (1.4fr,) + (1fr,) * 5,
  ([*Tom*], [*T*], [*2*], [*3*], [*5*], [*6*]),
  (
    ([C maior], [C], [D], [E], [G], [A]),
    ([G maior], [G], [A], [B], [D], [E]),
    ([A maior], [A], [B], [C\#], [E], [F\#]),
  ),
)

== 2. Relativas: mesmas notas, outra tônica

Compare a pentatônica de *Dó maior* com a de *Lá menor* (fórmula T – b3 – 4 – 5 – b7):

#v(0.3em)

#tabela(
  columns: (1.9fr,) + (1fr,) * 5,
  ([*Escala*], [*1ª nota*], [*2ª*], [*3ª*], [*4ª*], [*5ª*]),
  (
    ([C pentatônica maior], [*C* — T], [D — 2], [E — 3], [G — 5], [A — 6]),
    ([A pentatônica menor], [*A* — T], [C — b3], [D — 4], [E — 5], [G — b7]),
  ),
)

#v(0.4em)

As duas escalas usam *exatamente as mesmas cinco notas*: C, D, E, G e A. São escalas *relativas*, assim como os tons de Dó maior e Lá menor são relativos: usam as mesmas notas, mas cada um gira em torno de uma tônica diferente. A diferença está na *tônica* — a nota onde a música "descansa" e para onde as frases resolvem. Sobre um acorde de C, essas notas soam como C pentatônica maior; sobre um acorde de Am, como A pentatônica menor.

#cartoes-info((
  (
    titulo: "Maior → relativa menor",
    corpo: align(center)[A relativa menor está *3 casas abaixo* (1 tom e meio). \ C maior → *A* menor],
  ),
  (
    titulo: "Menor → relativa maior",
    corpo: align(center)[A relativa maior está *3 casas acima*. \ E menor → *G* maior],
  ),
))

=== A regra prática: "desloque 3 casas para baixo"

Para tocar a pentatônica maior de qualquer tom, encontre a tônica na 6ª corda, *desça 3 casas* e toque ali a posição 1 da pentatônica menor (a "caixa" de quatro casas, mostrada como posição 1 na seção 3). Os desenhos são os mesmos — só que agora a tônica é a nota que estava 3 casas acima.

#v(0.3em)

#tabela(
  columns: (1.3fr, 1.3fr, 1.8fr, 2fr),
  ([*Penta maior*], [*Relativa menor*], [*Tônica maior (6ª corda)*], [*Caixa menor começa na casa*]),
  (
    ([G], [Em], [casa 3], [0 (ou 12)]),
    ([A], [F\#m], [casa 5], [2]),
    ([C], [Am], [casa 8], [5]),
    ([D], [Bm], [casa 10], [7]),
    ([E], [C\#m], [casa 12 (ou 0)], [9]),
  ),
)

#v(0.4em)

#caixa(tipo: "atencao")[
  O desenho é o mesmo, mas o *pensamento muda*: na pentatônica maior, comece e termine as frases na *tônica maior* (os círculos pretos dos diagramas a seguir) e valorize a *3ª*. Se você continuar resolvendo na tônica da menor, o som volta a ser de pentatônica menor.
]

== 3. As 5 posições em Dó maior

As posições abaixo ocupam as mesmas casas das cinco posições da pentatônica de Lá menor e seguem a numeração usada para ela (a posição 1 é a "caixa" das casas 5 a 8), para que você reconheça os desenhos. Os rótulos agora são os *intervalos em relação a C*: *T* (preto) é a tônica Dó, e a *3* (em cinza) é a nota que dá o caráter maior.

#v(0.5em)

#grid(
  columns: (1fr, 1fr, 1fr),
  row-gutter: 1.4em,
  column-gutter: 0.8em,
  posicao("Posição 1 — casas 5 a 8", 0, 5, 8, [Tônicas: 6ª e 1ª cordas (casa 8), 3ª corda (casa 5). É a "caixa" de Am.]),
  posicao("Posição 2 — casas 7 a 10", 0, 7, 10, [Tônicas: 6ª e 1ª cordas (casa 8), 4ª corda (casa 10).]),
  posicao("Posição 3 — casas 9 a 13", 0, 9, 13, [Tônicas: 4ª corda (casa 10), 2ª corda (casa 13). Ocupa 5 casas por causa da corda Si.]),
  posicao("Posição 4 — casas 12 a 15", 0, 12, 15, [Tônicas: 5ª corda (casa 15), 2ª corda (casa 13).]),
  posicao("Posição 5 — casas 2 a 5", 0, 2, 5, [Tônicas: 5ª corda (casa 3), 3ª corda (casa 5). Repete-se uma oitava acima, nas casas 14 a 17.]),
  align(horizon, caixa(tipo: "dica", width: 100%)[
    Aprenda primeiro as posições *1 e 2*: juntas, cobrem as casas 5 a 10, com a tônica na 6ª corda. Depois ligue as posições pelas notas em comum — a última coluna de uma é a primeira da seguinte.
  ]),
)

#block(width: 100%)[
=== O mapa completo

Ligadas, as cinco posições cobrem o braço inteiro. A partir da casa 12 tudo se repete (a posição 5, nas casas 2 a 5, reaparece nas casas 14 a 17):

#v(0.3em)

#align(center, braco-notas(escala-braco(0, penta-maior, 0, 15), fs: 0))
#legenda[C pentatônica maior da corda solta até a casa 15. T = Dó; em cinza, a 3 (Mi).]
]

== 4. A sonoridade

Sem a 4ª e a 7ª, a pentatônica maior não tem notas de tensão: o som é *alegre, aberto e cantável*. Ela é a base melódica de vários estilos:

#v(0.3em)

#cartoes-info((
  (titulo: "Country", corpo: [Frases rápidas, bends da 2 para a 3 imitando a pedal steel e muitas cordas soltas.]),
  (titulo: "Pop", corpo: [Melodias vocais, introduções e solos curtos e "cantáveis" sobre progressões maiores.]),
  (titulo: "Rock clássico", corpo: [Solos melódicos do rock sulista e do classic rock dos anos 1970, alternando maior e menor.]),
  (titulo: "Sertanejo", corpo: [Introduções e solos de guitarra e viola, muitas vezes em terças, sobre harmonias maiores.]),
), columns: (1fr, 1fr))

== 5. Um lick para começar

#block(width: 100%)[
Este lick em Dó maior usa só a *posição 1* (casas 5 a 8). Toque-o sobre um acorde de C (ou uma base em Dó maior) e observe como a frase "pousa" na tônica no fim. A linha de baixo mostra o intervalo de cada nota em relação a C.

#v(0.3em)

#tab(
  titulo: "Lick em C pentatônica maior — posição 1",
  "   1  e  2  e  3  e  4  e    1  e     e  3
e|-------------5--8--5-----|-------------------------|
B|-------5--8-----------8--|-5-----------------------|
G|-5--7--------------------|----7b9---7--5-----------|
D|-------------------------|-------------------------|
A|-------------------------|-------------------------|
E|-------------------------|-------------------------|
   T  2  3  5  6  T  6  5    3  2→3   2  T",
  legenda: [7b9 = bend de 1 tom na casa 7 da 3ª corda (Ré → Mi: da 2 para a 3). Empurre a corda com o dedo 3, apoiado pelos dedos 1 e 2, até soar a mesma nota da casa 9.],
)

#v(0.4em)
]

O bend da *2 para a 3* é a assinatura do som maior: em vez de "chorar" como o bend da b3 na pentatônica menor, ele *afirma* a 3ª maior do acorde.

== 6. Maior ou menor sobre um acorde maior?

Sobre um acorde *maior*, as duas pentatônicas com a mesma tônica funcionam — mas produzem sons bem diferentes. Sobre um acorde *menor*, a escolha é mais restrita:

#v(0.3em)

#tabela(
  columns: (1.6fr, 1.5fr, 2.6fr),
  alinhamento: left + horizon,
  ([*Situação*], [*Escala*], [*Resultado*]),
  (
    ([Acorde ou tom maior (C)], [C penta *maior*], [Doce e consonante: a 3 da escala coincide com a 3 do acorde. Pop, country, baladas.]),
    ([Acorde ou tom maior (C)], [C penta *menor*], [A b3 (Mib) contra a 3 (Mi) do acorde gera atrito proposital: som de blues e rock "sujo".]),
    ([Blues com acordes dominantes (C7)], [Mistura das duas], [Alternar maior e menor é a marca do blues e do rock clássico.]),
    ([Acorde ou tom menor (Cm)], [C penta *menor*], [Combina com o acorde. A penta maior de C soaria errada: sua 3 (Mi) choca com a b3 (Mib).]),
  ),
)

#v(0.4em)

#caixa(tipo: "resumo")[
  *Acorde maior:* penta maior para soar doce; penta menor (mesma tônica) para soar blues/rock. \
  *Acorde menor:* penta menor. \
  *Atalho:* a penta maior de C é a penta menor de A — o mesmo desenho, pensando em outra tônica.
]

== 7. Exercícios

#ex(titulo: "Monte a pentatônica maior", nivel: "Escrita")[
  Escreva as notas da pentatônica maior de cada tom (T – 2 – 3 – 5 – 6).

  #v(0.3em)
  #tabela-preencher(
    ([*Tom*], [*T*], [*2*], [*3*], [*5*], [*6*]),
    (
      ([G], none, none, none, none, none),
      ([D], none, none, none, none, none),
      ([A], none, none, none, none, none),
      ([E], none, none, none, none, none),
      ([F], none, none, none, none, none),
    ),
    columns: (1.2fr,) + (1fr,) * 5,
  )
]

#ex(titulo: "Encontre a relativa", nivel: "Escrita")[
  Escreva a pentatônica menor relativa de cada pentatônica maior e, na segunda tabela, a maior relativa de cada menor.

  #v(0.3em)
  #grid(
    columns: (1.4fr, 1fr),
    column-gutter: 1.2em,
    tabela-preencher(
      ([*Maior*], [*G*], [*D*], [*A*], [*E*], [*F*], [*Bb*]),
      (([Relativa menor], none, none, none, none, none, none),),
      columns: (2.8fr,) + (1fr,) * 6,
    ),
    tabela-preencher(
      ([*Menor*], [*Cm*], [*Fm*], [*G\#m*]),
      (([Relativa maior], none, none, none),),
      columns: (2.2fr,) + (1fr,) * 3,
    ),
  )
]

#ex(titulo: "Desloque 3 casas", nivel: "Escrita")[
  Para cada tom, escreva a casa da tônica maior na 6ª corda e a casa onde começa a "caixa" da pentatônica menor relativa (entre 0 e 11).

  #v(0.3em)
  #tabela-preencher(
    ([*Penta maior de*], [*A*], [*D*], [*E*], [*F*], [*B*], [*G*]),
    (
      ([Tônica na 6ª (casa)], none, none, none, none, none, none),
      ([Caixa menor (casa)], none, none, none, none, none, none),
    ),
    columns: (2fr,) + (1fr,) * 6,
  )
]

#ex(titulo: "Desenhe a posição 1 de A maior", nivel: "Escrita")[
  A relativa menor de A é F\#m, cuja caixa fica nas casas 2 a 5. Escreva no braço os intervalos da *A pentatônica maior* nessa região (T, 2, 3, 5, 6), duas notas por corda.

  #v(0.3em)
  #align(center)[#braco-vazio(casas: 4, fs: 2)]
]

#ex(titulo: "Intervalos de um lick", nivel: "Escrita")[
  O lick abaixo está em *G pentatônica maior*, na região das cordas soltas (relativa: Em). Escreva o intervalo de cada nota em relação a G.

  #v(0.3em)
  #tab(
    "   1  e  2  e  3  e  4  e    1  e  2  e  3
e|-------------------0--3--|-0-----------------------|
B|-------------0--3--------|----3--0-----------------|
G|-------0--2--------------|----------2--0-----------|
D|-0--2--------------------|-------------------------|
A|-------------------------|-------------------------|
E|-------------------------|-------------------------|",
  )
  #linhas-resposta(2)
]

#ex(titulo: "Maior ou menor?", nivel: "Escrita")[
  Indique qual pentatônica (com a mesma tônica do tom) você usaria e justifique em poucas palavras.

  #v(0.3em)
  #tabela-preencher(
    ([*Situação*], [*Escala*], [*Por quê?*]),
    (
      ([a) Balada pop em G: G – D – Em – C], none, none),
      ([b) Rock em Am: Am – G – F – G], none, none),
      ([c) Solo country sobre um acorde de A], none, none),
      ([d) Blues em E com E7, A7 e B7], none, none),
    ),
    columns: (2.4fr, 1fr, 2.2fr),
    alinhamento: left + horizon,
  )
]

#ex(titulo: "Improvisação guiada", nivel: "Prática")[
  Grave (ou use uma base) com o acorde de C por 2 minutos. Improvise usando apenas as posições 1 e 2, com três regras: frases curtas, pausas entre elas e *toda frase terminando na tônica Dó*. Depois toque a mesma ideia sobre um acorde de Am, terminando em Lá, e compare os dois sons.
]

=== Sugestão de prática

#rotina-estudo((
  ([Posições 1 e 2 subindo e descendo, dizendo os intervalos], [5 min], [60–80]),
  ([Posições 3, 4 e 5 (uma de cada vez)], [5 min], [60]),
  ([Lick da seção 5, com bend afinado], [3 min], [70]),
  ([Regra das 3 casas: penta maior em G, A, D e E], [3 min], [—]),
  ([Improvisação guiada sobre C e sobre Am], [4 min], [—]),
))

#v(0.6em)

#checklist(
  (
    [Escrevo a pentatônica maior de qualquer tom pela fórmula T – 2 – 3 – 5 – 6.],
    [Explico por que a penta maior de C e a penta menor de A têm as mesmas notas.],
    [Toco as posições 1 e 2 em C reconhecendo a tônica e a 3.],
    [Uso a regra das 3 casas para tocar a penta maior em qualquer tom.],
    [Termino frases na tônica maior, e não na tônica da relativa.],
    [Sei quando usar a penta maior e quando usar a menor.],
  ),
  titulo: "Autoavaliação",
)

#gabarito[
  #resposta(1)[
    G: G A B D E · D: D E F\# A B · A: A B C\# E F\# · E: E F\# G\# B C\# · F: F G A C D.
  ]
  #resposta(2)[
    G → Em · D → Bm · A → F\#m · E → C\#m · F → Dm · Bb → Gm. \
    Cm → Eb · Fm → Ab · G\#m → B.
  ]
  #resposta(3)[
    A: tônica casa 5, caixa casa 2 · D: 10 → 7 · E: 0 (ou 12) → 9 · F: 1 → 10 (1 − 3 = −2; some 12) · B: 7 → 4 · G: 3 → 0 (ou 12).
  ]
  #resposta(4)[
    #grid(
      columns: (auto, 1fr),
      column-gutter: 1.2em,
      align: horizon,
      braco-notas(
        escala-braco(9, ("0": "T", "2": "2", "4": "3", "7": "5", "9": "6"), 2, 5),
        fs: 2,
      ),
      [6ª: 6 (casa 2), T (5) · 5ª: 2 (2), 3 (4) · 4ª: 5 (2), 6 (4) · 3ª: T (2), 2 (4) · 2ª: 3 (2), 5 (5) · 1ª: 6 (2), T (5). \
        Notas: F\#, A · B, C\# · E, F\# · A, B · C\#, E · F\#, A.],
    )
  ]
  #resposta(5)[
    Compasso 1: 5 – 6 – T – 2 – 3 – 5 – 6 – T (D, E, G, A, B, D, E, G). \
    Compasso 2: 6 – 5 – 3 – 2 – T (E, D, B, A, G).
  ]
  #resposta(6)[
    a) *Maior* (G): progressão maior, som pop e consonante. · b) *Menor* (A): tom menor; a penta maior de A teria C\#, que choca com o C do acorde Am. ·
    c) *Maior* (A): som característico do country, com bend da 2 para a 3. · d) *Menor* (E), podendo misturar com a maior — no blues a b3 sobre acordes maiores é proposital.
  ]
  #resposta(7)[
    Exercício prático — critério de sucesso: perceber claramente que as mesmas notas soam "alegres" e resolvidas sobre C (terminando em Dó) e "melancólicas" sobre Am (terminando em Lá).
  ]
]
