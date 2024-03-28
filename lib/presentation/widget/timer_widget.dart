import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/colors.dart';

class TimerWidget extends StatelessWidget {
  final int second;
  final int maxSeconds;

  const TimerWidget({required this.second, required this.maxSeconds, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 100,
        width: 100,
        child: Stack(
          fit: StackFit.expand,
          children: [
            CircularProgressIndicator(
                value: 1 - second / maxSeconds,
                valueColor: const AlwaysStoppedAnimation(Colors.white),
                strokeWidth: 8,
                backgroundColor: MainColors.accentColor),
            Center(
                child: Text(
              second.toString(),
              style: GoogleFonts.coiny(textStyle: const  TextStyle(fontSize: 25, color: Colors.white)),
            )),
          ],
        ));
  }
}
