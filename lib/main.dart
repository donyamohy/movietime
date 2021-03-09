import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movietime/Registeration/registerform.dart';
import 'package:movietime/screens/settings.dart';
import 'package:movietime/services/auth.dart';
//import 'screens/get_started.dart';
import 'movies/movie_screen.dart';
import 'Registeration/log_in.dart';
//import 'Registeration/signup.dart';
import 'screens/home_screen.dart';
import 'screens/editprofile.dart';
//import 'Categories/gerens.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) =>
              context.read<AuthenticationService>().authStateChanges,
        )
      ],
      child: MaterialApp(
        title: 'Movie Suggestion',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.teal, scaffoldBackgroundColor: Colors.white),
        home: AuthenticationWrapper(),
        routes: {
          MovieDetails.routeName: (ctx) => MovieDetails(),
          SignIn.routesigin: (ctx) => SignIn(),
          SignUp.routeregister: (ctx) => SignUp(),
          // HomeScreen.routehome: (ctx) => HomeScreen(),
          //MenuDashboardPage.routemenu: (ctx) => MenuDashboardPage(),
          //Gerens.routec: (ctx) => Gerens(),
          EditProfilePage.routeEditProfile: (ctx) => EditProfilePage(),
          Settings.routesettings: (ctx) => Settings(),
        },
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    if (firebaseUser != null) {
      return HomeScreen();
    } else {
      return SignIn();
    }
  }
}
