#import "/templates/layout.typ": *
#import "/templates/components.typ": *

#show: aula.with(
  instrumento: "Guitarra",
  nivel: "Intermediário",
)

// ─── Helpers locais ──────────────────────────────────────────
// arpejo: monta um braco-notas a partir de uma lista de notas
// (corda, casa, rótulo). `raiz` documenta a tônica usada (C, D…).
#let arpejo(raiz: none, fs: 1, casas: 5, largura: 24pt, notas) = {
  let dados = range(6).map(_ => range(casas).map(_ => ""))
  for n in notas {
    let (corda, casa, rotulo) = n
    dados.at(6 - corda).at(casa - fs) = rotulo
  }
  braco-notas(dados, fs: fs, casa-largura: largura)
}

// figura: diagrama + título + subtítulo, sem quebrar entre páginas
#let figura(titulo, sub, corpo) = block(breakable: false, align(center)[
  #corpo
  #v(0.25em)
  #text(size: 10pt, weight: "bold", fill: color-strong)[#titulo] \
  #text(size: 8pt, fill: color-muted)[#sub]
])

= Arpejos

Toda vez que um solo "conversa" com a harmonia, existe um arpejo por trás. Arpejar é tocar as notas de um acorde *uma de cada vez*: em vez de soar como um bloco, o acorde vira melodia. É a ferramenta que separa o improviso que apenas "cabe na escala" do improviso que *descreve cada acorde* da música. Nesta aula você vai montar os arpejos de tríades e tétrades, aprender os desenhos principais no braço e usá-los para seguir uma progressão.

#objetivos((
  [Diferenciar acorde, arpejo e escala e entender quando usar cada um],
  [Construir arpejos de tríades (maior, menor, diminuta, aumentada) e de tétrades (7M, 7, m7, m7(b5), º7) pela fórmula],
  [Tocar os desenhos com tônica na 6ª e na 5ª corda, identificando cada intervalo],
  [Aplicar digitação e palhetada adequadas (sweep leve e palhetada alternada)],
  [Arpejar o campo harmônico maior numa região e seguir a harmonia de um II-V-I],
))

== 1. Acorde, arpejo e escala

Os três conceitos usam as mesmas notas, mas cumprem papéis diferentes. Tome como referência o acorde de *Dó maior com sétima maior* (C7M):

#cartoes-info((
  (titulo: "ACORDE", corpo: [
    As notas soam *ao mesmo tempo*. \
    C7M = C, E, G, B tocados juntos. \
    Função: *harmonia*, base rítmica.
  ]),
  (titulo: "ARPEJO", corpo: [
    As *mesmas notas do acorde*, tocadas *uma a uma*. \
    C → E → G → B → C… \
    Função: *melodia que descreve o acorde*.
  ]),
  (titulo: "ESCALA", corpo: [
    Todas as notas do tom, *em graus conjuntos*. \
    C D E F G A B. \
    Função: *vocabulário completo*, inclui notas de passagem.
  ]),
))

#v(0.6em)

Repare que o arpejo é um *subconjunto* da escala: de cada sete notas da escala maior, o arpejo de tétrade escolhe quatro (graus 1, 3, 5 e 7). São exatamente as notas que *não* criam choque com o acorde. Por isso uma frase construída sobre o arpejo sempre soa "dentro", mesmo nos tempos fortes.

#caixa(tipo: "resumo")[
  *Acorde* = notas juntas. *Arpejo* = notas do acorde separadas. *Escala* = arpejo + notas de passagem. Pense no arpejo como o "esqueleto" da escala para cada acorde.
]

== 2. As fórmulas

Um arpejo é definido pela mesma fórmula de intervalos do acorde correspondente. Os exemplos abaixo usam sempre *Dó (C)* como tônica, para que você compare apenas os intervalos. Nas fórmulas, *7* indica a sétima menor e *7M*, a sétima maior.

=== Tríades (3 notas)

