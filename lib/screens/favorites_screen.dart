import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  const FavoritesScreen(this.favoriteMeals, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child:
            Text("No favorite meal found. Mark something as favorite first."),
      );
    } else {
      return Center(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(favoriteMeals[index]);
          },
          itemCount: favoriteMeals.length,
        ),
      );
    }
  }
}
