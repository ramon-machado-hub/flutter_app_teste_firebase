import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_teste_firebase/models/users.dart';
import 'package:flutter_app_teste_firebase/provider/user_provider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  String _email,_senha;


  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(
        context, listen: false);

    Future<bool> logIn(String email, String password) async {
      final user = (await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password))
          .user;
      if (user.emailVerified) {
        return true;
      }
      return false;
    }

    return Scaffold(
      body : SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
            
            child: Padding(
              padding: const EdgeInsets.all(25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      child: Image.asset('assets/images/logo.png'),
                    ),
                    SizedBox(height: 30,),
                    TextField(
                      onChanged: (value){
                        setState(() {
                          _email = value.trim();
                        });
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder()),
                    ),
                    SizedBox(height: 20,),
                    TextField(
                      onChanged: (value){
                        setState(() {
                          _senha = value.trim();
                        });
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: 'Senha',
                          border: OutlineInputBorder()),
                    ),
                    SizedBox(height: 20,),
                    SizedBox(
                      width: 120,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        color: Colors.blue[900],
                        onPressed: () async {
                          print(_email);
                          print(_senha);
                          userProvider.getUserByEmail(_email);

                          //Users usuario = await userProvider.getUserByEmail(_email);
                            final user = (await FirebaseAuth.instance
                                .signInWithEmailAndPassword(email: _email, password: _senha))
                                .user;
                            if (user.getIdToken().toString()!='') {
                              var usuario = new Users(
                                id: userProvider.id,
                                senha: userProvider.senha,
                                numero: userProvider.numero,
                                nome: userProvider.nome,
                                fone: userProvider.fone,
                                endereco: userProvider.endereco,
                                email: userProvider.email,
                                cpf: userProvider.cpf,
                                avatar_url: userProvider.avatar_url,
                                data_nascimento: userProvider.data_nascimento,
                                bairro: userProvider.bairro,
                              );
                              print(usuario.fone);
                              Navigator.of(context).pushNamed('/home', arguments: usuario);
                            }
                        },
                          child: Text('Entrar', style: TextStyle(
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
                          onPressed: (){
                            Navigator.of(context).pushNamed('/cadastro');
                          },
                          child: Text('Cadastrar', style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          )),
                          elevation: 4.0,
                          splashColor: Colors.blue,
                      ),
                    ),
                    Center(child: Container(child: Text('Esqueci minha senha', style: TextStyle(color: Colors.red, fontSize: 18) )))
                  ],
                )
            )
        ),
      )
    );
  }
}
