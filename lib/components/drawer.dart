import 'package:flutter/material.dart';
import 'package:flutter_app_teste_firebase/models/users.dart';

class IsDrawer extends StatefulWidget {
  final Users user;

  const IsDrawer({this.user});

  @override
  _IsDrawerState createState() => _IsDrawerState();
}

class _IsDrawerState extends State<IsDrawer> {


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                      widget.user.avatar_url,
                  ),
              ),
              accountName: Text(widget.user.nome),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 0, top: 5, bottom: 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('PARCEIRO',
                    style: TextStyle(fontSize: 15, color: Colors.black45),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.directions_car),
              title: Text('Meus carros', style: TextStyle(fontSize: 16),),
              onTap: () {
                Navigator.of(context).pushNamed('/meus_carros', arguments: widget.user.id);

              },
            ),

            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text('Reservas', style: TextStyle(fontSize: 16),),
              onTap: () {
                Navigator.of(context).pushNamed('/reservas', arguments: widget.user.id);
              },
            ),


            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 0, top: 5, bottom: 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('CLIENTE',
                  style: TextStyle(fontSize: 15, color: Colors.black45),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home Page', textAlign: TextAlign.left, style: TextStyle(fontSize: 16),),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/home', arguments: widget.user);
              },
            ),
            ListTile(
              leading: Icon(Icons.perm_identity),
              title: Text('Perfil', style: TextStyle(fontSize: 16),),
              onTap: () {
                Navigator.of(context).pushNamed('/perfil', arguments: widget.user);
              },
            ),
            ListTile(
              leading: Icon(Icons.assignment_turned_in_outlined),
              title: Text('Solicitações', style: TextStyle(fontSize: 16),),
              onTap: () {
                Navigator.of(context).pushNamed('/solicitacoes', arguments: widget.user.id);
              },
            ),

            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 0, top: 5, bottom: 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('OUTROS',
                  style: TextStyle(fontSize: 15, color: Colors.black45),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Configurações', style: TextStyle(fontSize: 16),),
              onTap: () {
                Navigator.of(context).pushNamed('/config');
              },
            ),
            ListTile(
              leading: Icon(Icons.subdirectory_arrow_left),
              title: Text('Sair', style: TextStyle(fontSize: 16),),
              onTap: () {
                Navigator.of(context).pushNamed('/');
              },
            ),
          ],
        ),
      ),
    );
  }
}
