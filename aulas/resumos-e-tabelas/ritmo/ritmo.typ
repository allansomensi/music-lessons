#import "/templates/layout.typ": *
#import "/templates/components.typ": *

#show: aula.with(
  instrumento: "Ritmo",
  nivel: "Teoria Musical",
)

// ============================================================
// HELPERS LOCAIS
// ============================================================

// Tabela no padrão dos resumos: cabeçalho luma(50) com texto
// branco, zebra luma(240) e moldura arredondada.
#let tabela-resumo(
  cabecalho,
  linhas,
  columns: auto,
  alinhar: center + horizon,
  inset: (x: 0.55em, y: 0.5em),
  tamanho: 10pt,
  negrito-1a: true,
  largura: 100%,
) = {
  let n = cabecalho.len()
  let cols = if columns == auto { (1fr,) * n } else { columns }
  let corpo = linhas.map(l => l.enumerate().map(p => {
    let (i, c) = p
    if i == 0 and negrito-1a { strong(c) } else { c }
  }))
  align(center, block(
    radius: 4pt,
    stroke: 0.75pt + black,
    clip: true,
    width: largura,
    breakable: false,
    {
      set text(size: tamanho)
      set par(justify: false, leading: 0.6em)
      table(
        columns: cols,
        align: alinhar,
        inset: inset,
        stroke: 0.5pt + black,
        fill: (_, row) => if row == 0 { luma(50) } else if calc.even(row) { luma(240) } else { white },
        table.header(..cabecalho.map(h => text(fill: white, weight: "bold", h))),
        ..corpo.flatten(),
      )
    },
  ))
}

// Parágrafo "grudado" no bloco seguinte (evita título órfão)
#let intro(body) = block(sticky: true, below: 0.9em, body)
// Caixa com texto alinhado à esquerda
#let aviso(tipo, body) = {
  let rot = (dica: "Dica:", atencao: "Atenção:", resumo: "Resumo:", neutro: none).at(tipo)
  caixa(tipo: tipo, titulo: none, width: 100%)[#set align(left); #if rot != none [*#rot* ]#body]
}
#let nota-rodape(body) = block(above: 0.5em, text(size: 8.5pt, fill: color-muted, body))

// ============================================================
// SÍMBOLOS DESENHADOS (locais)
// ============================================================

