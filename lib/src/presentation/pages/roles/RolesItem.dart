import 'package:flutter/material.dart';
import 'package:indrive_clone_flutter/src/domain/models/Rol.dart';

class RolesItem extends StatelessWidget {
  Role role;
  RolesItem(this.role);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(role.route);
        Navigator.pushNamedAndRemoveUntil(
            context, role.route, (route) => false);
      },
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10, top: 15),
            height: 150,
            child: FadeInImage(
              image: NetworkImage(role.image),
              fit: BoxFit.contain,
              fadeInDuration: Duration(seconds: 1),
              placeholder: AssetImage('assets/img/no-image.png'),
            ),
          ),
          Text(
            role.name,
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
          )
        ],
      ),
    );
  }
}
