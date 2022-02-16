import 'package:flutter_app_teste_firebase/models/users.dart';
import 'package:flutter_app_teste_firebase/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CadastroPage extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  String nome, cpf, data_nascimento, email, endereco,
  bairro, numero, fone, senha, avatar_url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: _form,
                child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  SizedBox(height: 35,),
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Nome', border: OutlineInputBorder()),
                          validator: (value){
                            if (value.trim().length < 5) {
                              return 'Nome Inválido';
                            }
                            return null;
                           },
                          onSaved: (value) {
                            nome = value;
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15,),
                  TextFormField(
                    decoration:
                    InputDecoration(labelText: 'Email', border: OutlineInputBorder()),
                    validator: (value){
                      if (value.trim().length < 5) {
                        return 'Email Inválido';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      email = value;
                    },
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Expanded( flex: 3,
                          child: TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Endereço', border: OutlineInputBorder()),
                        validator: (value){
                          if (value.trim().length < 5) {
                             return 'Endereço Inválido';
                          }
                          return null;
                        },
                        onSaved: (value) {
                           endereco = value;
                        },
                      )),
                      SizedBox(width: 15,),
                      Expanded(flex: 1 ,
                          child: TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Número', border: OutlineInputBorder()),
                        validator: (value){
                           if (value.trim().length ==0) {
                             return 'Insira o Número';
                           }
                           return null;
                        },
                        onSaved: (value) {
                           numero = value;
                        },
                        keyboardType: TextInputType.number,
                      )),
                      //SizedBox(width: 30,),
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Bairro', border: OutlineInputBorder()),
                          validator: (value){
                            if (value.trim().length < 5) {
                              return 'Bairro Inválido';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            bairro = value;
                          },
                        ),),
                      SizedBox(width: 15,),
                      Expanded(
                        child: TextFormField(
                          decoration:
                              InputDecoration(labelText: 'CPF', border: OutlineInputBorder()),
                          validator: (value){
                            if (value.trim().length < 11) {
                              return 'CPF Inválido. Insira os 11 dígitos';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            cpf = value;
                          },
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    children: [
                      Expanded(
                        child:TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Telefone', border: OutlineInputBorder()),
                          validator: (value){
                            if (value.trim().length < 9) {
                              return 'Telefone Inválido';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            fone = value;
                          },
                        keyboardType: TextInputType.number,
                      ),),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Data de Nascimento', border: OutlineInputBorder()),
                          validator: (value){
                            if (value.trim().length < 8) {
                              return 'Data Inválida';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            data_nascimento = value;
                          },
                          keyboardType: TextInputType.datetime,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15.0,0,15.0,0),
                    child: TextFormField(
                      decoration: InputDecoration(
                          labelText: 'avatar URL', border: OutlineInputBorder()),
                      validator: (value){
                        if (value.trim().length < 6) {
                          return 'Avatar inválido';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        avatar_url = value;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(80.0,0,80,0),
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: 'Senha', border: OutlineInputBorder()),
                      validator: (value){
                        if (value.trim().length < 6) {
                          return 'Senha Inválida. 6 dígitos';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        senha = value;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(80.0,0,80,0),
                    child: TextFormField(
                      obscureText: true,
                      decoration:
                      InputDecoration(labelText: ' Confirme sua Senha', border: OutlineInputBorder()),
                    ),
                  ),

                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: 120,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      color: Colors.blue[900],
                      onPressed: () {
                        final isValid = _form.currentState.validate();
                        print('valido '+isValid.toString());
                        if (isValid){
                          print('validou');
                          _form.currentState.save();
                          //validar se ja existe primeiro
                          // inserir no auth primeiro depois no firestore;
                          Provider.of<UserProvider>(context, listen: false).put(Users(
                            bairro: bairro,
                            avatar_url: avatar_url,
                            cpf: cpf,
                            data_nascimento: data_nascimento,
                            email: email,
                            endereco: endereco,
                            fone: fone,
                            nome: nome,
                            numero: numero,
                            senha: senha,
                          ));
                          Navigator.of(context).pushNamed('/');
                        }
                      },
                      child: Text('Cadastrar',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          )),
                      elevation: 4.0,
                      splashColor: Colors.blue,
                    ),
                  ),
                  SizedBox(
                    width: 120,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      color: Colors.blue[900],
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Cancelar',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          )),
                      elevation: 4.0,
                      splashColor: Colors.blue,
                    ),
                  ),
      ]),
              ),
    )));
  }
}