#let ink = color-strong
// Duas figuras unidas por ligadura de valor
#let ligadura(a, b, ponto-a: false, sep: 22pt) = box(width: sep + 16pt, height: 30pt, baseline: 0pt, {
  place(bottom + left, dy: -7pt, nota(a, ponto: ponto-a))
  place(bottom + left, dx: sep, dy: -7pt, nota(b))
  place(bottom + left, dx: 2pt, curve(stroke: 0.9pt + ink, curve.move((0pt, -4pt)), curve.cubic((4pt, 0pt), (sep - 2pt, 0pt), (sep + 2pt, -4pt))))
})
// Quiáltera: grupo com o número acima da barra
#let quialtera(n, barras: 1, num: auto, escala: 1) = {
  let larg = (7.4pt + 9pt) * escala * (n - 1) + 8.4pt * escala
  box(width: larg, height: 36pt * escala, baseline: 0pt, {
    place(bottom + left, grupo-notas(n, barras: barras, escala: escala))
    place(top + center, text(size: 8.5pt, weight: "bold", style: "italic")[#(if num == auto { n } else { num })])
  })
}
#let tercina-seminimas = box(width: 46pt, height: 36pt, baseline: 0pt, {
  for i in range(3) { place(bottom + left, dx: i * 16pt, nota("seminima")) }
  place(top + left, dx: 6pt, dy: 4pt, line(length: 34pt, stroke: 0.7pt + ink))
  place(top + left, dx: 6pt, dy: 4pt, line(angle: 90deg, length: 4pt, stroke: 0.7pt + ink))
  place(top + left, dx: 40pt, dy: 4pt, line(angle: 90deg, length: 4pt, stroke: 0.7pt + ink))
  place(top + left, dx: 19.5pt, dy: -1pt, box(fill: white, inset: (x: 1.5pt), text(size: 8.5pt, weight: "bold", style: "italic")[3]))
})
#let coda(t: 16pt) = box(width: t, height: t, baseline: 25%, {
  place(center + horizon, circle(radius: t * 0.28, stroke: 1.1pt + ink))
  place(center + horizon, line(length: t, stroke: 1pt + ink))
  place(center + horizon, line(angle: 90deg, length: t, stroke: 1pt + ink))
})
#let segno(t: 18pt) = box(width: t, height: t, baseline: 25%, {
  place(center + horizon, text(size: t * 1.05, style: "italic", font: "Linux Libertine")[S])
  place(center + horizon, line(start: (-t * 0.3, t * 0.38), end: (t * 0.3, -t * 0.38), stroke: 1pt + ink))
  place(center + horizon, dx: -t * 0.3, dy: -t * 0.05, circle(radius: 1.4pt, fill: ink))
  place(center + horizon, dx: t * 0.3, dy: t * 0.05, circle(radius: 1.4pt, fill: ink))
})
#let pauta(w, corpo) = box(width: w, height: 20pt, baseline: 30%, {
  for i in range(5) { place(top + left, dy: i * 5pt, line(length: w, stroke: 0.5pt + luma(90))) }
  corpo
})
#let rep-ini = pauta(26pt, {
  place(top + left, dx: 4pt, rect(width: 2.6pt, height: 20pt, fill: ink))
  place(top + left, dx: 9pt, line(angle: 90deg, length: 20pt, stroke: 0.7pt + ink))
  place(top + left, dx: 12.5pt, dy: 6.3pt, circle(radius: 1.3pt, fill: ink))
  place(top + left, dx: 12.5pt, dy: 11.3pt, circle(radius: 1.3pt, fill: ink))
})
#let rep-fim = pauta(26pt, {
  place(top + left, dx: 9pt, dy: 6.3pt, circle(radius: 1.3pt, fill: ink))
  place(top + left, dx: 9pt, dy: 11.3pt, circle(radius: 1.3pt, fill: ink))
  place(top + left, dx: 15pt, line(angle: 90deg, length: 20pt, stroke: 0.7pt + ink))
  place(top + left, dx: 18.5pt, rect(width: 2.6pt, height: 20pt, fill: ink))
})
#let barra-final = pauta(22pt, {
  place(top + left, dx: 8pt, line(angle: 90deg, length: 20pt, stroke: 0.7pt + ink))
  place(top + left, dx: 12pt, rect(width: 2.6pt, height: 20pt, fill: ink))
})
#let simile = pauta(26pt, {
  place(top + left, dx: 7pt, dy: 15pt, line(start: (0pt, 0pt), end: (12pt, -10pt), stroke: 2.4pt + ink))
  place(top + left, dx: 7.5pt, dy: 6.5pt, circle(radius: 1.4pt, fill: ink))
  place(top + left, dx: 16.5pt, dy: 11.5pt, circle(radius: 1.4pt, fill: ink))
})
#let hairpin(cresc: true, w: 40pt, h: 9pt) = box(width: w, height: h, baseline: 10%, {
  if cresc {
    place(top + left, line(start: (0pt, h / 2), end: (w, 0pt), stroke: 0.9pt + ink))
    place(top + left, line(start: (0pt, h / 2), end: (w, h), stroke: 0.9pt + ink))
  } else {
    place(top + left, line(start: (0pt, 0pt), end: (w, h / 2), stroke: 0.9pt + ink))
    place(top + left, line(start: (0pt, h), end: (w, h / 2), stroke: 0.9pt + ink))
  }
})
#let casas-volta = box(width: 86pt, height: 14pt, baseline: 30%, {
  place(top + left, line(angle: 90deg, length: 12pt, stroke: 0.8pt + ink))
  place(top + left, line(length: 38pt, stroke: 0.8pt + ink))
  place(top + left, dx: 3pt, dy: 2pt, text(size: 8pt, weight: "bold")[1.])
  place(top + left, dx: 46pt, line(angle: 90deg, length: 12pt, stroke: 0.8pt + ink))
  place(top + left, dx: 46pt, line(length: 38pt, stroke: 0.8pt + ink))
  place(top + left, dx: 49pt, dy: 2pt, text(size: 8pt, weight: "bold")[2.])
})
#let fermata(t: 14pt) = box(width: t, height: t * 0.6, baseline: 0pt, {
  place(bottom + left, curve(stroke: 1.1pt + ink, curve.move((0pt, 0pt)), curve.cubic((0pt, -t * 0.75), (t, -t * 0.75), (t, 0pt))))
  place(bottom + left, dx: t / 2 - 1.5pt, dy: -1pt, circle(radius: 1.5pt, fill: ink))
})
// Fórmula de compasso empilhada
#let fc(n, d, t: 13pt) = box(baseline: 35%, stack(dir: ttb, spacing: 1.5pt, align(center, text(size: t, weight: "bold")[#n]), align(center, text(size: t, weight: "bold")[#d])))
#let din(s) = box(inset: (y: 3pt), text(size: 12.5pt, weight: "bold", style: "italic", ligatures: false, s))
#let tabsym(s) = text(size: 9.5pt, raw(s))
// Célula com figura, centralizada verticalmente
#let fig(x) = block(inset: (y: 3pt), x)
#let semibreve(ponto: false) = move(dy: -8pt, nota("semibreve", ponto: ponto))

