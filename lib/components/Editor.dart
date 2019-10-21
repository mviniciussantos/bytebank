import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController controler;
  final String titulo;
  final String dica;
  final IconData icone;

  Editor({this.controler, this.titulo, this.dica, this.icone});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controler,
        style: TextStyle(
          fontSize: 24.0,
        ),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          icon: icone != null ? Icon(icone) : null,
          labelText: titulo,
          hintText: dica,
        ),
      ),
    );
  }
}
