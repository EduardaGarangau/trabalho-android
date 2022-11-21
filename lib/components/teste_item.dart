import 'package:flutter/material.dart';
import '../models/teste_model.dart';

class TesteItem extends StatefulWidget {
  final Teste teste;

  const TesteItem({
    required this.teste,
    super.key,
  });

  @override
  State<TesteItem> createState() => _TesteItemState();
}

class _TesteItemState extends State<TesteItem> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
