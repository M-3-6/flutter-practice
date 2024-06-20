import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/favorites_provider.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/meals.dart';

class Tabs extends ConsumerStatefulWidget {
  const Tabs({super.key});

  @override
  ConsumerState<Tabs> createState() {
    return _TabsState();
  }
}

class _TabsState extends ConsumerState<Tabs> {
  int _selectPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectPageIndex = index;
    });
  }

  // final List<Meal> _favoriteMeals = [];

  // void _toggleFavoriteMeals(Meal meal) {
  //   setState(() {
  //     if (_favoriteMeals.contains(meal)) {
  //       _favoriteMeals.remove(meal);
  //       _showRemoveFavMsg();
  //     } else {
  //       _favoriteMeals.add(meal);
  //       _showFavMsg();
  //     }
  //   });
  // }

   void _showFavMsg() {
    const snackBar = SnackBar(
      content: Text('Added to favourites'),
      duration: Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _showRemoveFavMsg() {
    const snackBar = SnackBar(
      content: Text('Removed from favourites'),
      duration: Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }


  @override
  Widget build(BuildContext context) {

    var favMeals = ref.watch(favMealsProvider);

    Widget activeScreen = MealsScreen(
        meals: favMeals);
    String activePageTitle = 'Favorites';
    if (_selectPageIndex == 1) {
      activeScreen = const Categories();
      activePageTitle = 'Categories';
    }
    return Scaffold(
      appBar: AppBar(title: Text(activePageTitle)),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorites'),
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories')
        ],
        currentIndex: _selectPageIndex,
      ),
    );
  }
}
