import 'dart:convert';
import 'dart:math';
import 'package:clinica_up/models/teste_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TestesService with ChangeNotifier {
  static const _firebaseURL =
      'https://clinicapsico-99177-default-rtdb.firebaseio.com/';

  final List<Teste> _testes = [];

  // Inserindo os itens da lista _testes na lista testes
  List<Teste> get testes => [..._testes];

  // Método para recuperar os testes do banco de dados do Firebase
  Future<void> getTestes() async {
    _testes.clear();
    final response = await http.get(Uri.parse('$_firebaseURL/testes.json'));
    // Recuperar o corpo da requisição GET
    if (response.body == 'null') return;
    Map<String, dynamic> data = jsonDecode(response.body);
    // Cria um Teste para cada item do corpo da requisição GET e adiciona a lista _testes
    data.forEach((testeId, testeData) {
      _testes.add(
        Teste(
          id: testeId,
          quant: testeData['quant'],
          nome: testeData['nome'],
          sigla: testeData['sigla'],
          construto: testeData['construto'],
          contexto: testeData['contexto'],
          idade: testeData['idade'],
          aplicacao: testeData['aplicacao'],
          tempoDeAplicacao: testeData['tempoDeAplicacao'],
          correcao: testeData['correcao'],
          validade: testeData['validade'],
          objetivo: testeData['objetivo'],
          publicoAlvo: testeData['publicoAlvo'],
          descricao: testeData['descricao'],
          itens: testeData['itens'],
          profissionaisAplicantes: testeData['profissionaisAplicantes'],
        ),
      );
    });
    notifyListeners();
  }

  // Método para salvar os atributos do Formulário e criar um teste.
  // Caso já tenha id indica que foi feito um update via formulário,
  // caso não tenha id indica que é um novo teste a ser adicionado
  Future<void> saveForm(Map<String, dynamic> formData) {
    bool temId = formData['id'] != null;

    final teste = Teste(
      id: temId ? formData['id'] : Random().nextDouble().toString(),
      quant: formData['quant'] as int,
      nome: formData['nome'] as String,
      sigla: formData['sigla'] as String,
      construto: formData['construto'] as String,
      contexto: formData['contexto'] as String,
      idade: formData['idade'] as String,
      aplicacao: formData['aplicacao'] as String,
      tempoDeAplicacao: formData['tempoDeAplicacao'] as String,
      correcao: formData['correcao'] as String,
      validade: formData['validade'] as String,
      objetivo: formData['objetivo'] as String,
      publicoAlvo: formData['publicoAlvo'] as String,
      descricao: formData['descricao'] as String,
      itens: formData['itens'] as String,
      profissionaisAplicantes: formData['profissionaisAplicantes'] as String,
    );

    if (temId) {
      return updateTeste(teste);
    } else {
      return addTeste(teste);
    }
  }

  // Método para adicionar teste ao Firebase
  Future<void> addTeste(Teste teste) async {
    final response = await http.post(
      Uri.parse('$_firebaseURL/testes.json'),
      // Manda um objeto tipo JSON para o Firebase usando adapters do model
      body: teste.toJson(),
    );
    // Recupera o id criado automaticamente pelo Firebase ao fazer requisição POST para adicionar item ao banco
    final id = jsonDecode(response.body)['name'];
    _testes.add(
      Teste(
        id: id,
        quant: teste.quant,
        nome: teste.nome,
        sigla: teste.sigla,
        construto: teste.construto,
        contexto: teste.contexto,
        idade: teste.idade,
        aplicacao: teste.aplicacao,
        tempoDeAplicacao: teste.tempoDeAplicacao,
        correcao: teste.correcao,
        validade: teste.validade,
        objetivo: teste.objetivo,
        publicoAlvo: teste.publicoAlvo,
        descricao: teste.descricao,
        itens: teste.itens,
        profissionaisAplicantes: teste.profissionaisAplicantes,
      ),
    );
    notifyListeners();
  }

  // Método para atualizar um teste no Firebase
  Future<void> updateTeste(Teste teste) async {
    // Descobre a posição do teste na lista
    int index = _testes.indexWhere((item) => item.id == teste.id);

    if (index >= 0) {
      await http.patch(
        Uri.parse('$_firebaseURL/testes/${teste.id}.json'),
        body: teste.toJson(),
      );

      _testes[index] = teste;
      notifyListeners();
    }
  }

  // Método para remover teste do Firebase
  Future<void> removeTeste(Teste teste) async {
    // Descobre a posição do teste na lista
    int index = _testes.indexWhere((item) => item.id == teste.id);

    if (index >= 0) {
      // Primeiro exclui o item da lista
      final t = _testes[index];
      _testes.remove(t);
      notifyListeners();

      // Depois exclui do Firebase
      final response =
          await http.delete(Uri.parse('$_firebaseURL/testes/${t.id}.json'));

      // Se caso ocorrer um erro na requisição insere na lista novamente o teste
      if (response.statusCode >= 400) {
        _testes.insert(index, t);
        notifyListeners();
      }
    }
  }
}
