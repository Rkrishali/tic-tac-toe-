
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/game_provider/game_provider.dart';

class GameButton extends StatelessWidget {
  GameButton({super.key});
  late GameProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<GameProvider>(context, listen: false);
    return GestureDetector(
        onTap: () {
          provider.startTimer();
          provider.restartGame();

        },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child:  Text(
          "Play Again",
          style: GoogleFonts.coiny(textStyle: const TextStyle(fontSize: 30)),
        ),
      ),
    );
  }
}
