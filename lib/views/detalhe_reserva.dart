import 'package:flutter/material.dart';
import 'package:flutter_app_teste_firebase/models/reserva.dart';
import 'package:flutter_app_teste_firebase/provider/reserva_provider.dart';
import 'package:provider/provider.dart';

class DetalhesReserva extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final Reserva reserva = ModalRoute.of(context).settings.arguments;
    return  Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Detalhes Reserva')),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 12.0, right: 12.0, top: 0, bottom: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Data da reserva: '+reserva.data_reserva,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5,),
                  Text('Hora entrada: '+reserva.hora_entrada,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black45
                    ),
                  ),
                  SizedBox(height: 3,),
                  Text('Hora saída:     '+reserva.hora_saida,
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.black45
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 0.0, right: 0.0, top: 0, bottom: 0),
                    child: Divider(
                      color: Colors.black45,
                    ),
                  ),
                  SizedBox(height: 3,),
                  Text('Diária: '+reserva.diaria+',00',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black
                    ),
                  ),
                  SizedBox(height: 3,),
                  Text('Calção: '+reserva.calcao+',00',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black
                    ),
                  ),
                  SizedBox(height: 3,),
                  Text('Total: '+reserva.total+',00',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
                    child: Divider(
                      color: Colors.black45,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Center(
                    child: Text(reserva.situacao,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 0, bottom: 0),
              child: Divider(
                color: Colors.black45,
              ),
            ),

            SizedBox(
              width: 240,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                color: Colors.blue[900],
                onPressed: ((){
                  print('aqui');
                  Provider.of<ReservaProvider>(context, listen: false).put(Reserva(
                    id: reserva.id,
                    situacao: 'ACEITOU',
                    visualized: reserva.visualized,
                    quilometragem: reserva.quilometragem,
                    diaria: reserva.diaria,
                    hora_saida: reserva.hora_saida,
                    hora_entrada: reserva.hora_entrada,
                    data_reserva: reserva.data_reserva,
                    id_carro: reserva.id_carro,
                    id_solicitante: reserva.id_solicitante,
                    id_proprietario: reserva.id_proprietario,
                    total: reserva.total,
                    taxas_extras: reserva.taxas_extras,
                    calcao: reserva.calcao,

                  ),);
                  Navigator.of(context).pop();

                }),
                child: Text('Aceitar reserva', style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                )),
                elevation: 4.0,
                splashColor: Colors.blue[900],
              ),
            ),
            SizedBox(
              width: 240,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                color: Colors.blue[900],
                onPressed: ((){
                  Provider.of<ReservaProvider>(context, listen: false).put(Reserva(
                    id: reserva.id,
                    situacao: 'REJEITOU',
                    visualized: reserva.visualized,
                    quilometragem: reserva.quilometragem,
                    diaria: reserva.diaria,
                    hora_saida: reserva.hora_saida,
                    hora_entrada: reserva.hora_entrada,
                    data_reserva: reserva.data_reserva,
                    id_carro: reserva.id_carro,
                    id_solicitante: reserva.id_solicitante,
                    id_proprietario: reserva.id_proprietario,
                    total: reserva.total,
                    taxas_extras: reserva.taxas_extras,
                    calcao: reserva.calcao,
                  ),
                  );
                  Navigator.of(context).pop();
                }),
                child: Text('Rejeitar reserva', style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                )),
                elevation: 4.0,
                splashColor: Colors.blue[900],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

