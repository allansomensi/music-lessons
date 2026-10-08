#import "/templates/layout.typ": *
#import "/templates/components.typ": *
#import "@preview/conchord:0.4.0": new-chordgen

#show: aula.with(
  instrumento: "Guitarra",
  nivel: "Intermediário",
)

#let chord = new-chordgen(number-to-left: true, use-shadow-barre: false, colors: (hold: black, barre: black))
#show <chord>: set text(fill: color-strong, weight: "bold")

// Tabelas sem justificação (evita espaços largos em células estreitas)
#show table: set par(justify: false)
#show table: set text(size: 10pt)

// Caixa com texto alinhado à esquerda (a última linha não fica centralizada)
#let caixa-e(body, tipo: "neutro", titulo: auto) = {
  let cores = (neutro: color-rule-dark, dica: color-secondary, atencao: color-strong, resumo: color-brand-soft)
  let rotulos = (neutro: none, dica: "Dica", atencao: "Atenção", resumo: "Resumo Rápido")
  let rotulo = if titulo == auto { rotulos.at(tipo) } else { titulo }
  let cor = cores.at(tipo)
  block(breakable: false, width: 100%, caixa(tipo: tipo, titulo: none, align(left)[
    #if rotulo != none [#text(weight: "bold", fill: cor)[#rotulo:] #h(4pt)]
    #body
  ]))
}

// Blocos que não podem ser quebrados entre páginas
#let inteiro(body) = block(breakable: false, width: 100%, body)
#let tabela-i(..args) = inteiro(tabela(..args))
#let cartoes-i(..args) = inteiro(cartoes-info(..args))
#let exercicio-i(..args) = inteiro(exercicio(..args))
#let resp(n, body) = { resposta(n, body); v(0.45em) }

= Acordes Diminutos

Poucos acordes têm uma reputação tão curiosa quanto o diminuto: soa tenso, misterioso, às vezes "de filme de suspense" — e ainda assim aparece em choro, samba, bossa nova, jazz, rock clássico e música erudita como uma ponte elegante entre dois acordes. Nesta aula você vai entender por que ele é tão versátil: o acorde diminuto com sétima é *simétrico*, cabe em poucos shapes móveis e esconde dentro de si um *acorde dominante*.

#objetivos((
  [Diferenciar tríade diminuta, tétrade diminuta (º7) e meio-diminuto (m7(b5))],
  [Entender a simetria do º7 e saber por que só existem três acordes º7 diferentes],
  [Tocar shapes móveis de º7 com tônica na 6ª, 5ª e 4ª corda e usar o truque das 3 casas],
  [Aplicar o diminuto como acorde de passagem (ascendente e descendente), auxiliar e dominante],
  [Conhecer a escala diminuta tom-semitom, que combina com o º7],
))

== 1. Três acordes "diminutos" diferentes

A palavra _diminuto_ aparece em três acordes que muita gente confunde. Todos começam com a tríade diminuta (T – b3 – b5); o que muda é a sétima.

#tabela-i(
  columns: (1.5fr, 1fr, 1.1fr, 0.9fr, 2fr),
  alinhamento: (left + horizon, center + horizon, center + horizon, center + horizon, left + horizon),
  ([*Acorde*], [*Cifra*], [*Fórmula*], [*Em Si*], [*Onde aparece*]),
  (
    ([Tríade diminuta], [Bº], [T b3 b5], [B D F], [VIIº do campo de C maior]),
    ([Meio-diminuto], [Bm7(b5) ou Bø], [T b3 b5 *b7*], [B D F A], [VIIø de C maior; IIø de A menor]),
    ([Diminuto com sétima], [Bº7], [T b3 b5 *bb7*], [B D F Ab], [VIIº7 de C menor harmônico]),
  ),
)

#v(0.4em)

A *bb7* (sétima diminuta) fica um semitom abaixo da b7. Em Si, a b7 é Lá; a bb7 é *Láb*, que soa igual a Sol\#. Por isso a bb7 é *enarmônica da 6ª maior*: o som é o mesmo, mas o nome correto dentro do acorde é bb7.

