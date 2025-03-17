import 'package:eimimian_flutter_developer_coding_task/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/text_widget.dart';

void showActionsBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,

    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
    ),
    backgroundColor: Colors.transparent,
    builder: (context) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        padding: EdgeInsets.only(top: 16.h, bottom: 16.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header Row
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Actions", style:
              TextStyle(color: AppColors.normalBlackColor, fontSize: 24.sp, fontWeight: FontWeight.w700, fontFamily: "CabinetGrotesk")),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: SvgPicture.asset('assets/icons/close2.svg', width: 12.w, height: 12.h),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            _actionTile(context, 'Notify Me', 'assets/icons/bell.svg'),
            _actionTile(context, 'Edit Post', 'assets/icons/iconoir_edit.svg'),
            _actionTile(context, 'Flag Post', 'assets/icons/flag.svg'),
          ],
        ),
      );
    },
  );
}

Widget _actionTile(BuildContext context, String title, String iconPath) {
  return Column(
    children: [
      ListTile(
        leading: SvgPicture.asset(iconPath, width: 24.w, height: 24.h),
        title: text14Bold(text: title),
        trailing: Icon(Icons.arrow_forward_ios, size: 16.w, color: Colors.grey),
        onTap: () {
          Navigator.pop(context);
          // Handle action tap
        },
      ),
      Divider(color: AppColors.postBox,),
    ],
  );
}
