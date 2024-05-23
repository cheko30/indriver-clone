import 'package:flutter/material.dart';
import 'package:indriver_clone_flutter/src/presentation/widgets/DefaultButton.dart';
import 'package:indriver_clone_flutter/src/presentation/widgets/DefaultTextField.dart';

class LoginContent extends StatelessWidget {
  const LoginContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: const [
                Color.fromARGB(255,12,38,145),
                Color.fromARGB(255,34,156,249),
              ]
            ),
          ),
          padding: EdgeInsets.only(left: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _textRotated("Login", 27, FontWeight.bold, false, context),
              SizedBox(height: 50,),
              _textRotated("Registro", 24, FontWeight.normal, true, context),
              SizedBox(height: 90,),
            ]
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          margin: EdgeInsets.only(left: 60, bottom: 60),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: const [
                Color.fromARGB(255,14,29,166),
                Color.fromARGB(255,30,112,227),
              ]
            ),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(25), bottomLeft: Radius.circular(25)),
          ),
          child: Container(
            margin: EdgeInsets.only(left: 25, right: 25),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50,),
                  _textWelcome("Welcome", 30),
                  _textWelcome("back...", 28),
                  _imageCar(),
                  _textLogin(),
                  DefaultTextField(text: "Email", icon: Icons.email_outlined, margin: EdgeInsets.only(top: 20, left: 10, right: 10)),
                  DefaultTextField(text: "Password", icon: Icons.lock_outline, margin: EdgeInsets.only(top: 20, left: 10, right: 10)),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  DefaultButton(text: "Iniciar sesión"),
                  _separetorOr(),
                  SizedBox(height: 5,),
                  _textDontHaveAccount(context),
                  SizedBox(height: 50,)
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _textDontHaveAccount(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "¿No tienes cuenta?",
          style: TextStyle(
            color: Colors.grey[100],
            fontSize: 17
          ),
        ),
        SizedBox(width: 7,),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, 'register');
          },
          child: Text(
            "Registrate",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 17
            ),
          ),
        ),
      ],
    );
  }

  Widget _separetorOr() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 25,
          height: 1,
          color: Colors.white,
          margin: EdgeInsets.only(right: 5),
        ),
        Text(
          "O",
          style: TextStyle(
            color: Colors.white,
            fontSize: 17
          ),
        ),
        Container(
          width: 25,
          height: 1,
          color: Colors.white,
          margin: EdgeInsets.only(left: 5),
        )
      ],
    );
  }

  Widget _textLogin() {
    return Text(
      "Login",
      style: TextStyle(
        fontSize: 24,
        color: Colors.white,
        fontWeight: FontWeight.bold
      ),
    );
  }

  Widget _imageCar() {
    return Container(
      alignment: Alignment.centerRight,
      child: Image.asset(
        "assets/img/car_white.png",
        width: 150,
        height: 150,
      ),
    );
  }

  Widget _textRotated(String text, double fontSize, FontWeight fontWeight, bool isRegister, BuildContext context) {
    return GestureDetector(
      onTap: isRegister ? () {
        Navigator.pushNamed(context, 'register');
      } : null,
      child: RotatedBox(
        quarterTurns: 1,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize,
            fontWeight: fontWeight
          ),
        ),
      ),
    );
  }

  Widget _textWelcome(String text, double fontSize) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: Colors.white,
        fontWeight: FontWeight.bold
      ),
    );
  }
}