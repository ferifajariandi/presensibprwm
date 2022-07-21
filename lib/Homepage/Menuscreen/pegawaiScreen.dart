import 'package:flutter/material.dart';

class PegawaiScreen extends StatefulWidget {
  const PegawaiScreen({Key? key}) : super(key: key);

  @override
  _PegawaiScreenState createState() => _PegawaiScreenState();
}

class _PegawaiScreenState extends State<PegawaiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Profile"
        ),
      ),
    );
  }
}
