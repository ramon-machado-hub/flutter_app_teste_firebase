import 'package:flutter/material.dart';
import 'package:flutter_app_teste_firebase/models/car.dart';
import 'package:flutter_app_teste_firebase/models/reserva.dart';
import 'package:flutter_app_teste_firebase/provider/reserva_provider.dart';
import 'package:flutter_app_teste_firebase/provider/user_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class SolicitarReserva extends StatefulWidget {
  @override
  _SolicitarReservaState createState() => _SolicitarReservaState();
}

class _SolicitarReservaState extends State<SolicitarReserva> {

  String _data = '';
  String _hourIn = '';
  String _hourOut = '';
  bool _hasBeenSelectDate = true;

  Future _selectDate() async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(DateTime.now().year+1));
    if (picked != null) setState(() => _data =
        DateFormat("dd/MM/yyyy").format(DateTime.parse(picked.toString())),
    );
    TimeOfDay picked1 = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now());
    if (picked1 != null) setState(() {
      if (picked1.hour<10)
        _hourIn = '0'+picked1.hour.toString();
      else
        _hourIn = picked1.hour.toString();

      if (picked1.minute<10)
        _hourIn = (_hourIn+':'+picked1.minute.toString()+'0');
      else
        _hourIn = (_hourIn+':'+picked1.minute.toString());

      if (picked1.hour<12)
        _hourIn = (_hourIn+' AM');
      else
        _hourIn = (_hourIn+' PM');
    });

    TimeOfDay picked2 = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now());
    if (picked2 != null) setState(() {
      if (picked2.hour<10)
        _hourOut = '0'+picked2.hour.toString();
      else
        _hourOut = picked2.hour.toString();

      if (picked2.minute<10)
        _hourOut = (_hourOut+':'+picked2.minute.toString()+'0');
      else
        _hourOut = (_hourOut+':'+picked2.minute.toString());

      if (picked2.hour<12)
        _hourOut = (_hourOut+' AM');
      else
        _hourOut = (_hourOut+' PM');
    });
    _hasBeenSelectDate=true;
  }

  @override
  Widget build(BuildContext context) {
    final Car car = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Detalhes Veículo')),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 12.0, top: 5, bottom: 0),
          child: Column(
            children: [
              SizedBox(
                child: Row(
                  children: [
                    Text('Selecionar data:', style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                    )),
                   CircleAvatar(
                     backgroundColor: Colors.black12,
                     child: IconButton(
                        icon: Icon(Icons.date_range_outlined,
                        color: _hasBeenSelectDate ? Colors.blue[900] : Colors.red,
                        size: 24.0,
                        ),
                       onPressed: _selectDate,
                      ),
                   ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 0, right: 0, top: 5, bottom: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          child: Text('Data da retirada: '+_data),
                        ),
                      ]
                    ),
                    SizedBox(
                      child: Text('Horário da retirada: '+_hourIn),
                    ),
                    SizedBox(
                      child: Text('Horário da entrega: '+_hourOut),
                    ),
                  ],
                ),
              ),


              Padding(
                padding: const EdgeInsets.only(left: 0, right: 0, top: 5, bottom: 0),
                child: Divider(
                  color: Colors.black45,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0, right: 0, top: 5, bottom: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('DESCRIÇÃO VEÍCULO: ', style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                        )),
                      ],
                    ),
                    Text('Modelo: '+car.modelo, style: TextStyle(
                      color: Colors.black45,
                      fontSize: 12.0,
                    )),
                    Text('Ano: '+car.ano, style: TextStyle(
                      color: Colors.black45,
                      fontSize: 12.0,
                    )),
                    Text('Limite de KM: '+car.quilometragem, style: TextStyle(
                      color: Colors.black45,
                      fontSize: 12.0,
                    )),
                  ],
                )
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0, right: 0, top: 5, bottom: 0),
                child: Divider(
                  color: Colors.black45,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0, right: 0, top: 5, bottom: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        children: [
                          Text('Diária: '+car.diaria+',00', style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                          )),
                        ]
                    ),
                    Text('Calção: '+car.calcao+',00', style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                    )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0, right: 0, top: 5, bottom: 0),
                child: Divider(
                  color: Colors.black45,
                ),
              ),
              Text('Total: '+(int.parse(car.calcao)+int.parse(car.diaria)).toString()+',00', style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
              )),
              SizedBox(
                width: 180,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  color: Colors.blue[900],
                  onPressed: ((){
                    if (_hasBeenSelectDate) {
                      Provider.of<ReservaProvider>(context, listen: false).put(Reserva(
                        id_proprietario: car.id_proprietario,
                        calcao: car.calcao,
                        diaria: car.diaria,
                        quilometragem: car.quilometragem,
                        data_reserva: _data,
                        hora_entrada: _hourIn,
                        hora_saida: _hourOut,
                        id_carro: car.id,
                        id_solicitante: '7',
                        situacao: 'PENDENTE',
                        taxas_extras: '0',
                        total: (int.parse(car.diaria)+int.parse(car.calcao)).toString(),
                      ),);
                      Navigator.of(context).pushNamed('/home');
                    }
                  }
                  ),
                  child: Text('Confirmar reserva', style: TextStyle(

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
      ),
    );
  }
}
