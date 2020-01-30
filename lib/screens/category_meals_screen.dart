import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/meal.dart';
import 'package:flutter_complete_guide/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const route = '/category-meals';

  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  var _loadedInitData = false;

  @override //Used instead of initState because context cannot be used in initState
  void didChangeDependencies() {
    if(!this._loadedInitData) {
      final routeArguments =
      ModalRoute.of(context).settings.arguments as Map<String, String>;
      final categoryId = routeArguments['id'];
      this.categoryTitle = routeArguments['title'];
      this.displayedMeals = widget.availableMeals
          .where((meal) => meal.categories.contains(categoryId))
          .toList();
      this._loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      this.displayedMeals.removeWhere((m) => m.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: this.displayedMeals[index].id,
            title: this.displayedMeals[index].title,
            affordability: this.displayedMeals[index].affordability,
            complexity: this.displayedMeals[index].complexity,
            duration: this.displayedMeals[index].duration,
            imageUrl: this.displayedMeals[index].imageUrl,
            removeItem: this._removeMeal,
          );
        },
        itemCount: this.displayedMeals.length,
      ),
    );
  }
}
