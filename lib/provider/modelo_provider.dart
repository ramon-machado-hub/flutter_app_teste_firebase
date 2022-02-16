import 'package:flutter_app_teste_firebase/data/dummy_modelo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app_teste_firebase/models/modelo.dart';

class ModeloProvider with ChangeNotifier {
  final Map<String, Modelo> _items = {...DUMMY_MODELO};
  List<Modelo> get all{
    return [..._items.values];
  }

  int get count{
    return _items.length;
  }
}