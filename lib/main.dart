import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './screens/categories_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/meal_details_screen.dart';
import './screens/products_screen.dart';
import './screens/tabs_screen.dart';
import './screens/add_new_product_screen.dart';
import './models/category.dart';
import './models/meal.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _categoryModel = Categories();
  final _mealModel = Meals();

  void _toggleLike(String mealId) {
    setState(() {
      _mealModel.toggleLike(mealId);
    });
  }

  bool _isFavorite(String mealId) {
    return _mealModel.favorites.any((meal) => meal.id == mealId);
  }

  void _addNewMeal(Meal meal) {
    setState(() {
      _mealModel.addNewMeal(meal);
    });
  }

  void _deleteMeal(String id) {
    setState(() {
      _mealModel.deleteMeal(id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.adventPro().fontFamily,
      ),
      // home: CategoriesScreen(
      //     categories: _categoryModel.list, meals: _mealModel.list),
      initialRoute: TabsScreen.routeName,
      routes: {
        TabsScreen.routeName: (ctx) => TabsScreen(
          categories: _categoryModel.list,
          mealModel: _mealModel,
          toggleLike: _toggleLike,
          isFavorite: _isFavorite,
        ),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(
            toggleLike: _toggleLike, isFavorite: _isFavorite),
        MealDetailsScreen.routeName: (ctx) => const MealDetailsScreen(),
        ProductsScreen.routeName: (ctx) =>
            ProductsScreen(meals: _mealModel.list, deleteMeal: _deleteMeal),
        AddNewProductScreen.routeName: (ctx) => AddNewProductScreen(
            categories: _categoryModel.list, addFunction: _addNewMeal),
      },
      onGenerateRoute: (settings) {
        // if (settings.name == "/meal-details") {
        //   return ...;
        // } else if (settings.name == '/category-meals') {
        //   return ...;
        // }

        return MaterialPageRoute(
          builder: (ctx) => CategoriesScreen(
              categories: _categoryModel.list, meals: _mealModel.list),
        );
      },
      onUnknownRoute: (settings) {
        // return MaterialPageRoute(builder: (ctx) => NotFoundScreen());
      },
    );
  }
}
