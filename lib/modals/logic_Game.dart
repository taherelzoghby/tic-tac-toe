import 'dart:math';

class Player {
  static const x = "X";
  static const o = "O";
  static const empty = "";
  static List<int> playerX = []; //0 2 4 6
  static List<int> playerO = []; //1 3 5 8 9
}

extension ContainsAll on List {
  bool containsAll(int x, int y, [z]) {
    if (z == null) {
      return contains(x) && contains(y);
    } else {
      return contains(x) && contains(y) && contains(z);
    }
  }
}

class Game {
  void playGame(int index, String activePlayer) {
    if (activePlayer == "X") {
      Player.playerX.add(index);
    } else {
      Player.playerO.add(index);
    }
  }

  String checkWinner() {
    String winner = "";
    if (Player.playerX.containsAll(0, 1, 2) ||
        Player.playerX.containsAll(3, 4, 5) ||
        Player.playerX.containsAll(6, 7, 8) ||
        Player.playerX.containsAll(0, 3, 6) ||
        Player.playerX.containsAll(1, 4, 7) ||
        Player.playerX.containsAll(2, 5, 8) ||
        Player.playerX.containsAll(0, 4, 8) ||
        Player.playerX.containsAll(2, 4, 6)) {
      winner = "X";
    } else if (Player.playerX.containsAll(0, 1, 2) ||
        Player.playerO.containsAll(3, 4, 5) ||
        Player.playerO.containsAll(6, 7, 8) ||
        Player.playerO.containsAll(0, 3, 6) ||
        Player.playerO.containsAll(1, 4, 7) ||
        Player.playerO.containsAll(2, 5, 8) ||
        Player.playerO.containsAll(0, 4, 8) ||
        Player.playerO.containsAll(2, 4, 6)) {
      winner = "O";
    } else {
      winner = "";
    }
    return winner;
  }

  Future autoPlay(String activePlayer) async {
    int index = 0;
    List<int> emptyL = [];
    for (int i = 0; i < 9; i++) {
      if (!(Player.playerO.contains(i) || Player.playerX.contains(i))) {
        emptyL.add(i);
      }
    }

//attacks
    //start-center
    if (Player.playerO.containsAll(0, 1) && emptyL.contains(2)) {
      index = 2;
    } else if (Player.playerO.containsAll(3, 4) && emptyL.contains(5)) {
      index = 5;
    } else if (Player.playerO.containsAll(6, 7) && emptyL.contains(8)) {
      index = 8;
    } else if (Player.playerO.containsAll(0, 3) && emptyL.contains(6)) {
      index = 6;
    } else if (Player.playerO.containsAll(1, 4) && emptyL.contains(7)) {
      index = 7;
    } else if (Player.playerO.containsAll(2, 5) && emptyL.contains(8)) {
      index = 8;
    } else if (Player.playerO.containsAll(0, 4) && emptyL.contains(8)) {
      index = 8;
    } else if (Player.playerO.containsAll(2, 4) && emptyL.contains(6)) {
      index = 6;
    }
    //center-end
    else if (Player.playerO.containsAll(1, 2) && emptyL.contains(0)) {
      index = 0;
    } else if (Player.playerO.containsAll(4, 5) && emptyL.contains(3)) {
      index = 3;
    } else if (Player.playerO.containsAll(7, 8) && emptyL.contains(6)) {
      index = 6;
    } else if (Player.playerO.containsAll(3, 6) && emptyL.contains(0)) {
      index = 0;
    } else if (Player.playerO.containsAll(4, 7) && emptyL.contains(1)) {
      index = 1;
    } else if (Player.playerO.containsAll(5, 8) && emptyL.contains(2)) {
      index = 2;
    } else if (Player.playerO.containsAll(4, 8) && emptyL.contains(0)) {
      index = 0;
    } else if (Player.playerO.containsAll(4, 6) && emptyL.contains(2)) {
      index = 2;
    }
    //start-end
    else if (Player.playerO.containsAll(0, 2) && emptyL.contains(1)) {
      index = 1;
    } else if (Player.playerO.containsAll(3, 5) && emptyL.contains(4)) {
      index = 4;
    } else if (Player.playerO.containsAll(6, 8) && emptyL.contains(7)) {
      index = 7;
    } else if (Player.playerO.containsAll(0, 6) && emptyL.contains(3)) {
      index = 3;
    } else if (Player.playerO.containsAll(1, 7) && emptyL.contains(4)) {
      index = 4;
    } else if (Player.playerO.containsAll(2, 8) && emptyL.contains(5)) {
      index = 5;
    } else if (Player.playerO.containsAll(0, 8) && emptyL.contains(4)) {
      index = 4;
    } else if (Player.playerO.containsAll(2, 6) && emptyL.contains(4)) {
      index = 4;
    }
    //defense
    if (Player.playerX.containsAll(0, 1) && emptyL.contains(2)) {
      index = 2;
    } else if (Player.playerX.containsAll(3, 4) && emptyL.contains(5)) {
      index = 5;
    } else if (Player.playerX.containsAll(6, 7) && emptyL.contains(8)) {
      index = 8;
    } else if (Player.playerX.containsAll(0, 3) && emptyL.contains(6)) {
      index = 6;
    } else if (Player.playerX.containsAll(1, 4) && emptyL.contains(7)) {
      index = 7;
    } else if (Player.playerX.containsAll(2, 5) && emptyL.contains(8)) {
      index = 8;
    } else if (Player.playerX.containsAll(0, 4) && emptyL.contains(8)) {
      index = 8;
    } else if (Player.playerX.containsAll(2, 4) && emptyL.contains(6)) {
      index = 6;
    }
    //center-end
    else if (Player.playerX.containsAll(1, 2) && emptyL.contains(0)) {
      index = 0;
    } else if (Player.playerX.containsAll(4, 5) && emptyL.contains(3)) {
      index = 3;
    } else if (Player.playerX.containsAll(7, 8) && emptyL.contains(6)) {
      index = 6;
    } else if (Player.playerX.containsAll(3, 6) && emptyL.contains(0)) {
      index = 0;
    } else if (Player.playerX.containsAll(4, 7) && emptyL.contains(1)) {
      index = 1;
    } else if (Player.playerX.containsAll(5, 8) && emptyL.contains(2)) {
      index = 2;
    } else if (Player.playerX.containsAll(4, 8) && emptyL.contains(0)) {
      index = 0;
    } else if (Player.playerX.containsAll(4, 6) && emptyL.contains(2)) {
      index = 2;
    }
    //start-end
    else if (Player.playerX.containsAll(0, 2) && emptyL.contains(1)) {
      index = 1;
    } else if (Player.playerX.containsAll(3, 5) && emptyL.contains(4)) {
      index = 4;
    } else if (Player.playerX.containsAll(6, 8) && emptyL.contains(7)) {
      index = 7;
    } else if (Player.playerX.containsAll(0, 6) && emptyL.contains(3)) {
      index = 3;
    } else if (Player.playerX.containsAll(1, 7) && emptyL.contains(4)) {
      index = 4;
    } else if (Player.playerX.containsAll(2, 8) && emptyL.contains(5)) {
      index = 5;
    } else if (Player.playerX.containsAll(0, 8) && emptyL.contains(4)) {
      index = 4;
    } else if (Player.playerX.containsAll(2, 6) && emptyL.contains(4)) {
      index = 4;
    } else {
      Random randomInd = Random();
      int rInd = randomInd.nextInt(emptyL.length);
      index = emptyL[rInd];
    }

    playGame(index, activePlayer);
  }
}
