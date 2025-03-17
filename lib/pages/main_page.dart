import 'package:eimimian_flutter_developer_coding_task/provider/user_provider.dart';
import 'package:eimimian_flutter_developer_coding_task/routes/route_names.dart';
import 'package:eimimian_flutter_developer_coding_task/utils/colors.dart';
import 'package:eimimian_flutter_developer_coding_task/widgets/bottom_nav_widget.dart';
import 'package:eimimian_flutter_developer_coding_task/widgets/card_widgets.dart';
import 'package:eimimian_flutter_developer_coding_task/widgets/customfab.dart';
import 'package:eimimian_flutter_developer_coding_task/widgets/search_textfield.dart';
import 'package:eimimian_flutter_developer_coding_task/widgets/text_widget.dart';
import 'package:eimimian_flutter_developer_coding_task/widgets/toogle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Top Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    Container(
                      height: 40.h,
                      width: 40.h,
                      child: Image(image: AssetImage("assets/images/profilepicture.png")),
                    ),
                    SizedBox(width: 5.w),
                    ToggleSwitch(),
                  ]),
                  Row(children: [
                    Container(
                      width: 32.w,
                      height: 32.w,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.iconBlack,
                      ),
                      padding: EdgeInsets.all(3),
                      child: SvgPicture.asset('assets/icons/nnotification.svg'),
                    ),
                    SizedBox(width: 5.w),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: 32.w,
                          height: 32.w,
                          padding: EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.customGrey,
                          ),
                          child: SvgPicture.asset('assets/icons/notification.svg'),
                        ),
                        Positioned(
                          right: -5,
                          top: -2,
                          child: Container(
                            width: 16.w,
                            height: 16.w,
                            decoration: BoxDecoration(
                              color: AppColors.customRed,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                '3',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 8.sp,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]),
                ],
              ),
              SizedBox(height: 10.h),
              boldtext14Normal(text: "Community"),
              //SearchTextField
              SearchTextField(
                controller: searchController,
              ),
              SizedBox(height: 20.h),
              //Posts Section
              Expanded(
                child: ListView.separated(
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return CardWidget(
                        username: 'Paul Adah',
                        handle: '@paulxstudy',
                        time: '11:23AM',
                        content: 'Paul Adah What is it like to study in Orlando with their What is it like to study in Orlando with their',
                        likes: 89,
                        comments: 4,
                        profilePicture: 'assets/images/pauladah.png',
                      );
                    } else {
                      return CardWidget(
                        username: 'Paul Adah',
                        handle: '@paulxstudy',
                        time: '11:23AM',
                        content: 'Paul Adah just got a new laptop, hehe.',
                        likes: 89,
                        comments: 4,
                        profilePicture: 'assets/images/pauladah.png',
                        repeat: 4,
                        imageUrl: [
                          'assets/images/laptop1.png',
                          'assets/images/laptop2.png',
                        ],
                      );
                    }
                  },
                  separatorBuilder: (context, index) => const SizedBox(height: 16),
                ),
              ),
            ],
          ),
        ),
        //Post Button
        floatingActionButton: CustomFAB(
          onPressed: () {
            ref.read(userProvider.notifier).setUser(
              User(
                username: "John Doe",
                handle: "@johndoe",
                profilePicture: "assets/images/pauladah.png",
              ),
            );
            context.pushNamed(RouteNames.postPage);
          },
        ),

        //Bottom Navigation
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: CustomNavBar(),
        ),
      ),
    );
  }
}
