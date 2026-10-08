#import "/templates/layout.typ": *
#import "/templates/components.typ": *
#import "@preview/conchord:0.4.0": new-chordgen

#show: aula.with(
  instrumento: "Guitarra",
  nivel: "Avançado",
)

#let chord = new-chordgen(number-to-left: true, use-shadow-barre: false, colors: (hold: black, barre: black))
#show <chord>: set text(fill: color-strong, weight: "bold")
#let junto(body) = block(width: 100%, breakable: false, body)
#let legenda(body) = align(center, text(size: 8.5pt, fill: color-muted, body))

// Progressão em compassos: | A | B C | ...
#let compassos(..cs) = align(center, box(
  fill: color-subtle-bg,
  stroke: 0.5pt + color-rule-dark,
  radius: 4pt,
  inset: (x: 10pt, y: 7pt),
  text(size: 10.5pt, weight: "bold", fill: color-strong, "| " + cs.pos().join(" | ") + " |"),
))

= Rearmonização

Rearmonizar é trocar os acordes de uma música sem trocar a sua melodia. É o que fazem os arranjadores de bossa nova, os pianistas de jazz ao reexpor um tema e os violonistas que acompanham cantores: a canção continua reconhecível, mas ganha cor, movimento e surpresa. Nesta aula você vai aprender a regra que decide se um acorde "cabe" sob uma nota, oito técnicas de rearmonização em ordem crescente de complexidade e um método para aplicá-las passo a passo.

#objetivos((
  [Verificar se um acorde é compatível com a nota da melodia (nota do acorde, tensão disponível ou nota evitada)],
  [Aplicar substituição diatônica, dominantes secundários, II-V relacionado e SubV],
  [Usar diminutos de passagem, empréstimo modal, pedal, baixo cromático e back-door],
  [Rearmonizar uma progressão e uma melodia em etapas, justificando cada escolha],
))

== 1. O que é rearmonizar — e quando fazer

Toda melodia admite muitas harmonias. A harmonia original costuma ser a mais simples e direta; a rearmonização propõe *outro caminho que leva ao mesmo lugar*. Ela faz sentido quando há espaço para isso:

#cartoes-info((
  (titulo: "Arranjos", corpo: [Introduções, finais, interlúdios e versões instrumentais (solo guitar, chord melody).]),
  (titulo: "Reexposição", corpo: [Na segunda vez do tema, uma harmonia nova renova a escuta sem mudar a canção.]),
  (titulo: "Acompanhamento", corpo: [Com cantor, rearmonize com moderação: o cantor precisa reconhecer o "chão".]),
))

Evite rearmonizar quando a harmonia original é a identidade da música (um riff, uma cadência famosa) ou quando a troca atrapalha quem está cantando. Rearmonização boa soa *inevitável*, não exibicionista.

=== A regra de ouro: respeitar a melodia

Antes de escolher qualquer acorde, olhe a nota da melodia naquele ponto — sobretudo as notas *longas* e as que caem em *tempo forte*. Ela precisa ser *nota do acorde* ou *tensão disponível*. Se for uma *nota evitada* (avoid note), o choque vai soar como erro, não como cor.

