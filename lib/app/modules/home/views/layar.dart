import 'package:cake_baru/app/modules/home/views/RegistrationScreen.dart';
import 'package:cake_baru/app/modules/home/views/login_page.dart';
import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Mylayar());
  }
}

class Mylayar extends StatefulWidget {
  const Mylayar({super.key});

  @override
  State<Mylayar> createState() => _MylayarState();
}

class _MylayarState extends State<Mylayar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 208, 173, 161),
      appBar: AppBar(
        actions: [],
        backgroundColor: Color.fromARGB(255, 208, 173, 161),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                child: Text(
              "STORE BAKERY",
              style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontFamily: 'glossy shen'),
            ))
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 500,
              child: Image.asset(
                "assets/bakeryy.png",
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 50),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: BorderSide(
                            width: 3,
                            color: const Color.fromARGB(255, 45, 32, 28))))),
                child: Text('Login')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegistrationScreen()));
                },
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: BorderSide(
                            width: 3,
                            color: const Color.fromARGB(255, 45, 32, 28))))),
                child: Text('Register')),
          ],
        ),
      ),
    );
  }
}
