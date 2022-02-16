import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_teste_firebase/models/users.dart';

class UserProvider with ChangeNotifier {
  var db = FirebaseFirestore.instance;
  String id, fone, email, nome, cpf, endereco, avatar_url, data_nascimento, bairro, senha, numero;
  Future<int> getCount() async {
    QuerySnapshot _myDoc =
        await FirebaseFirestore.instance.collection('users').get();
    List<DocumentSnapshot> _myDocCount = _myDoc.docs;
    return _myDocCount.length;
  }

  int count() {
    int count = int.parse(getCount().toString());
    return count;
  }

  String getEmailCurrentUser() {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User user = auth.currentUser;
    return user.email;
  }

  Future<void> getUserByEmail (String emaill) async{
    Map<String, dynamic> userDocumentt;
    Stream<DocumentSnapshot> userP = await
        db.collection('users').doc(emaill).snapshots();
    print('getUserByEmail');
    userP.listen((DocumentSnapshot snap) {
      if (userP != null) {
        userDocumentt = Map.from(snap.data());
        print('userDocumentt');
        print(userDocumentt);
        print(userDocumentt['id']);
        id = userDocumentt['id'];
        senha = userDocumentt['senha'];
        fone = userDocumentt['fone'];
        cpf = userDocumentt['cpf'];
        nome = userDocumentt['nome'];
        avatar_url = userDocumentt['avatar_url'];
        data_nascimento = userDocumentt['data_nascimento'];
        bairro = userDocumentt['bairro'];
        endereco = userDocumentt['endereco'];
        numero = userDocumentt['numero'];
        email = userDocumentt['email'];
       /* return Users(
          id: userDocumentt['id'],
          senha: userDocumentt['senha'],
          numero: userDocumentt['numero'],
          nome: userDocumentt['nome'],
          fone: userDocumentt['fone'],
          endereco: userDocumentt['endereco'],
          email: userDocumentt['email'],
          cpf: userDocumentt['cpf'],
          avatar_url: userDocumentt['avatar_url'],
          data_nascimento: userDocumentt['data_nascimento'],
          bairro: userDocumentt['bairro'],
        );*/
      } else {
        print('HELLOaaaaa');
      }
    });
    //print('aqui' + user.nome.toString());
   // return null;
  }

  String getId(){
    return null;
  }

  Users getUserByUEmail(String email) {
    Map<String, dynamic> userDocumentt;
    Stream<DocumentSnapshot> userP =
        db.collection('users').doc(email).snapshots();
     userP.listen((DocumentSnapshot snap) {
      userDocumentt = Map.from(snap.data());
      print('getUserByUEmail');
      if (userP != null) {
        print('entrou');
        var user =  new Users(
          bairro: userDocumentt['bairro'],
          data_nascimento: userDocumentt['data_nascimento'],
          avatar_url: userDocumentt['avatar_url'],
          cpf: userDocumentt['cpf'],
          email:  userDocumentt['email'],
          endereco: userDocumentt['endereco'],
          fone: userDocumentt['fone'],
          nome: userDocumentt['nome'],
          numero: userDocumentt['numero'],
          senha: userDocumentt['senha'],
          id: userDocumentt['id'],
        );
        //print(user.id);
        return user;
      } else {
        print('HELLOaaaaa');
      }
    });
    //print('return null');
    //return null;
  }

  void remove(BuildContext context, DocumentSnapshot doc, int position) async {
    db.collection("users").doc(doc.id).delete();
    notifyListeners();
  }

  Future<String> getData() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    final User user = auth.currentUser;
    final String uid = user.uid.toString();
    print(uid);
    return uid;
  }

  void insertUserEmailAndPassword(String email, String senha) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    auth.createUserWithEmailAndPassword(email: email, password: senha);
    notifyListeners();
  }

  Future<void> put(Users user) async {
    if (user.id == null) {
      insertUserEmailAndPassword(user.email, user.senha);
      int id = await getCount();
      db.collection('users').doc((user.email).toString()).set({
        'id': (id + 1).toString(),
        'senha': user.senha,
        'numero': user.numero,
        'nome': user.nome,
        'fone': user.fone,
        'endereco': user.endereco,
        'email': user.email,
        'data_nascimento': user.data_nascimento,
        'cpf': user.cpf,
        'avatar_url': user.avatar_url,
        'bairro': user.bairro,
      });
    } else {
      db.collection('users').doc((user.email).toString()).set({
        'id': user.id,
        'senha': user.senha,
        'numero': user.numero,
        'nome': user.nome,
        'fone': user.fone,
        'endereco': user.endereco,
        'email': user.email,
        'data_nascimento': user.data_nascimento,
        'cpf': user.cpf,
        'avatar_url': user.avatar_url,
        'bairro': user.bairro,
      });
    }
    notifyListeners();
  }
}
