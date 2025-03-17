import 'package:eimimian_flutter_developer_coding_task/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eimimian_flutter_developer_coding_task/provider/user_provider.dart';
import '../widgets/post_widget.dart';

class PostPage extends ConsumerStatefulWidget {
  const PostPage({super.key});

  @override
  ConsumerState<PostPage> createState() => _PostPageState();
}

class _PostPageState extends ConsumerState<PostPage> {
  final TextEditingController _postController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            children: [
              // Top Bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: SvgPicture.asset('assets/icons/close2.svg'),
                  ),
                  text18Normal(text: "Cancel"),
                ],
              ),
              SizedBox(height: 20.h),

              // User Info
              Row(
                children: [
                  user?.profilePicture != null && user!.profilePicture.isNotEmpty
                      ? Image.asset(user.profilePicture, height: 40.h, width: 40.h)
                      : CircleAvatar(radius: 20.r, backgroundColor: Colors.grey),
                  SizedBox(width: 10.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      text14Bold(text: user?.username ?? "Guest"),
                      text10(text: user?.handle ?? "@guest"),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20.h),

              // Post Input Box
              PostInputWidget(controller: _postController),
            ],
          ),
        ),
      ),
    );
  }
}




