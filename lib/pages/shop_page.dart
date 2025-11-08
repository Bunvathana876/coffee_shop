import 'package:coffee_shop/components/coffe_title.dart';
import 'package:coffee_shop/models/coffe.dart';
import 'package:coffee_shop/models/coffe_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // add to cart function
  void addToCart(Coffee coffee) {
    Provider.of<CoffeShop>(context, listen: false).addItemToCart(coffee);

    // feedback to user
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Added to Cart'),
        content: Text('${coffee.name} has been added to your cart.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              // header
              Text(
                'How would you like your coffee?',
                style: TextStyle(fontSize: 22),
              ),

              SizedBox(height: 25),

              // list view of coffee
              Expanded(
                child: ListView.builder(
                  itemCount: value.getCoffeeList().length,
                  itemBuilder: (context, index) {
                    // get coffee item
                    Coffee eachCoffee = value.getCoffeeList()[index];
                    // return the title of coffee
                    return CoffeTitle(
                      icon: Icon(Icons.add),
                      coffee: eachCoffee,
                      onPressed: () => addToCart(eachCoffee),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