// ============================================================
// CONTEÚDO
// ============================================================

= Ritmo e Sinais de Leitura

Este resumo reúne o essencial da escrita rítmica: figuras e pausas, valores relativos, ponto de aumento, ligadura, quiálteras, fórmulas de compasso, contagem, andamentos, dinâmica, sinais de repetição e os símbolos mais comuns de tablatura. *Como usar:* consulte as tabelas sempre que encontrar um símbolo desconhecido numa partitura, cifra ou tablatura; para estudar, leia em voz alta as contagens da seção 6 batendo o pulso com o pé.

== 1. Figuras rítmicas e pausas

#tabela-resumo(
  ([Figura], [Nome], [Pausa], [Duração em 4/4], [Número], [Equivale a]),
  (
    (fig(semibreve()), [Semibreve], fig(pausa("semibreve")), [4 tempos], [1], [2 mínimas]),
    (fig(nota("minima")), [Mínima], fig(pausa("minima")), [2 tempos], [2], [2 semínimas]),
    (fig(nota("seminima")), [Semínima], fig(pausa("seminima")), [1 tempo], [4], [2 colcheias]),
    (fig(nota("colcheia")), [Colcheia], fig(pausa("colcheia")), [½ tempo], [8], [2 semicolcheias]),
    (fig(nota("semicolcheia")), [Semicolcheia], fig(pausa("semicolcheia")), [¼ de tempo], [16], [2 fusas]),
  ),
  columns: (0.8fr, 1.1fr, 0.8fr, 1.1fr, 0.75fr, 1.3fr),
  inset: (x: 0.4em, y: 0.35em),
  tamanho: 10pt,
  negrito-1a: false,
)

#nota-rodape[A duração considera a semínima como unidade de tempo (compassos x/4). O *número* é o que representa a figura no denominador da fórmula de compasso. Existem ainda a fusa (32, ⅛ de tempo) e a semifusa (64, ¹⁄₁₆ de tempo). A pausa de semibreve fica *pendurada* na 4ª linha; a de mínima fica *sentada* na 3ª linha.]

== 2. Valores relativos (árvore de divisão)

#let linha-arvore(rotulo, n, figura) = (
  align(right + horizon, text(size: 9.5pt, rotulo)),
  grid(columns: (1fr,) * n, align: center + horizon, ..range(n).map(_ => figura)),
)

#align(center, block(
  width: 100%,
  stroke: 0.75pt + black,
  radius: 4pt,
  inset: (x: 12pt, y: 6pt),
  breakable: false,
  grid(
    columns: (3.2cm, 1fr),
    column-gutter: 10pt,
    row-gutter: 5pt,
    ..linha-arvore([*1* semibreve], 1, semibreve()),
    ..linha-arvore([\= *2* mínimas], 2, nota("minima")),
    ..linha-arvore([\= *4* semínimas], 4, nota("seminima")),
    ..linha-arvore([\= *8* colcheias], 4, grupo-notas(2)),
    ..linha-arvore([\= *16* semicolcheias], 4, grupo-notas(4, barras: 2)),
  ),
))

