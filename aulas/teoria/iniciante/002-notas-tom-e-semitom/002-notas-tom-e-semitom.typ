#import "/templates/layout.typ": *
#import "/templates/components.typ": *

#show: aula.with(
  instrumento: "Teoria Musical",
  nivel: "Fundamentos",
)

// Exercício que não se divide entre páginas (enunciado + área de resposta juntos)
#let ex(..args) = block(breakable: false, above: 1.5em, below: 0.9em, exercicio(..args))

// ============================================================
// HELPERS LOCAIS
// ============================================================

// Teclado de uma oitava (Dó a Dó) com nomes nas teclas e marcação
// dos dois semitons naturais (Mi–Fá e Si–Dó).
#let teclado() = {
  let w = 38pt
  let h = 98pt
  let bw = 23pt
  let bh = 58pt
  let brancas = (("C", "Dó"), ("D", "Ré"), ("E", "Mi"), ("F", "Fá"), ("G", "Sol"), ("A", "Lá"), ("B", "Si"), ("C", "Dó"))
  // (índice da tecla branca à esquerda, cifra com #, cifra com b)
  let pretas = ((0, "C#", "Db"), (1, "D#", "Eb"), (3, "F#", "Gb"), (4, "G#", "Ab"), (5, "A#", "Bb"))
  box(width: w * 8, height: h + 22pt, {
    for (i, (cif, nome)) in brancas.enumerate() {
      place(top + left, dx: w * i, rect(width: w, height: h, fill: white, stroke: 0.8pt + color-strong, radius: (bottom: 3pt)))
      place(top + left, dx: w * i, dy: h - 30pt, box(width: w, align(center, {
        text(size: 10pt, weight: "bold", fill: color-strong, cif)
        linebreak()
        text(size: 8pt, fill: color-secondary, nome)
      })))
    }
    for (i, s, b) in pretas {
      place(top + left, dx: w * (i + 1) - bw / 2, rect(width: bw, height: bh, fill: luma(55), stroke: 0.8pt + color-strong, radius: (bottom: 2pt)))
      place(top + left, dx: w * (i + 1) - bw / 2, dy: bh - 24pt, box(width: bw, align(center, {
        set text(size: 7pt, weight: "bold", fill: white)
        s
        linebreak()
        b
      })))
    }
    // Marcas de semitom natural entre Mi–Fá e Si–Dó
    for x in (3, 7) {
      place(top + left, dx: w * x - 14pt, dy: h + 5pt, box(width: 28pt, align(center, text(size: 8pt, weight: "bold", fill: color-strong)[ST])))
    }
  })
}

// Linha de notas com a distância entre cada par vizinho.
// `passos` usa "T" ou "ST"; os semitons ficam em destaque.
#let escada(notas, passos) = {
  let caixa-nota(n) = box(
    width: 36pt,
    inset: (y: 6pt),
    stroke: 0.8pt + color-strong,
    radius: 3pt,
    fill: white,
    align(center, text(size: 10pt, weight: "bold", n)),
  )
  let conector(p) = box(width: 26pt, stack(
    dir: ttb,
    spacing: 3pt,
    align(center, if p == "ST" {
      box(fill: color-subtle-bg-alt, inset: (x: 3pt, y: 2pt), radius: 2pt, text(size: 8.5pt, weight: "bold", fill: color-strong, p))
    } else {
      box(inset: (y: 2pt), text(size: 8.5pt, fill: color-secondary, p))
    }),
    align(center, line(length: 20pt, stroke: 0.6pt + color-rule-dark)),
    // espaço simétrico para manter a linha na altura do centro das caixas
    box(height: 15pt),
  ))
  let cels = ()
  for (i, n) in notas.enumerate() {
    cels.push(caixa-nota(n))
    if i < passos.len() { cels.push(conector(passos.at(i))) }
  }
  align(center, grid(columns: cels.len(), align: horizon, ..cels))
}

= Notas Musicais, Tom e Semitom

Toda a teoria musical — intervalos, escalas e acordes — é construída sobre três ideias simples: como as notas se chamam, como elas se organizam e qual é a distância entre elas. Neste material você vai dominar esse "alfabeto" da música, que vale para qualquer instrumento.

#objetivos((
  [Nomear as sete notas naturais em português (Dó, Ré, Mi…) e em cifra (C, D, E…).],
  [Entender o que são semitom e tom e onde ficam os semitons naturais (Mi–Fá e Si–Dó).],
  [Usar sustenido (\#) e bemol (b) e reconhecer notas enarmônicas.],
  [Montar a escala maior a partir de qualquer nota com a fórmula T – T – ST – T – T – T – ST.],
))

