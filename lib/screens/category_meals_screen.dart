import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatelessWidget {
  final Function toggleLike;
  final Function isFavorite;
  const CategoryMealsScreen({
    Key? key,
    required this.toggleLike,
    required this.isFavorite,
  }) : super(key: key);

  static const routeName = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final categoryData =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final title = categoryData['categoryTitle'];
    final meals = categoryData['categoryMeals'] as List<Meal>;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
      ),
      body: meals.length > 0
          ? ListView.builder(
              padding: const EdgeInsets.all(10),
              itemBuilder: (ctx, index) => MealItem(
                  meal: meals[index],
                  toggleLike: toggleLike,
                  isFavorite: isFavorite),
              itemCount: meals.length,
            )
          : const Center(
              child: Text('Hozircha bu kategoriyada mahsulotlar mavjud emas.'),
            ),
    );
  }
}
