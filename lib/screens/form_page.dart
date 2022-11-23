import 'package:clinica_up/models/teste_model.dart';
import 'package:clinica_up/services/testes_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_formData.isEmpty) {
      final args = ModalRoute.of(context)?.settings.arguments;

      if (args != null) {
        final teste = args as Teste;
        _formData['id'] = teste.id;
        _formData['quant'] = teste.quant;
        _formData['nome'] = teste.nome;
        _formData['sigla'] = teste.sigla;
        _formData['construto'] = teste.construto;
        _formData['contexto'] = teste.contexto;
        _formData['idade'] = teste.idade;
        _formData['aplicacao'] = teste.aplicacao;
        _formData['tempoDeAplicaçao'] = teste.tempoDeAplicacao;
        _formData['correcao'] = teste.correcao;
        _formData['validade'] = teste.validade;
        _formData['objetivo'] = teste.objetivo;
        _formData['publicoAlvo'] = teste.publicoAlvo;
        _formData['descricao'] = teste.descricao;
        _formData['itens'] = teste.itens;
        _formData['profissionaisAplicantes'] = teste.profissionaisAplicantes;
      }
    }
  }

  final _formKey = GlobalKey<FormState>();
  final _formData = <String, dynamic>{};

  void _submitForm() {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }

    _formKey.currentState?.save();

    Provider.of<TestesService>(context, listen: false).saveForm(_formData);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: const Color.fromRGBO(6, 48, 96, 1),
        centerTitle: true,
        title: const Text(
          'Formulário de Teste',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Lato',
            fontSize: 23,
            letterSpacing: 0.4,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _submitForm,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 10,
          left: 15,
          right: 15,
          bottom: 30,
        ),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                initialValue: _formData['nome']?.toString(),
                decoration: const InputDecoration(
                  labelText: 'Nome',
                ),
                textInputAction: TextInputAction.next,
                onSaved: (nome) => _formData['nome'] = nome ?? '',
                validator: (nomeForm) {
                  final nome = nomeForm ?? '';

                  if (nome.trim().isEmpty) {
                    return 'Nome é um campo obrigatório.';
                  }

                  return null;
                },
              ),
              TextFormField(
                initialValue: _formData['quant']?.toString(),
                decoration: const InputDecoration(
                  labelText: 'Quantidade',
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                textInputAction: TextInputAction.next,
                onSaved: (quant) =>
                    _formData['quant'] = int.parse(quant ?? '0'),
                validator: (quantForm) {
                  final quantString = quantForm ?? '';
                  final quant = int.tryParse(quantString) ?? 0;

                  if (quant <= 0) {
                    return 'Quantidade é um campo obrigatório.';
                  }

                  return null;
                },
              ),
              TextFormField(
                initialValue: _formData['sigla']?.toString(),
                decoration: const InputDecoration(
                  labelText: 'Sigla',
                ),
                textInputAction: TextInputAction.next,
                onSaved: (sigla) => _formData['sigla'] = sigla ?? '',
                validator: (siglaForm) {
                  final sigla = siglaForm ?? '';

                  if (sigla.trim().isEmpty) {
                    return 'Sigla é um campo obrigatório.';
                  }

                  return null;
                },
              ),
              TextFormField(
                initialValue: _formData['construto']?.toString(),
                decoration: const InputDecoration(
                  labelText: 'Construto',
                ),
                textInputAction: TextInputAction.next,
                onSaved: (construto) =>
                    _formData['construto'] = construto ?? '',
                validator: (construtoForm) {
                  final construto = construtoForm ?? '';

                  if (construto.trim().isEmpty) {
                    return 'Construto é um campo obrigatório.';
                  }

                  return null;
                },
              ),
              TextFormField(
                initialValue: _formData['contexto']?.toString(),
                decoration: const InputDecoration(
                  labelText: 'Contexto',
                ),
                textInputAction: TextInputAction.next,
                onSaved: (contexto) => _formData['contexto'] = contexto ?? '',
                validator: (contextoForm) {
                  final contexto = contextoForm ?? '';

                  if (contexto.trim().isEmpty) {
                    return 'Contexto é um campo obrigatório.';
                  }

                  return null;
                },
              ),
              TextFormField(
                initialValue: _formData['idade']?.toString(),
                decoration: const InputDecoration(
                  labelText: 'Idade',
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                textInputAction: TextInputAction.next,
                onSaved: (idade) => _formData['idade'] = idade ?? '',
                validator: (idadeForm) {
                  final idade = idadeForm ?? '';

                  if (idade.trim().isEmpty) {
                    return 'Idade é um campo obrigatório.';
                  }

                  return null;
                },
              ),
              TextFormField(
                initialValue: _formData['aplicacao']?.toString(),
                decoration: const InputDecoration(
                  labelText: 'Aplicação',
                ),
                textInputAction: TextInputAction.next,
                onSaved: (aplicacao) =>
                    _formData['aplicacao'] = aplicacao ?? '',
                validator: (aplicacaoForm) {
                  final aplicacao = aplicacaoForm ?? '';

                  if (aplicacao.trim().isEmpty) {
                    return 'Aplicação é um campo obrigatório.';
                  }

                  return null;
                },
              ),
              TextFormField(
                initialValue: _formData['tempoDeAplicacao']?.toString(),
                decoration: const InputDecoration(
                  labelText: 'Tempo de Aplicação',
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                textInputAction: TextInputAction.next,
                onSaved: (tempo) => _formData['tempoDeAplicacao'] = tempo ?? '',
                validator: (tempoForm) {
                  final tempo = tempoForm ?? '';

                  if (tempo.trim().isEmpty) {
                    return 'Tempo de Aplicação é um campo obrigatório.';
                  }

                  return null;
                },
              ),
              TextFormField(
                initialValue: _formData['correcao']?.toString(),
                decoration: const InputDecoration(
                  labelText: 'Correção',
                ),
                textInputAction: TextInputAction.next,
                onSaved: (correcao) => _formData['correcao'] = correcao ?? '',
                validator: (correcaoForm) {
                  final correcao = correcaoForm ?? '';

                  if (correcao.trim().isEmpty) {
                    return 'Correção é um campo obrigatório.';
                  }

                  return null;
                },
              ),
              TextFormField(
                initialValue: _formData['validade']?.toString(),
                decoration: const InputDecoration(
                  labelText: 'Validade',
                ),
                textInputAction: TextInputAction.next,
                onSaved: (validade) => _formData['validade'] = validade ?? '',
                validator: (validadeForm) {
                  final validade = validadeForm ?? '';

                  if (validade.trim().isEmpty) {
                    return 'Validade é um campo obrigatório.';
                  }

                  return null;
                },
              ),
              TextFormField(
                initialValue: _formData['objetivo']?.toString(),
                decoration: const InputDecoration(
                  labelText: 'Objetivo',
                ),
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.next,
                onSaved: (objetivo) => _formData['objetivo'] = objetivo ?? '',
                validator: (objetivoForm) {
                  final objetivo = objetivoForm ?? '';

                  if (objetivo.trim().isEmpty) {
                    return 'Objetivo é um campo obrigatório.';
                  }

                  return null;
                },
              ),
              TextFormField(
                initialValue: _formData['publicoAlvo']?.toString(),
                decoration: const InputDecoration(
                  labelText: 'Publico-Alvo',
                ),
                textInputAction: TextInputAction.next,
                onSaved: (publico) => _formData['publicoAlvo'] = publico ?? '',
                validator: (publicoForm) {
                  final publico = publicoForm ?? '';

                  if (publico.trim().isEmpty) {
                    return 'Publico-Alvo é um campo obrigatório.';
                  }

                  return null;
                },
              ),
              TextFormField(
                initialValue: _formData['descricao']?.toString(),
                decoration: const InputDecoration(
                  labelText: 'Descrição',
                ),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.multiline,
                onSaved: (descricao) =>
                    _formData['descricao'] = descricao ?? '',
                validator: (descricaoForm) {
                  final descricao = descricaoForm ?? '';

                  if (descricao.trim().isEmpty) {
                    return 'Descrição é um campo obrigatório.';
                  }

                  return null;
                },
              ),
              TextFormField(
                initialValue: _formData['itens'].toString(),
                decoration: const InputDecoration(
                  labelText: 'Itens',
                ),
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.next,
                onSaved: (itens) => _formData['itens'] = itens ?? '',
                validator: (itensForm) {
                  final itens = itensForm ?? '';

                  if (itens.trim().isEmpty) {
                    return 'Itens é um campo obrigatório.';
                  }

                  return null;
                },
              ),
              TextFormField(
                initialValue: _formData['profissionaisAplicantes']?.toString(),
                decoration: const InputDecoration(
                  labelText: 'Profissionais Aplicantes',
                ),
                textInputAction: TextInputAction.next,
                onSaved: (profissionais) =>
                    _formData['profissionaisAplicantes'] = profissionais ?? '',
                validator: (profissionaisForm) {
                  final profissionais = profissionaisForm ?? '';

                  if (profissionais.trim().isEmpty) {
                    return 'Profissionais Aplicantes é um campo obrigatório.';
                  }

                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
