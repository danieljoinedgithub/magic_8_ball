import 'dart:math';

class Respostas {
  // Lista de frases
  static final List<String> frases = [
    "Claro, porque eu sou super confiável para prever o futuro.",
    "Sim... e unicórnios existem.",
    "Definitivamente, se ignorares a realidade.",
    "Pergunta ao teu horóscopo. Talvez ele saiba.",
    "Acho que vais precisar de sorte... e de um milagre.",
    "Se queres uma resposta séria, tenta outra app.",
    "Com certeza! Só não me perguntes como ou quando.",
    "Sim, mas só se estiveres numa dimensão alternativa.",
    "Sim, mas primeiro compra um bilhete de loteria.",
    "Claro! O que pode dar errado, né?",
    "Com certeza! Mas se não der certo, não me culpes.",
    "Sim, desde que continues a acreditar em magia.",
    "Os astros estão ocupados, mas eu digo que sim!",
    "Nem por um milhão de anos... ou talvez amanhã.",
    "Com certeza! Afinal, o caos é divertido.",
    "As hipóteses estão entre 0% e 100%. Boa sorte!",
    "Sim, mas só se dançares primeiro.",
    "Hmm... deixa-me adivinhar: não, mas quase.",
    "Sim, mas só se ofereceres pizza em troca.",
    "O futuro é incerto, mas o sarcasmo é garantido."
  ];

  // Função que devolve uma frase aleatória
  static String obterFraseAleatoria() {
    final random = Random();
    return frases[random.nextInt(frases.length)];
  }
}
