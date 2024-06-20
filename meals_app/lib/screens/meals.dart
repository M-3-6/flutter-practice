import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_details.dart';
import 'package:meals_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, this.title, required this.meals});

  final String? title;
  final List<Meal> meals;

  void _onSelectMeal(BuildContext context, Meal meal) {
    Navigator.push(context, MaterialPageRoute(builder: (ctx) => MealDetails(meal: meal)));
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) {
          return MealItem(meal: meals[index], onMealSelected: () { _onSelectMeal(context, meals[index]); },);
        });

    if (meals.isEmpty) {
      mainContent = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Uh oh ... nothing here!',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            const SizedBox(height: 16),
            Text(
              'Try selecting a different category!',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
          ],
        ),
      );
    }

    if(title == null) return mainContent;

    return Scaffold(
        appBar: AppBar(
          title: Text(title!),
        ),
        body: mainContent);
  }
}
