import 'package:flutter/material.dart';

class SearchTextFieldWidget extends StatelessWidget {
  final String hint;
  const SearchTextFieldWidget({Key? key, required this.hint}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: 50,
        child: TextFormField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            filled: true,
            hintStyle: TextStyle(color: Colors.grey[800]),
            hintText: hint,
            fillColor: Colors.white70,
            prefixIcon: const Icon(Icons.search_rounded),
          ),
        ),
      ),
    );
  }
}
