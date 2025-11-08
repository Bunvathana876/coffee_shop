import 'package:coffee_shop/models/coffe.dart';
import 'package:flutter/material.dart';

class CoffeTitle extends StatelessWidget {
  final Widget icon;
  final Coffee coffee;
  void Function()? onPressed;
  CoffeTitle({
    super.key,
    required this.coffee,
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
      child: ListTile(
        title: Text(coffee.name),
        subtitle: Text(coffee.price),
        leading: Image.asset(coffee.imagePath),
        trailing: IconButton(onPressed: onPressed, icon: icon),
      ),
    );
  }
}
