import 'package:flutter/material.dart';
import 'package:indriver_clone_flutter/src/presentation/widgets/DefaultButton.dart';
import 'package:indriver_clone_flutter/src/presentation/widgets/DefaultTextFieldOutlined.dart';

class RegisterContent extends StatelessWidget {
  const RegisterContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(left: 12),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: const [
                Color.fromARGB(255,12,38,145),
                Color.fromARGB(255,34,156,249),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _textLoginRotated(context),
              SizedBox(height: 100,),
              _textRegisterRotated(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.25),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 60, bottom: 35),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              bottomLeft: Radius.circular(35)
            ),
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: const [
                Color.fromARGB(255, 255, 255, 255),
                Color.fromARGB(255, 154, 154, 154),
              ]
            ),
          ),
          child: Stack(
            children: [
              _imageBackground(context),
              SingleChildScrollView(
                child: Column(
                  children: [
                    _imageBanner(),
                    DefaultTextFieldOutlined(
                      text: 'Nombre',
                      icon: Icons.person_outline,
                      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                    ),
                    DefaultTextFieldOutlined(
                      text: 'Apellifo',
                      icon: Icons.person_2_outlined,
                      margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                    ),
                    DefaultTextFieldOutlined(
                      text: 'Email',
                      icon: Icons.email_outlined,
                      margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                    ),
                    DefaultTextFieldOutlined(
                      text: 'Telefono',
                      icon: Icons.email_outlined,
                      margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                    ),
                    DefaultTextFieldOutlined(
                      text: 'Password',
                      icon: Icons.email_outlined,
                      margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                    ),
                    DefaultTextFieldOutlined(
                      text: 'Confirmar Password',
                      icon: Icons.email_outlined,
                      margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                    ),
                    DefaultButton(
                      text: 'Crear usuario',
                      margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                    ),
                    SizedBox(height: 10),
                    _separetorOr(),
                    _textIAlreadyAccount(context)
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _imageBackground(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(bottom: 50),
      child: Image.asset(
        "assets/img/destination.png",
        width: MediaQuery.of(context).size.width * 0.6,
        height: MediaQuery.of(context).size.height * 0.6,
        opacity: AlwaysStoppedAnimation(0.1),
      ),      
    );
  }

  Widget _textIAlreadyAccount(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '¿Ya tienes cuenta?',
          style: TextStyle(
            color: Colors.grey[100],
            fontSize: 16
          ),
        ),
        SizedBox(width: 5,),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, "login");
          },
          child: Text(
            "Inicia sesion",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16
            ),
          ),
        )
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
        ),
      ],
    );
  }

  Widget _imageBanner() {
    return Container(
      margin: EdgeInsets.only(top: 50),
      alignment: Alignment.center,
      child: Image.asset(
        "assets/img/delivery.png",
        height: 130,
        width: 130,
      ),
    );

  }

  Widget _textRegisterRotated() {
    return RotatedBox(
      quarterTurns: 1,
      child: Text(
        'Registro',
        style: TextStyle(
          fontSize: 27,
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }

  Widget _textLoginRotated(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "login");
      },
      child: RotatedBox(
        quarterTurns: 1,
        child: Text(
          'Login',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}