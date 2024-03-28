import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/game_provider/game_provider.dart';
import 'package:tic_tac_toe/model/player_model.dart';
import 'package:tic_tac_toe/utils/colors.dart';
import '../widget/timer_button_widget.dart';

class GamePage extends StatefulWidget {
  final player1;
  final player2;

  const GamePage({required this.player1, required this.player2, super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late GameProvider provider;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GameProvider>(context, listen: false);
    provider.restartGame();
    if (provider.timer != null) {
      provider.stopTimer();
    }
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: MainColors.primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: Consumer<GameProvider>(
            builder: (context, value, child) => Column(
              children: [
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: (provider.xTurn)
                                  ? Colors.green
                                  : MainColors.primaryColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            widget.player1,
                            style: GoogleFonts.coiny(
                                textStyle: (const TextStyle(
                                    fontSize: 30, color: Colors.white))),
                          ),
                        ),
                        Text(
                          provider.oScore.toString(),
                          style: GoogleFonts.coiny(
                              textStyle: const TextStyle(
                                  fontSize: 30, color: Colors.white)),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: (provider.xTurn)
                                  ? MainColors.primaryColor
                                  : Colors.green,
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            widget.player2,
                            style: GoogleFonts.coiny(
                                textStyle: (const TextStyle(
                                    fontSize: 30, color: Colors.white))),
                          ),
                        ),
                        Text(
                          provider.xScore.toString(),
                          style: GoogleFonts.coiny(
                              textStyle: const TextStyle(
                                  fontSize: 30, color: Colors.white)),
                        )
                      ],
                    ),
                  ],
                )),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  flex: 3,
                  child: GridView.builder(
                    itemCount: 9,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          if (!provider.hasWon && provider.isTimerRunning) {
                            String symbol = provider.xTurn ? 'O' : 'X';
                            String playerName = provider.xTurn ? widget.player1 : widget.player2;
                            provider.onTapped(index, PlayerModel(playerName, symbol));

                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: provider.winningList.contains(index)
                                  ? Colors.blue
                                  : MainColors.secondaryColor,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                  width: 5, color: MainColors.primaryColor)),
                          child: Center(
                            child: Text(
                              provider.displayX0[index]!.symbol,
                              style: GoogleFonts.coiny(
                                  textStyle: TextStyle(
                                      fontSize: 64,
                                      color: MainColors.primaryColor)),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Text(
                  provider.resultDeclaration,
                  style: GoogleFonts.coiny(
                      textStyle:
                          const TextStyle(fontSize: 30, color: Colors.white)),
                ),
                const SizedBox(
                  height: 30,
                ),
                TimeButtonWidget(),
                const SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