#nota-rodape[Cada figura vale o dobro da seguinte e a metade da anterior. Colcheias e semicolcheias costumam ser agrupadas por barras (em vez de bandeirolas), um grupo por tempo.]

#pagebreak()

== 3. Ponto de aumento e ligadura

#intro[O *ponto de aumento*, escrito à direita da figura, acrescenta metade do valor dela. A *ligadura de valor* une duas notas de mesma altura: toca-se só a primeira, que dura a soma das duas. (A ligadura entre notas *diferentes* é de expressão: indica legato.)]

#tabela-resumo(
  ([Figura pontuada], [Nome], [Valor], [Equivale a (com ligadura)]),
  (
    (fig(semibreve(ponto: true)), [Semibreve pontuada], [4 + 2 = *6 tempos*], [semibreve + mínima]),
    (fig(nota("minima", ponto: true)), [Mínima pontuada], [2 + 1 = *3 tempos*], fig(ligadura("minima", "seminima"))),
    (fig(nota("seminima", ponto: true)), [Semínima pontuada], [1 + ½ = *1½ tempo*], fig(ligadura("seminima", "colcheia"))),
    (fig(nota("colcheia", ponto: true)), [Colcheia pontuada], [½ + ¼ = *¾ de tempo*], fig(ligadura("colcheia", "semicolcheia"))),
  ),
  columns: (1fr, 1.4fr, 1.3fr, 1.5fr),
  inset: (x: 0.4em, y: 0.3em),
  tamanho: 10pt,
  negrito-1a: false,
)

#nota-rodape[Duplo ponto: o segundo ponto acrescenta metade do valor do primeiro (mínima com duplo ponto = 2 + 1 + ½ = 3½ tempos). A ligadura é usada principalmente quando a nota atravessa a barra de compasso, onde o ponto não pode ser usado.]

== 4. Quiálteras (tercinas e outras)

#intro[Quiáltera é um grupo de notas tocado no tempo de um número *diferente* de figuras do mesmo tipo. A mais comum é a *tercina*: três notas iguais no tempo de duas. O número sobre o grupo indica a quiáltera.]

#tabela-resumo(
  ([Escrita], [Nome], [Ocupa o tempo de], [Duração em 4/4], [Como sentir]),
  (
    (fig(quialtera(3)), [Tercina de colcheias], [2 colcheias], [1 tempo], [3 notas iguais por pulso: “1-e-a”]),
    (fig(tercina-seminimas), [Tercina de semínimas], [2 semínimas], [2 tempos], [3 notas espalhadas por 2 pulsos]),
    (fig(quialtera(5, barras: 2)), [Quintina], [4 semicolcheias], [1 tempo], [5 notas iguais por pulso]),
    (fig(quialtera(6, barras: 2)), [Sextina], [4 semicolcheias], [1 tempo], [2 tercinas seguidas por pulso]),
  ),
  columns: (1.25fr, 1.25fr, 1.1fr, 0.9fr, 1.75fr),
  alinhar: (c, r) => if c == 4 { left + horizon } else { center + horizon },
  inset: (x: 0.4em, y: 0.3em),
  tamanho: 9.5pt,
  negrito-1a: false,
)

#v(0.6em)
#aviso("dica")[Para sentir a tercina, fale “*1*-e-a, *2*-e-a” mantendo o pulso firme: as três sílabas cabem exatamente em um tempo. O ritmo de *shuffle* (blues, swing) nasce da tercina, tocando a 1ª e a 3ª nota de cada grupo.]

#pagebreak()

== 5. Fórmulas de compasso

#intro[O *numerador* indica quantas figuras cabem no compasso; o *denominador*, qual figura (pelo número da seção 1). Nos compassos *simples*, cada tempo se divide em 2; nos *compostos*, em 3, e a unidade de tempo é uma figura pontuada.]

