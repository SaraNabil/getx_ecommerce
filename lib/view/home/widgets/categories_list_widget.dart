import 'package:flutter/material.dart';

import '../../../model/category.dart';
import 'category_item_widget.dart';

class CategoriesListWidget extends StatelessWidget {
  const CategoriesListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: SizedBox(
        height: 100,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => CategoryItemWidget(
            categoryImg: categories[index].categoryImg,
            categoryName: categories[index].categoryName,
          ),
        ),
      ),
    );
  }
}