#grid-acordes(
  chord: chord,
  columns: 3,
  gutter: 3em,
  (
    (tabs: "x,2,3,4,3,x", nome: "Bº", titulo: "Tríade diminuta", detalhe: "B · F · B · D  (3ª corda: Si)"),
    (tabs: "x,2,3,2,3,x,*", nome: "Bm7(b5)", titulo: "Meio-diminuto", detalhe: "B · F · A · D  (3ª corda: Lá)"),
    (tabs: "x,2,3,1,3,x", nome: "Bº7", titulo: "Diminuto com sétima", detalhe: "B · F · Ab · D  (3ª corda: Láb)"),
  ),
)

#v(0.3em)

Compare os três shapes: só a nota da 3ª corda muda (casa 4 → 2 → 1), e com ela o caráter do acorde. O meio-diminuto ainda soa "menor sombrio" e costuma funcionar como IIø (Bm7(b5) – E7 – Am); o º7 soa instável por completo e quer resolver.


== 2. A simetria do º7

Empilhe as notas de Bº7 e conte os semitons entre elas: todas as distâncias são *terças menores* (3 semitons), inclusive da última nota de volta à tônica.

#tabela-i(
  columns: (1fr,) * 9,
  ([*Nota*], [B], [], [D], [], [F], [], [Ab], [B]),
  (
    ([*Distância*], [], [3 st], [], [3 st], [], [3 st], [], [3 st],),
  ),
)

#v(0.4em)

Quatro terças menores somam 12 semitons: uma oitava exata. Consequências práticas:

#passos((
  [*As quatro inversões têm a mesma estrutura.* Bº7, Dº7, Fº7 e Abº7 (G\#º7) contêm *as mesmas quatro notas*. O nome depende só de qual nota está no baixo.],
  [*Só existem três acordes º7 diferentes.* Como cada acorde "vale" por quatro nomes, as 12 notas se dividem em apenas 3 famílias.],
  [*Mover um shape 3 casas não muda o acorde*, apenas a inversão — veja a seção 3.],
))

#v(0.4em)

#tabela-i(
  columns: (0.8fr, 1.4fr, 2.2fr, 1.8fr),
  ([*Família*], [*Notas*], [*Nomes possíveis (mesmo acorde)*], [*V7(b9) sem fundamental de*]),
  (
    ([1], [C · Eb · Gb · A], [Cº7 = Ebº7 = F\#º7 (Gbº7) = Aº7], [D7 · F7 · Ab7 · B7]),
    ([2], [C\# · E · G · Bb], [C\#º7 (Dbº7) = Eº7 = Gº7 = Bbº7], [A7 · C7 · Eb7 · F\#7]),
    ([3], [D · F · Ab · B], [Dº7 = Fº7 = G\#º7 (Abº7) = Bº7], [G7 · Bb7 · Db7 · E7]),
  ),
)

#align(center, text(size: 8.5pt, fill: color-muted)[Última coluna: veja a seção 4. Grafia simplificada; a rigorosa usa a bb7 (Cº7 = C Eb Gb Bbb).])

=== As notas de Cº7 espalhadas pelo braço

Cada corda tem uma nota do acorde *a cada 3 casas*. Não há "posição certa" para o º7: qualquer grupo de quatro notas vizinhas forma o acorde.

#inteiro(align(center, braco-notas(fs: 1, (
  ("", "Gb", "", "", "A", "", "", "*C", "", "", "Eb", ""),
  ("", "", "*C", "", "", "Eb", "", "", "Gb", "", "", "A"),
  ("Eb", "", "", "Gb", "", "", "A", "", "", "*C", "", ""),
  ("", "A", "", "", "*C", "", "", "Eb", "", "", "Gb", ""),
  ("*C", "", "", "Eb", "", "", "Gb", "", "", "A", "", ""),
  ("", "Gb", "", "", "A", "", "", "*C", "", "", "Eb", ""),
))))

#align(center, text(size: 8.5pt, fill: color-muted)[Notas de Cº7 (família 1), casas 1 a 12. Em cinza, Dó; Lá aparece no lugar da bb7 (Sibb).])

== 3. Shapes móveis de º7

Os três shapes abaixo cobrem quase tudo o que você vai tocar. Todos estão sem pestana e usam quatro cordas; abafe as cordas marcadas com × encostando a polpa dos dedos.

#grid-acordes(
  chord: chord,
  columns: 3,
  gutter: 3em,
  (
    (tabs: "3,x,2,3,2,x,*", nome: "Gº7", titulo: "Tônica na 6ª corda", detalhe: "G · E (bb7) · Bb · Db"),
    (tabs: "x,3,4,2,4,x", nome: "Cº7", titulo: "Tônica na 5ª corda", detalhe: "C · Gb · A (bb7) · Eb"),
    (tabs: "x,x,2,3,2,3,*", nome: "Eº7", titulo: "Tônica na 4ª corda", detalhe: "E · Bb · Db · G"),
  ),
)

