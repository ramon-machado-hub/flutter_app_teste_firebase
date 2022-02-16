import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:flutter_app_teste_firebase/components/textFieldsComponents.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_teste_firebase/models/users.dart';

import '../components/drawer.dart';
import 'home_page.dart';

class PerfilPage extends StatefulWidget {


  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  @override
  Widget build(BuildContext context) {

    final Users usuario = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        //drawer: IsDrawer(),
        appBar: AppBar(
            centerTitle: true,
            title: Text('Perfil'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 18, bottom: 18),
            child: Column(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(150),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network(
                          usuario.avatar_url,
                        ),
                      ),
                  ),
                ),

                Column(

                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [

                    Padding(
                      padding: const EdgeInsets.only(left: 0, right: 0, top: 5, bottom: 0),
                      child: Divider(
                        color: Colors.black45,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Text('Nome: ',
                        style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        Text(usuario.nome,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Text('CPF: ',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        Text(usuario.cpf,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Text('Data Nascimento: ', style: TextStyle(
                          fontSize: 15,
                         ),
                        ),
                        Text(usuario.data_nascimento, style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 0, right: 0, top: 5, bottom: 0),
                      child: Divider(
                        color: Colors.black45,
                      ),
                    ),
                    SizedBox(height: 15,),
                    Row(
                      children: [
                        IconButton(
                            icon: Icon(Icons.edit_outlined),
                            onPressed: () {

                            }
                        ),
                        Text('Telefone: '+usuario.fone,
                          style: TextStyle(
                            fontSize: 15,
                          ),),
                      ],
                    ),
                    SizedBox(height: 15,),
                    Row(
                      children: [
                        IconButton(
                            icon: Icon(Icons.edit_outlined),
                            onPressed: () {

                            }
                        ),
                        Text('Email: '+usuario.email,
                          style: TextStyle(
                            fontSize: 15,
                          ),),
                      ],
                    ),
                    SizedBox(height: 15,),
                    Column(
                      children: [
                        Row(
                          children: [
                            IconButton(
                                icon: Icon(Icons.edit_outlined),
                                onPressed: () {

                                }
                            ),
                            Text('Endereço: '),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(usuario.endereco,
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),),
                                Text('Número: '+usuario.numero,
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),),

                                Text('Bairro: '+usuario.bairro,
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),),
                              ],
                            )
                          ],
                        ),

                      ],
                    ),

                  ],
                ),
                SizedBox(height: 15,),
              ],

            ),
          ),
        )

    );
  }
}
