import 'package:clinica_up/components/item_detail_field.dart';
import 'package:flutter/material.dart';
import '../models/teste_model.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    final teste = ModalRoute.of(context)!.settings.arguments as Teste;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: const Color.fromRGBO(6, 48, 96, 1),
        centerTitle: true,
        title: Text(
          teste.nome,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: 'Lato',
            fontSize: 20,
            letterSpacing: 0.4,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 10,
            ),
            child: IconButton(
              icon: const Icon(
                Icons.edit,
                size: 25,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          const SizedBox(height: 10),
          ItemDetailsField(
            title: 'QUANTIDADE: ',
            value: teste.quant.toString(),
          ),
          ItemDetailsField(
            title: 'SIGLA: ',
            value: teste.sigla,
          ),
          ItemDetailsField(
            title: 'CONSTRUTO: ',
            value: teste.construto,
          ),
          ItemDetailsField(
            title: 'CONTEXTO: ',
            value: teste.contexto,
          ),
          ItemDetailsField(
            title: 'IDADE: ',
            value: teste.idade,
          ),
          ItemDetailsField(
            title: 'APLICAÇÃO: ',
            value: teste.aplicacao,
          ),
          ItemDetailsField(
            title: 'TEMPO DE APLICAÇÃO: ',
            value: teste.tempoDeAplicacao,
          ),
          ItemDetailsField(
            title: 'CORREÇÃO: ',
            value: teste.correcao,
          ),
          ItemDetailsField(
            title: 'VALIDADE: ',
            value: teste.validade,
          ),
          ItemDetailsField(
            title: 'OBJETIVO: ',
            value: teste.objetivo,
          ),
          ItemDetailsField(
            title: 'PUBLICO-ALVO: ',
            value: teste.publicoAlvo,
          ),
          ItemDetailsField(
            title: 'DESCRIÇÃO: ',
            value: teste.descricao,
          ),
          ItemDetailsField(
            title: 'IENS: ',
            value: teste.itens,
          ),
          ItemDetailsField(
            title: 'PROFISSIONAIS APLICANTES: ',
            value: teste.profissionaisAplicantes,
          ),
        ],
      ),
    );
  }
}