#tabela-resumo(
  ([Compasso], [Classificação], [Tempos], [Unidade de tempo], [Divisão do tempo], [Uso típico]),
  (
    (fc(2, 4), [binário simples], [2], fig(nota("seminima", escala: 0.8)), fig(grupo-notas(2, escala: 0.8)), [samba, marcha, polca]),
    (fc(3, 4), [ternário simples], [3], fig(nota("seminima", escala: 0.8)), fig(grupo-notas(2, escala: 0.8)), [valsa, minueto]),
    (fc(4, 4), [quaternário simples (C)], [4], fig(nota("seminima", escala: 0.8)), fig(grupo-notas(2, escala: 0.8)), [rock, pop, bossa, funk]),
    (fc(2, 2), [binário simples (₵)], [2], fig(nota("minima", escala: 0.8)), fig(box(nota("seminima", escala: 0.8) + h(3pt) + nota("seminima", escala: 0.8))), [marchas rápidas, frevo, choro]),
    (fc(6, 8), [binário composto], [2], fig(nota("seminima", ponto: true, escala: 0.8)), fig(grupo-notas(3, escala: 0.8)), [baladas em 6/8, tarantela]),
    (fc(9, 8), [ternário composto], [3], fig(nota("seminima", ponto: true, escala: 0.8)), fig(grupo-notas(3, escala: 0.8)), [jigas, danças folclóricas]),
    (fc(12, 8), [quaternário composto], [4], fig(nota("seminima", ponto: true, escala: 0.8)), fig(grupo-notas(3, escala: 0.8)), [blues lento, soul, doo-wop]),
  ),
  columns: (0.85fr, 1.55fr, 0.7fr, 1fr, 1fr, 1.6fr),
  inset: (x: 0.4em, y: 0.3em),
  tamanho: 9.5pt,
  negrito-1a: false,
)

#nota-rodape[Regra dos compostos: divida o numerador por 3 para obter o número de tempos (6/8 → 2, 9/8 → 3, 12/8 → 4). O 4/4 também é escrito com o símbolo C; o 2/2 (_alla breve_), com ₵. Os primeiros tempos de cada compasso são os fortes: em 4/4, o 1 é forte e o 3 meio-forte.]

== 6. Contagem (sílabas)

#tabela-resumo(
  ([Subdivisão], [Escrita (1 tempo)], [Contagem em 4/4]),
  (
    ([Semínimas], fig(nota("seminima", escala: 0.8)), [*1* · *2* · *3* · *4*]),
    ([Colcheias], fig(grupo-notas(2, escala: 0.8)), [*1* e *2* e *3* e *4* e]),
    ([Tercinas], fig(quialtera(3, escala: 0.8)), [*1* e a · *2* e a · *3* e a · *4* e a]),
    ([Semicolcheias], fig(grupo-notas(4, barras: 2, escala: 0.8)), [*1* i e a · *2* i e a · *3* i e a · *4* i e a]),
  ),
  columns: (1fr, 1fr, 2.6fr),
  inset: (x: 0.4em, y: 0.3em),
  tamanho: 10pt,
)

#v(0.5em)
#tabela-resumo(
  ([Compasso composto], [Contagem por colcheia], [Contagem por tempo]),
  (
    ([6/8], [*1* 2 3 *4* 5 6], [*1* e a *2* e a]),
    ([9/8], [*1* 2 3 *4* 5 6 *7* 8 9], [*1* e a *2* e a *3* e a]),
    ([12/8], [*1* 2 3 *4* 5 6 *7* 8 9 *10* 11 12], [*1* e a *2* e a *3* e a *4* e a]),
  ),
  columns: (1fr, 1.9fr, 1.7fr),
  inset: (x: 0.4em, y: 0.4em),
  tamanho: 10pt,
)

#nota-rodape[Os números em negrito caem no pulso (onde o pé bate). Tercinas e compassos compostos usam as mesmas sílabas (“e-a”), pois ambos dividem o tempo em três. Existem outras convenções de sílabas (como “ta-ka-di-mi”); escolha uma e use-a sempre, para que cada sílaba corresponda sempre à mesma posição dentro do tempo.]

