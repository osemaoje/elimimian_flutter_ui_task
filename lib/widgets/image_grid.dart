import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ImageGrid extends ConsumerWidget {
  final List<String> imageUrls;

  const ImageGrid({Key? key, required this.imageUrls}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Single image: make it fill the entire container.
    if (imageUrls.length == 1) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(8.r),
        child: Image.asset(
          imageUrls.first,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      );
    }

    // For multiple images, we want the grid to fill a container of fixed height (210.h).
    return LayoutBuilder(
      builder: (context, constraints) {
        double containerHeight = 210.h;
        int crossAxisCount = 2;
        double spacing = 8.w;
        int rows = (imageUrls.length / crossAxisCount).ceil();
        double totalWidth = constraints.maxWidth;
        double cellWidth = (totalWidth - (crossAxisCount - 1) * spacing) / crossAxisCount;
        double totalSpacingHeight = (rows - 1) * 8.h;
        double cellHeight = (containerHeight - totalSpacingHeight) / rows;
        double childAspectRatio = cellWidth / cellHeight;

        return GridView.builder(
          itemCount: imageUrls.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: spacing,
            mainAxisSpacing: 8.h,
            childAspectRatio: childAspectRatio,
          ),
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: Image.asset(
                imageUrls[index],
                fit: BoxFit.cover,
              ),
            );
          },
        );
      },
    );
  }
}
