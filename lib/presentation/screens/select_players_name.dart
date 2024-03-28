import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/presentation/screens/game_page.dart';
import '../../utils/colors.dart';

class SelectPlayersName extends StatefulWidget {
  const SelectPlayersName({super.key});

  @override
  State<SelectPlayersName> createState() => _SelectPlayersNameState();
}

class _SelectPlayersNameState extends State<SelectPlayersName> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _player1Controller = TextEditingController();
  final TextEditingController _player2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MainColors.accentColor,
        body: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Enter Players Name",
                style: GoogleFonts.coiny(
                    textStyle: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: _player1Controller,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      hintText: "Player 1 Name",
                      hintStyle: TextStyle(color: Colors.white),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter player 1 name";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                    controller: _player2Controller,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                        hintText: "Player 2 Name",
                        hintStyle: TextStyle(color: Colors.white),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter player 2 name";
                      }
                      return null;
                    }),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    final player1 = _player1Controller.text.toString();
                    final player2 = _player2Controller.text.toString();

                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              GamePage(player1: player1, player2: player2),
                        ));
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      "Next",
                      style: GoogleFonts.coiny(
                          textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