#v(0.3em)

Para encontrar qualquer º7, coloque a tônica do shape sobre a nota desejada na 6ª, 5ª ou 4ª corda. Exemplos: G\#º7 com tônica na 6ª corda = *4-x-3-4-3-x*; C\#º7 com tônica na 5ª corda = *x-4-5-3-5-x*.

#caixa-e(tipo: "atencao")[
  Na cifragem deste material, *º* sozinho indica a tríade (Bº) e *º7* indica a tétrade diminuta (Bº7). Em muitos songbooks populares, porém, "Bº" já significa o acorde com sétima diminuta. Na dúvida, quase sempre o º7 é a escolha que soa melhor na guitarra.
]

=== O truque das 3 casas

Como o acorde se repete a cada terça menor, deslocar o shape inteiro *3 casas* acima ou abaixo produz *o mesmo acorde* em outra inversão. Isso permite tocar um º7 em qualquer região do braço sem decorar novos shapes — e criar um efeito clássico de suspense subindo o mesmo shape em escada.

#grid-acordes(
  chord: chord,
  columns: 4,
  (
    (tabs: "x,3,4,2,4,x", nome: "Cº7", titulo: "Baixo: Dó", detalhe: "casa 3"),
    (tabs: "x,6,7,5,7,x", nome: "Ebº7", titulo: "Baixo: Mib", detalhe: "casa 6"),
    (tabs: "x,9,10,8,10,x", nome: "F#º7", titulo: "Baixo: Fá#", detalhe: "casa 9"),
    (tabs: "x,12,13,11,13,x", nome: "Aº7", titulo: "Baixo: Lá", detalhe: "casa 12"),
  ),
)

#align(center, text(size: 8.5pt, fill: color-muted)[Os quatro diagramas contêm as mesmas notas: Dó, Mib, Solb (Fá\#) e Lá.])

== 4. As funções do diminuto

O º7 quase nunca é ponto de chegada. Ele aparece *entre* dois acordes, e o modo como se liga a eles define sua função. Há quatro usos principais.

=== a) Diminuto de passagem ascendente

O baixo sobe *por semitom* da fundamental de um acorde para a do seguinte: C – *C\#º7* – Dm7. O C\#º7 preenche o espaço cromático entre Dó e Ré.

#grid-acordes(
  chord: chord,
  columns: 4,
  (
    (tabs: "x,3,5,4,5,3", nome: "C7M", titulo: "I7M", detalhe: "baixo: Dó"),
    (tabs: "x,4,5,3,5,x", nome: "C#º7", titulo: "#Iº7", detalhe: "baixo: Dó#"),
    (tabs: "x,5,7,5,6,5", nome: "Dm7", titulo: "IIm7", detalhe: "baixo: Ré"),
    (tabs: "3,5,3,4,3,3", nome: "G7", titulo: "V7", detalhe: "baixo: Sol"),
  ),
)

#v(0.3em)

Por que funciona tão bem? C\#º7 (C\# E G Bb) é *A7(b9) sem a fundamental* — ou seja, é o dominante secundário V7/II disfarçado, apontando para o Dm7. Da mesma forma, Dm7 – *D\#º7* – Em7 usa D\#º7 = B7(b9) sem fundamental (V7/III).

=== b) Diminuto de passagem descendente

O baixo *desce* por semitom: Em7 – *Ebº7* – Dm7. Aqui o diminuto não é dominante do acorde seguinte; ele é puramente *cromático*, uma ponte suave na linha do baixo (Mi → Mib → Ré).

