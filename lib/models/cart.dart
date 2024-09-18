import 'dart:math';

import 'package:flutter/material.dart';
import 'package:loja/models/cart_item.dart';
import 'package:loja/models/product.dart';

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemsCount {
    return _items.length;
  }

  void addItem(Product product) {
    if (_items.containsKey(product.id)) {
      _items.update(
        product.id,
        (exitingItem) => CartItem(
          id: exitingItem.id,
          productId: exitingItem.productId,
          name: exitingItem.name,
          price: exitingItem.price,
          quantity: exitingItem.quantity + 1,
        ),
      );
    } else {
      _items.putIfAbsent(
          product.id,
          () => CartItem(
                id: Random().nextDouble().toString(),
                productId: product.id,
                name: product.name,
                price: product.price,
                quantity: 1,
              ));
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void removeSingleItem(String productId) {
    if (!_items.containsKey(productId)) {
      return;
    }

    if (_items[productId]?.quantity == 1) {
      _items.remove(productId);
    } else {
      _items.update(
        productId,
        (exitingItem) => CartItem(
          id: exitingItem.id,
          productId: exitingItem.productId,
          name: exitingItem.name,
          price: exitingItem.price,
          quantity: exitingItem.quantity - 1,
        ),
      );
    }
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }

  double get totalAmount {
    double total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });

    return total;
  }
}
