import 'package:flutter/material.dart';

class TextFieldsComp extends StatelessWidget {

  final String descricao;

  const TextFieldsComp({Key key, this.descricao}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return TextField(
      decoration: InputDecoration(labelText: this.descricao, border: OutlineInputBorder()),
    );
  }
}
