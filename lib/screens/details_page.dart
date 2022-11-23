import 'package:clinica_up/components/item_detail_field.dart';
import 'package:clinica_up/services/testes_service.dart';
import 'package:clinica_up/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
              onPressed: () => Navigator.of(context).pushNamed(
                AppRoutes.FORM,
                arguments: teste,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 10,
            ),
            child: IconButton(
              icon: const Icon(
                Icons.delete,
                size: 25,
                color: Colors.red,
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Excluir'),
                    content: const Text(
                        'Tem certeza que deseja excluir esse teste?'),
                    actions: [
                      ElevatedButton(
                        child: const Text('Cencelar'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      ElevatedButton(
                        child: const Text('Deletar'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        onPressed: () {
                          Provider.of<TestesService>(context, listen: false)
                              .removeTeste(teste);
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                );
              },
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
            title: 'ITENS: ',
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
