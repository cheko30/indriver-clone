import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:indrive_clone_flutter/blocProviders.dart';
import 'package:indrive_clone_flutter/injection.dart';
import 'package:indrive_clone_flutter/src/presentation/pages/auth/login/LoginPage.dart';
import 'package:indrive_clone_flutter/src/presentation/pages/auth/register/RegisterPage.dart';
import 'package:indrive_clone_flutter/src/presentation/pages/client/home/ClientHomePage.dart';
import 'package:indrive_clone_flutter/src/presentation/pages/client/mapBookingInfo/ClientMapBookingInfoPage.dart';
import 'package:indrive_clone_flutter/src/presentation/pages/driver/home/DriverHomePage.dart';
import 'package:indrive_clone_flutter/src/presentation/pages/profile/update/ProfileUpdatePage.dart';
import 'package:indrive_clone_flutter/src/presentation/pages/roles/RolesPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: blocProviders,
      child: MaterialApp(
        builder: FToastBuilder(),
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: 'login',
        routes: {
          'login': (BuildContext context) => Loginpage(),
          'register': (BuildContext context) => RegisterPage(),
          'roles': (BuildContext context) => RolesPage(),
          'client/home': (BuildContext context) => ClientHomePage(),
          'driver/home': (BuildContext context) => DriverHomePage(),
          'client/map/booking': (BuildContext context) =>
              ClientMapBookingInfoPage(),
          'profile/update': (BuildContext context) => ProfileUpdatePage(),
        },
      ),
    );
  }
}