#tabela(
  columns: (1.2fr, 1.5fr, 2fr, 1.7fr),
  ([*Acorde*], [*Notas do acorde*], [*Tensões disponíveis*], [*Evite na melodia*]),
  (
    ([7M (I, IV)], [T 3 5 7M], [9, 13; \#11 (lídio, no IV)], [11 (4ª justa) longa]),
    ([m7 (IIm, VIm)], [T b3 5 7], [9, 11; 13 no IIm7 (dórico)], [b13 (b6), 7M]),
    ([m7 (IIIm)], [T b3 5 7], [11], [b9, b13]),
    ([7 (dominante)], [T 3 5 7], [9, 13; b9, \#9, \#11, b13 (alterações)], [11 (exceto sus4), 7M]),
    ([m7(b5)], [T b3 b5 7], [11, b13; 9 (lócrio \#2)], [b9]),
    ([º7], [T b3 b5 bb7], [um tom acima de cada nota do acorde], [notas a ½ tom acima]),
  ),
)

#caixa(tipo: "atencao", titulo: "Notas de passagem")[
  Uma nota curta, de passagem, entre duas notas do acorde, tolera quase qualquer harmonia. O teste importa nas notas que *ficam*: as longas, as acentuadas e as que caem na troca de acorde.
]

== 2. As técnicas, da mais simples à mais complexa

=== Técnica 1 — Substituição diatônica por função

Acordes da mesma função harmônica compartilham notas e podem trocar de lugar. É a técnica mais suave: tudo continua dentro do tom.

#cartoes-info((
  (titulo: "Tônica", corpo: [*I7M ↔ VIm7 ↔ IIIm7* \ C7M ↔ Am7 ↔ Em7 \ (3 notas em comum entre vizinhos)]),
  (titulo: "Subdominante", corpo: [*IV7M ↔ IIm7* \ F7M ↔ Dm7 \ (F A C em comum)]),
  (titulo: "Dominante", corpo: [*V7 ↔ VIIø* \ G7 ↔ Bm7(b5) \ (B D F em comum)]),
))

=== Técnica 2 — Dominantes secundários

Quando a fundamental de um acorde desce uma 5ª justa até o próximo, você pode transformá-lo em *dominante* desse próximo acorde — o V7 secundário, isto é, o V7 de um acorde do tom que não é a tônica. Am7 → Dm7 vira *A7* → Dm7; Dm7 → G7 vira *D7* → G7. A fundamental e o ritmo harmônico continuam iguais; só muda a qualidade, e a 3ª maior (Dó\# em A7, Fá\# em D7) vira uma sensível que puxa para o acorde seguinte.

=== Técnica 3 — II-V relacionado

Todo dominante pode ser precedido pelo seu *IIm7*, dividindo o tempo do acorde: A7 (um compasso) vira *Em7 – A7*; D7 vira *Am7 – D7*. Se o alvo for um acorde menor, o II relacionado costuma ser meio-diminuto: *Em7(b5) – A7(b9) → Dm7*.

=== Técnica 4 — SubV e SubV com seu II

O *SubV* substitui um V7 pelo dominante a trítono de distância, que tem o mesmo trítono (3ª e 7ª trocadas): G7 → *Db7*; A7 → *Eb7*. A fundamental passa a descer por semitom até o alvo. O passo seguinte é preceder o SubV pelo *seu próprio IIm7*: Db7 vira *Abm7 – Db7*; Eb7 vira *Bbm7 – Eb7*.

#compassos("Dm7", "G7", "C7M")
#v(-0.2em)
#legenda[↓]
#v(-0.2em)
#compassos("Dm7", "Abm7  Db7", "C7M")

=== Técnica 5 — Diminutos de passagem

Um acorde º7 entre dois acordes diatônicos cujas fundamentais estão a um tom cria um baixo cromático ascendente. Ele funciona porque é um *dominante 7(b9) sem tônica* do acorde seguinte: A7(b9) = A + C\# E G Bb, e C\# E G Bb é justamente C\#º7.

#tabela(
  columns: (1.6fr, 1.4fr, 2fr),
  ([*Movimento*], [*Em Dó*], [*O º7 equivale a*]),
  (
    ([I – \#Iº7 – IIm7], [C7M – C\#º7 – Dm7], [A7(b9) sem tônica (V7/II)]),
    ([IIm7 – \#IIº7 – IIIm7], [Dm7 – D\#º7 – Em7], [B7(b9) sem tônica (V7/III)]),
    ([IV7M – \#IVº7 – I/5], [F7M – F\#º7 – C/G], [D7(b9) sem tônica (V7/V)]),
    ([IIIm7 – bIIIº7 – IIm7], [Em7 – Ebº7 – Dm7], [cromático descendente, sem função de V7]),
  ),
)

=== Técnica 6 — Empréstimo modal

Acordes do *tom menor homônimo* (Dó menor, no tom de Dó maior) trazem uma sombra melancólica sem mudar a tônica — é o chamado *empréstimo modal*:

#tabela(
  columns: (1fr, 1fr, 1.2fr, 2fr),
  ([*Grau*], [*Acorde*], [*Substitui*], [*Efeito*]),
  (
    ([IVm7 / IVm6], [Fm7 / Fm6], [IV7M], [o "IV menor", cadência plagal triste]),
    ([bVI7M], [Ab7M], [VIm7 ou IV7M], [cor cinematográfica, baixo Lá → Láb]),
    ([bVII7], [Bb7], [V7], [cadência back-door (técnica 8)]),
    ([IIm7(b5)], [Dm7(b5)], [IIm7], [prepara um V7(b9) "menor"]),
    ([bIII7M], [Eb7M], [IIIm7 ou I], [brilho modal, muito usado no rock e na MPB]),
  ),
)

=== Técnica 7 — Pedal e baixo cromático

No *pedal*, o baixo fica parado enquanto os acordes mudam por cima — o pedal de dominante (Sol sob todo o turnaround) cria expectativa e é clássico em introduções: *C7M/G – Am7/G – Dm7/G – G7*. No *baixo cromático*, você escolhe inversões e substituições para que o baixo ande por semitons: *C7M – A7/C\# – Dm7 – D\#º7 → Em7* (baixo Dó, Dó\#, Ré, Ré\#, Mi), ou a linha descendente *C – C7/Bb – F/A – Fm/Ab – C/G*.

=== Técnica 8 — Back-door (IVm7 – bVII7 – I)

A cadência *back-door* (porta dos fundos) chega à tônica pelo lado "errado": em vez de G7 → C7M, usa *Fm7 – Bb7 → C7M*. As notas emprestadas do tom menor (Láb, Mib e Sib) caminham por grau conjunto até a tônica: Láb → Sol, Sib → Si (ou Dó), e o Ré de Bb7 sobe para Mi. É um dos finais mais característicos do jazz e da canção americana.

#caixa(tipo: "resumo", titulo: "Ordem de aplicação")[
  Comece pela técnica mais simples que resolve o que você quer e só depois combine. Em cada troca, faça duas perguntas: (1) a nota da melodia é nota do acorde ou tensão disponível? (2) o baixo e as vozes internas se movem de forma suave?
]

== 3. Exemplo-guia: I – VI – II – V em etapas

Vamos aplicar cada técnica ao turnaround mais comum do repertório, *C7M | Am7 | Dm7 | G7* (sem melodia, para isolar o efeito harmônico). Em cada linha, só a técnica indicada foi aplicada à progressão base — exceto a última, que combina várias.

#tabela(
  columns: (1.9fr, 1fr, 1.2fr, 1.2fr, 1.2fr),
  alinhamento: (left + horizon, center + horizon, center + horizon, center + horizon, center + horizon),
  ([*Técnica*], [*Comp. 1*], [*Comp. 2*], [*Comp. 3*], [*Comp. 4*]),
  (
    ([Base (I – VIm – IIm – V)], [C7M], [Am7], [Dm7], [G7]),
    ([1\. Subst. diatônica], [Em7], [Am7], [F7M], [G7]),
    ([2\. Dominantes secundários], [C7M], [*A7*], [*D7*], [G7]),
    ([3\. II-V relacionado], [C7M], [Em7 *A7*], [Am7 *D7*], [Dm7 *G7*]),
    ([4a. SubV], [C7M], [*Eb7*], [Dm7], [*Db7*]),
    ([4b. SubV com seu II], [C7M], [Bbm7 *Eb7*], [Dm7], [Abm7 *Db7*]),
    ([5\. Diminuto de passagem], [C7M], [*C\#º7*], [Dm7], [G7]),
    ([6\. Empréstimo modal], [C7M], [*Ab7M*], [*Dm7(b5)*], [G7(b9)]),
    ([7a. Pedal de dominante], [C7M/G], [Am7/G], [Dm7/G], [G7]),
    ([7b. Baixo cromático], [C7M], [A7/C\#], [Dm7], [D\#º7 (→ Em7)]),
    ([8\. Back-door], [C7M], [Am7], [*Fm7*], [*Bb7*]),
    ([*Combinação*], [C7M C\#º7], [Dm7 D\#º7], [Em7 Eb7], [Dm7 Db7]),
  ),
)

Leia a última linha devagar: o diminuto de passagem leva C7M → Dm7 e Dm7 → Em7 (baixo cromático subindo); então Em7 – Eb7 – Dm7 – Db7 desce cromaticamente, com Eb7 como SubV de A7 (→ Dm7) e Db7 como SubV de G7 (→ C7M). É o turnaround *III – bIII7 – II – bII7*, um clássico. Todos os voicings abaixo usam a 5ª corda como baixo, o que deixa o movimento cromático evidente:

#grid-acordes(
  chord: chord,
  columns: 4,
  gutter: 1.4em,
  (
    (tabs: "x,3,5,4,5,x", titulo: "C7M", nome: "", detalhe: "C G B E"),
    (tabs: "x,4,5,3,5,x", titulo: "C#º7", nome: "", detalhe: "C# G Bb E"),
    (tabs: "x,5,7,5,6,x", titulo: "Dm7", nome: "", detalhe: "D A C F"),
    (tabs: "x,6,7,5,7,x", titulo: "D#º7", nome: "", detalhe: "D# A C F#"),
    (tabs: "x,7,9,7,8,x", titulo: "Em7", nome: "", detalhe: "E B D G"),
    (tabs: "x,6,8,6,8,x", titulo: "Eb7", nome: "", detalhe: "Eb Bb Db G"),
    (tabs: "x,5,7,5,6,x", titulo: "Dm7", nome: "", detalhe: "D A C F"),
    (tabs: "x,4,6,4,6,x", titulo: "Db7", nome: "", detalhe: "Db Ab Cb F"),
  ),
)

#caixa(tipo: "dica", titulo: "Para ir além")[
  Troque a qualidade dos SubVs da cadeia A7 – D7 – G7 por 7M e você chega ao turnaround de Tadd Dameron: *C7M – Eb7M – Ab7M – Db7M → C7M* (Eb, Ab e Db são os SubVs de A7, D7 e G7). Ele aparece em temas como "Lady Bird" e só funciona onde a melodia não tem notas da tonalidade que choquem com esses acordes.
]

== 4. Rearmonizando uma melodia

Agora o trabalho real: uma melodia de 8 compassos em Dó maior, harmonizada originalmente com tríades diatônicas. Cada nova escolha foi testada contra a nota da melodia (coluna "Função").

#tabela(
  columns: (0.55fr, 0.75fr, 0.85fr, 1.3fr, 0.9fr, 2.1fr),
  ([*C.*], [*Melodia*], [*Original*], [*Rearmonização*], [*Função*], [*Técnica / justificativa*]),
  (
    ([1], [G], [C], [C7M], [5], [tônica mantida, só enriquecida]),
    ([2], [A], [Am], [Em7 – A7], [11 / T], [II-V relacionado mirando o Dm7]),
    ([3], [A], [F], [Dm7], [5], [subst. diatônica (IV → IIm)]),
    ([4], [B], [G], [Abm7 – Db7], [b3 / 7], [SubV com seu II (Si = Dób)]),
    ([5], [C], [C], [C7M], [T], [Db7 → C7M: resolução por semitom]),
    ([6], [E], [C], [C7/Bb], [3], [V7/IV com baixo cromático (Dó → Sib)]),
    ([7], [D – F], [Dm – G], [F6/A – Fm/Ab], [6 / T], [baixo cromático + IVm emprestado]),
    ([8], [E], [C], [C7M/G], [3], [fim da linha Dó – Sib – Lá – Láb – Sol]),
  ),
)

Observe o que *não* foi usado. No compasso 2, Bbm7 – Eb7 (SubV com seu II) seria tentador, mas o Lá da melodia é a *7M de Bbm7* — choque garantido; por isso ficou o II-V relacionado comum (no Eb7 sozinho, o Lá seria \#11 e funcionaria). No compasso 5, Em7 também é substituto de tônica, mas o Dó da melodia seria a *b13 de Em7*, nota evitada. Os voicings abaixo colocam a melodia na *corda mais aguda tocada* (chord melody):

#grid-acordes(
  chord: chord,
  columns: 6,
  gutter: 1.1em,
  (
    (tabs: "x,3,5,4,5,3", titulo: "C7M", nome: "", detalhe: "1 · mel. G"),
    (tabs: "x,7,5,7,5,5", titulo: "Em7(11)", nome: "", detalhe: "2 · mel. A"),
    (tabs: "x,0,5,6,5,5", titulo: "A7", nome: "", detalhe: "2 · mel. A"),
    (tabs: "x,5,7,5,6,5", titulo: "Dm7", nome: "", detalhe: "3 · mel. A"),
    (tabs: "x,x,6,8,7,7", titulo: "Abm7", nome: "", detalhe: "4 · mel. B"),
    (tabs: "x,4,x,4,6,7", titulo: "Db7", nome: "", detalhe: "4 · mel. B"),
    (tabs: "x,3,2,4,1,x", titulo: "C7M", nome: "", detalhe: "5 · mel. C"),
    (tabs: "x,1,2,0,1,0", titulo: "C7/Bb", nome: "", detalhe: "6 · mel. E"),
    (tabs: "x,0,3,2,3,x", titulo: "F6/A", nome: "", detalhe: "7 · mel. D"),
    (tabs: "4,x,3,5,6,x", titulo: "Fm/Ab", nome: "", detalhe: "7 · mel. F"),
    (tabs: "3,3,2,0,0,0", titulo: "C7M/G", nome: "", detalhe: "8 · mel. E"),
  ),
)

#legenda[Toque cada acorde e cante (ou toque) a nota mais aguda: ela é a melodia. No compasso 4, o Db7 usa só T, 3 e 7ª (a 7ª dobrada na 1ª corda é a melodia).]

#caixa(tipo: "dica", titulo: "Múltiplas respostas")[
  Não existe "a" rearmonização correta. Existem escolhas *válidas* (melodia compatível, condução suave, função coerente) e escolhas mais ou menos adequadas ao estilo. Ao corrigir os exercícios, confira os critérios — não apenas se o seu acorde é igual ao do gabarito.
]

== 5. Exercícios

#junto[
#exercicio(titulo: "Identifique a técnica", nivel: "Análise")[
  Em cada progressão (tom de Dó), diga qual técnica de rearmonização gerou o(s) acorde(s) em negrito.

  #grid(
    columns: (1fr, 1fr),
    column-gutter: 2em,
    row-gutter: 0.75em,
    [a) C7M – *E7* – Am7], [e) *Bm7(b5) – E7* – Am7],
    [b) Dm7 – *Db7* – C7M], [f) C7M – *Ab7M* – G7 – C7M],
    [c) C7M – *C\#º7* – Dm7], [g) *Em7* – A7 – Dm7 – G7 (no lugar de C7M – Am7…)],
    [d) C7M – *Fm7 – Bb7* – C7M], [h) C7M – *Bbm7 – Eb7* – Dm7],
  )
  #linhas-resposta(3)
]
]