#grid-acordes(
  chord: chord,
  columns: 4,
  (
    (tabs: "x,7,9,7,8,7", nome: "Em7", titulo: "IIIm7", detalhe: "baixo: Mi"),
    (tabs: "x,6,7,5,7,x", nome: "Ebº7", titulo: "bIIIº7", detalhe: "baixo: Mib"),
    (tabs: "x,5,7,5,6,5", nome: "Dm7", titulo: "IIm7", detalhe: "baixo: Ré"),
    (tabs: "3,5,3,4,3,3", nome: "G7", titulo: "V7", detalhe: "baixo: Sol"),
  ),
)

=== c) Diminuto auxiliar (de mesmo baixo)

O baixo *fica parado* e o diminuto aparece com a mesma fundamental do acorde que ele enfeita: C – *Cº7* – C. As outras notas de Cº7 (Ré\#/Mib, Fá\#/Solb, Lá) funcionam como *bordaduras* das notas de C (Mi, Sol, Sol) e voltam para elas. É o famoso "balanço" de introduções de choro, valsa e standards.

#grid-acordes(
  chord: chord,
  columns: 3,
  gutter: 3em,
  (
    (tabs: "x,3,5,5,5,3", nome: "C", titulo: "I", detalhe: "C · G · C · E · G"),
    (tabs: "x,3,4,2,4,x", nome: "Cº7", titulo: "Iº7 (auxiliar)", detalhe: "C · Gb · A · Eb"),
    (tabs: "x,3,5,5,5,3", nome: "C", titulo: "I", detalhe: "volta ao repouso"),
  ),
)

=== d) Diminuto com função dominante

Este é o uso mais importante — e o que explica todos os outros. Monte um G7(b9) e retire a fundamental:

#tabela-i(
  columns: (1.6fr, 0.8fr, 0.8fr, 0.8fr, 0.8fr, 0.8fr),
  ([*Acorde*], [*T*], [*3*], [*5*], [*b7*], [*b9*]),
  (
    ([G7(b9)], [G], [B], [D], [F], [Ab]),
    ([sem fundamental], [—], [B], [D], [F], [Ab]),
    ([resultado: Bº7], [], [T], [b3], [b5], [bb7]),
  ),
)

#v(0.4em)

As quatro notas restantes, B – D – F – Ab, formam exatamente o *Bº7*. Portanto *Bº7 = G7(b9) sem fundamental*, e ele resolve no C como o G7 resolveria. A regra geral: o º7 está construído sobre a *3ª* de um V7(b9); a fundamental desse dominante fica *uma terça maior abaixo* da nota que dá nome ao º7.

#grid-acordes(
  chord: chord,
  columns: 4,
  (
    (tabs: "3,x,3,4,3,4", nome: "G7(b9)", titulo: "V7(b9)", detalhe: "G · F · B · D · Ab"),
    (tabs: "x,x,3,4,3,4,*", nome: "Fº7", titulo: "o mesmo sem o G", detalhe: "F · B · D · Ab = Bº7"),
    (tabs: "x,2,3,1,3,x", nome: "Bº7", titulo: "VIIº7", detalhe: "B · F · Ab · D"),
    (tabs: "x,3,2,0,1,0", nome: "C", titulo: "I", detalhe: "resolução"),
  ),
)

#v(0.3em)

Na resolução Bº7 → C (shapes 3 e 4 acima), cada voz anda no máximo um tom: Si → Dó, Fá → Mi, Láb → Sol, Ré → Dó. É a condução de vozes mais econômica possível — por isso o º7 "puxa" tanto para o acorde seguinte.

#caixa-e(tipo: "resumo")[
  *Bº7 e G\#º7 são o mesmo acorde* (família 3: B D F Ab = G\# B D F). O que muda é a leitura: tocado antes de *C*, ele é G7(b9) sem fundamental (VIIº7 de Dó). Tocado antes de *Am*, ele é *E7(b9)* sem fundamental (G\# B D F = E7(b9) sem o Mi), o VIIº7 de Lá menor harmônico (a escala menor com a 7ª elevada, Sol\#, que transforma o V em E7 e o VII em G\#º7). Um único shape de º7 pode resolver em quatro tons diferentes — os indicados na última coluna da tabela das famílias.
]

=== Progressões para tocar

