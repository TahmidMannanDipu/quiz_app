import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.chooseAnswer});
  final List<String> chooseAnswer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 36, 148, 213),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("You answeres X out of Y questions correctly!"),
              SizedBox(height: 24),
              Text("List of answer and questions"),
              TextButton(onPressed: (){}, child:  Text("Restart quiz again",style: GoogleFonts.roboto(
                color: Colors.white,fontWeight: FontWeight.bold,
              ),))
            ],
          ),
        ),
      ),
    );
  }
}