#junto[
#exercicio(titulo: "Melodia × acorde", nivel: "Análise")[
  Diga se a nota da melodia (longa, em tempo forte) funciona sobre o acorde. Escreva o intervalo e marque ✓ ou ✗.

  #tabela-preencher(
    ([*Melodia / acorde*], [*Intervalo*], [*✓ / ✗*], [*Melodia / acorde*], [*Intervalo*], [*✓ / ✗*]),
    (
      ([1\. F / C7M], none, none, [6\. D / Fm6], none, none),
      ([2\. A / Bbm7], none, none, [7\. E / Fm7], none, none),
      ([3\. G / Db7], none, none, [8\. B / Abm7], none, none),
      ([4\. C / Em7], none, none, [9\. Eb / G7], none, none),
      ([5\. Bb / A7], none, none, [10\. C / G7], none, none),
    ),
    columns: (1.3fr, 1fr, 0.7fr, 1.3fr, 1fr, 0.7fr),
    altura: 0.75cm,
  )
]
]

#junto[
#exercicio(titulo: "II relacionado, SubV e o II do SubV", nivel: "Escrita")[
  Complete a tabela para cada dominante.

  #tabela-preencher(
    ([*Dominante*], [*IIm7 relacionado*], [*SubV*], [*IIm7 do SubV*]),
    (
      ([G7], none, none, none),
      ([A7], none, none, none),
      ([D7], none, none, none),
      ([E7], none, none, none),
      ([B7], none, none, none),
      ([F7], none, none, none),
    ),
    altura: 0.75cm,
  )
]
]

