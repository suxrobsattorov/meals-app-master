import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';
import '../models/meal.dart';
import './add_new_product_screen.dart';

class ProductsScreen extends StatefulWidget {
  final List<Meal> meals;
  final Function deleteMeal;

  const ProductsScreen({
    Key? key,
    required this.meals,
    required this.deleteMeal,
  }) : super(key: key);

  static const routeName = '/products';

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  void _goToAddNewProductScreen(BuildContext context) {
    Navigator.of(context).pushNamed(AddNewProductScreen.routeName).then(
      (value) {
        // if (value == true) {
        //   setState(() {});
        // }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Mahsulotlar'),
        actions: [
          IconButton(
            onPressed: () => _goToAddNewProductScreen(context),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      drawer: const MainDrawer(),
      body: ListView.builder(
        itemCount: widget.meals.length,
        itemBuilder: (ctx, index) => Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage:
                  widget.meals[index].imageUrls[0].startsWith("assets/")
                      ? AssetImage(widget.meals[index].imageUrls[0])
                      : NetworkImage(widget.meals[index].imageUrls[0])
                          as ImageProvider,
            ),
            title: Text(widget.meals[index].title),
            subtitle: Text("\$${widget.meals[index].price}"),
            trailing: IconButton(
              onPressed: () => widget.deleteMeal(widget.meals[index].id),
              icon: const Icon(Icons.delete, size: 20),
            ),
          ),
        ),
      ),
    );
  }
}
