import 'package:flutter/material.dart';
import 'package:flutter_ulmo/config/constants.dart';
import 'package:flutter_ulmo/presentation/widgets/bottom_navbar.dart';
import 'package:flutter_ulmo/presentation/widgets/categories_widget.dart';
import 'package:flutter_ulmo/presentation/widgets/search_bar.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key, required this.categoryTitle});
  final String categoryTitle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      bottomNavigationBar: const MyBottomNavBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          searchBar(),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'categories',
              style: h2SemiBold,
            ),
          ),
          const CategoriesWidget(),
        ],
      ),
    );
  }
}
