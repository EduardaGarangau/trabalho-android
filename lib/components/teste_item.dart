import 'package:clinica_up/components/item_field.dart';
import 'package:clinica_up/utils/app_routes.dart';
import 'package:flutter/material.dart';
import '../models/teste_model.dart';
import 'package:clinica_up/utils/extensions.dart';

class TesteItem extends StatelessWidget {
  final Teste teste;

  const TesteItem({
    required this.teste,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(
        AppRoutes.DETAILS,
        arguments: teste,
      ),
      child: Container(
        height: 130,
        width: 500,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade300,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    teste.nome.capitalize,
                    style: const TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // ItemField(
                  //     title: 'Descrição:', value: teste.descricao.capitalize),
                  // const SizedBox(height: 6),
                  ItemField(
                      title: 'Profissionais Aplicantes:',
                      value: teste.profissionaisAplicantes.capitalize),
                  const SizedBox(height: 6),
                  ItemField(
                      title: 'Validade:', value: teste.validade.capitalize),
                  const SizedBox(height: 6),
                  ItemField(
                      title: 'Quantidade:',
                      value: '${teste.quant} / ${teste.quant}'),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'QUANT.',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 7),
                    CircleAvatar(
                      backgroundColor: const Color.fromRGBO(6, 48, 96, 1),
                      radius: 25,
                      child: FittedBox(
                        child: Text(
                          '${teste.quant} / ${teste.quant}',
                          style: const TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
