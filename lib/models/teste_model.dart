import 'dart:convert';

class Teste {
  final String id;
  final int quant;
  final String nome;
  final String sigla;
  final String construto;
  final String contexto;
  final String idade;
  final String aplicacao;
  final String tempoDeAplicacao;
  final String correcao;
  final String validade;
  final String objetivo;
  final String publicoAlvo;
  final String descricao;
  final String itens;
  final String profissionaisAplicantes;

  Teste({
    required this.id,
    required this.quant,
    required this.nome,
    required this.sigla,
    required this.construto,
    required this.contexto,
    required this.idade,
    required this.aplicacao,
    required this.tempoDeAplicacao,
    required this.correcao,
    required this.validade,
    required this.objetivo,
    required this.publicoAlvo,
    required this.descricao,
    required this.itens,
    required this.profissionaisAplicantes,
  });

  // Adapters
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'quant': quant,
      'nome': nome,
      'sigla': sigla,
      'construto': construto,
      'contexto': contexto,
      'idade': idade,
      'aplicacao': aplicacao,
      'tempoDeAplicacao': tempoDeAplicacao,
      'correcao': correcao,
      'validade': validade,
      'objetivo': objetivo,
      'publicoAlvo': publicoAlvo,
      'descricao': descricao,
      'itens': itens,
      'profissionaisAplicantes': profissionaisAplicantes,
    };
  }

  String toJson() => jsonEncode(toMap());
}
