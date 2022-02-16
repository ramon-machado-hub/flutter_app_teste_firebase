import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app_teste_firebase/provider/car_provider.dart';
import 'package:flutter_app_teste_firebase/models/car.dart';

class CadastroCarro extends StatefulWidget {

  @override
  _CadastroCarroState createState() => _CadastroCarroState();
}

class _CadastroCarroState extends State<CadastroCarro> {

  @override
  void initState() {
    super.initState();

  }

  final _form = GlobalKey<FormState>();
  //transferir variaveis para o map
  final  Map<String, String> _formData = {};
  String marca = 'Chevrolett';
  String modelo= 'CELTA 1.0';
  String ano, calcao, cor, diaria, foto_url, placa, quilometragem;


  @override
  Widget build(BuildContext context) {
    //final CarProvider carProvider = Provider.of(context, listen: false);
    final String id_proprietario = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Adicionar Veículo')),
      ),
      body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 18, bottom: 18),
            child: Form(
              key: _form,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 35,),
                  Row(
                    children: <Widget>[
                        Expanded(
                          child: DropdownButton<String>(
                            value: marca,
                            onChanged: (String newValue) {
                              setState(() {
                                marca = newValue;
                              });
                            },
                            items: <String>['Chevrolett', 'Fiat', 'Hiunday', 'Pegeout', 'Renault', 'Toyota','Wolksvagem']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                        SizedBox(width: 35,),
                        Expanded(child: DropdownButton<String>(
                          value: modelo,
                          onChanged: (String newValue) {
                            setState(() {
                              modelo = newValue;
                            });
                          },
                          items: <String>['CELTA 1.0', 'COBALT','CORSA 1.4 SEDAN', 'CRUZE', 'ONIX']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),),
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    children: [
                      Expanded(child: TextFormField(

                        decoration: InputDecoration(
                            labelText: 'Placa', border: OutlineInputBorder()),
                        validator: (value){
                          if (value.trim().length < 7) {
                            return 'Placa Inválida';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          placa = value;
                        },
                      )),
                      SizedBox(width: 30,),
                      Expanded(child: TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Ano', border: OutlineInputBorder()),
                        validator: (value){
                          if (value.trim().length != 4) {
                            return 'Ano inválido. Ex.: 2019';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          ano = value;
                        },
                        keyboardType: TextInputType.number,
                      )),
                      //SizedBox(width: 30,),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(child: TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Cor', border: OutlineInputBorder()),
                        validator: (value){
                          if (value.trim().length < 3) {
                            return 'No mínimo 3 caracteres';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          cor = value;
                        },
                      )),
                      SizedBox(width: 30,),
                      Expanded(child: TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Quilometragem', border: OutlineInputBorder()),
                        validator: (value){
                          if (value.trim().length <= 1) {
                            return 'KM não informado';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          quilometragem = value;
                        },
                        keyboardType: TextInputType.number,
                      )),
                      //SizedBox(width: 30,),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(child: TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Valor Diaria', border: OutlineInputBorder()),
                            validator: (value){
                              if (value.isEmpty) {
                                return 'Informe valor';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              diaria = value;
                            },
                            keyboardType: TextInputType.number,
                      )),
                      SizedBox(width: 30,),
                      Expanded(child: TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Valor calção', border: OutlineInputBorder()),
                        validator: (value){
                          if (value.isEmpty) {
                            return 'Informe valor';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          calcao = value;
                        },
                        keyboardType: TextInputType.number,
                      )),
                      //SizedBox(width: 30,),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(child: TextFormField(
                        decoration: InputDecoration(
                            labelText: 'URL Foto', border: OutlineInputBorder()),
                        validator: (value){
                          if (value.length <= 7) {
                            return 'URL inválida';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          foto_url = value;
                        },
                      )),
                    ],
                  ),
                  SizedBox(height: 15,),
                  SizedBox(
                    width: 120,
                    height: 50,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      color: Colors.red,
                      onPressed: (){
                        final isValid = _form.currentState.validate();
                        print(isValid);
                        if (isValid){
                          print('validou');
                          _form.currentState.save();
                          Provider.of<CarProvider>(context, listen: false).put(Car(
                            //filtrar para id do usuario...
                             id_proprietario: id_proprietario,
                             placa: placa,
                             cor: cor,
                             modelo: modelo,
                             quilometragem: quilometragem,
                             ano: ano,
                             calcao: calcao,
                             diaria: diaria,
                             foto_url: foto_url,
                             marca: marca,
                          ),);
                          Navigator.of(context).pushReplacementNamed('/meus_carros', arguments: id_proprietario);
                        }
                      },
                      child: Text('Cadastrar', style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      )),
                      elevation: 4.0,
                      splashColor: Colors.redAccent,

                    ),
                  ),
                  SizedBox(height: 15,),

                  SizedBox(
                    width: 120,
                    height: 50,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      color: Colors.red,
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                      child: Text('Cancelar', style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      )),
                      elevation: 4.0,
                      splashColor: Colors.redAccent,

                    ),
                  ),
                ],
        ),
            ),
          ),
      ),
     );
  }
}

