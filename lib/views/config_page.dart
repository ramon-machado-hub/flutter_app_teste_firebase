import 'package:flutter/material.dart';

import '../components/drawer.dart';
import 'home_page.dart';

class ConfigPage extends StatefulWidget {
  @override
  _ConfigPageState createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: IsDrawer(),
        appBar: AppBar(
          title: Center(child: Text('Configurações')),
        ),
      body: Center(child: Text('Versão 2.0', style: TextStyle(color: Colors.white, fontSize: 20),))
      
    );
  }
}
