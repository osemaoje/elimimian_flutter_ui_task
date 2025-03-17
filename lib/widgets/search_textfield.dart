import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../provider/search_provider.dart';
import '../utils/colors.dart';

class SearchTextField extends ConsumerStatefulWidget {
  final TextEditingController controller;

  const SearchTextField({Key? key, required this.controller}) : super(key: key);

  @override
  ConsumerState<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends ConsumerState<SearchTextField> {
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose(); // Clean up the focus node when widget is removed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchQuery = ref.watch(searchProvider);
    final searchNotifier = ref.read(searchProvider.notifier);

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (_focusNode.hasFocus) {
          _focusNode.unfocus(); // Hide keyboard only if it's active
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 335.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: const Color(0xFFF8F9FB),
              borderRadius: BorderRadius.circular(5.r),
              border: Border.all(width: 1, color: const Color(0xFFDFE0E7)),
            ),
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            alignment: Alignment.center,
            child: TextField(
              focusNode: _focusNode, // Attach focus node
              controller: widget.controller,
              onChanged: searchNotifier.updateQuery,
              cursorColor: AppColors.normalBlackColor,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                fontFamily: "CabinetGrotesk",
                color: AppColors.normalBlackColor,
              ),
              decoration: InputDecoration(
                hintText: "Search keywords like SEVIS, United States, Canada",
                hintStyle: TextStyle(
                  color: AppColors.normalBlackColor,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: "CabinetGrotesk",
                ),
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
                suffixIcon: searchQuery.isNotEmpty
                    ? GestureDetector(
                  onTap: () {
                    widget.controller.clear();
                    searchNotifier.clearQuery();
                    _focusNode.unfocus(); // Hide cursor when clearing
                  },
                  child: Padding(
                    padding: EdgeInsets.all(10.w),
                    child: SvgPicture.asset(
                      'assets/icons/close2.svg',
                      width: 6.w,
                      height: 6.h,
                    ),
                  ),
                )
                    : null,
              ),
              textAlignVertical: TextAlignVertical.center,
            ),
          ),
          SizedBox(height: 10.h),
          if (searchQuery.isNotEmpty)
            Column(
              children: _filteredNames(searchQuery)
                  .map(
                    (name) => Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 4.h,
                    horizontal: 10.w,
                  ),
                  child: Text(
                    name,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
              )
                  .toList(),
            ),
        ],
      ),
    );
  }

  List<String> _filteredNames(String query) {
    List<String> allNames = [
      "Paul Adah", "Bukola A.A", "Joel Ovien", "Stephen Jude",
      "Elimimian Oje", "Pearl Peace", "Canada", "Belgium",
      "SEVIS", "United States", "Jack"
    ];
    return allNames
        .where((name) => name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
