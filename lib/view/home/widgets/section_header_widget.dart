import 'package:flutter/material.dart';

import '../../shared_widgets/custom_text_widget.dart';

class SectionHeaderWidget extends StatelessWidget {
  final String sectionName;
  const SectionHeaderWidget({
    Key? key,
    required this.sectionName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomTextWidget(
            text: sectionName,
            fontWeight: FontWeight.bold,
          ),
          const CustomTextWidget(
            text: 'See all',
            fontSize: 16,
          ),
        ],
      ),
    );
  }
}
