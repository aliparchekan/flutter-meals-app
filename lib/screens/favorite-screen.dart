import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../models/meal.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  FavoriteScreen(this.favoriteMeals);
  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text('You have no favorite meals added!'),
      );
    }
    return ListView.builder(
      itemBuilder: (ctx, index) {
        Meal item = favoriteMeals[index];
        return MealItem(
          id: item.id,
          affordability: item.affordability,
          complexity: item.complexity,
          duration: item.duration,
          imageUrl: item.imageUrl,
          title: item.title,
        );
      },
      itemCount: favoriteMeals.length,
    );
  }
}
