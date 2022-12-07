import 'dart:io';
import 'dart:math';

main() {
  GeoCartas().iniciarGame();
}

class GeoCartas {
  int pontuacaoMaquina = 0;
  int pontuacaoJogador = 0;

  iniciarGame() {
    jogadorJoga();
  }

  jogadorJoga() {
    while (pontuacaoJogador != 5) {
      stdout.write("Digite sua primeira escolha: ");
      String? input1 = stdin.readLineSync();
      stdout.write("Digite sua segunda escolha: ");
      String? input2 = stdin.readLineSync();
      int jogada1 = int.parse(input1 ?? "0"); // conversão de variáveis
      int jogada2 = int.parse(input2 ?? "0");
      if (jogada1 == 1 && jogada2 == 1) {
        // ajustar, somente para teste
        registraPontuacao(1);
      } else {
        maquinaJoga();
      }
    }
  }

  maquinaJoga() {
    while (pontuacaoMaquina != 2) {
      int jogadaMaquina1 = Random().nextInt(2);
      int jogadaMaquina2 = Random().nextInt(2);
      print("número 1 da máquina: $jogadaMaquina1");
      print("número 2 da máquina: $jogadaMaquina2");
      if (jogadaMaquina1 == 1 && jogadaMaquina2 == 1) {
        registraPontuacao(2);
      } else {
        jogadorJoga();
      }
    }
  }

  registraPontuacao(int quemPontua) {
    if (quemPontua == 1) {
      pontuacaoJogador += 1;
      print("pontuação jogador: $pontuacaoJogador");
    }
    if (quemPontua == 2) {
      pontuacaoMaquina += 1;
      print("pontuação máquina: $pontuacaoMaquina");
    }
  }
}
