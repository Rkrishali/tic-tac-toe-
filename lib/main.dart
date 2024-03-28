import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/game_provider/game_provider.dart';
import 'package:tic_tac_toe/presentation/screens/game_page.dart';
import 'package:tic_tac_toe/presentation/screens/select_players_name.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => GameProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        title: 'Flutter Demo',
        theme: ThemeData(
          
        ),
        home: SelectPlayersName()
      ),
    );
  }
}
