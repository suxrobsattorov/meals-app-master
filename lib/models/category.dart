class Category {
  final String id;
  final String title;
  final String imageUrl;

  const Category({
    required this.id,
    required this.title,
    required this.imageUrl,
  });
}

class Categories {
  List<Category> _list = [
    Category(
        id: 'c1', title: 'Fast Food', imageUrl: 'assets/images/burger.jpeg'),
    Category(
        id: 'c2', title: 'Milliy Taomlar', imageUrl: 'assets/images/osh.jpeg'),
    Category(
        id: 'c3',
        title: 'Italiya Taomlari',
        imageUrl: 'assets/images/pizza.jpeg'),
    Category(
        id: 'c4',
        title: 'Fransiya Taomlari',
        imageUrl: 'assets/images/pizza.jpeg'),
    Category(
        id: 'c5', title: 'Ichimliklar', imageUrl: 'assets/images/cola.jpeg'),
    Category(id: 'c6', title: 'Salatlar', imageUrl: 'assets/images/salad.jpeg'),
  ];

  List<Category> get list {
    return _list;
  }
}