#tabela(
  columns: (1.3fr, 0.9fr, 1.3fr, 1.3fr, 2fr),
  ([Tipo], [Cifra], [Fórmula], [Notas em C], [Distâncias]),
  (
    ([Maior], [C], [T · 3 · 5], [C · E · G], [2 tons + 1½ tom]),
    ([Menor], [Cm], [T · b3 · 5], [C · Eb · G], [1½ tom + 2 tons]),
    ([Diminuta], [Cº], [T · b3 · b5], [C · Eb · Gb], [1½ tom + 1½ tom]),
    ([Aumentada], [C+], [T · 3 · \#5], [C · E · G\#], [2 tons + 2 tons]),
  ),
)

=== Tétrades (4 notas)

#tabela(
  columns: (1.6fr, 1.1fr, 1.5fr, 1.5fr, 1.6fr),
  ([Tipo], [Cifra], [Fórmula], [Notas em C], [Onde aparece]),
  (
    ([Maior com 7ª maior], [C7M], [T · 3 · 5 · 7M], [C · E · G · B], [I e IV do tom maior]),
    ([Dominante], [C7], [T · 3 · 5 · 7], [C · E · G · Bb], [V do tom maior]),
    ([Menor com 7ª], [Cm7], [T · b3 · 5 · 7], [C · Eb · G · Bb], [II, III e VI]),
    ([Meio-diminuto], [Cm7(b5)], [T · b3 · b5 · 7], [C · Eb · Gb · Bb], [VII do tom maior]),
    ([Diminuto], [Cº7], [T · b3 · b5 · bb7], [C · Eb · Gb · Bbb], [VII da menor harmônica]),
  ),
)

#v(0.4em)

#caixa(tipo: "atencao")[
  No Cº7 a sétima é *diminuta* (bb7): escrevemos Bbb, que soa igual a Lá (A). No braço você toca a casa de Lá, mas o *intervalo* continua sendo bb7 — por isso o diagrama mostra "bb7", e não "6".
]

=== Como ler os diagramas

Os desenhos das próximas páginas são *móveis*: aprenda-os com tônica em Dó e depois arraste-os para qualquer tom, usando a tônica como âncora. O círculo preto é a tônica (T), cada círculo branco traz o intervalo em relação a ela e a primeira linha é a 6ª corda (Mi grave). Os nomes vêm do sistema CAGED, que leva as formas abertas de C, A, G, E e D para qualquer ponto do braço com pestana:

- *Tônica na 6ª corda* (C na casa 8): derivam da forma de *Mi* do CAGED. A tônica aparece três vezes — 6ª corda casa 8, 4ª corda casa 10 e 1ª corda casa 8 —, cobrindo duas oitavas.
- *Tônica na 5ª corda* (C na casa 3): derivam da forma de *Lá* do CAGED. A tônica aparece na 5ª corda (casa 3) e na 3ª corda (casa 5). A 6ª corda fica livre: quando dominar o desenho, acrescente as notas do acorde que estiverem nela, na mesma região.

#pagebreak()

== 3. Desenhos de tríades

=== Tônica na 6ª corda — C na 8ª casa

#align(center, grid(
  columns: 4,
  column-gutter: 8pt,
  figura([C — maior], [T · 3 · 5], arpejo(raiz: "C", fs: 7, largura: 19pt, (
    (6, 8, "T"), (5, 7, "3"), (5, 10, "5"), (4, 10, "T"), (3, 9, "3"), (2, 8, "5"), (1, 8, "T"),
  ))),
  figura([Cm — menor], [T · b3 · 5], arpejo(raiz: "C", fs: 7, largura: 19pt, (
    (6, 8, "T"), (6, 11, "b3"), (5, 10, "5"), (4, 10, "T"), (3, 8, "b3"), (2, 8, "5"), (1, 8, "T"), (1, 11, "b3"),
  ))),
  figura([Cº — diminuta], [T · b3 · b5], arpejo(raiz: "C", fs: 7, largura: 19pt, (
    (6, 8, "T"), (6, 11, "b3"), (5, 9, "b5"), (4, 10, "T"), (3, 8, "b3"), (2, 7, "b5"), (1, 8, "T"), (1, 11, "b3"),
  ))),
  figura([C+ — aumentada], [T · 3 · \#5], arpejo(raiz: "C", fs: 7, largura: 19pt, (
    (6, 8, "T"), (5, 7, "3"), (5, 11, "#5"), (4, 10, "T"), (3, 9, "3"), (2, 9, "#5"), (1, 8, "T"),
  ))),
))

=== Tônica na 5ª corda — C na 3ª casa

#align(center, grid(
  columns: 4,
  column-gutter: 8pt,
  figura([C — maior], [T · 3 · 5], arpejo(raiz: "C", fs: 2, largura: 19pt, (
    (5, 3, "T"), (4, 2, "3"), (4, 5, "5"), (3, 5, "T"), (2, 5, "3"), (1, 3, "5"),
  ))),
  figura([Cm — menor], [T · b3 · 5], arpejo(raiz: "C", fs: 2, largura: 19pt, (
    (5, 3, "T"), (5, 6, "b3"), (4, 5, "5"), (3, 5, "T"), (2, 4, "b3"), (1, 3, "5"),
  ))),
  figura([Cº — diminuta], [T · b3 · b5], arpejo(raiz: "C", fs: 2, largura: 19pt, (
    (5, 3, "T"), (5, 6, "b3"), (4, 4, "b5"), (3, 5, "T"), (2, 4, "b3"), (1, 2, "b5"),
  ))),
  figura([C+ — aumentada], [T · 3 · \#5], arpejo(raiz: "C", fs: 2, largura: 19pt, (
    (5, 3, "T"), (4, 2, "3"), (4, 6, "#5"), (3, 5, "T"), (2, 5, "3"), (1, 4, "#5"),
  ))),
))