#[
#set text(size: 9.5pt)
#tabela-i(
  columns: (2.3fr, 2.5fr, 1.45fr),
  alinhamento: (center + horizon, center + horizon, left + horizon),
  ([*Progressão*], [*Graus*], [*Função do º7*]),
  (
    ([C7M – C\#º7 – Dm7 – D\#º7 – Em7], [I7M – \#Iº7 – IIm7 – \#IIº7 – IIIm7], [Passagem ascendente]),
    ([F7M – F\#º7 – C/G – A7 – Dm7 – G7], [IV7M – \#IVº7 – I/5 – V7/II – IIm7 – V7], [Passagem ascendente]),
    ([Em7 – Ebº7 – Dm7 – G7 – C7M], [IIIm7 – bIIIº7 – IIm7 – V7 – I7M], [Passagem descendente]),
    ([C – Cº7 – C – A7 – Dm7 – G7], [I – Iº7 – I – V7/II – IIm7 – V7], [Auxiliar]),
    ([Dm7 – Bº7 – C], [IIm7 – VIIº7 – I], [Dominante]),
    ([Bm7(b5) – G\#º7 – Am], [IIø – VIIº7 – Im (em Lá menor)], [Dominante]),
  ),
)
]

== 5. A escala diminuta tom-semitom

Sobre um acorde º7, a escala que soa "dentro" é a *diminuta tom-semitom*: alterna tom e semitom a partir da tônica e tem *oito* notas. Ela contém as quatro notas do acorde e, entre elas, uma nota um tom acima de cada uma.

#tabela-i(
  columns: (2.2fr,) + (1fr,) * 9,
  ([*Diminuta de C*], [C], [D], [Eb], [F], [Gb], [Ab], [A], [B], [C]),
  (
    ([Distância], [], [T], [S], [T], [S], [T], [S], [T], [S]),
    ([Notas do acorde], [●], [], [●], [], [●], [], [●], [], [●]),
  ),
)

#v(0.4em)

Assim como o acorde, a escala é simétrica: ela se repete a cada 3 semitons, então a diminuta de Cº7 tem as mesmas notas das diminutas de Ebº7, F\#º7 e Aº7. Por enquanto, basta tocá-la em uma oitava sobre o º7 e ouvir a cor. Existe também a versão *semitom-tom* (a mesma alternância começando por semitom), que é a escolha sobre um acorde V7(b9); digitados por todo o braço e aplicações em improviso ficam para um estudo mais aprofundado de escalas simétricas.

#caixa-e(tipo: "dica")[
  Um atalho de improviso que funciona desde já: sobre um º7 de passagem, toque o *arpejo* do próprio acorde (quatro notas a cada 3 casas numa mesma corda, ou o shape da seção 3 nota a nota). Ele soa correto em qualquer uma das funções vistas acima.
]

== 6. Exercícios

#exercicio-i(titulo: "Monte os acordes", nivel: "Fácil")[
  Escreva as notas de cada acorde. Na última coluna, use b7 ou bb7 conforme o tipo.

  #tabela-preencher(
    columns: (1.4fr, 1fr, 1fr, 1fr, 1fr),
    ([*Acorde*], [*T*], [*b3*], [*b5*], [*b7 / bb7*]),
    (
      ([Eº], none, none, none, [—]),
      ([Eº7], none, none, none, none),
      ([Em7(b5)], none, none, none, none),
      ([Aº7], none, none, none, none),
      ([F\#m7(b5)], none, none, none, none),
      ([G\#º7], none, none, none, none),
    ),
    altura: 0.68cm,
  )
]

#exercicio-i(titulo: "Famílias de º7", nivel: "Fácil")[
  Cada º7 abaixo tem outros três nomes possíveis. Escreva-os e indique a família (1, 2 ou 3).

  #tabela-preencher(
    columns: (1fr, 2.6fr, 0.9fr),
    ([*Acorde*], [*Outros três nomes*], [*Família*]),
    (
      ([Aº7], none, none),
      ([Gº7], none, none),
      ([Fº7], none, none),
      ([D\#º7], none, none),
    ),
    altura: 0.68cm,
  )
]

#exercicio-i(titulo: "O dominante escondido", nivel: "Médio")[
  Complete a tabela. A primeira linha está preenchida como exemplo.

  #tabela-preencher(
    columns: (1fr, 1.6fr, 1.2fr, 1.2fr),
    ([*Dominante*], [*Notas do V7(b9)*], [*Sem fundamental =*], [*Resolve em*]),
    (
      ([G7(b9)], [G B D F Ab], [Bº7], [C ou Cm]),
      ([A7(b9)], none, none, none),
      ([D7(b9)], none, none, none),
      ([E7(b9)], none, none, none),
    ),
    altura: 0.68cm,
  )
]

#exercicio-i(titulo: "Qual é a função?", nivel: "Médio")[
  Classifique o diminuto de cada progressão como *passagem ascendente*, *passagem descendente*, *auxiliar* ou *dominante*. Quando ele for um V7(b9) disfarçado, diga de qual dominante.

  #tabela-preencher(
    columns: (0.35fr, 2fr, 3fr),
    ([], [*Progressão (tom de G ou C)*], [*Função do º7*]),
    (
      ([a)], [G – G\#º7 – Am7], none),
      ([b)], [Am7 – Abº7 – G], none),
      ([c)], [G – Gº7 – G], none),
      ([d)], [Dm7 – Bº7 – C], none),
      ([e)], [F – F\#º7 – C/G], none),
      ([f)], [Em7 – Ebº7 – Dm7 – G7], none),
    ),
    altura: 0.68cm,
  )
]

