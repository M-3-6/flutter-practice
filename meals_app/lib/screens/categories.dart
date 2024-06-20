import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/category_item.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});


  void _selectCategory(BuildContext context, Category category) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) => MealsScreen(
              title: category.title,
              meals: dummyMeals
                  .where((meal) => meal.categories.contains(category.id))
                  .toList()),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      children: availableCategories
          .map((category) => CategoryItem(
                category: category,
                onSelectCategory: () {
                  _selectCategory(context, category);
                },
              ))
          .toList(),
    );
  }
}
