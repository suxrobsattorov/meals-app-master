import 'package:flutter/material.dart';

import '../screens/tabs_screen.dart';
import '../screens/products_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget _buildMenuItem(IconData icon, String title, Function() handle) {
    return ListTile(
      onTap: handle,
      leading: Icon(icon),
      title: Text(title),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: const Text(
              "MENU",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          _buildMenuItem(Icons.home, "Bosh Sahifa", () {
            Navigator.of(context).pushReplacementNamed(TabsScreen.routeName);
          }),
          const Divider(
            height: 0,
          ),
          _buildMenuItem(Icons.category, "Mahsulotlar", () {
            Navigator.of(context)
                .pushReplacementNamed(ProductsScreen.routeName);
          }),
        ],
      ),
    );
  }
}
