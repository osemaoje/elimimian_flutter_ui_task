import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/toggle_provider.dart';
import '../utils/colors.dart';


class ToggleSwitch extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSelected = ref.watch(toggleProvider);
    final toggleNotifier = ref.read(toggleProvider.notifier);

    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: AppColors.customGrey,
        borderRadius: BorderRadius.circular(32.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildToggleItem(
            icon: 'assets/icons/house.svg',
            isActive: !isSelected,
            onTap: () => toggleNotifier.toggle(false),
          ),
          _buildToggleItem(
            icon: 'assets/icons/chat.svg',
            isActive: isSelected,
            onTap: () => toggleNotifier.toggle(true),
          ),
        ],
      ),
    );
  }

  Widget _buildToggleItem({
    required String icon,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        height: 32.h,
        width: 40.w,
        duration: Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isActive ? AppColors.primaryBlue : Colors.transparent,
          borderRadius: BorderRadius.circular(32.r),
        ),
        child: SvgPicture.asset(
          icon,
          color: isActive ? Colors.white : Colors.black,
          width: 16.w,
          height: 16.h,
        ),
      ),
    );
  }
}
