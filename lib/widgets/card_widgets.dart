import 'package:eimimian_flutter_developer_coding_task/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utils/colors.dart';
import 'actions_bottom_sheet.dart';
import 'image_grid.dart';


final likeProvider = StateProvider<bool>((ref) => false);

class CardWidget extends ConsumerWidget {
  final String username, handle, time, content, profilePicture;
  final int likes, comments;
  final List<String>? imageUrl;
  final String? svgImage;
  final int? repeat;

  const CardWidget({
    super.key,
    required this.username,
    required this.handle,
    required this.time,
    required this.content,
    required this.likes,
    required this.comments,
    required this.profilePicture,
    this.imageUrl,
    this.svgImage,
    this.repeat,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLiked = ref.watch(likeProvider);

    return Container(
      constraints: BoxConstraints(minHeight: 149.h),
      width: 335.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: AppColors.innerAlignment,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.innerAlignment.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
          ),
        ],
      ),
      padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User Info Row
          Container(
            width: 319.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(image: AssetImage(profilePicture)),
                    SizedBox(width: 10.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        text14Bold(text: username),
                        text10(text: handle),
                      ],
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    text10(text: time),
                    SizedBox(width: 10.w),
                    GestureDetector(
                      onTap: () => showActionsBottomSheet(context),
                      child: SvgPicture.asset('assets/icons/threedots.svg'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),

          // Content text
          text14Normal(text: content),
          SizedBox(height: 10.h),

          // Image grid (if available)
          if (imageUrl != null && imageUrl!.isNotEmpty)
            Container(
              height: 210.h,
              child: ImageGrid(imageUrls: imageUrl!),
            ),

          // SVG Image (if provided)
          if (svgImage != null)
            Container(
              height: 210.h,
              width: double.infinity,
              child: SvgPicture.asset(
                svgImage!,
                fit: BoxFit.cover,
              ),
            ),

          SizedBox(height: 10.h),

          // Footer section with conditional repeat feature
          Container(
            height: 34.h,
            width: 188.w,
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 34.h,
                  width: 51.w,
                  child: Row(
                    children: [
                      SvgPicture.asset("assets/icons/messages.svg"),
                      blackText(text: "$comments"),
                    ],
                  ),
                ),
                Container(
                  height: 34.h,
                  width: 51.w,
                  child: GestureDetector(
                    onTap: () {
                      ref.read(likeProvider.notifier).state = !isLiked;
                    },
                    child: TweenAnimationBuilder<Color?>(
                      tween: ColorTween(
                        begin: Colors.black,
                        end: isLiked ? Colors.red : Colors.black,
                      ),
                      duration: Duration(milliseconds: 300),
                      builder: (context, color, child) {
                        return Row(
                          children: [
                            AnimatedOpacity(
                              opacity: isLiked ? 1.0 : 0.5,
                              duration: Duration(milliseconds: 150),
                              child: SvgPicture.asset(
                                "assets/icons/like.svg",
                                colorFilter: ColorFilter.mode(color ?? Colors.black, BlendMode.srcIn),
                              ),
                            ),
                            blackText(text: "$likes"),
                          ],
                        );
                      },
                    ),
                  ),
                ),
                if (repeat != null) // Show only if repeat is provided
                  Container(
                    height: 34.h,
                    width: 51.w,
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/icons/repeat.svg"),
                        blackText(text: "$repeat"),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
