import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/auth/auth_screen.dart';
import 'package:amazon_clone/router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(

    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'amazon_clone',
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
          colorScheme: ColorScheme.light(
           primary: GlobalVariables.secondaryColor
          ),
          appBarTheme: const AppBarTheme(
              elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black
        )
      ),
      ),
      onGenerateRoute: (settings)=> generateRoute(settings),
      home:  AuthScreen()  ,
    );
  }
}
final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
signInWithGoogle(context)async {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  try {
    final GoogleSignInAccount? googleSignInAccount = await _googleSignIn
        .signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount
          .authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,

      );
      var login = await _firebaseAuth.signInWithCredential(credential);
      print("firebase sign in result:${login.toString()}");
      if (login.user != null){
        Navigator.of(context).pushNamed('/home');
      }
    }
  }
  catch(e){
    print(e);
  }
}