== 1. O alfabeto musical

A música ocidental usa *sete notas naturais*, que se repetem em ciclos do grave ao agudo. Depois do Si, a sequência recomeça no Dó — esse novo Dó, mais agudo, está *uma oitava* acima do primeiro. As notas podem ser nomeadas de duas formas equivalentes:

#tabela(
  ([*Cifra*], [*C*], [*D*], [*E*], [*F*], [*G*], [*A*], [*B*]),
  (
    ([*Nome*], [Dó], [Ré], [Mi], [Fá], [Sol], [Lá], [Si]),
  ),
  columns: (1.1fr,) + (1fr,) * 7,
  zebra: false,
)

No Brasil usamos os nomes *Dó, Ré, Mi…* ao falar e cantar. Já a *cifra*, com as letras de A a G, é a forma usada em cifras de músicas, tablaturas, aplicativos de afinação e no repertório internacional. Você precisa transitar livremente entre as duas. Para memorizar, lembre que a cifra começa no Lá: *A* = Lá, *B* = Si, *C* = Dó, e assim por diante.

== 2. O teclado como mapa das notas

O teclado do piano é o mapa mais claro para visualizar as notas. As teclas *brancas* são as sete notas naturais; as teclas *pretas* são as notas intermediárias, que recebem nomes com *sustenido* (\#) ou *bemol* (b), explicados na seção 5.

#align(center)[#teclado()]

Repare que *não existe tecla preta entre Mi e Fá nem entre Si e Dó* (marcados com ST). Somando teclas brancas e pretas, há *12 sons diferentes* dentro de uma oitava — depois deles, tudo se repete.

== 3. Semitom: a menor distância

O *semitom* (ST), ou meio-tom, é a menor distância entre duas notas na música ocidental.

- *No teclado:* é a distância de uma tecla para a tecla vizinha imediata, seja ela branca ou preta (Dó → Dó\#, Mi → Fá).
- *No violão, na guitarra e no baixo:* é a distância de *uma casa* para a casa vizinha, na mesma corda.

== 4. Tom: dois semitons

O *tom* (T) é a soma de *dois semitons*: no teclado, é pular uma tecla, contando as pretas (Dó → Ré, Mi → Fá\#); no braço, são *duas casas*. Entre as notas naturais, quase todos os vizinhos estão a um tom de distância — com duas exceções:

#escada(("Dó", "Ré", "Mi", "Fá", "Sol", "Lá", "Si", "Dó"), ("T", "T", "ST", "T", "T", "T", "ST"))

#caixa(tipo: "atencao", titulo: "As duas exceções")[
  Entre *Mi–Fá* e entre *Si–Dó* a distância é de apenas *1 semitom* — não existe nota entre elas. Todos os outros pares de notas naturais vizinhas (Dó–Ré, Ré–Mi, Fá–Sol, Sol–Lá, Lá–Si) estão a *1 tom*.
]

== 5. Sustenido (\#) e bemol (b)

Os *acidentes* alteram a altura de uma nota em um semitom:

#cartoes-info((
  (titulo: [Sustenido (\#)], corpo: [*Sobe* a nota um semitom. \ Ex.: F\# (Fá sustenido) é a nota um semitom acima de Fá, entre Fá e Sol.]),
  (titulo: [Bemol (b)], corpo: [*Desce* a nota um semitom. \ Ex.: Bb (Si bemol) é a nota um semitom abaixo de Si, entre Lá e Si.]),
))

=== Enarmonia: dois nomes para o mesmo som

A tecla preta entre Dó e Ré pode ser vista como "Dó subido" (C\#) ou como "Ré descido" (Db). C\# e Db soam *exatamente igual*: são notas *enarmônicas*. O nome escolhido depende do contexto — numa escala, por exemplo, cada letra aparece uma única vez (veja a seção 6).

#tabela(
  ([*Com sustenido*], [*C\#*], [*D\#*], [*F\#*], [*G\#*], [*A\#*]),
  (
    ([*Com bemol*], [Db], [Eb], [Gb], [Ab], [Bb]),
  ),
  columns: (1.6fr,) + (1fr,) * 5,
  zebra: false,
  width: 80%,
)

Como não há nota entre Mi–Fá e Si–Dó, ali o acidente cai numa tecla branca: *E\#* soa como Fá, *Fb* como Mi, *B\#* como Dó e *Cb* como Si. Esses nomes são raros, mas aparecem em algumas escalas.

== 6. Construindo a escala maior

Toda *escala maior* segue a mesma "receita" de tons e semitons, seja qual for a nota de partida:

#caixa-destaque(width: 70%)[
  #align(center, text(size: 15pt, weight: "bold")[T – T – ST – T – T – T – ST])
]

Aplicando a fórmula a partir de Dó, obtemos a escala de Dó maior. Ela não tem nenhum acidente, porque os semitons da fórmula caem exatamente em Mi–Fá e Si–Dó:

#tabela(
  ([*Grau*], [*1*], [*2*], [*3*], [*4*], [*5*], [*6*], [*7*], [*8*]),
  (
    ([Nota], [Dó (C)], [Ré (D)], [Mi (E)], [Fá (F)], [Sol (G)], [Lá (A)], [Si (B)], [Dó (C)]),
    ([Distância], [—], [T], [T], [ST], [T], [T], [T], [ST]),
  ),
  columns: (1.1fr,) + (1fr,) * 8,
)

=== Escala maior em outra nota: Sol maior

Começando em Sol, as distâncias naturais já não batem com a fórmula, e um acidente se torna necessário:

#passos((
  [Sol → Lá: 1 tom (T) ✓ · Lá → Si: 1 tom (T) ✓ · Si → Dó: 1 semitom (ST) ✓],
  [Dó → Ré: T ✓ · Ré → Mi: T ✓],
  [Mi → *?*: a fórmula pede *1 tom*, mas Mi → Fá é só 1 semitom. Subimos o Fá para *Fá\#* (Mi → Fá\# = T).],
  [Fá\# → Sol: 1 semitom (ST) ✓ — a escala fecha na oitava.],
))

#escada(("Sol", "Lá", "Si", "Dó", "Ré", "Mi", "Fá#", "Sol"), ("T", "T", "ST", "T", "T", "T", "ST"))

Resultado: *Sol – Lá – Si – Dó – Ré – Mi – Fá\#* (G A B C D E F\#). Repare que usamos *Fá\#* e não Solb: em toda escala maior cada letra aparece *uma única vez*, sem repetir nem pular nenhuma.

== 7. Exercícios

#ex(titulo: "Nome e cifra", nivel: "Escrita")[
  Complete a tabela: escreva o nome das cifras e a cifra dos nomes.

  #v(0.3em)
  #tabela-preencher(
    ([*Cifra*], [*G*], [*E*], [*B*], [*F\#*], [*Bb*], [*D\#*]),
    (([Nome], none, none, none, none, none, none),),
    columns: (1.2fr,) + (1fr,) * 6,
  )
  #v(0.4em)
  #tabela-preencher(
    ([*Nome*], [*Lá*], [*Ré*], [*Fá*], [*Dó\#*], [*Mib*], [*Láb*]),
    (([Cifra], none, none, none, none, none, none),),
    columns: (1.2fr,) + (1fr,) * 6,
  )
]

#ex(titulo: "Tom ou semitom?", nivel: "Escrita")[
  Escreva *T* (tom) ou *ST* (semitom) para a distância entre as notas, sempre subindo da primeira para a segunda.

  #v(0.3em)
  #tabela-preencher(
    ([*Notas*], [*Dó–Ré*], [*Mi–Fá*], [*Lá–Si*], [*Si–Dó*], [*Fá–Sol*]),
    (([T ou ST], none, none, none, none, none),),
    columns: (1.2fr,) + (1fr,) * 5,
  )
  #v(0.4em)
  #tabela-preencher(
    ([*Notas*], [*Dó–Dó\#*], [*Mi–Fá\#*], [*Sol\#–Lá*], [*Sib–Dó*], [*Ré–Mib*]),
    (([T ou ST], none, none, none, none, none),),
    columns: (1.2fr,) + (1fr,) * 5,
  )
]

#ex(titulo: "Um semitom acima e abaixo", nivel: "Escrita")[
  Escreva a nota que fica um semitom *acima* e um semitom *abaixo* de cada nota. Quando houver dois nomes possíveis, escreva os dois (ex.: C\# / Db).

  #v(0.3em)
  #tabela-preencher(
    ([*Nota*], [*E*], [*B*], [*C*], [*F*], [*A*]),
    (
      ([1 ST acima], none, none, none, none, none),
      ([1 ST abaixo], none, none, none, none, none),
    ),
    columns: (1.3fr,) + (1fr,) * 5,
  )
]

#ex(titulo: "Notas enarmônicas", nivel: "Escrita")[
  Escreva o outro nome (enarmônico) de cada nota.

  #v(0.3em)
  #tabela-preencher(
    ([*Nota*], [*C\#*], [*Eb*], [*F\#*], [*Ab*], [*Bb*], [*E\#*], [*Cb*]),
    (([Enarmônico], none, none, none, none, none, none, none),),
    columns: (1.4fr,) + (1fr,) * 7,
  )
]

#ex(titulo: "Monte escalas maiores", nivel: "Escrita")[
  Use a fórmula T – T – ST – T – T – T – ST para escrever as escalas maiores pedidas (em cifra). Lembre-se: cada letra aparece uma única vez.

  #v(0.3em)
  #tabela-preencher(
    ([*Escala*], [*1*], [*2*], [*3*], [*4*], [*5*], [*6*], [*7*]),
    (
      ([Ré maior], [D], none, none, none, none, none, none),
      ([Fá maior], [F], none, none, none, none, none, none),
      ([Lá maior], [A], none, none, none, none, none, none),
    ),
    columns: (1.4fr,) + (1fr,) * 7,
  )
]

#ex(titulo: "A escala maior numa corda só", nivel: "Escrita + prática")[
  No violão ou na guitarra, a *casa 1 da 2ª corda (Si)* é a nota Dó. Lembrando que 1 semitom = 1 casa e 1 tom = 2 casas, escreva em que casa está cada nota da escala de Dó maior nessa corda. Depois, toque a escala subindo e descendo.

  #v(0.3em)
  #tabela-preencher(
    ([*Nota*], [*Dó*], [*Ré*], [*Mi*], [*Fá*], [*Sol*], [*Lá*], [*Si*], [*Dó*]),
    (([Casa], [1], none, none, none, none, none, none, none),),
    columns: (1.1fr,) + (1fr,) * 8,
  )
]

