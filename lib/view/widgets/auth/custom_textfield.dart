import 'package:flutter/material.dart';

import '../../../core/constants/color.dart';
import '../../../core/constants/image_assets.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  bool? isSecure = false;
  final String? Function(String?) valid;
  final TextInputType type;
  final void Function()? onTapIcon;
  final void Function(String?)? onSaveFunc;
  CustomTextField({
    super.key,
    required this.hintText,
    required this.valid,
    this.isSecure,
    required this.type,
    this.onTapIcon,
    this.onSaveFunc
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaveFunc,
      cursorColor: AppColor.primaryColor,
      obscureText: isSecure == null || isSecure == false ? false : true,
      keyboardType: type,
      style: TextStyle(color: Colors.black),
      validator: valid,
      decoration: InputDecoration(
        suffixIcon: isSecure != null || isSecure == true ? InkWell(
          child: Image.asset(ImageAssets.hiddenPassword),
          onTap: onTapIcon,
        ) : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColor.grey2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColor.grey2,
          ),
        ),
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColor.grey2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColor.grey2,
          ),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
            color: AppColor.grey2, fontWeight: FontWeight.w500, fontSize: 16),
      ),
    );
  }
}
