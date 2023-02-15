import 'package:flutter/material.dart';

import '../models/category.dart';
import '../widgets/custom_image_input.dart';
import '../models/meal.dart';

class AddNewProductScreen extends StatefulWidget {
  final List<Category> categories;
  final Function addFunction;

  const AddNewProductScreen({
    Key? key,
    required this.categories,
    required this.addFunction,
  }) : super(key: key);

  static const routeName = '/add-new-product';

  @override
  State<AddNewProductScreen> createState() => _AddNewProductScreenState();
}

class _AddNewProductScreenState extends State<AddNewProductScreen> {
  late String categoryId;
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _ingredientsController = TextEditingController();
  final _priceController = TextEditingController();
  final _preparingTimeController = TextEditingController();
  final _mainImageController = TextEditingController();
  final _firstImageController = TextEditingController();
  final _secondImageController = TextEditingController();
  final _thirdImageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    categoryId = widget.categories[0].id;
  }

  void _save() {
    final title = _titleController.text;
    final desc = _descriptionController.text;
    final ingred = _ingredientsController.text;
    final price = _priceController.text;
    final prepTime = _preparingTimeController.text;
    final mainImage = _mainImageController.text;
    final firstImage = _firstImageController.text;
    final secondImage = _secondImageController.text;
    final thirdImage = _thirdImageController.text;

    if (title.isEmpty ||
        desc.isEmpty ||
        ingred.isEmpty ||
        price.isEmpty ||
        prepTime.isEmpty ||
        mainImage.isEmpty ||
        firstImage.isEmpty ||
        secondImage.isEmpty ||
        thirdImage.isEmpty) {
      return;
    }

    final List<String> ingreds = ingred.split(",");
    final List<String> imageUrls = [
      mainImage,
      firstImage,
      secondImage,
      thirdImage
    ];

    widget.addFunction(
      Meal(
        id: UniqueKey().toString(),
        title: title,
        imageUrls: imageUrls,
        description: desc,
        ingredients: ingreds,
        preparingTime: int.parse(prepTime),
        price: double.parse(price),
        categoryId: categoryId,
      ),
    );

    Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(centerTitle: true, title: const Text("Yangi Ovqat"), actions: [
        IconButton(
          onPressed: _save,
          icon: const Icon(Icons.save),
        )
      ]),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              DropdownButton(
                isExpanded: true,
                value: categoryId,
                onChanged: (id) {
                  setState(() {
                    categoryId = id as String;
                  });
                },
                items: widget.categories
                    .map((category) => DropdownMenuItem(
                          child: Text(category.title),
                          value: category.id,
                        ))
                    .toList(),
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: "Ovqat nomi",
                ),
                controller: _titleController,
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: "Ovqat tarifi",
                ),
                maxLines: 5,
                controller: _descriptionController,
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: "Ovqat tarkibi(Misol uchun: Pomidor, Go'sht,...)",
                ),
                controller: _ingredientsController,
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: "Narxi",
                ),
                keyboardType: TextInputType.number,
                controller: _priceController,
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: "Tayyorlanish vaqti (minutda)",
                ),
                keyboardType: TextInputType.number,
                controller: _preparingTimeController,
              ),
              const SizedBox(height: 10),
              CustomImageInput(
                imageController: _mainImageController,
                label: 'Asosiy rasm linkini kiriting',
              ),
              const SizedBox(height: 10),
              CustomImageInput(
                imageController: _firstImageController,
                label: 'Rasm 1 linkini kiriting',
              ),
              const SizedBox(height: 10),
              CustomImageInput(
                imageController: _secondImageController,
                label: 'Rasm 2 linkini kiriting',
              ),
              const SizedBox(height: 10),
              CustomImageInput(
                imageController: _thirdImageController,
                label: 'Rasm 3 linkini kiriting',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
