import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:presenceattedance/Homepage/homescreen.dart';
import 'package:presenceattedance/loginScreen/login.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:shared_preferences/shared_preferences.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const KeyboardVisibilityProvider(
          child: AuthCheck(),
      ),
    );
  }
}

//Shared Preferences
class AuthCheck extends StatefulWidget {
  const AuthCheck({Key? key}) : super(key: key);

  @override
  _AuthCheckState createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  bool userTersedia = false;
  late SharedPreferences sharedPreferences;
  @override
  void initState() {
    super.initState();


  }

  void _getCurrentUser() async {
    sharedPreferences = await SharedPreferences.getInstance();


    try{
      if(sharedPreferences.getString('employeeId') != null) {
        setState(() {
          userTersedia = true;
        });
      }
    } catch(e){
      setState(() {
        userTersedia = false;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return userTersedia ? const HomeScreen() : const LoginScreen();
  }
}
