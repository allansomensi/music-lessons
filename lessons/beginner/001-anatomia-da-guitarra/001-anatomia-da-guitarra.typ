#import "../../../templates/layout.typ": explainer-component, lesson-template

#show: lesson-template.with(
  module: "Guitarra",
  level: "Iniciante",
)

= Conhecendo o Instrumento

#align(center)[
  #image("attachments/anatomia-guitarra.jpg", width: 85%)
]

#align(center)[
  #text(size: 8pt, fill: luma(100))[Disponível em: https://www.wesleylylycaesar.net/anatomia-da-guitarra]
]

#pagebreak()

== Captadores (Pickups)

São os microfones da guitarra, os captadores são os responsáveis por transformar a vibração das cordas em sinal elétrico. Os principais tipos são:

#v(1em)

#explainer-component(
  image("attachments/captador-singlecoil.svg", width: 100%),
  [
    *Single Coil:* Possui bobina simples e tem um som mais brilhante, estalado e agudo. Muito usado em Blues, Rock, Pop, Funk, Country etc. Emitem mais ruído do que os humbuckers.
  ],
)

#v(2em)

#explainer-component(
  image("attachments/captador-humbucker.svg", width: 100%),
  inverted: true,
  [
    *Humbucker:* Possui bobina dupla e são essencialmente dois single-coils juntos. Som mais encorpado, quente e com maior volume. Cancela o ruído e é ideal para distorções pesadas. É muito usado no Rock, Heavy Metal, Hard Blues etc.
  ],
)

#v(2em)

#explainer-component(
  image("attachments/captador-ativo.svg", width: 100%),
  [
    *Captador Ativo:* Sinal muito forte, compressão natural e baixíssimo ruído. Utilizado no Metal Moderno e afinações mais baixas. Diferente dos captadores passivos, os captadores ativos precisam ser alimentados por uma bateria, geralmente de 9V.
  ],
)

#v(2em)

#explainer-component(
  image("attachments/captador-p90.svg", width: 100%),
  inverted: true,
  [
    *P90:* É um meio termo entre o Single-Coil e o Humbucker. Ele é tecnicamente um single coil, mas sua bobina é mais larga e curta. É conhecido por ser um captador sujo e expressivo, sendo bastante utilizado no Punk Rock e Rock Alternativo.
  ],
)

#pagebreak()

== Ponte

A peça que segura as cordas no corpo da guitarra. A escolha da ponte é um dos fatores que mais define a personalidade e a funcionalidade de uma guitarra, influenciando diretamente a estabilidade da afinação, forma de tocar e a facilidade para trocar cordas e de manutenção. Os principais tipos são:

#v(2em)

#explainer-component(
  image("attachments/ponte-fixa.svg", width: 100%),
  [
    *Ponte Fixa:* É o tipo mais estável. Por não possuir molas ou alavanca, a energia da corda passa diretamente para o corpo. Tem excelente estabilidade de afinação, mais sustain e bastante facilidade para trocar as cordas. É a ponte utilizada nas guitarras Les Paul e SG. \
    _Utilizado por: James Hetfield, Angus Young etc._
  ],
)

#v(2em)

#explainer-component(
  image("attachments/ponte-tremolo.svg", width: 100%),
  inverted: true,
  [
    *Ponte Tremolo:* É a ponte utilizada nas guitarras Fender Stratocaster. Trabalha com um sistema de molas interno que permite usar uma alavanca para alterar a afinação para cima ou para baixo. Ela é presa por 6 parafusos (estilo vintage) ou 2 pivôs (moderno). \
    _Utilizado por: Jimi Hendrix, Stevie Ray Vaughan, John Mayer etc._
  ],
)

#v(2em)

#explainer-component(
  image("attachments/ponte-floyd.svg", width: 100%),
  [
    *Floyd Rose (Ponte Flutuante):* O padrão nas guitarras Superstrato. Permite alavancadas extremas tanto para cima quanto para baixo e proporciona muita liberdade expressiva, no entanto, trocar as cordas e afinar a guitarra é um processo mais demorado e técnico. \
    _Utilizado por: Eddie Van Halen, Steve Vai, Joe Satriani etc._
  ],
)

#pagebreak()

== Encordoamento

Escolher o encordoamento certo é fundamental e vai influenciar o timbre que você busca e a saúde da sua mão e tendões. O calibre dita quanta força você precisa fazer para pressionar as cordas e executar bends, além de influenciar diretamente na ressonância do instrumento.

- *Super Leves (.007 e .008):* Têm baixíssima tensão e exigem pouquíssima força, o que as torna excelentes para facilitar bends extremos e vibratos, além de cansar menos a mão em rotinas longas de estudo. O som tende a ser um pouco mais anasalado. \
  _Utilizadas por: Yngwie Malmsteen, Tony Iommi, Brian May etc._

- *Leves / Padrão (.009):* É o padrão da indústria. A maioria das guitarras vem de fábrica com esse calibre. Oferece um meio-termo, pois são confortáveis o suficiente para solos e têm tensão suficiente para não trastejar ao tocar acordes. \
  _Utilizadas por: Eddie Van Halen, Steve Vai, Joe Satriani etc._

- *Médias e Pesadas (.010, .011 ou mais):* Oferecem um timbre mais encorpado, com mais graves e maior volume. A desvantagem é a alta tensão: fazer bends exige dedos bem calejados e muita força. São ideais para guitarras de escala um pouco mais curta ou para quem usa afinações mais graves na guitarra. \
  _Utilizadas por: Stevie Ray Vaughan, Slash, James Hetfield etc._

== Observações

- Um encordoamento .010 em uma Gibson (escala 24.75") parece muito mais macio do que o mesmo jogo em uma Fender (escala 25.5"). A escala mais longa da Fender coloca mais tensão na corda.
- O braço da guitarra reage ao ambiente. Deixar o instrumento em lugares quentes ou tomando sol direto vai empenar a madeira, alterar a ação das cordas e prejudicar a afinação.
- Se a guitarra faz um chiado que para quando você encosta nas cordas ou na ponte, isso é sinal de que o aterramento está funcionando. O corpo humano funciona como uma antena de ruído e quando você toca nas partes metálicas, você descarrega esse ruído no circuito da guitarra, que o joga para o terra.
