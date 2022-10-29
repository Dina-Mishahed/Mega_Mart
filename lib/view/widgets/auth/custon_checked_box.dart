import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../../controller/auth/signup_controller.dart';
import '../../../core/constants/color.dart';

class CustomCheckBox extends StatelessWidget {
   String text;
   void Function(bool?) onChandeFun;
   bool value ;
   CustomCheckBox({
     super.key,
     required this.text,
    required this.onChandeFun,
     required this.value,
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
         checkColor: AppColor.primaryColor,
         splashRadius: Material.defaultSplashRadius,
         value: this.value,
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
// return Obx(() =>  CheckboxListTile(
//   title: const Text('This is the title 1'),
//   //subtitle: const Text('Thi is the subtitle with ID 1'),
//   checkColor: AppColor.grey2,
//   activeColor: AppColor.primaryColor,
//   controlAffinity: ListTileControlAffinity.leading,
//   checkboxShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
//   value: controller.selected.value == 1,
//   onChanged: (val) {
//     val ?? true ? controller.selected.value = 1 : controller.selected.value = null;
//   },
// ));
//);
// return Row(
//   children: [
//     Container(
//       width: 23,
//       height: 23,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(8.0)
//       ),
//       child: Checkbox(
//         onChanged: onChandeFun,
//         checkColor: Colors.white,splashRadius: Material.defaultSplashRadius,
//         value: false,
//         fillColor: MaterialStateProperty.resolveWith(getColor),
//       ),
//     ),
//     Text(text),
//   ],
// );
