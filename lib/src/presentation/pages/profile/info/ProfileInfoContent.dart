import 'package:flutter/material.dart';
import 'package:indrive_clone_flutter/src/domain/models/user.dart';

class ProfileInfoContent extends StatelessWidget {
  User? user;
  ProfileInfoContent(this.user);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            _headerProfile(context),
            Spacer(),
            _actionProfile('Editar Perfil', Icons.edit),
            _actionProfile('Cerrar Sesión', Icons.settings_power),
            SizedBox(
              height: 35,
            )
          ],
        ),
        _cardUserInfo(context),
      ],
    );
  }

  Widget _cardUserInfo(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 100),
      width: MediaQuery.of(context).size.width,
      height: 250,
      child: Card(
        color: Colors.white,
        surfaceTintColor: Colors.white,
        child: Column(
          children: [
            Container(
              width: 115,
              margin: EdgeInsets.only(top: 15, bottom: 15),
              child: AspectRatio(
                aspectRatio: 1,
                child: ClipOval(
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/img/user_image.png',
                    image:
                        'https://img.freepik.com/photos-gratuite/portrait-homme-affaires-joyeux-dans-lunettes-rendu-3d_1142-51566.jpg',
                    fit: BoxFit.cover,
                    fadeInDuration: Duration(seconds: 1),
                  ),
                ),
              ),
            ),
            Text(
              '${user?.name} ${user?.lastname}' ?? '',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              user?.email ?? '',
              style: TextStyle(color: Colors.grey[700]),
            ),
            Text(
              user?.phone ?? '',
              style: TextStyle(color: Colors.grey[700]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _actionProfile(String option, IconData icon) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 15),
      child: ListTile(
        title: Text(
          option,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: const [
                      Color.fromARGB(255, 14, 29, 106),
                      Color.fromARGB(255, 30, 112, 227)
                    ]),
                borderRadius: BorderRadius.all(Radius.circular(50))),
            child: Icon(
              icon,
              color: Colors.white,
            )),
      ),
    );
  }

  Widget _headerProfile(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.only(top: 40),
      height: MediaQuery.of(context).size.height * 0.35,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: const [
            Color.fromARGB(255, 12, 38, 145),
            Color.fromARGB(255, 34, 156, 249)
          ])),
      child: Text(
        'Perfil de Usuario',
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }
}