=== Sugestão de prática

#block(breakable: false, rotina-estudo((
  ([Recitar as notas naturais subindo e descendo, em nome e em cifra], [3 min], [—]),
  ([Dizer T ou ST para pares de notas sorteados], [3 min], [—]),
  ([Escala de Dó maior numa corda só, dizendo o nome das notas], [5 min], [60]),
  ([Montar no papel a escala maior de uma nota sorteada], [5 min], [—]),
)))

#v(0.6em)

#checklist(
  (
    [Traduzo qualquer nota de nome para cifra e de cifra para nome sem hesitar.],
    [Sei que entre Mi–Fá e Si–Dó há só um semitom.],
    [Sei a diferença entre sustenido e bemol e dou o enarmônico de qualquer tecla preta.],
    [Escrevo de memória a fórmula da escala maior (T – T – ST – T – T – T – ST).],
    [Monto a escala maior a partir de qualquer nota, sem repetir letras.],
  ),
  titulo: "Autoavaliação",
)

#gabarito[
  #resposta(1)[G = Sol · E = Mi · B = Si · F\# = Fá sustenido · Bb = Si bemol · D\# = Ré sustenido. \ Lá = A · Ré = D · Fá = F · Dó\# = C\# · Mib = Eb · Láb = Ab.]
  #resposta(2)[Dó–Ré: T · Mi–Fá: ST · Lá–Si: T · Si–Dó: ST · Fá–Sol: T. \ Dó–Dó\#: ST · Mi–Fá\#: T · Sol\#–Lá: ST · Sib–Dó: T · Ré–Mib: ST.]
  #resposta(3)[
    E: acima F · abaixo D\# / Eb. \
    B: acima C · abaixo A\# / Bb. \
    C: acima C\# / Db · abaixo B. \
    F: acima F\# / Gb · abaixo E. \
    A: acima A\# / Bb · abaixo G\# / Ab.
  ]
  #resposta(4)[C\# = Db · Eb = D\# · F\# = Gb · Ab = G\# · Bb = A\# · E\# = F · Cb = B.]
  #resposta(5)[
    Ré maior: D – E – F\# – G – A – B – C\#. \
    Fá maior: F – G – A – Bb – C – D – E (usa-se Bb, e não A\#, para não repetir a letra A). \
    Lá maior: A – B – C\# – D – E – F\# – G\#.
  ]
  #resposta(6)[Dó 1 · Ré 3 · Mi 5 · Fá 6 · Sol 8 · Lá 10 · Si 12 · Dó 13. Repare nos saltos de uma casa só entre Mi–Fá e Si–Dó.]
]
