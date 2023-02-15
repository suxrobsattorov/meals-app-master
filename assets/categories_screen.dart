// import 'package:flutter/material.dart';
//
// class CategoriesScreen extends StatelessWidget {
//   const CategoriesScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text("Ovqatlar menyusi"),
//       ),
//       body: GridView.count(
//         primary: false,
//         padding: const EdgeInsets.all(20),
//         crossAxisSpacing: 20,
//         childAspectRatio: 3 / 2,
//         crossAxisCount: 2,
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(15),
//             child: Stack(
//               children: [
//                 SizedBox(
//                   width: double.infinity,
//                   child: Image.asset(
//                     "assets/images/Fast-food-en-France.jpg",
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 Container(
//                   color: Colors.black.withOpacity(0.3),
//                 ),
//                 const Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: Text(
//                     "Fast food",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 20,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
