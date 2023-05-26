import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:retirement_app/screens/home_screen.dart';
import 'package:retirement_app/screens/profile_screen/profile_screen.dart';
import 'package:retirement_app/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

// final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
// final GlobalKey<NavigatorState> _shellNavigatorKey =
//     GlobalKey<NavigatorState>();

//     final GoRouter _router= GoRouter(
//       navigatorKey: _rootNavigatorKey,
//       initialLocation: '/root',
//       routes:[
//         ShellRoute(
//           navigatorKey: _shellNavigatorKey,
//           builder: (context, state, child){
//             return SplashScreen();
//           }, routes: [
//             GoRoute(path: '/root', builder: (context, state) {
//               return ProfileScreen();
//             },)
//           ]
//         )
//       ] )

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(414, 896),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return const MaterialApp(
            home: SplashScreen(),
          );
        });
  }
}
