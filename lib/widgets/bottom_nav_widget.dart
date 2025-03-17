import 'package:eimimian_flutter_developer_coding_task/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/nav_provider.dart';
import '../utils/colors.dart';


class CustomNavBar extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(navBarProvider);
    final navNotifier = ref.read(navBarProvider.notifier);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(40.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.r),
              color: AppColors.innerAlignment,
            ),
            child: Row(
              children: [
                _buildNavItem(navNotifier, "assets/icons/house2.svg", "Home", 0, selectedIndex),
                SizedBox(width: 10.w),
                _buildNavItem(navNotifier, "assets/icons/history.svg", "History", 1, selectedIndex),
              ],
            ),
          ),
          SizedBox(width: 20.w),
          _buildNavItem(navNotifier, "assets/icons/more.svg", "More", 2, selectedIndex),
        ],
      ),
    );
  }

  Widget _buildNavItem(NavBarNotifier navNotifier, String iconPath, String label, int index, int selectedIndex) {
    bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () => navNotifier.setIndex(index),
      child: Container(
        height: 68.h,
        width: 68.w,
        padding: EdgeInsets.only(top: 8.h, bottom: 8.h, left: 10.w, right: 10.w),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.innerAlignment : AppColors.innerAlignment,
          borderRadius: BorderRadius.circular(40.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              iconPath,
              color: AppColors.iconBlack,
            ),
            SizedBox(height: 5.h),
            text12Normal(text: label)
          ],
        ),
      ),
    );
  }
}
