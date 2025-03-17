
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/colors.dart';

Widget text14Normal({String text = "", Color color = AppColors.normalBlackColor}) {
  return Text(text,
      style:
      TextStyle(color: AppColors.normalBlackColor, fontSize: 14.sp, fontWeight: FontWeight.w400, fontFamily: "CabinetGrotesk"));
}

Widget boldtext14Normal({String text = "", Color color = AppColors.normalBlackColor}) {
  return Text(text,
      style:
      TextStyle(color: AppColors.normalBlackColor, fontSize: 14.sp, fontWeight: FontWeight.w700, fontFamily: "CabinetGrotesk"));
}

Widget text12Normal({String text = "", Color color = AppColors.normalBlackColor}) {
  return Text(text,
      style:
      TextStyle(color: AppColors.normalBlackColor, fontSize: 12.sp, fontWeight: FontWeight.w500, fontFamily: "CabinetGrotesk"));
}

Widget text18Normal({String text = "", Color color = AppColors.normalBlackColor}) {
  return Text(text,
      style:
      TextStyle(color: AppColors.normalBlackColor, fontSize: 18.sp, fontWeight: FontWeight.w500, fontFamily: "CabinetGrotesk"));
}

Widget text14Bold(
    {String text = "", Color color = AppColors.boldBlackColor}) {
  return Text(text,
      style:
      TextStyle(color: AppColors.boldBlackColor, fontSize: 14.sp, fontWeight: FontWeight.w500, fontFamily: "CabinetGrotesk"));
}

Widget text10(
    {String text = "", Color color = AppColors.textGrey}) {
  return Text(text,
      style:
      TextStyle(color: AppColors.textGrey, fontSize: 10.sp, fontWeight: FontWeight.w400, fontFamily: "CabinetGrotesk"));
}

Widget blackText(
    {String text = "", Color color = AppColors.blackText}) {
  return Text(text,
      style:
      TextStyle(color: AppColors.blackText, fontSize: 14.sp, fontWeight: FontWeight.w400, fontFamily: "CabinetGrotesk"));
}