#junto[
#exercicio(titulo: "O exemplo-guia em Fá", nivel: "Escrita")[
  Transponha para Fá maior a base *F7M | Dm7 | Gm7 | C7* e escreva cada versão.

  #tabela-preencher(
    ([*Técnica*], [*Comp. 1*], [*Comp. 2*], [*Comp. 3*], [*Comp. 4*]),
    (
      ([Dominantes secundários], none, none, none, none),
      ([II-V relacionado], none, none, none, none),
      ([SubV com seu II], none, none, none, none),
      ([Diminuto de passagem], none, none, none, none),
      ([Back-door], none, none, none, none),
      ([Combinação (III – bIII7 – II – bII7)], none, none, none, none),
    ),
    columns: (2.6fr, 1fr, 1fr, 1fr, 1fr),
    altura: 0.75cm,
  )
]
]

#junto[
#exercicio(titulo: "Rearmonize a melodia", nivel: "Composição")[
  Melodia em Sol maior, uma nota por compasso, com a harmonia original entre parênteses: \
  *D* (G) · *E* (Em) · *C* (Am) · *F\#* (D7) · *G* (G). \
  Proponha uma rearmonização para os compassos 1 a 4 usando *pelo menos três técnicas diferentes*. Para cada acorde, escreva a função da nota da melodia. Depois explique por que a back-door (Cm7 – F7) *não* serve no compasso 4.

  #tabela-preencher(
    ([*Comp.*], [*Melodia*], [*Novo(s) acorde(s)*], [*Função da melodia*], [*Técnica*]),
    (
      ([1], [D], none, none, none),
      ([2], [E], none, none, none),
      ([3], [C], none, none, none),
      ([4], [F\#], none, none, none),
      ([5], [G], none, none, none),
    ),
    columns: (0.6fr, 0.8fr, 1.4fr, 1.3fr, 1.6fr),
    altura: 0.75cm,
  )
  #linhas-resposta(3)
]
]

