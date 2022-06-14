import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/user.dart';
import '../utils/routes.dart';

class AulaAnotacoes extends StatefulWidget {
  void Function(String) onDelete;
  List<String> anotacoes;
  AulaAnotacoes(this.anotacoes, this.onDelete);

  @override
  State<AulaAnotacoes> createState() => _AulaAnotacoesState();
}

class _AulaAnotacoesState extends State<AulaAnotacoes> {
  _deletarAnotacao(String anotacao) {
    widget.onDelete(anotacao);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 32),
      padding: const EdgeInsets.all(16),
      color: Colors.yellowAccent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Anotações",
              style: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.headline4,
              )),
          const Padding(padding: EdgeInsets.only(bottom: 16)),
          ListView.builder(
              shrinkWrap: true,
              itemCount: widget.anotacoes.length,
              itemBuilder: (context, index) {
                final anotacao = widget.anotacoes[index];
                return ListTile(
                  leading: IconButton(
                    icon: Icon(Icons.check_box),
                    onPressed: () {
                      _deletarAnotacao(anotacao);
                    },
                  ),
                  title: Text(
                    "- $anotacao",
                    style: GoogleFonts.lato(
                        textStyle: Theme.of(context).textTheme.bodyText1),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
