import 'package:bytebank/components/Editor.dart';
import 'package:bytebank/models/Transferencia.dart';
import 'package:flutter/material.dart';

const _titleAppBar = 'Nova transferência';
const _titleFieldNumeroConta = 'Número da conta';
const _hintFieldNumeroConta = '0000';
const _titleFieldValor = 'Valor';
const _hintFieldValor = '0.00';

class FormTransferencia extends StatefulWidget {
  @override
  FormTransferenciaState createState() => FormTransferenciaState();
}

class FormTransferenciaState extends State<FormTransferencia> {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleAppBar),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Editor(
                controler: _controladorCampoNumeroConta,
                titulo: _titleFieldNumeroConta,
                dica: _hintFieldNumeroConta,
              ),
              Editor(
                controler: _controladorCampoValor,
                titulo: _titleFieldValor,
                dica: _hintFieldValor,
                icone: Icons.monetization_on,
              ),
              RaisedButton(
                child: Text(
                  'Confirmar',
                ),
                onPressed: () => _criarTransferencia(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _criarTransferencia(BuildContext context) {
    int numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    double valor = double.tryParse(_controladorCampoValor.text);

    if (numeroConta != null && valor != null) {
      Transferencia transf = Transferencia(valor, numeroConta);
      Navigator.pop(context, transf);
    }
  }
}
