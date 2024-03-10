// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class CheckBoxFormFieldWithErrorMessage extends FormField<bool> {

//   final String labelText;
//   final bool isChecked;
//   String error;
//   final void Function(bool?) onChanged;

//  CheckBoxFormFieldWithErrorMessage({
//     Key? key,
//     required this.labelText,
//     required this.isChecked,
//     required this.onChanged,
//     required FormFieldValidator<bool>? validator,
//     required this.error,
//   }) : super(
//           key: key,
//           initialValue: isChecked,
//           validator: validator,
//           builder: (FormFieldState<bool> state) {
//             return Column(
//               children: [
//                 Container(
//            padding: const EdgeInsets.symmetric(horizontal: 10),
//            child: Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                   Checkbox(
//                       value: isChecked,
//                       onChanged: onChanged,
//                       isError: true,
//                   ),
//                   Expanded(
//                       child: Text(
//                       labelText,
//                       style: TextStyle(
//                          fontSize: 14,
//                          fontWeight: FontWeight.w400,
//                          height: 1.3,
//                          color: const Color.fromARGB(255, 0, 0, 0),
//                          ),
//                       ),
//                   ),
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Container(
//                     constraints: const BoxConstraints(minHeight: 5.0),
//                     padding: const EdgeInsets.only(left: 5, right: 5),
//                     child: Text(
//                       (error.isNotEmpty) ? ' * $error' : '',
//                       // overflow: TextOverflow.ellipsis,
//                       style: const TextStyle(
//                         fontSize: 18.0,
//                         fontWeight: FontWeight.w400,
//                         color: Colors.red,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),             
//           ],
//         ),
//                 ),
//               ],
//             );
//           },
//         );
// }