import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/game_provider/game_provider.dart';
import 'package:tic_tac_toe/presentation/widget/play_button.dart';
import 'package:tic_tac_toe/presentation/widget/timer_widget.dart';
class TimeButtonWidget extends StatelessWidget {
   TimeButtonWidget({super.key});
  late GameProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<GameProvider>(context,listen: false);
   provider.buildTimer();
    return (provider.isTimerRunning)?TimerWidget(second: provider.second, maxSeconds: 30,):GameButton();
  }
}
