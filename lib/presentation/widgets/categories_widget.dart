import 'package:flutter/material.dart';
import 'package:flutter_ulmo/config/constants.dart';
import 'package:flutter_ulmo/domain/datasources/dump.dart';
import 'package:flutter_ulmo/domain/models/category_model.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  _categoriesTile(CategoryModel data) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(data.imgPath),
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Text(
            data.title,
            style: b1Regular,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: const ClampingScrollPhysics(),
        itemCount: subCategoriesItem.length,
        itemBuilder: (context, index) =>
            _categoriesTile(subCategoriesItem[index]),
      ),
    );
  }
}
