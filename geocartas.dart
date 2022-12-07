import 'dart:io';
import 'dart:math';

main() {
  GeoCartas().jogadorJoga();
}

class GeoCartas {
  jogadorJoga() {
    int pontuacaoJogador = 0;
    while (pontuacaoJogador != 5) {
      stdout.write("Digite sua primeira escolha: ");
      String? input1 = stdin.readLineSync();
      stdout.write("Digite sua segunda escolha: ");
      String? input2 = stdin.readLineSync();
      int jogada1 = int.parse(input1 ?? "0"); // conversão de variáveis
      int jogada2 = int.parse(input2 ?? "0");
      if (jogada1 == 1 && jogada2 == 1) {
        // ajustar, somente para teste
        pontuacaoJogador += 1;
        print("Pontuação do jogador: $pontuacaoJogador");
      } else {
        maquinaJoga();
      }
    }
  }

  maquinaJoga() {
    int pontuacaoMaquina = 0;
    while (pontuacaoMaquina != 2) {
      int jogadaMaquina1 = Random().nextInt(2);
      int jogadaMaquina2 = Random().nextInt(2);
      print("número 1 da máquina: $jogadaMaquina1");
      print("número 2 da máquina: $jogadaMaquina2");
      if (jogadaMaquina1 == 1 && jogadaMaquina2 == 1) {
        pontuacaoMaquina += 1;
        print("Pontuação da Máquina: $pontuacaoMaquina");
      } else {
        jogadorJoga();
      }
    }
  }
}
