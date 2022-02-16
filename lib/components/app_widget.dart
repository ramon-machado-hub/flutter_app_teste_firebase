import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app_teste_firebase/components/authentication_service.dart';
import 'package:flutter_app_teste_firebase/provider/car_provider.dart';
import 'package:flutter_app_teste_firebase/provider/reserva_provider.dart';
import 'package:flutter_app_teste_firebase/provider/user_provider.dart';
import 'package:flutter_app_teste_firebase/views/detalhe_reserva.dart';
import 'package:flutter_app_teste_firebase/views/detalhe_solicitacoes.dart';
import 'package:flutter_app_teste_firebase/views/solicitacoes_page.dart';
import 'package:flutter_app_teste_firebase/views/cadastro_carro.dart';
import 'package:flutter_app_teste_firebase/views/cadastro_page.dart';
import 'package:flutter_app_teste_firebase/views/config_page.dart';
import 'package:flutter_app_teste_firebase/views/detalhes_carro.dart';
import 'package:flutter_app_teste_firebase/views/home_page.dart';
import 'package:flutter_app_teste_firebase/views/list_my_cars.dart';
import 'package:flutter_app_teste_firebase/views/login_page.dart';
import 'package:flutter_app_teste_firebase/views/minhas_reservas.dart';
import 'package:flutter_app_teste_firebase/views/perfil_page.dart';
import 'package:flutter_app_teste_firebase/views/solicitar_reserva.dart';
import 'package:flutter_app_teste_firebase/views/users_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MultiProvider(providers: [
          ChangeNotifierProvider(
            create: (ctx) => ReservaProvider(),
          ),
          ChangeNotifierProvider(
          create: (ctx) => CarProvider(),
          ),
          ChangeNotifierProvider(
            create: (ctx) => UserProvider(),
          ),
          Provider<AuthenticationService>(
            create: (_) => AuthenticationService(FirebaseAuth.instance),
          ),
          StreamProvider(
            create: (context) => context.read<AuthenticationService>().authStateChanges,
          )
        ],
        child: MaterialApp(
          localizationsDelegates: [
             GlobalMaterialLocalizations.delegate,
             GlobalWidgetsLocalizations.delegate
          ],
          supportedLocales: [const Locale('pt', 'BR')],
          theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.blue[900],
          accentColor: Colors.white38,

          // Define the default font family.
          fontFamily: 'Raleway',

          // Define the default TextTheme. Use this to specify the default
          // text styling for headlines, titles, bodies of text, and more.
          textTheme: TextTheme(
            headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
            bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
          ),
        ),

        //home: LoginPage(),
        initialRoute: '/',
        routes: {
          '/': (context) => LoginPage(),
          '/user_view': (context) =>UsersView(),
          '/home': (context) =>HomePage(),
          '/perfil': (context) =>PerfilPage(),
          '/config': (context) =>ConfigPage(),
          '/meus_carros': (context) =>ListMyCars(),
          '/cadastro': (context) =>CadastroPage(),
          '/solicitacoes': (context) =>MinhasSolicitacoes(),
          '/reservas': (context) =>MinhasReservas(),
          '/cadastro_carro': (context) =>CadastroCarro(),
          '/detalhes_carro': (context) =>DetalhesCarro(),
          '/solicitar_reserva': (context) =>SolicitarReserva(),
          '/detalhes_reserva': (context) =>DetalhesReserva(),
          '/detalhes_solicitacoes': (context) =>DetalhesSolicitacoes(),
        }
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      return HomePage();
    }
    return LoginPage();
  }
}