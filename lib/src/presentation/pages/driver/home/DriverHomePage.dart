import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indrive_clone_flutter/main.dart';
import 'package:indrive_clone_flutter/src/presentation/pages/client/mapSeeker/ClientMapSeekerPage.dart';
import 'package:indrive_clone_flutter/src/presentation/pages/driver/home/bloc/DriverHomeBloc.dart';
import 'package:indrive_clone_flutter/src/presentation/pages/driver/home/bloc/DriverHomeEvent.dart';
import 'package:indrive_clone_flutter/src/presentation/pages/driver/home/bloc/DriverHomeState.dart';
import 'package:indrive_clone_flutter/src/presentation/pages/driver/mapLocation/DriverMapLocationPage.dart';

import 'package:indrive_clone_flutter/src/presentation/pages/profile/info/ProfileInfoPage.dart';
import 'package:indrive_clone_flutter/src/presentation/pages/roles/RolesPage.dart';

class DriverHomePage extends StatefulWidget {
  const DriverHomePage({super.key});

  @override
  State<DriverHomePage> createState() => _DriverHomePageState();
}

class _DriverHomePageState extends State<DriverHomePage> {
  List<Widget> pageList = <Widget>[
    DriverMapLocationPage(),
    ProfileInfoPage(),
    RolesPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menú'),
      ),
      body: BlocBuilder<DriverHomeBloc, DriverHomeState>(
        builder: (context, state) {
          return pageList[state.pageIndex];
        },
      ),
      drawer: BlocBuilder<DriverHomeBloc, DriverHomeState>(
        builder: (context, state) {
          return Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: const [
                        Color.fromARGB(255, 12, 38, 145),
                        Color.fromARGB(255, 34, 156, 249)
                      ])),
                  child: Text(
                    'Menú del Conductor',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ListTile(
                  title: Text('Mapa de localización'),
                  selected: state.pageIndex == 0,
                  onTap: () {
                    context
                        .read<DriverHomeBloc>()
                        .add(ChangeDrawerPage(pageIndex: 0));
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Perfil del usuario'),
                  selected: state.pageIndex == 1,
                  onTap: () {
                    context
                        .read<DriverHomeBloc>()
                        .add(ChangeDrawerPage(pageIndex: 1));
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Roles de usuario'),
                  selected: state.pageIndex == 2,
                  onTap: () {
                    context
                        .read<DriverHomeBloc>()
                        .add(ChangeDrawerPage(pageIndex: 2));
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Cerrar sesión'),
                  onTap: () {
                    context.read<DriverHomeBloc>().add(Logout());
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => MyApp()),
                        (route) => false);
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