#v(0.6em)

#caixa(tipo: "dica")[
  Compare os quatro desenhos de cada linha: eles partem do *mesmo* desenho maior e mudam *uma nota por vez*. Menor = abaixe a 3ª um semitom; diminuta = abaixe também a 5ª; aumentada = suba a 5ª. Pensar nas alterações é mais rápido do que decorar quatro desenhos independentes.
]

#pagebreak()

== 4. Desenhos de tétrades

Para as tétrades, basta acrescentar a sétima ao desenho da tríade. Os desenhos ocupam cinco casas: use um dedo por casa e permita uma pequena extensão do dedo 1 ou do dedo 4 quando necessário.

=== Tônica na 6ª corda — C na 8ª casa

#align(center, grid(
  columns: 3,
  column-gutter: 14pt,
  row-gutter: 10pt,
  figura([C7M], [T · 3 · 5 · 7M #h(4pt) (C E G B)], arpejo(raiz: "C", fs: 7, (
    (6, 8, "T"), (5, 7, "3"), (5, 10, "5"), (4, 9, "7M"), (4, 10, "T"), (3, 9, "3"), (2, 8, "5"), (1, 7, "7M"), (1, 8, "T"),
  ))),
  figura([C7], [T · 3 · 5 · 7 #h(4pt) (C E G Bb)], arpejo(raiz: "C", fs: 7, (
    (6, 8, "T"), (5, 7, "3"), (5, 10, "5"), (4, 8, "7"), (4, 10, "T"), (3, 9, "3"), (2, 8, "5"), (2, 11, "7"), (1, 8, "T"),
  ))),
  figura([Cm7], [T · b3 · 5 · 7 #h(4pt) (C Eb G Bb)], arpejo(raiz: "C", fs: 7, (
    (6, 8, "T"), (6, 11, "b3"), (5, 10, "5"), (4, 8, "7"), (4, 10, "T"), (3, 8, "b3"), (2, 8, "5"), (2, 11, "7"), (1, 8, "T"), (1, 11, "b3"),
  ))),
))

#v(0.2em)

#align(center, grid(
  columns: 2,
  column-gutter: 14pt,
  figura([Cm7(b5) — meio-diminuto], [T · b3 · b5 · 7 #h(4pt) (C Eb Gb Bb)], arpejo(raiz: "C", fs: 7, (
    (6, 8, "T"), (6, 11, "b3"), (5, 9, "b5"), (4, 8, "7"), (4, 10, "T"), (3, 8, "b3"), (2, 7, "b5"), (2, 11, "7"), (1, 8, "T"), (1, 11, "b3"),
  ))),
  figura([Cº7], [T · b3 · b5 · bb7 #h(4pt) (C Eb Gb A)], arpejo(raiz: "C", fs: 7, (
    (6, 8, "T"), (6, 11, "b3"), (5, 9, "b5"), (4, 7, "bb7"), (4, 10, "T"), (3, 8, "b3"), (2, 7, "b5"), (2, 10, "bb7"), (1, 8, "T"), (1, 11, "b3"),
  ))),
))

#v(0.6em)

#caixa(tipo: "dica", titulo: "Transposição")[
  Para transpor, mova o desenho inteiro até a tônica desejada. Exemplos: Dm7 com tônica na 5ª corda começa na casa 5; G7 com tônica na 6ª corda começa na casa 3; Bm7(b5) com tônica na 6ª corda começa na casa 7.
]

=== Tônica na 5ª corda — C na 3ª casa

