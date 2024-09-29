
import 'package:flutter/foundation.dart';

class FavoriteProvider extends ChangeNotifier{
  List<int> _selectedItem = [];

  List<int> get selectedItem => _selectedItem;

  void addSelectedItem(int index){
    _selectedItem.add(index);
    notifyListeners();
  }

  void removeSelectedItem(int index){
    _selectedItem.remove(index);
    notifyListeners();
  }
}