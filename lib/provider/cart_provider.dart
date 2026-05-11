import 'package:flutter/foundation.dart';
import '../data/models/cake_model.dart';
import '../data/models/cart_item_model.dart';

class CartProvider extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => List.unmodifiable(_items);

  int get itemCount => _items.fold(0, (sum, item) => sum + item.quantity);

  double get total => _items.fold(0.0, (sum, item) => sum + item.total);

  void addItem(Cake cake) {
    final index = _items.indexWhere((i) => i.cake.id == cake.id);
    if (index >= 0) {
      _items[index].quantity++;
    } else {
      _items.add(CartItem(cake: cake));
    }
    notifyListeners();
  }

  void removeItem(String cakeId) {
    _items.removeWhere((i) => i.cake.id == cakeId);
    notifyListeners();
  }

  void decreaseQuantity(String cakeId) {
    final index = _items.indexWhere((i) => i.cake.id == cakeId);
    if (index >= 0) {
      if (_items[index].quantity > 1) {
        _items[index].quantity--;
      } else {
        _items.removeAt(index);
      }
      notifyListeners();
    }
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}