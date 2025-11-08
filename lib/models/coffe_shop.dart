import 'package:coffee_shop/models/coffe.dart';
import 'package:flutter/material.dart';

class CoffeShop extends ChangeNotifier {
  // coffee sales list
  final List<Coffee> _shop = [
    // black coffee
    Coffee(
      name: 'Long Black',
      imagePath: 'assets/images/coffee_black.png',
      price: "4.10",
    ),

    // expresso
    Coffee(
      name: 'expresso',
      imagePath: 'assets/images/expresso.png',
      price: "4.10",
    ),

    // iced coffee
    Coffee(
      name: 'iced coffee',
      imagePath: 'assets/images/iced-coffee.png',
      price: "4.10",
    ),

    // latte
    Coffee(name: 'latte', imagePath: 'assets/images/latte.png', price: "4.10"),
  ];

  // user cart list
  List<Coffee> _userCart = [];

  // get coffee list
  List<Coffee> getCoffeeList() => _shop;

  // get user cart list
  List<Coffee> getUserCart() => _userCart;

  // add to cart
  void addItemToCart(Coffee coffee) {
    _userCart.add(coffee);
    notifyListeners();
  }

  // remove from cart
  void removeItemFromCart(Coffee coffee) {
    _userCart.remove(coffee);
    notifyListeners();
  }
}
