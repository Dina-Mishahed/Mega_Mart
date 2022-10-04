import 'package:flutter/material.dart';

import '../../../core/constants/color.dart';

class CustomCheckBox extends StatelessWidget {
  String text;
  void Function(bool?) onChandeFun;

  CustomCheckBox({
    super.key,
    required this.text,
    required this.onChandeFun,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 23,
          height: 23,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0)
          ),
          child: Checkbox(
            onChanged: onChandeFun,
            checkColor: Colors.white,splashRadius: Material.defaultSplashRadius,
            value: false,
            fillColor: MaterialStateProperty.resolveWith(getColor),
          ),
        ),
        Text(text),
      ],
    );
  }
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return AppColor.primaryColor;
    }
    return AppColor.grey2;
  }
}
