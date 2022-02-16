import 'package:flutter/material.dart';

class Users {
  String id;
  String nome;
  String cpf;
  String email;
  String data_nascimento;
  String fone;
  String endereco;
  String bairro;
  String numero;
  String senha;
  String avatar_url;

 Users({
   @required this.id,
   @required this.nome,
   @required this.cpf,
   @required this.email,
   @required this.data_nascimento,
   @required this.fone,
   @required this.endereco,
   @required this.bairro,
   @required this.numero,
   @required this.senha,
   @required this.avatar_url,
 });

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (id!=null){
      map['id']= id;
    }
    map['nome'] = nome;
    map['cpf']= cpf;
    map['data_nascimento']= data_nascimento;
    map['email']= email;
    map['fone']= fone;
    map['endereco']= endereco;
    map['numero']= numero;
    map['bairro']= bairro;
    map['senha']= senha;
    map['avatar_url']= avatar_url;
  }

  Users.map(dynamic obj){
    this.id = obj['id'];
    this.nome = obj['nome'];
    this.cpf = obj['cpf'];
    this.data_nascimento = obj['data_nascimento'];
    this.email = obj['email'];
    this.fone = obj['fone'];
    this.endereco = obj['endereco'];
    this.numero = obj['numero'];
    this.bairro = obj['bairro'];
    this.senha = obj['senha'];
    this.avatar_url = obj['avatar_url'];
  }

  Users.fromMap(Map<String, dynamic> map, String id){
    this.id = id ?? '';
    this.nome = map['nome'];
    this.cpf = map['cpf'];
    this.data_nascimento = map['data_nascimento'];
    this.email = map['email'];
    this.fone = map['fone'];
    this.endereco = map['endereco'];
    this.numero = map['numero'];
    this.bairro = map['bairro'];
    this.senha = map['senha'];
    this.avatar_url = map['avatar_url'];
  }
}






