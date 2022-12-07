import 'dart:io';
import 'dart:math';

main() {
  GeoCartas().iniciarGame();
}

class GeoCartas {
  int pontuacaoMaquina = 0;
  int pontuacaoJogador = 0;
  int pontuacaoMaxima = 26;

  List<String> estados = [
    "acre",
    "alagoas",
    "Amapá",
    "Amazonas",
    "Bahia",
    "Ceará",
    "Espírito Santo",
    "Goiás",
    "Maranhão",
    "Mato Grosso",
    "Mato Grosso do Sul",
    "Minas Gerais",
    "Pará",
    "Paraíba",
    "Paraná",
    "Pernambuco",
    "Piauí",
    "Rio de Janeiro",
    "Rio Grande do Norte",
    "Rio Grande do Sul",
    "Rondônia",
    "Roraima",
    "Santa Catarina",
    "São Paulo",
    "Sergipe",
    "Tocantins",
    "Distrito Federal"
  ];

  List<String> capitais = [
    "rio branco",
    "Maceió",
    "Macapá",
    "Manaus",
    "Salvador",
    "Fortaleza",
    "Vitória",
    "Goiânia",
    "São Luís",
    "Cuiabá",
    "Campo Grande",
    "Belo Horizonte",
    "Belém",
    "João Pessoa",
    "Curitiba",
    "Recife",
    "Teresina",
    "Rio de Janeiro",
    "Natal",
    "Porto Alegre",
    "Porto Velho",
    "Boa Vista",
    "Florianópolis",
    "São Paulo",
    "Aracaju",
    "Palmas",
    "Brasília"
  ];

  iniciarGame() {
    print("!GEOCARTAS!");
    print("Escolha um número de 0 a 25");
    jogadorJoga();
  }

  jogadorJoga() {
    while (pontuacaoJogador != pontuacaoMaxima) {
      stdout.write("Digite sua primeira escolha: ");
      String? input1 = stdin.readLineSync();
      stdout.write("Digite sua segunda escolha: ");
      String? input2 = stdin.readLineSync();
      int? jogada1 = int.parse(input1 ?? "0"); // conversão de variáveis
      int? jogada2 = int.parse(input2 ?? "0");
      if (pontuacaoMaquina + pontuacaoJogador == pontuacaoMaxima) {
        print("Pontuação máxima atingida!");
        if (pontuacaoJogador > pontuacaoMaquina) {
          print("O ganhador é o Jogador!");
        } else {
          print("O ganhador é a máquina");
        }
      }
      if (jogada1 == null || jogada2 == null) {
        maquinaJoga();
      }
      if (jogada1 > 25 || jogada2 > 25) {
        print("Por favor digite um valor válido.");
      }
      if (jogada1 == jogada2) {
        registraPontuacao(1);
        estados.removeAt(jogada1);
        capitais.removeAt(jogada2);
        print(estados);
        print(capitais);
      } else {
        maquinaJoga();
      }
    }
  }

  maquinaJoga() {
    while (pontuacaoMaquina != pontuacaoMaxima) {
      int jogadaMaquina1 = Random().nextInt(26);
      int jogadaMaquina2 = Random().nextInt(26);
      print("número 1 da máquina: $jogadaMaquina1");
      print("número 2 da máquina: $jogadaMaquina2");
      if (pontuacaoMaquina + pontuacaoJogador == pontuacaoMaxima) {
        print("Pontuação máxima atingida!");
        if (pontuacaoJogador > pontuacaoMaquina) {
          print("O ganhador é o Jogador!");
        } else {
          print("O ganhador é a máquina");
        }
      }
      if (jogadaMaquina1 > 25 || jogadaMaquina2 > 25) {
        print("Por favor digite um valor válido.");
      }
      if (jogadaMaquina1 == jogadaMaquina2) {
        registraPontuacao(2);
        estados.removeAt(jogadaMaquina1);
        capitais.removeAt(jogadaMaquina2);
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
