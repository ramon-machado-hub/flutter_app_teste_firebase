import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddUser extends StatelessWidget {
  final String nome;
  final String data_nascimento;
  final int codigo;
  final String endereco;
  final String bairro;
  final String cpf;
  final String email;
  final String numero;
  final String senha;

  const AddUser(this.nome, this.data_nascimento, this.codigo, this.endereco, this.bairro, this.cpf, this.email, this.numero, this.senha);


  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('usuario');
    Future<void> addUser() {
      return users.add({
        'nome': this.nome,
        'endereco': this.endereco,
        'cpf': this.cpf,
        'email': this.email,
        'senha': this.senha,
        'numero': this.numero,
        'data_nascimento': this.data_nascimento,
        'bairro': this.bairro,
      });


    }

  }
}
