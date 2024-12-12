import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/aplicacao/ap_cliente.dart';
import 'package:flutter_application_1/app/dominio/dto/dto_cliente.dart';

class FormCliente extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final _nomeController = TextEditingController();
    final _cpfController = TextEditingController();
    final _emailController = TextEditingController();
    final _descricaoController = TextEditingController();

    void _criarCliente() async {
      if (_formKey.currentState!.validate()) {
        final nome = _nomeController.text;
        final cpf = _cpfController.text;
        final email = _emailController.text;
        final descricao = _descricaoController.text;

        DTOCliente dto = DTOCliente(
          nome: nome,
          cpf: cpf,
          email: email,
          descricao: descricao,
          status: true,
        );

        APCliente apCliente = APCliente();
        await apCliente.salvar(dto);

        _nomeController.clear();
        _cpfController.clear();
        _emailController.clear();
        _descricaoController.clear();

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Cliente salvo com sucesso')),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Cliente'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nomeController,
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe o nome';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _cpfController,
                decoration: InputDecoration(labelText: 'CPF'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe o CPF';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe o email';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descricaoController,
                decoration: InputDecoration(labelText: 'Descrição'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _criarCliente,
                child: Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}