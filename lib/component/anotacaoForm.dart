import 'package:alcanceaulas/model/Leson.dart';
import 'package:flutter/material.dart';

import '../utils/routes.dart';

class AnotacaoForm extends StatefulWidget {
  void Function(String anotacao) onSubmit;

  AnotacaoForm(this.onSubmit);

  @override
  State<AnotacaoForm> createState() => _AnotacaoFormState();
}

class _AnotacaoFormState extends State<AnotacaoForm> {
  final anotacaoController = TextEditingController();
  void _onSubmit() {
    widget.onSubmit(anotacaoController.text);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: anotacaoController,
          decoration: const InputDecoration(
            label: Text("Escreva aqui sua anotação..."),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            _onSubmit();
          },
          child: const Text("Salvar"),
        )
      ],
    );
  }
}