#align(center, grid(
  columns: 3,
  column-gutter: 14pt,
  row-gutter: 10pt,
  figura([C7M], [T · 3 · 5 · 7M #h(4pt) (C E G B)], arpejo(raiz: "C", fs: 2, (
    (5, 3, "T"), (4, 2, "3"), (4, 5, "5"), (3, 4, "7M"), (3, 5, "T"), (2, 5, "3"), (1, 3, "5"),
  ))),
  figura([C7], [T · 3 · 5 · 7 #h(4pt) (C E G Bb)], arpejo(raiz: "C", fs: 2, (
    (5, 3, "T"), (4, 2, "3"), (4, 5, "5"), (3, 3, "7"), (3, 5, "T"), (2, 5, "3"), (1, 3, "5"), (1, 6, "7"),
  ))),
  figura([Cm7], [T · b3 · 5 · 7 #h(4pt) (C Eb G Bb)], arpejo(raiz: "C", fs: 2, (
    (5, 3, "T"), (5, 6, "b3"), (4, 5, "5"), (3, 3, "7"), (3, 5, "T"), (2, 4, "b3"), (1, 3, "5"), (1, 6, "7"),
  ))),
))

#v(0.2em)

#align(center, grid(
  columns: 2,
  column-gutter: 14pt,
  figura([Cm7(b5) — meio-diminuto], [T · b3 · b5 · 7 #h(4pt) (C Eb Gb Bb)], arpejo(raiz: "C", fs: 2, (
    (5, 3, "T"), (5, 6, "b3"), (4, 4, "b5"), (3, 3, "7"), (3, 5, "T"), (2, 4, "b3"), (1, 2, "b5"), (1, 6, "7"),
  ))),
  figura([Cº7], [T · b3 · b5 · bb7 #h(4pt) (C Eb Gb A)], arpejo(raiz: "C", fs: 2, (
    (5, 3, "T"), (5, 6, "b3"), (4, 4, "b5"), (3, 2, "bb7"), (3, 5, "T"), (2, 4, "b3"), (1, 2, "b5"), (1, 5, "bb7"),
  ))),
))

== 5. Digitação e palhetada

Um arpejo bem tocado soa como *notas separadas*, nunca como um acorde "arrastado". Três cuidados fazem a diferença:

#passos((
  [*Uma nota soa de cada vez.* Ao passar para a corda seguinte, alivie a pressão do dedo anterior (sem tirá-lo da corda) para abafar a nota que já soou. A mão da palheta também ajuda, encostando levemente nas cordas graves.],
  [*Rolagem de dedo.* Quando duas cordas vizinhas pedem a mesma casa (por exemplo, 2ª e 1ª cordas na casa 8 do arpejo de C), use um único dedo e "role" a ponta para a almofada: a primeira nota se apaga quando a segunda soa.],
  [*Escolha a palhetada pelo desenho.* Desenhos com *uma nota por corda* pedem palhetada em varredura (sweep); desenhos com *duas notas por corda* funcionam melhor com palhetada alternada ou com ligados.],
))

=== Sweep leve (varredura)

Na varredura, a palheta atravessa as cordas num único movimento contínuo: para baixo (↓) na subida do arpejo e para cima (↑) na descida. Não é uma "batida": cada nota é articulada separadamente, como se a palheta "caísse" de uma corda para a próxima. Quando houver duas notas na mesma corda, use ligado (h = hammer-on, p = pull-off).

#tab(
  titulo: "Exemplo 1 — Arpejo de C (tônica na 6ª corda) com sweep leve",
  legenda: [Comece a 50 BPM em colcheias. O objetivo é ouvir sete notas separadas, com o mesmo volume, e não um acorde.],
  "   ↓  ↓  h  ↓  ↓  ↓  ↓       ↑  ↑  ↑  ↑  p  ↑\ne|-------------------8-----|-------------------------|\nB|----------------8--------|-8-----------------------|\nG|-------------9-----------|----9--------------------|\nD|----------10-------------|-------10----------------|\nA|----7--10----------------|----------10-7-----------|\nE|-8-----------------------|----------------8--------|",
)

=== Palhetada alternada

Nos desenhos com duas notas por corda, como o Cm7 com tônica na 6ª corda, a palhetada alternada (↓~↑~↓~↑) mantém a regularidade rítmica e é mais fácil de controlar no começo. Toque em tercinas (três notas por tempo, acentuando a primeira de cada grupo): cada trecho entre barras dura dois tempos.

#tab(
  titulo: "Exemplo 2 — Cm7 (tônica na 6ª corda) com palhetada alternada",
  legenda: [Sobe até o Eb da 1ª corda, desce até a 6ª e resolve na tônica.],
  "   ↓  ↑  ↓  ↑  ↓  ↑    ↓  ↑  ↓  ↑  ↓  ↑    ↓  ↑  ↓  ↑  ↓  ↑    ↓\ne|-------------------|-------8--11-8-----|-------------------|----------|\nB|-------------------|-8--11----------11-|-8-----------------|----------|\nG|----------------8--|-------------------|----8--------------|----------|\nD|----------8--10----|-------------------|-------10-8--------|----------|\nA|-------10----------|-------------------|-------------10----|----------|\nE|-8--11-------------|-------------------|----------------11-|-8--------|",
)

