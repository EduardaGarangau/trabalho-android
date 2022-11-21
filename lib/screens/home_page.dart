import 'package:clinica_up/models/teste_model.dart';
import 'package:clinica_up/services/testes_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final service = Provider.of<TestesService>(context);

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
        onPressed: () {
          final teste = Teste(
            id: 'a1',
            quant: 2,
            nome: 'nome teste',
            sigla: 'sigla teste',
            construto: 'constructo teste',
            contexto: 'contexto teste',
            idade: 'idade teste',
            aplicacao: 'aplicacao teste',
            tempoDeAplicacao: 'tempo teste',
            correcao: 'correcao teste',
            validade: 'validade teste',
            objetivo: 'objetivo teste',
            publicoAlvo: 'publico teste',
            descricao: 'descricao teste',
            itens: 'itens teste',
            profissionaisAplicantes: 'profissionais teste',
          );

          service.addTeste(teste);
        },
      ),
    );
  }
}
