void main() {

  Personagem personagem1 = new Personagem('Rennan', 'Humano', 'Ladrão', 24, 100, 100, 1.74, false, ['Ataque rápido', 'Ataque furtivo aumenta o dano em 3x', 'Ao eliminar inimigos furtivamente recebe uma recompensa maior em xp', 'Golpe com adagas dão o dobro de dano']);
  print(personagem1.exibirFicha());

  Guerreiro guerreiro1 = new Guerreiro('João', 'Humano', 26, 100, 100, 1.69, false, ['Ataque forte', 'Quanto menos vida o guerreiro tiver, mais dano de ataque ele possui', 'Ao eliminar inimigos recebe uma recompensa maior em xp', 'Golpe com espada longa dão o dobro de dano']);
  print(guerreiro1.exibirFicha());

  Mago mago1 = new Mago('Apollo', 'Humano', 7, 100, 100, 0.40, true, ['Ataque mágico', 'Possui recuperação de vida uma vez durante combate', 'Agachar deixa o mago invisível', 'Usar o Lançar Feitiço te gera desgaste e o mago perde 10 pontos de energia.']);
  print(mago1.exibirFicha());
  mago1.lancarFeitico();

  guerreiro1.atacar(personagem1);
  mago1.atacar(personagem1);
}


class Personagem {
  String nome, raca, classe;
  int idade, vida, energia;
  double altura;
  bool isMagico;
  List<String> habilidades;

  Personagem(this.nome, this.raca, this.classe, this.idade, this.vida, this.energia, this.altura, this.isMagico, this.habilidades);

  String exibirFicha() {
    print('------------------------------------------------------------------------------------');
    return '\nCaracterísticas do personagem=\n\n'
           'Nome: $nome\nRaça: $raca\nClasse: $classe\n'
           'Idade: $idade\nVida: $vida\nEnergia: $energia\n'
           'Altura: $altura\nPossui Magia? $isMagico\n'
           'Conjunto de Habilidades:\n\t${habilidades.join('\n\t')}\n';
  }
}

class Guerreiro extends Personagem implements Combate {
  String arma = 'Machado e Escudo';

  Guerreiro(String nome, String raca, int idade, int vida, int energia, double altura, bool isMagico, List<String> habilidades): super(nome, raca, 'Guerreiro', idade, vida, energia, altura, isMagico, habilidades);

  @override
  String exibirFicha() {
    return '${super.exibirFicha()}Arma: $arma\n';
  }

  void atacar(Personagem personagem) {
    print('------------------------------------------------------------------------------------');
    if(personagem.nome != nome) {
      if(personagem.vida>0) {
      print('\nCombate acontecendo');
      print('$nome atacando ${personagem.nome}');
      personagem.vida -= 15;
      print('Dano de ataque: 10\nVida atual de ${personagem.nome}: ${personagem.vida}');
      print(
        "  ,   A           {}\n"
        " / \\, | ,        .--.\n"
        "|    =|= >      /.--.\\\n"
        " \\ /` | `       |====|\n"
        "  `   |         |`::`|  \n"
        "      |     .-;`\\..../`;_.-^-._\n"
        "     /\\\\/  /  |...::..|`   :   `|\n"
        "     |:'\\ |   /'''::''|   .:.   |\n"
        "      \\ /\\;-,/\\   ::  |..:::::..|\n"
        "      |\\ <` >  >._::_.| ':::::' |\n"
        "      | `\"\"`  /   ^^  |   ':'   |\n"
        "      |       |       \\    :    /\n"
        "      |       |        \\   :   / \n"
        "      |       |___/\\___|`-.:.-`\n"
        "      |        \\_ || _/    `\n"
        "      |        <_ >< _>\n"
        "      |        |  ||  |\n"
        "      |        |  ||  |\n"
        "      |       _\\.:||:./_\n"
        "      |      /____/\\____\\\n"
      );
      }else {
        print('\nCombate não pode ocorrer porque ${personagem.nome} está sem vida\n');
      }
    }else {
      print('\nO personagem não pode atacar o mesmo personagem.\n');
    }
  }
}

class Mago extends Personagem  implements Combate {
  String arma = 'Cajado Mágico';

  Mago(String nome, String raca, int idade, int vida, int energia, double altura, bool isMagico, List<String> habilidades): super(nome, raca, 'Mago', idade, vida, energia, altura, isMagico, habilidades);

  @override
  String exibirFicha() {
    return '${super.exibirFicha()}Arma: $arma\n';
  }

  void lancarFeitico() {
    print('------------------------------------------------------------------------------------');
    print(r'''
                  .

                   .
         /^\     .
    /\   "V"
   /__\   I      O  o
  //..\\  I     .
  \].`[/  I
  /l\/j\  (]    .  O
 /. ~~ ,\/I          .
 \\L__j^\/I       o
  \/--v}  I     o   .
  |    |  I   _________
  |    |  I c(`       ')o
  |    l  I   \.     ,/
_/j  L l\_!  _//^---^\\_    -Mago preparando seu feitiço
''');
  energia-=10;
  print('\n\n\n\t\t\-10 de energia\n\t\tEnergia atual: ${energia}');
  }

  void atacar(Personagem personagem) {
    print('------------------------------------------------------------------------------------');
    if(personagem.nome != nome) {
      if(personagem.vida>0) {
      print('\nCombate acontecendo');
      print('$nome atacando ${personagem.nome}');
      personagem.vida -= 10;
      print('Dano de ataque: 10\nVida atual de ${personagem.nome}: ${personagem.vida}');
      print("                             /\\");
      print("                            /  \\");
      print("                           |    |");
      print("                         --:'''':--");
      print("                           :'_' :");
      print("                           _:\"\":\\___");
      print("            ' '      ____.' :::     '._");
      print("           . *=====<<=)           \\    :");
      print("            .  '      '-'-'\\_      /'._.'");
      print("                             \\====:_ \"\"");
      print("                            .'     \\\\");
      print("                           :       :");
      print("                          /   :    \\");
      print("                         :   .      '.");
      print("         ,. _        pif :  : :      :");
      print("      '-'    ).          :__:-:__.;--'");
      print("    (        '  )        '-'   '-'");
      print(" ( -   .00.   - _");
      print("(    .'  _ )     )");
      print("'-  ()_.\\,\\,   -");
      }else {
        print('\nCombate não pode ocorrer porque ${personagem.nome} está sem vida\n');
      }
    }else {
      print('\nO personagem não pode atacar o mesmo personagem.\n');
    }
  }
}

abstract class Combate {
  void atacar(Personagem personagem);
}