#pagebreak()

== 7. Andamento

#intro[O andamento é a velocidade do pulso, medida em *BPM* (batidas por minuto) no metrônomo. Os termos tradicionais são italianos; as faixas abaixo são aproximadas e variam conforme a fonte.]

#grid(
  columns: (1.25fr, 1fr),
  gutter: 1em,
  tabela-resumo(
    ([Termo], [Significado], [BPM]),
    (
      ([Grave], [muito lento, solene], [25–45]),
      ([Largo], [amplo, muito lento], [40–60]),
      ([Larghetto], [um pouco menos lento], [60–66]),
      ([Adagio], [lento, calmo], [66–76]),
      ([Andante], [“andando”, moderadamente lento], [76–108]),
      ([Moderato], [moderado], [108–120]),
      ([Allegro], [rápido, alegre], [120–156]),
      ([Vivace], [vivo, animado], [156–176]),
      ([Presto], [muito rápido], [168–200]),
      ([Prestissimo], [o mais rápido possível], [acima de 200]),
    ),
    columns: (1fr, 1.7fr, 0.85fr),
    inset: (x: 0.4em, y: 0.42em),
    tamanho: 9.5pt,
  ),
  tabela-resumo(
    ([Indicação], [Efeito]),
    (
      ([_accel._ (accelerando)], [acelerar aos poucos]),
      ([_rit._ (ritardando)], [desacelerar aos poucos]),
      ([_rall._ (rallentando)], [desacelerar aos poucos]),
      ([_a tempo_], [voltar ao andamento original]),
      ([_rubato_], [flexibilizar o tempo com expressão]),
      ([#fermata() (fermata)], [sustentar a nota além do valor]),
      ([♩ = 90], [90 semínimas por minuto]),
    ),
    columns: (1.15fr, 1.3fr),
    inset: (x: 0.4em, y: 0.5em),
    tamanho: 9.5pt,
  ),
)

== 8. Dinâmica

#grid(
  columns: (1.25fr, 1fr),
  gutter: 1em,
  tabela-resumo(
    ([Sinal], [Nome], [Significado]),
    (
      (din("ppp"), [pianississimo], [o mais suave possível]),
      (din("pp"), [pianissimo], [muito suave]),
      (din("p"), [piano], [suave]),
      (din("mp"), [mezzo-piano], [meio suave]),
      (din("mf"), [mezzo-forte], [meio forte]),
      (din("f"), [forte], [forte]),
      (din("ff"), [fortissimo], [muito forte]),
      (din("fff"), [fortississimo], [o mais forte possível]),
    ),
    columns: (0.7fr, 1.2fr, 1.4fr),
    inset: (x: 0.4em, y: 0.36em),
    tamanho: 9.5pt,
    negrito-1a: false,
  ),
  tabela-resumo(
    ([Sinal], [Significado]),
    (
      (hairpin(), [_crescendo_ (_cresc._): aumentar a intensidade aos poucos]),
      (hairpin(cresc: false), [_decrescendo_ ou _diminuendo_ (_decresc._, _dim._): diminuir aos poucos]),
      (din("sfz"), [_sforzando_: acento forte e súbito em uma nota]),
      (din("fp"), [_forte-piano_: ataque forte e logo suave]),
      (text(size: 13pt, weight: "bold")[>], [acento: destacar a nota]),
    ),
    columns: (0.75fr, 1.9fr),
    alinhar: (c, r) => if c == 1 { left + horizon } else { center + horizon },
    inset: (x: 0.4em, y: 0.45em),
    tamanho: 9.5pt,
    negrito-1a: false,
  ),
)

#nota-rodape[A dinâmica é sempre relativa: um _f_ num violão solo não tem a mesma intensidade de um _f_ numa banda de rock. O que importa é o contraste entre as indicações.]

#pagebreak()

== 9. Sinais de repetição e navegação

