import 'dart:async';
import 'package:flutter/material.dart';
import '../model/player_model.dart';
import '../presentation/widget/play_button.dart';
import '../presentation/widget/timer_widget.dart';

class GameProvider extends ChangeNotifier {
  bool oTurn = true;
  int filledBoxes = 0;
  List<PlayerModel?> displayX0 = List.generate(9, (_) => PlayerModel("", ""));
  int xScore = 0;
  int oScore = 0;
  bool hasWon = false;
  List<int> winningList = [];
  String resultDeclaration = '';
  Timer? timer;
  static const maxSeconds = 30;
  int second = maxSeconds;
  bool isTimerRunning = false;
  bool xTurn = true;

  /// change player's turn
  void changePlayersTurn() {
    xTurn = !xTurn;
    notifyListeners();
  }

  /// when player will tap on any box
  void onTapped(int index, PlayerModel player ) {
    changePlayersTurn();
    if (oTurn && displayX0[index] != null) {
      filledBoxes++;
      displayX0[index] = player;
    } else if (displayX0[index] != null) {
      filledBoxes++;
      displayX0[index] = player;
    }
    if (filledBoxes == 9 && !hasWon) {
      resultDeclaration = "Nobody Wins!!";
      stopTimer();
    }
    oTurn = !oTurn;

    /// check we got winner so far or not
    _checkWinner();

    notifyListeners();
  }

  /// checking all combination of winning
  void _checkWinner() {
    /// check first row
    if (displayX0[0]!.symbol == displayX0[1]!.symbol &&
        displayX0[0]!.symbol == displayX0[2]!.symbol &&
        displayX0[0]!.symbol != '') {
      winningList.add(0);
      winningList.add(1);
      winningList.add(2);
      resultDeclaration = '${displayX0[0]!.name} Wins!!';
      hasWon = true;
      _updateScore(displayX0[0]!.symbol);
    }

    /// check second row
    if (displayX0[3]!.symbol == displayX0[4]!.symbol &&
        displayX0[3]!.symbol == displayX0[5]!.symbol &&
        displayX0[3]!.symbol != '') {
      winningList.add(3);
      winningList.add(4);
      winningList.add(5);
      resultDeclaration = '${displayX0[3]!.name} Wins!!';
      hasWon = true;
      _updateScore(displayX0[3]!.symbol);
    }

    /// check third row
    if (displayX0[6]!.symbol == displayX0[7]!.symbol &&
        displayX0[6]!.symbol == displayX0[8]!.symbol &&
        displayX0[6]!.symbol != '') {
      winningList.add(6);
      winningList.add(7);
      winningList.add(8);
      resultDeclaration = '${displayX0[6]!.name} Wins!!';
      hasWon = true;
      _updateScore(displayX0[6]!.symbol);
    }

    /// check first column
    if (displayX0[0]!.symbol == displayX0[3]!.symbol &&
        displayX0[0]!.symbol == displayX0[6]!.symbol &&
        displayX0[0]!.symbol != '') {
      winningList.add(0);
      winningList.add(3);
      winningList.add(6);
      resultDeclaration = '${displayX0[0]!.name} Wins!!';
      hasWon = true;
      _updateScore(displayX0[0]!.symbol);
    }

    /// check second column
    if (displayX0[1]!.symbol == displayX0[4]!.symbol &&
        displayX0[1]!.symbol == displayX0[7]!.symbol &&
        displayX0[1]!.symbol != '') {
      winningList.add(1);
      winningList.add(4);
      winningList.add(7);
      resultDeclaration = '${displayX0[1]!.name} Wins!!';
      hasWon = true;
      _updateScore(displayX0[1]!.symbol);
    }

    /// check third column
    if (displayX0[2]!.symbol == displayX0[5]!.symbol &&
        displayX0[2]!.symbol == displayX0[8]!.symbol &&
        displayX0[2]!.symbol != '') {
      winningList.add(2);
      winningList.add(5);
      winningList.add(8);
      resultDeclaration = '${displayX0[2]!.name} Wins!!';
      hasWon = true;
      _updateScore(displayX0[2]!.symbol);
    }

    /// check diagonal
    if (displayX0[0]!.symbol == displayX0[4]!.symbol &&
        displayX0[0]!.symbol == displayX0[8]!.symbol &&
        displayX0[0]!.symbol != '') {
      winningList.add(0);
      winningList.add(4);
      winningList.add(8);
      resultDeclaration = '${displayX0[0]!.name} Wins!!';
      hasWon = true;
      _updateScore(displayX0[0]!.symbol);
    }

    /// check diagonal
    if (displayX0[2]!.symbol == displayX0[4]!.symbol &&
        displayX0[2]!.symbol == displayX0[6]!.symbol &&
        displayX0[2]!.symbol != '') {
      winningList.add(2);
      winningList.add(4);
      winningList.add(6);
      resultDeclaration = '${displayX0[2]!.name} Wins!!';
      hasWon = true;
      _updateScore(displayX0[2]!.symbol);
    }
  }

  /// update player's winning score
  void _updateScore(String winner) {
    stopTimer();
    if (winner == 'O') {
      ++oScore;
    } else {
      ++xScore;
    }
    notifyListeners();
  }

  /// restart game
  void restartGame() {
    oTurn = true;
    filledBoxes = 0;
    displayX0 = List.generate(9, (_) => PlayerModel("", ""));
    hasWon = false;
    winningList = [];
    resultDeclaration = '';
    xTurn = true;
    notifyListeners();
  }

  /// start playing time
  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (second > 0) {
        second--;
      } else {
        stopTimer();
      }
      notifyListeners();
    });
  }

  /// reset time
  void resetTimer() => second = maxSeconds;

  /// stop timer
  void stopTimer() {
    timer!.cancel();
    resetTimer();
    notifyListeners();
  }

  /// build timer
  void buildTimer() => isTimerRunning = timer == null ? false : timer!.isActive;
}
