body: Container(
  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.w),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // Top Header
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
      // SearchTextField
      SearchTextField(
        controller: searchController,
      ),
      SizedBox(height: 20.h),
      
      // Make this section take only the remaining space
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
