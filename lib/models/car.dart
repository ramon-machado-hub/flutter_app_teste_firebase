import 'package:flutter/material.dart';

class Car {

    String id;
    String id_proprietario;
    String placa;
    String cor;
    String modelo;
    String marca;
    String quilometragem;
    String ano;
    String calcao;
    String diaria;
    String foto_url;

  Car({
    @required this.id,
    @required this.id_proprietario,
    @required this.placa,
    @required this.cor,
    @required this.modelo,
    @required this.marca,
    @required this.quilometragem,
    @required this.ano,
    @required this.calcao,
    @required this.diaria,
    @required this.foto_url,
  });

   Map<String, dynamic> toMap() {
     var map = new Map<String, dynamic>();
     if (id!=null){
       map['id']= id;
     }
     map['id_proprietario'] = id_proprietario;
     map['placa']= placa;
     map['cor']= cor;
     map['modelo']= modelo;
     map['quilometragem']= quilometragem;
     map['ano']= ano;
     map['calcao']= calcao;
     map['diaria']= diaria;
     map['foto_url']= foto_url;
     map['marca']= marca;

   }

    Car.map(dynamic obj){
      this.id = obj['id'];
      this.id_proprietario = obj['id_proprietario'];
      this.placa = obj['placa'];
      this.cor = obj['cor'];
      this.modelo = obj['modelo'];
      this.marca = obj['marca'];
      this.quilometragem = obj['quilometragem'];
      this.ano = obj['ano'];
      this.calcao = obj['calcao'];
      this.diaria = obj['diaria'];
      this.foto_url = obj['foto_url'];
      this.marca = obj['marca'];
    }

   Car.fromMap(Map<String, dynamic> map, String id){
     this.id = id ?? '';
     this.id_proprietario = map['id_proprietario'];
     this.placa = map['placa'];
     this.cor = map['cor'];
     this.modelo = map['modelo'];
     this.quilometragem = map['quilometragem'];
     this.ano = map['ano'];
     this.calcao = map['calcao'];
     this.diaria = map['diaria'];
     this.foto_url = map['foto_url'];
     this.foto_url = map['marca'];
   }

}
