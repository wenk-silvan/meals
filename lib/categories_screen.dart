import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/category_item.dart';
import 'package:flutter_complete_guide/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DeliMeals')),
      body: GridView(
        padding: const EdgeInsets.all(20),
        children: DUMMY_CATEGORIES
            .map((category) => CategoryItem(
                  category.id,
                  category.title,
                  category.color,
                ))
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
