import 'package:flutter/material.dart';

import '../shared_widgets/custom_text_widget.dart';
import 'widgets/categories_list_widget.dart';
import 'widgets/search_text_field_widget.dart';
import 'widgets/section_header_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SearchTextFieldWidget(hint: 'Search'),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: CustomTextWidget(
                text: 'Categories',
                fontWeight: FontWeight.bold,
              ),
            ),
            CategoriesListWidget(),
            SectionHeaderWidget(sectionName: 'Best Selling'),
          ],
        ),
      ),
    );
  }
}
