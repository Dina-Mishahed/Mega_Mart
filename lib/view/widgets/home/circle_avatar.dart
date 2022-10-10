import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constants/color.dart';

class CircleAvatarWidget extends StatelessWidget {
  final String text, icon;

  final Color backgroundColor;

  CircleAvatarWidget(
      {required this.text, required this.icon, required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 27,
          child: SvgPicture.asset(icon),
          backgroundColor: backgroundColor,
        ),
        const SizedBox(
          height: 9,
        ),
        Text(
          text,
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
