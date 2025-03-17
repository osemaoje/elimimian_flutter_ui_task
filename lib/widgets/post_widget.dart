import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utils/colors.dart';

class PostInputWidget extends ConsumerWidget {
  final TextEditingController controller;

  const PostInputWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 170.h,
      width: 343.w,
      padding: EdgeInsets.only(top: 12.h, right: 12.w, left: 12.w),
      decoration: BoxDecoration(
        color: AppColors.postBox,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.postBox,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  'assets/icons/tabler_edit.svg',
                  height: 32.h,
                  width: 32.w,
                  fit: BoxFit.contain,
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: TextField(
                    controller: controller,
                    maxLines: 4,
                    style: TextStyle(
                      color: AppColors.normalBlackColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: "CabinetGrotesk",
                    ),
                    decoration: InputDecoration(
                      hintText: "Write your post...",
                      border: InputBorder.none,
                      isDense: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  _buildIcon("assets/icons/pic.svg"),
                  _buildIcon("assets/icons/video.svg"),
                  _buildIcon("assets/icons/gif.svg"),
                  _buildIcon("assets/icons/multiselect.svg"),
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: Size(60.w, 33.h),
                  padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                onPressed: () {
                  // Handle post submission
                },
                child: Text(
                  "Post",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: "CabinetGrotesk",
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildIcon(String assetPath) {
    return Padding(
      padding: EdgeInsets.only(right: 12.w),
      child: SvgPicture.asset(assetPath, height: 24.h, width: 24.w),
    );
  }
}
