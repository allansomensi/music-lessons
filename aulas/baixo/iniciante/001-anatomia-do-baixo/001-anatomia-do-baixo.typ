#import "../../../../templates/layout.typ": *

#show: aula.with(
  instrumento: "Baixo",
  nivel: "Iniciante",
)

= Conhecendo o Instrumento

#v(3em)

#align(center)[
  #image("attachments/anatomia-baixo.jpg", width: 100%)
]

#align(center)[
  #text(size: 8pt, fill: color-muted)[Disponível em: https://www.contrabaixoeletrico.com.br]
]

#pagebreak()

== Tipos de Baixo

Existem diversos modelos de contrabaixo, cada um projetado para atender a diferentes estilos musicais e preferências sonoras. Os principais tipos são:

#explainer-component(
  move(
    dx: 30pt,
    rotate(30deg, image("attachments/precision-bass.jpg", width: 55%)),
  ),
  [
    *Precision Bass (P-Bass):* O modelo elétrico mais tradicional e primeiro a ser produzido em massa. Possui um captador do tipo _split-coil_ (dividido) e entrega um som encorpado, grave e com bastante "soco" (punch). É o padrão absoluto da indústria, imbatível no Rock, Motown e Pop.
  ],
)

#explainer-component(
  move(
    dx: 70pt,
    dy: -10pt,
    rotate(20deg, image("attachments/jazz-bass.jpg", width: 55%)),
  ),
  inverted: true,
  [
    *Jazz Bass (J-Bass):* Equipado com dois captadores (ponte e braço), oferece uma maior versatilidade de timbres. Seu braço é ligeiramente mais fino perto do _headstock_. Produz um som mais estalado, definido e com médios bem presentes. Clássico no Jazz, Funk e na técnica de Slap.
  ],
)

#explainer-component(
  move(
    dx: 30pt,
    rotate(30deg, image("attachments/baixo-acustico.jpg", width: 65%)),
  ),
  [
    *Baixo Acústico (Baixolão):* Possui uma caixa de ressonância semelhante à de um violão, amplificando o som naturalmente. Embora muitas vezes precise ser plugado em apresentações ao vivo para ser ouvido junto à banda, traz um timbre mais amadeirado, quente e intimista ("Unplugged").
  ],
)

#explainer-component(
  move(
    dx: 60pt,
    rotate(30deg, image("attachments/baixo-5-cordas.jpg", width: 60%)),
  ),
  inverted: true,
  [
    *Baixo de 5 (ou mais) Cordas:* Adiciona uma corda mais grave (geralmente afinada em Si), ampliando a extensão das notas baixas sem a necessidade de mudar a posição da mão no braço. É amplamente utilizado no Gospel, Metal, Sertanejo moderno e estilos que exigem mais peso.
  ],
)

#pagebreak()

== Encordoamento

A escolha das cordas define o seu timbre, o ataque e o conforto. Cordas de baixo são grossas e exigem condicionamento dos dedos.

- *Tipos de Enrolamento (Textura e Som):*
  - _Roundwound (Fio Redondo):_ As mais comuns e versáteis. Têm superfície áspera ao toque, som brilhante, com bastante ataque e _sustain_. Excelentes para Rock, Pop e Slap.
  - _Flatwound (Fio Liso):_ Superfície polida e lisa. Produzem um som mais abafado, "gordo" e aveludado, remetendo aos baixos antigos ou ao contrabaixo acústico. Perfeitas para Jazz, R&B tradicional, Reggae, além de desgastarem menos os trastes.

- *Calibres (Espessuras baseadas na corda mais fina, a Sol/G):*
  - _Leve (.040):_ Fáceis de pressionar e confortáveis, são ótimas para iniciantes. Têm uma resposta ágil para técnicas como o _Slap_, porém entregam um pouco menos de peso nos graves em comparação às mais grossas.
  - _Médio (.045):_ O padrão da indústria (geralmente o kit é .045 a .105). Oferecem um excelente equilíbrio entre graves bem definidos, volume e uma tensão confortável e versátil para a mão.
  - _Pesado (.050 ou mais):_ Som extremamente encorpado e potente. São muito utilizadas por baixistas que tocam com afinações mais baixas (como Drop D), mas exigem mais força e resistência da mão esquerda.

== Observações

- Diferente da maioria dos violões, muitos contrabaixos possuem circuito *ativo*, que utiliza um pré-amplificador interno alimentado por uma bateria (geralmente de 9V) escondida na parte de trás do corpo. *Dica:* Lembre-se sempre de desplugar o cabo do seu baixo ativo quando não estiver tocando para não descarregar a bateria.
- O baixo elétrico é um instrumento denso e pesado. O uso de uma correia larga e acolchoada é essencial para distribuir bem o peso, garantindo conforto e evitando dores nas costas e nos ombros durante os estudos.
- O encordoamento do baixo é um investimento considerável (bem mais caro que o de violão). Passar uma flanela limpa e seca para retirar o suor e a oleosidade das cordas após terminar de tocar é uma boa prática para manter o brilho do som e prolongar muito a vida útil das suas cordas.
