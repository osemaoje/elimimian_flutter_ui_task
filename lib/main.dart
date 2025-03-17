import 'package:eimimian_flutter_developer_coding_task/pages/post_page.dart';
import 'package:eimimian_flutter_developer_coding_task/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:go_router/go_router.dart';

import 'pages/main_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp())); // Wrap with ProviderScope
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'ScreenUtil Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
            routerConfig: _router
          //home: const MainPage(),
        );
      },
    );
  }
}


final GoRouter _router = GoRouter(routes: [
  GoRoute(
      name: RouteNames.mainPage,
      path: "/",
      builder: (context, state) =>  MainPage(),
      routes: [

        GoRoute(
            name: RouteNames.postPage,
            path: "postPage",
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                transitionDuration: Duration(milliseconds: 200),
                key: state.pageKey,
                child: const PostPage(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  const begin = Offset(0.0, 0.5);
                  const end = Offset.zero;
                  const curve = Curves.linear;
                  var tween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));
                  var offsetAnimation = animation.drive(tween);
                  return SlideTransition(
                      position: offsetAnimation, child: child);
                },
              );
            }),

      ])
]);



