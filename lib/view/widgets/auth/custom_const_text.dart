import 'package:flutter/material.dart';

import '../../../core/constants/color.dart';

class CustomConstText extends StatelessWidget {
  final String text;

  CustomConstText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 8.8),
      child: Text(
        text,
        textAlign: TextAlign.start,
        style: TextStyle(
            fontSize: 12, color: AppColor.grey4, fontWeight: FontWeight.w500),
      ),
    );
  }
}