#v(0.4em)

#cartoes-info((
  (titulo: "Sweep leve", corpo: [Ideal para uma nota por corda. Economiza movimento e permite velocidade, mas exige abafamento rigoroso e sincronia entre as mãos. Comece *devagar*: a pressa transforma o arpejo em acorde.]),
  (titulo: "Palhetada alternada", corpo: [Ideal para duas notas por corda e para tempos lentos e médios. O controle rítmico é maior, mas os saltos de corda exigem precisão. Ótima para treinar o arpejo com metrônomo.]),
))

== 6. Aplicação: o campo harmônico de C numa região

Agora junte tudo: arpeje os sete acordes do campo harmônico de Dó maior (as tétrades formadas sobre cada grau da escala de Dó, empilhando terças só com notas da escala) *sem sair da região entre as casas 7 e 10* (posição VII). A mão esquerda fica parada, com um dedo por casa; só muda o desenho que você "enxerga" dentro dela. É assim que se aprende a enxergar os arpejos dentro da escala.

#tabela(
  columns: (0.7fr, 1.1fr, 1.4fr, 1.4fr, 1.5fr),
  ([Grau], [Acorde], [Tipo], [Notas], [Tônica na região]),
  (
    ([I], [C7M], [7M], [C · E · G · B], [6ª corda, casa 8]),
    ([IIm7], [Dm7], [m7], [D · F · A · C], [6ª corda, casa 10]),
    ([IIIm7], [Em7], [m7], [E · G · B · D], [5ª corda, casa 7]),
    ([IV7M], [F7M], [7M], [F · A · C · E], [5ª corda, casa 8]),
    ([V7], [G7], [7 (dominante)], [G · B · D · F], [5ª corda, casa 10]),
    ([VIm7], [Am7], [m7], [A · C · E · G], [4ª corda, casa 7]),
    ([VIIø], [Bm7(b5)], [m7(b5)], [B · D · F · A], [6ª corda, casa 7]),
  ),
)

#v(0.4em)

Cada compasso sobe o arpejo da tônica até a oitava (T · 3 · 5 · 7ª · T) e desce até a 3ª, em colcheias. Diga em voz alta o nome do acorde ao começar cada compasso.

#tab(
  titulo: "Exemplo 3 — Campo harmônico de C arpejado na posição VII",
  tamanho: 8.2pt,
  legenda: [Quando estiver seguro, suba duas oitavas nos acordes que cabem inteiros na região (C7M, Dm7, Em7 e Bm7(b5)).],
  "   C7M                       Dm7                       Em7\ne|-------------------------|-------------------------|-------------------------|\nB|-------------------------|-------------------------|-------------------------|\nG|-------------------------|-------------7-----------|----------7--9--7--------|\nD|----------9--10-9--------|-------7--10----10-7-----|-------9-----------9-----|\nA|----7--10----------10-7--|----8-----------------8--|-7--10----------------10-|\nE|-8-----------------------|-10----------------------|-------------------------|\n   1  &  2  &  3  &  4  &    1  &  2  &  3  &  4  &    1  &  2  &  3  &  4  &\n\n   F7M                       G7                        Am7\ne|-------------------------|-------------------------|-------------------------|\nB|-------------------------|-------------8-----------|----------8--10-8--------|\nG|----------9--10-9--------|-------7--10----10-7-----|-------9-----------9-----|\nD|----7--10----------10-7--|----9-----------------9--|-7--10----------------10-|\nA|-8-----------------------|-10----------------------|-------------------------|\nE|-------------------------|-------------------------|-------------------------|\n   1  &  2  &  3  &  4  &    1  &  2  &  3  &  4  &    1  &  2  &  3  &  4  &\n\n   Bm7(b5)                   C7M\ne|-------------------------|-------------|\nB|-------------------------|-------------|\nG|-------------------------|-------------|\nD|----------7--9--7--------|-------------|\nA|-------8-----------8-----|-------------|\nE|-7--10----------------10-|-8-----------|\n   1  &  2  &  3  &  4  &    1",
)

#pagebreak()

== 7. Seguindo a harmonia: o II-V-I

No campo harmônico, cada arpejo começava "do zero" na tônica. Num solo real, a habilidade mais importante é *trocar de arpejo junto com o acorde, sem saltos*: a última nota de um compasso deve levar à nota mais próxima do acorde seguinte. Veja, na mesma posição VII, o II-V-I de Dó maior (Dm7 – G7 – C7M), a cadência mais comum do jazz e da MPB: preparação (IIm7), tensão (V7) e resolução (I).

