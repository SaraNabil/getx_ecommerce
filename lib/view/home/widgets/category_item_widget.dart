import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/resources/colors_manager.dart';
import '../../shared_widgets/custom_text_widget.dart';

class CategoryItemWidget extends StatelessWidget {
  final String categoryImg;
  final String categoryName;
  const CategoryItemWidget({
    Key? key,
    required this.categoryImg,
    required this.categoryName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: Colors.black12,
                  spreadRadius: 5,
                )
              ],
            ),
            child: CircleAvatar(
              backgroundColor: ColorsManager.whiteColor,
              radius: 30.0,
              child: SvgPicture.asset(categoryImg),
            ),
          ),
          const SizedBox(height: 8),
          CustomTextWidget(
            text: categoryName,
            fontSize: 12,
          ),
        ],
      ),
    );
  }
}
