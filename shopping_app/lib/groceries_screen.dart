import 'package:flutter/material.dart';
import 'package:shopping_app/data/dummy_items.dart';

class GroceriesScreen extends StatelessWidget {
  const GroceriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Groceries'),
        ),
        body: ListView.builder(
          itemCount: groceryItems.length,
          itemBuilder: (ctx, index) => ListTile(
            title: Text(groceryItems[index].name),
            leading: Container(
              width: 24,
              height: 24,
              color: groceryItems[index].category.color,
            ),
            trailing: Text(
              groceryItems[index].quantity.toString(),
            ),
          ),
        ));
  }
}
