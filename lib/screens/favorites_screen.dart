import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/meal.dart';
import 'package:flutter_complete_guide/widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> meals;

  FavoriteScreen(this.meals);

  @override
  Widget build(BuildContext context) {
    if (this.meals.isEmpty) {
      return Center(
        child: Text('You have no favorites yet - start adding some!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: this.meals[index].id,
            title: this.meals[index].title,
            affordability: this.meals[index].affordability,
            complexity: this.meals[index].complexity,
            duration: this.meals[index].duration,
            imageUrl: this.meals[index].imageUrl,
          );
        },
        itemCount: this.meals.length,
      );
    }
  }
}