#junto[
#exercicio(titulo: "Chord melody", nivel: "Prática")[
  Toque a rearmonização da seção 4 com os voicings sugeridos, mantendo a melodia sempre na voz mais aguda. Em seguida, monte voicings com a melodia no topo para a sua resposta do Exercício 5 e anote-os abaixo.

  #tab-vazia(sistemas: 2, compassos: 4, altura-linha: 12pt)
]
]

#junto[
=== Sugestão de prática

#rotina-estudo((
  ([Tabela de tensões/notas evitadas: teste 5 notas sobre 5 acordes], [5 min], [—]),
  ([Exemplo-guia: tocar todas as linhas da tabela da seção 3], [10 min], [70]),
  ([Turnaround III – bIII7 – II – bII7 em Dó, Fá e Sib], [5 min], [80–100]),
  ([Chord melody da seção 4 (melodia no topo)], [10 min], [60]),
  ([Rearmonizar uma música do seu repertório (4–8 compassos)], [10 min], [—]),
))
]

#junto(checklist(
  (
    [Verifico a nota da melodia contra o acorde antes de qualquer troca.],
    [Aplico as oito técnicas ao I – VIm – IIm – V sem consultar a tabela.],
    [Calculo SubV e IIm7 do SubV de qualquer dominante de cabeça.],
    [Explico o º7 de passagem como dominante 7(b9) sem tônica.],
    [Toco o turnaround III – bIII7 – II – bII7 em três tons.],
    [Rearmonizei pelo menos um trecho real e justifiquei cada acorde.],
  ),
  titulo: "Autoavaliação",
))