#tabela-resumo(
  ([Sinal], [Nome], [Como ler]),
  (
    ([#rep-ini #h(4pt) #rep-fim], [Ritornello], [repete o trecho entre os sinais; sem o sinal inicial, volta ao começo]),
    (casas-volta, [Casa 1 e casa 2 (volta)], [1ª vez: casa 1 e repete; 2ª vez: pula a casa 1 e toca a casa 2]),
    ([*D.C.*], [Da Capo], [volta ao início da música]),
    ([*D.C. al Fine*], [Da Capo al Fine], [volta ao início e termina onde estiver escrito _Fine_]),
    ([#segno()], [Segno (sinal)], [marca o ponto de retorno do D.S.]),
    ([*D.S.*], [Dal Segno], [volta ao sinal #segno(t: 13pt)]),
    ([*D.S. al Coda*], [Dal Segno al Coda], [volta ao sinal #segno(t: 13pt) e, no _To Coda_, salta para a Coda]),
    ([#coda()], [Coda], [trecho final; também marca o ponto de salto (_To Coda_ #coda(t: 12pt))]),
    ([*Fine*], [Fim], [ponto final da música após um D.C. ou D.S.]),
    (barra-final, [Barra final], [fim da música (ou da seção)]),
    (simile, [Repetição de compasso], [repete o compasso anterior]),
  ),
  columns: (1.05fr, 1.1fr, 2.6fr),
  alinhar: (c, r) => if c == 2 { left + horizon } else { center + horizon },
  inset: (x: 0.45em, y: 0.42em),
  tamanho: 9.5pt,
  negrito-1a: false,
)

#nota-rodape[Roteiro típico: Intro – #segno(t: 11pt) Verso – Refrão (_To Coda_ #coda(t: 10pt)) – Ponte – *D.S. al Coda*: volte ao sinal, toque até o _To Coda_ e salte para a Coda final. Em D.C. e D.S., normalmente não se repetem os ritornellos internos.]

== 10. Símbolos de tablatura

#tabela-resumo(
  ([Símbolo], [Exemplo], [Nome], [Como tocar]),
  (
    (tabsym("h"), tabsym("5h7"), [Hammer-on], [toque a casa 5 e “martele” a 7 sem palhetar]),
    (tabsym("p"), tabsym("7p5"), [Pull-off], [com 7 e 5 presas, puxe o dedo da 7 fazendo soar a 5]),
    (tabsym("b"), tabsym("7b9"), [Bend], [na casa 7, empurre a corda até soar a nota da casa 9]),
    (tabsym("r"), tabsym("7b9r7"), [Release], [faça o bend e volte a corda à posição original]),
    (tabsym("/"), tabsym("5/7"), [Slide ascendente], [deslize da casa 5 até a 7 sem soltar a corda]),
    (tabsym("\\"), tabsym("7\\5"), [Slide descendente], [deslize da casa 7 até a 5]),
    (tabsym("~"), tabsym("7~~~"), [Vibrato], [oscile a afinação da nota com pequenos bends]),
    (tabsym("x"), tabsym("x"), [Nota abafada], [encoste sem pressionar e palhete: som percussivo]),
    (tabsym("PM"), tabsym("PM----"), [Palm mute], [lateral da mão apoiada na ponte durante o tracejado]),
    (tabsym("<12>"), tabsym("<12>"), [Harmônico natural], [encoste o dedo sobre o traste 12, sem pressionar]),
    (tabsym("AH / PH"), tabsym("7(AH19)"), [Harmônico artificial], [AH: harmônico 12 casas acima da nota presa; PH: roce o polegar logo após palhetar]),
    (tabsym("t"), tabsym("t12"), [Tapping], [percuta a casa 12 com um dedo da mão da palheta]),
    (tabsym("( )"), tabsym("(7)"), [Nota fantasma], [nota tocada bem suave, quase só sugerida]),
  ),
  columns: (0.7fr, 0.8fr, 1.2fr, 2.9fr),
  alinhar: (c, r) => if c == 3 { left + horizon } else { center + horizon },
  inset: (x: 0.45em, y: 0.4em),
  tamanho: 9.5pt,
  negrito-1a: false,
)

#nota-rodape[Bends também podem vir com a medida: ½ (meio tom), _full_ (um tom), 1½ (um tom e meio).]
