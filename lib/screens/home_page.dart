import 'package:clinica_up/components/teste_item.dart';
import 'package:clinica_up/models/teste_model.dart';
import 'package:clinica_up/services/testes_service.dart';
import 'package:clinica_up/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<TestesService>(context, listen: false).getTestes();
  }

  @override
  Widget build(BuildContext context) {
    final service = Provider.of<TestesService>(context);
    final lista = service.testes;

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
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Testes Disponíveis:',
              style: TextStyle(
                fontFamily: 'Lato',
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(6, 48, 96, 1),
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: ListView.builder(
                itemCount: lista.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      TesteItem(teste: lista[index]),
                      const SizedBox(height: 10),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        //Floating Button para adicionar teste
        child: const Icon(Icons.add),
        backgroundColor: const Color.fromRGBO(6, 48, 96, 1),
        onPressed: () {
          Navigator.of(context).pushNamed(AppRoutes.FORM);
        },
      ),
    );
  }
}
