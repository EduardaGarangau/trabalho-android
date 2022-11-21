import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: const Color.fromRGBO(6, 48, 96, 1),
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/assets/images/star_logo.png',
              height: 60,
            ),
            const Text(
              'Clínica de Psicologia',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Lato',
                fontSize: 23,
                letterSpacing: 0.4,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        //Floating Button para adicionar teste
        child: const Icon(Icons.add),
        backgroundColor: const Color.fromRGBO(6, 48, 96, 1),
        onPressed: () {},
      ),
    );
  }
}