#exercicio-i(titulo: "No braço", nivel: "Médio")[
  Escreva o shape (casas da 6ª para a 1ª corda, como "3-x-2-3-2-x") de cada acorde nas três formas da seção 3.

  #tabela-preencher(
    columns: (0.8fr, 1.4fr, 1.4fr, 1.4fr),
    ([*Acorde*], [*Tônica na 6ª corda*], [*Tônica na 5ª corda*], [*Tônica na 4ª corda*]),
    (
      ([Gº7], none, none, none),
      ([Dº7], none, none, none),
    ),
    altura: 0.9cm,
  )
]

#exercicio-i(titulo: "Escada de diminutos e resolução", nivel: "Prática")[
  Toque a escada de Cº7 subindo de 3 em 3 casas (um acorde por tempo, 60 BPM) e depois a resolução Bº7 → C. Ouça como os quatro primeiros acordes soam como "o mesmo" e como o último compasso resolve.

  #grid(
    columns: (1.7fr, 1fr),
    gutter: 1em,
    tab(
      titulo: "Escada de Cº7 (mesmas notas, 4 inversões)",
      "e|------------|------------|\nB|--4----7----|--10---13---|\nG|--2----5----|--8----11---|\nD|--4----7----|--10---13---|\nA|--3----6----|--9----12---|\nE|------------|------------|",
    ),
    tab(
      titulo: "Bº7 → C",
      "e|-----------|\nB|--3----1---|\nG|--1----0---|\nD|--3----2---|\nA|--2----3---|\nE|-----------|",
    ),
  )
]

#exercicio-i(titulo: "Rearmonização", nivel: "Desafio")[
  Insira acordes diminutos na progressão abaixo (um compasso por acorde, tom de C). Use pelo menos uma passagem ascendente, uma descendente e um º7 com função dominante. Escreva a nova progressão e toque-a com os shapes desta aula.

  #align(center, text(size: 11pt)[*C7M – Dm7 – Em7 – Dm7 – G7 – C7M*])

  #linhas-resposta(4)
]

#v(0.4em)

#inteiro[
=== Resumo das funções do º7

#cartoes-i(columns: (1fr, 1fr), (
  (titulo: "Passagem ascendente", corpo: [Baixo sobe meio tom: X – *X\#º7* – acorde seguinte. É um V7(b9) sem fundamental do acorde de chegada. Ex.: C~–~C\#º7~–~Dm7.]),
  (titulo: "Passagem descendente", corpo: [Baixo desce meio tom: X – *Xbº7* – acorde seguinte. Função cromática, sem resolução de dominante. Ex.: Em7~–~Ebº7~–~Dm7.]),
  (titulo: "Auxiliar", corpo: [Mesmo baixo antes e depois: X – *Xº7* – X. As notas do º7 são bordaduras do acorde. Ex.: C~–~Cº7~–~C.]),
  (titulo: "Dominante", corpo: [Substitui o V7: *VIIº7* = V7(b9) sem fundamental. Resolve como o dominante. Ex.: Dm7~–~Bº7~–~C.]),
))
]

