import 'package:bytebank/models/Transferencia.dart';
import 'package:bytebank/screens/FormTransferencia.dart';
import 'package:flutter/material.dart';

const _titleAppBar = 'Transferências';
const _snacSuccess = 'Transferência criada!';

class ListaTransferencia extends StatefulWidget {
  final List<Transferencia> _transferencias = List();

  @override
  ListaTransferenciaState createState() => ListaTransferenciaState();
}

class ListaTransferenciaState extends State<ListaTransferencia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, posicao) {
          return ItemTransferencia(widget._transferencias[posicao]);
        },
      ),
      appBar: AppBar(
        title: Text(_titleAppBar),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return FormTransferencia();
              },
            ),
          ).then(
            (tranferenciaRecebida) {
              if (tranferenciaRecebida != null) {
                widget._transferencias.add(tranferenciaRecebida);
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text(_snacSuccess),
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.conta.toString()),
      ),
    );
  }
}
