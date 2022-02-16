import 'package:flutter/material.dart';

class Reserva {
  String id;
  String id_proprietario;
  String id_solicitante;
  String id_carro;
  String diaria;
  String calcao;
  String taxas_extras;
  String total;
  String quilometragem;
  String data_reserva;
  String hora_entrada;
  String hora_saida;
  String situacao;//pendente, aceitou, rejeitou
  bool visualized;

  Reserva({
    @required this.id,
    @required this.id_proprietario,
    @required this.id_solicitante,
    @required this.id_carro,
    @required this.diaria,
    @required this.calcao,
    @required this.taxas_extras,
    @required this.total,
    @required this.quilometragem,
    @required this.data_reserva,
    @required this.hora_entrada,
    @required this.hora_saida,
    @required this.situacao,
    @required this.visualized,
  });

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (id!=null){
      map['id']= id;
    }
    map['id_proprietario'] = id_proprietario;
    map['id_solicitante']= id_solicitante;
    map['diaria']= diaria;
    map['quilometragem']= quilometragem;
    map['data_reserva']= data_reserva;
    map['taxas_extras']= taxas_extras;
    map['hora_entrada']= hora_entrada;
    map['id_carro']= id_carro;
    map['hora_saida']= hora_saida;
    map['situacao']= situacao;
    map['visualized']= visualized;
    map['calcao']= calcao;
  }

  Reserva.map(dynamic obj){

    this.id = obj['id'];
    this.id_proprietario = obj['id_proprietario'];
    this.id_solicitante = obj['id_solicitante'];
    this.diaria = obj['diaria'];
    this.quilometragem = obj['quilometragem'];
    this.data_reserva = obj['data_reserva'];
    this.taxas_extras = obj['taxas_extras'];
    this.hora_entrada = obj['hora_entrada'];
    this.id_carro = obj['id_carro'];
    this.hora_saida = obj['hora_saida'];
    this.situacao = obj['situacao'];
    this.calcao = obj['calcao'];
    this.visualized = obj['visualized'];
  }

  Reserva.fromMap(Map<String, dynamic> map, String id){
    this.id = id ?? '';
    this.id_proprietario = map['id_proprietario'];
    this.id_solicitante = map['id_solicitante'];
    this.diaria = map['diaria'];
    this.quilometragem = map['quilometragem'];
    this.data_reserva = map['data_reserva'];
    this.taxas_extras = map['taxas_extras'];
    this.hora_entrada = map['hora_entrada'];
    this.id_carro = map['id_carro'];
    this.hora_saida = map['hora_saida'];
    this.situacao = map['situacao'];
    this.calcao = map['calcao'];
    this.visualized = map['visualized'];
  }

}