#v(0.6em)

#inteiro[
=== Sugestão de prática

#rotina-estudo((
  ([Bº – Bm7(b5) – Bº7: alternar os três shapes ouvindo a diferença], [5 min], [60]),
  ([Shapes de º7 com tônica na 6ª, 5ª e 4ª corda em todas as 12 notas], [10 min], [60–70]),
  ([Escada de 3 em 3 casas nos três shapes], [5 min], [60–80]),
  ([Progressões da seção 4 (uma ou duas por sessão, com metrônomo)], [10 min], [70]),
  ([Bº7 → C e G\#º7 → Am: resolução com condução de vozes], [5 min], [60]),
  ([Escala diminuta tom-semitom de C em uma oitava sobre Cº7], [5 min], [60]),
))
]

#v(0.4em)

#checklist(titulo: "Autoavaliação", (
  [Diferencio Bº, Bm7(b5) e Bº7 pela fórmula e pelo som.],
  [Explico por que só existem três acordes º7 diferentes.],
  [Encontro qualquer º7 nas três formas e uso o truque das 3 casas.],
  [Reconheço diminuto de passagem ascendente, descendente, auxiliar e dominante.],
  [Transformo um V7(b9) em º7 (e vice-versa) sem consultar a tabela.],
  [Toco a escala diminuta tom-semitom de C sobre Cº7.],
))

#gabarito[
  #resp(1)[
    Eº: E – G – Bb. \
    Eº7: E – G – Bb – Db. \
    Em7(b5): E – G – Bb – D. \
    Aº7: A – C – Eb – Gb. \
    F\#m7(b5): F\# – A – C – E. \
    G\#º7: G\# – B – D – F.
  ]
  #resp(2)[
    Aº7 = Cº7 = Ebº7 = F\#º7 (família 1). \
    Gº7 = Bbº7 = C\#º7 = Eº7 (família 2). \
    Fº7 = G\#º7 (Abº7) = Bº7 = Dº7 (família 3). \
    D\#º7 = F\#º7 = Aº7 = Cº7 (família 1).
  ]
  #resp(3)[
    A7(b9): A C\# E G Bb → C\#º7 → resolve em D ou Dm. \
    D7(b9): D F\# A C Eb → F\#º7 → resolve em G ou Gm. \
    E7(b9): E G\# B D F → G\#º7 → resolve em A ou Am.
  ]
  #resp(4)[
    a) Passagem ascendente (baixo Sol – Sol\# – Lá); G\#º7 = E7(b9) sem fundamental, o V7/II de G. \
    b) Passagem descendente (baixo Lá – Láb – Sol), cromático. \
    c) Auxiliar (mesmo baixo, Sol). \
    d) Dominante: Bº7 = G7(b9) sem fundamental, resolvendo em C. \
    e) Passagem ascendente (baixo Fá – Fá\# – Sol); F\#º7 = D7(b9) sem fundamental, apontando para o Sol do baixo. \
    f) Passagem descendente (baixo Mi – Mib – Ré), cromático.
  ]
  #resp(5)[
    Gº7: 3-x-2-3-2-x · x-10-11-9-11-x · x-x-5-6-5-6. \
    Dº7: 10-x-9-10-9-x · x-5-6-4-6-x · x-x-0-1-0-1 (ou x-x-12-13-12-13). \
    Como cada º7 se repete a cada 3 casas, qualquer shape deslocado em múltiplos de 3 casas também está correto.
  ]
  #resp(6)[
    Exercício prático — critério de sucesso: as quatro posições da escada soam com as quatro cordas limpas (sem a 6ª e a 1ª), as trocas acontecem no tempo a 60 BPM e a resolução Bº7 → C soa sem notas abafadas.
  ]
  #resp(7)[
    Resposta pessoal. Exemplo: C7M – C\#º7 – Dm7 – D\#º7 – Em7 – Ebº7 – Dm7 – Bº7 – C7M (C\#º7 e D\#º7: passagens ascendentes; Ebº7: passagem descendente; Bº7: dominante, no lugar do G7).
  ]
]