#gabarito[
  #resposta(1)[
    a) Dominante secundário (E7 = V7/VI). b) SubV de G7. c) Diminuto de passagem (C\#º7 = A7(b9) sem tônica → Dm7). d) Back-door (IVm7 – bVII7 do tom menor homônimo). e) II-V relacionado (II-V menor do VIm7). f) Empréstimo modal (bVI7M de Dó menor). g) Substituição diatônica (IIIm7 no lugar de I) — e, ao mesmo tempo, Em7 é o II relacionado de A7; as duas leituras estão corretas. h) SubV com seu II (Eb7 = SubV de A7 → Dm7; Bbm7 é o seu II).
  ]
  #resposta(2)[
    1\. 11 ✗ (4ª justa sobre 7M) · 2. 7M ✗ · 3. \#11 ✓ · 4. b13 ✗ (b6 sobre IIIm7) · 5. b9 ✓ · 6. 6 ✓ (nota do acorde) · 7. 7M ✗ (m7 com 7M na melodia) · 8. b3 ✓ (Si = Dób) · 9. b13 ✓ (tensão alterada) · 10. 11 ✗ (só funciona em G7sus4).
  ]
  #resposta(3)[
    G7: Dm7 · Db7 · Abm7 — A7: Em7 · Eb7 · Bbm7 — D7: Am7 · Ab7 · Ebm7 — E7: Bm7 · Bb7 · Fm7 — B7: F\#m7 · F7 · Cm7 — F7: Cm7 · B7 (Cb7) · F\#m7 (Gbm7).
  ]
  #resposta(4)[
    Dom. secundários: F7M | D7 | G7 | C7 · II-V relacionado: F7M | Am7 D7 | Dm7 G7 | Gm7 C7 · SubV com seu II: F7M | Ebm7 Ab7 | Gm7 | Dbm7 Gb7 · Diminuto de passagem: F7M | F\#º7 | Gm7 | C7 · Back-door: F7M | Dm7 | Bbm7 | Eb7 (→ F7M) · Combinação: F7M F\#º7 | Gm7 G\#º7 | Am7 Ab7 | Gm7 Gb7.
  ]
  #resposta(5)[
    *Uma solução possível:* 1. G7M (D = 5) · 2. Bm7 – E7 (E = 11 / T), II-V relacionado para Am7 · 3. Am7 (C = b3) · 4. Ebm7 – Ab7 (F\# = Gb = b3 / 7), SubV com seu II · 5. G7M (T). \
    *Alternativas válidas:* comp. 1: Bm7 (D = b3) ou Em7 (D = 7), substituição diatônica; comp. 2: E7 sozinho (V7/II) ou Bb7(\#11) (E = \#11, SubV de E7 → Am7); comp. 3: Cm6 (C = T, empréstimo) ou Am7 precedido de E7; comp. 4: D7 (F\# = 3), Ab7 sozinho (F\# = 7) ou Am7 – D7 (F\# = 13 no dórico / 3). \
    *Critérios:* nota da melodia sempre nota do acorde ou tensão disponível; cada dominante resolve no acorde seguinte (por 5ª ou por semitom, no SubV); pelo menos três técnicas distintas. \
    *Back-door:* sobre Cm7, o Fá\# é a b5 — transforma o acorde em Cm7(b5) e soa como erro. A técnica é ótima, mas não com essa melodia.
  ]
  #resposta(6)[
    Exercício prático — critério de sucesso: cada acorde soa com a melodia como nota mais aguda e audível, sem cordas soltas indesejadas; a troca entre os voicings acontece no tempo (60 BPM, um acorde por compasso).
  ]
]