#tab(
  titulo: "Exemplo 4 — Dm7 – G7 – C7M seguindo a harmonia",
  tamanho: 7.6pt,
  legenda: [Dm7 sobe; G7 desce; C7M sobe e resolve na tônica. Todas as notas pertencem ao acorde do compasso.],
  "   Dm7                       G7                        C7M                       C7M\ne|----------------------8--|-7-----------------------|----------------------7--|-8-----------|\nB|-------------------10----|----8--------------------|-------------------8-----|-------------|\nG|-------------7--10-------|-------10-7--------------|----------------9--------|-------------|\nD|-------7--10-------------|-------------9-----------|----------9--10----------|-------------|\nA|----8--------------------|----------------10-8-----|----7--10----------------|-------------|\nE|-10----------------------|----------------------10-|-8-----------------------|-------------|\n   1  &  2  &  3  &  4  &    1  &  2  &  3  &  4  &    1  &  2  &  3  &  4  &    1",
)

#v(0.4em)

Observe as *emendas* entre os compassos:

- *Dm7 → G7:* o compasso de Dm7 termina em Dó (C, a 7ª do Dm7, 1ª corda casa 8) e o G7 começa em Si (B, a 3ª do G7, casa 7). Um semitom de distância — a mesma condução de vozes que existe dentro da cadência.
- *G7 → C7M:* o G7 termina em Ré (D, a 5ª, 6ª corda casa 10) e o C7M começa em Dó (C, a tônica, casa 8). Um tom de distância.
- *C7M → final:* a frase sobe até Si (7M) e resolve um semitom acima, em Dó.

=== Variações para praticar

#passos((
  [*Inverta as direções:* desça o Dm7 a partir do Dó da 1ª corda, suba o G7 e desça o C7M. As emendas mudam — encontre de novo a nota mais próxima em cada troca.],
  [*Comece por outra nota do acorde:* inicie cada compasso pela 3ª ou pela 5ª, e não pela tônica. Isso tira o arpejo do "exercício" e o aproxima de uma frase.],
  [*Mude o ritmo:* toque em semínimas (quatro notas por compasso) e escolha, em cada troca, a nota do acorde novo que esteja a um semitom ou um tom da anterior.],
))

#caixa(tipo: "dica")[
  A passagem 7ª do acorde → 3ª do acorde seguinte (C → B) é o segredo das linhas que "soam jazz". Essas duas notas, 3ª e 7ª, são as *guide tones* (notas-guia): são elas que definem a qualidade de cada acorde, e mirar nelas a cada troca faz o solo "desenhar" a progressão.
]

#pagebreak()

== 8. Exercícios

#exercicio(titulo: "Monte os arpejos", nivel: "Escrita")[
  Escreva a fórmula e as notas de cada arpejo. Use a grafia correta (por exemplo, a 3ª de A é C\#, e não Db).

  #tabela-preencher(
    ([Arpejo], [Fórmula], [Notas]),
    (
      ([G7M], none, none),
      ([A7], none, none),
      ([Em7], none, none),
      ([F\#m7(b5)], none, none),
      ([Bº7], none, none),
      ([D+], none, none),
      ([Fm], none, none),
      ([Eº], none, none),
    ),
    columns: (1fr, 1.6fr, 1.6fr),
  )
]

#exercicio(titulo: "Qual é o arpejo?", nivel: "Escrita")[
  Dê a cifra do arpejo formado por cada grupo de notas (a primeira nota é a tônica).

  #grid(
    columns: (1fr, 1fr),
    column-gutter: 2em,
    row-gutter: 1.1em,
    [a) F · A · C · E #h(1fr) #box(width: 3.2cm, line(length: 100%, stroke: 0.5pt + color-rule-light))],
    [b) Bb · D · F · Ab #h(1fr) #box(width: 3.2cm, line(length: 100%, stroke: 0.5pt + color-rule-light))],
    [c) E · G · Bb · D #h(1fr) #box(width: 3.2cm, line(length: 100%, stroke: 0.5pt + color-rule-light))],
    [d) G\# · B · D · F #h(1fr) #box(width: 3.2cm, line(length: 100%, stroke: 0.5pt + color-rule-light))],
    [e) D · F · A · C #h(1fr) #box(width: 3.2cm, line(length: 100%, stroke: 0.5pt + color-rule-light))],
    [f) A · C\# · E\# #h(1fr) #box(width: 3.2cm, line(length: 100%, stroke: 0.5pt + color-rule-light))],
    [g) C\# · E · G #h(1fr) #box(width: 3.2cm, line(length: 100%, stroke: 0.5pt + color-rule-light))],
    [h) Eb · G · Bb · D #h(1fr) #box(width: 3.2cm, line(length: 100%, stroke: 0.5pt + color-rule-light))],
  )
]

