import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';

class FavoritesMealsNotifier extends StateNotifier<List<Meal>> {
  FavoritesMealsNotifier() : super([]);

  // cannot modify existing list --> create new --> where creates new
  void toggleFavStatus(Meal meal) {
    final isMealFav = state.contains(meal);

    if (isMealFav) {
      state = state.where((m) => m.id != meal.id).toList();
    } else {
      state = [...state, meal];
    }
  }
}

final favMealsProvider =
    StateNotifierProvider<FavoritesMealsNotifier, List<Meal>>(
        (ref) => FavoritesMealsNotifier());
