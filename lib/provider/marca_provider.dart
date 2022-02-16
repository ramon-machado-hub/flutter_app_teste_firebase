import 'package:flutter/cupertino.dart';
import 'package:flutter_app_teste_firebase/models/marca.dart';
import 'package:flutter_app_teste_firebase/data/dummy_marca.dart';

class MarcaProvider with ChangeNotifier {
  final Map<String, Marca> _items = {...DUMMY_MARCA};
  List<Marca> get all{
    return [..._items.values];
  }

  int get count{
    return _items.length;
  }
}