#exercicio(titulo: "Transponha os desenhos", nivel: "Braço")[
  Desenhe cada arpejo no braço, escrevendo o *intervalo* dentro de cada nota (T, 3, b3, 5, 7…).

  #v(0.3em)
  #align(center, grid(
    columns: 2,
    column-gutter: 2em,
    align(center)[
      #braco-vazio(casas: 5, fs: 2)
      #v(0.2em)
      #text(size: 9pt)[*a)* G7 — tônica na 6ª corda, casa 3]
    ],
    align(center)[
      #braco-vazio(casas: 5, fs: 4)
      #v(0.2em)
      #text(size: 9pt)[*b)* Dm7 — tônica na 5ª corda, casa 5]
    ],
  ))
]

#exercicio(titulo: "Campo harmônico de G", nivel: "Escrita")[
  Complete o campo harmônico de Sol maior com o acorde, o tipo de arpejo e as notas de cada grau.

  #tabela-preencher(
    ([Grau], [Acorde], [Tipo de arpejo], [Notas]),
    (
      ([I], none, none, none),
      ([IIm7], none, none, none),
      ([IIIm7], none, none, none),
      ([IV7M], none, none, none),
      ([V7], none, none, none),
      ([VIm7], none, none, none),
      ([VIIø], none, none, none),
    ),
    columns: (0.7fr, 1fr, 1.2fr, 1.8fr),
  )
]

#exercicio(titulo: "Seguindo a harmonia em G", nivel: "Tablatura")[
  Escreva uma linha de colcheias sobre *Am7 – D7 – G7M – G7M* (um compasso cada), usando apenas notas do acorde de cada compasso. Regra: a primeira nota de cada compasso deve estar a, no máximo, um tom da última nota do compasso anterior. Termine na tônica de G7M.

  #tab-vazia(sistemas: 2, compassos: 2, altura-linha: 10pt)
]

#exercicio(titulo: "A nota mais próxima", nivel: "Escrita")[
  Uma frase termina na nota indicada sobre o primeiro acorde. Escreva a nota do acorde *seguinte* mais próxima dela (nota comum, semitom ou tom) e diga que intervalo ela é nesse acorde.

  #tabela-preencher(
    ([Última nota], [Troca de acorde], [Nota mais próxima], [Intervalo no novo acorde]),
    (
      ([C], [Dm7 → G7], none, none),
      ([F], [G7 → C7M], none, none),
      ([E], [C7M → A7], none, none),
      ([B], [G7 → Am7], none, none),
      ([D], [Bm7(b5) → E7], none, none),
    ),
    columns: (1fr, 1.3fr, 1.3fr, 1.5fr),
  )
]

#exercicio(titulo: "Sweep leve com metrônomo", nivel: "Prática")[
  Toque os quatro arpejos de tríade com tônica na 6ª corda (C, Cm, Cº, C+) em colcheias, subindo e descendo com sweep leve, como no Exemplo 1. Comece a 50 BPM e suba de 5 em 5 BPM somente quando conseguir três repetições seguidas com todas as notas separadas e de mesmo volume.

  Anote seu BPM máximo limpo: #box(width: 3cm, line(length: 100%, stroke: 0.5pt + color-rule-light))
]

#exercicio(titulo: "Campo harmônico sem parar", nivel: "Prática")[
  Toque o Exemplo 3 inteiro (C7M até Bm7(b5) e de volta a C7M) sem interrupções, a 60 BPM. Depois repita a mesma ideia na região das casas 2 a 5, começando pelo C7M com tônica na 5ª corda (casa 3).
]

#v(0.8em)

#block(breakable: false)[
=== Sugestão de prática

#rotina-estudo((
  ([Tríades C, Cm, Cº, C+ — tônica na 6ª e na 5ª corda], [5 min], [60–80]),
  ([Tétrades 7M, 7, m7, m7(b5), º7 — tônica na 6ª corda], [5 min], [60–80]),
  ([Tétrades 7M, 7, m7, m7(b5), º7 — tônica na 5ª corda], [5 min], [60–80]),
  ([Sweep leve (Exemplo 1) e alternada (Exemplo 2)], [5 min], [50–70]),
  ([Campo harmônico de C na posição VII (Exemplo 3)], [10 min], [60–90]),
  ([II-V-I seguindo a harmonia, em C e em G (Exemplo 4)], [10 min], [70–100]),
))

#v(0.8em)

