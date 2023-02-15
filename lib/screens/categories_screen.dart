import 'package:flutter/material.dart';

import '../models/category.dart';
import '../models/meal.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  final List<Category> categories;
  final List<Meal> meals;
  const CategoriesScreen({
    Key? key,
    required this.categories,
    required this.meals,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return categories.length > 0
        ? GridView(
            padding: const EdgeInsets.all(15),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            children: categories.map((category) {
              final categoryMeals = meals
                  .where((meal) => meal.categoryId == category.id)
                  .toList();
              return CategoryItem(category: category, meals: categoryMeals);
            }).toList(),
          )
        : const Center(
            child: Text('Ovqat kategoriyalari mavjud emas.'),
          );
  }
}