#checklist(titulo: "Autoavaliação", (
  [Sei explicar a diferença entre acorde, arpejo e escala.],
  [Escrevo as notas de qualquer tríade ou tétrade a partir da fórmula.],
  [Toco os desenhos de tríade e tétrade com tônica na 6ª e na 5ª corda dizendo o intervalo de cada nota.],
  [Transponho os desenhos para qualquer tom usando a tônica como âncora.],
  [No sweep leve, ouço notas separadas, e não um acorde.],
  [Arpejo o campo harmônico de C na posição VII sem parar.],
  [Troco de arpejo junto com o acorde num II-V-I, ligando os compassos por grau conjunto.],
))
]

#gabarito[
  #resposta(1)[
    #grid(
      columns: (1fr, 1fr),
      row-gutter: 0.55em,
      [G7M: T 3 5 7M → G B D F\#], [A7: T 3 5 7 → A C\# E G],
      [Em7: T b3 5 7 → E G B D], [F\#m7(b5): T b3 b5 7 → F\# A C E],
      [Bº7: T b3 b5 bb7 → B D F Ab], [D+: T 3 \#5 → D F\# A\#],
      [Fm: T b3 5 → F Ab C], [Eº: T b3 b5 → E G Bb],
    )
  ]
  #resposta(2)[
    a) F7M · b) Bb7 · c) Em7(b5) · d) G\#º7 · e) Dm7 · f) A+ (E\# é a \#5 de Lá) · g) C\#º · h) Eb7M.
  ]
  #resposta(3)[
    #grid(
      columns: (1fr, 1fr),
      column-gutter: 1em,
      align(center)[
        #arpejo(raiz: "G", fs: 2, (
          (6, 3, "T"), (5, 2, "3"), (5, 5, "5"), (4, 3, "7"), (4, 5, "T"), (3, 4, "3"), (2, 3, "5"), (2, 6, "7"), (1, 3, "T"),
        ))
        #text(size: 8.5pt)[a) G7: G B D F — desenho do C7 deslocado 5 casas para baixo.]
      ],
      align(center)[
        #arpejo(raiz: "D", fs: 4, (
          (5, 5, "T"), (5, 8, "b3"), (4, 7, "5"), (3, 5, "7"), (3, 7, "T"), (2, 6, "b3"), (1, 5, "5"), (1, 8, "7"),
        ))
        #text(size: 8.5pt)[b) Dm7: D F A C — desenho do Cm7 deslocado 2 casas para cima.]
      ],
    )
  ]
  #resposta(4)[
    #grid(
      columns: (1fr, 1fr),
      row-gutter: 0.55em,
      [I: G7M (7M) — G B D F\#], [IIm7: Am7 (m7) — A C E G],
      [IIIm7: Bm7 (m7) — B D F\# A], [IV7M: C7M (7M) — C E G B],
      [V7: D7 (dominante) — D F\# A C], [VIm7: Em7 (m7) — E G B D],
      [VIIø: F\#m7(b5) (meio-diminuto) — F\# A C E], [],
    )
  ]
  #resposta(5)[
    Há várias respostas corretas. Sugestão: o Exemplo 4 transposto cinco casas para baixo (posição II). As emendas Am7 → D7 (G → F\#) e D7 → G7M (A → G) andam por grau conjunto.
    #tab(
      tamanho: 7.6pt,
      "   Am7                       D7                        G7M                       G7M\ne|----------------------3--|-2-----------------------|----------------------2--|-3-----------|\nB|-------------------5-----|----3--------------------|-------------------3-----|-------------|\nG|-------------2--5--------|-------5--2--------------|----------------4--------|-------------|\nD|-------2--5--------------|-------------4-----------|----------4--5-----------|-------------|\nA|----3--------------------|----------------5--3-----|----2--5-----------------|-------------|\nE|-5-----------------------|----------------------5--|-3-----------------------|-------------|",
    )
  ]
  #resposta(6)[
    C → B (3ª do G7, semitom abaixo) · F → E (3ª do C7M, semitom abaixo) · E → E (5ª do A7, nota comum) · B → C (b3 do Am7, semitom acima) · D → D (7ª do E7, nota comum).
  ]
  #resposta(7)[
    Exercício prático — critério de sucesso: três repetições seguidas de cada arpejo, sem notas soando juntas, com a palheta sempre no sentido indicado (↓ na subida, ↑ na descida).
  ]
  #resposta(8)[
    Exercício prático — critério de sucesso: os sete compassos tocados em sequência, sem pausas nem notas fora do acorde, nas duas regiões (posição VII e casas 2 a 5).
  ]
]
