import 'package:admins/src/otroja/core/di/dependency_injection.dart';
import 'package:admins/src/otroja/core/routing/app_router.dart';
import 'package:admins/src/otroja/cubit/activityCubit/activity_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'src/otroja/presentation/screens/activity/addActivity/addActivityScreen.dart';
import 'src/otroja/presentation/screens/tasme3/tasmeaaScreen.dart';

void main() {
  setUpGetIt();

  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Set the status bar color to transparent
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Make status bar transparent
      statusBarIconBrightness:
          Brightness.dark, // Optionally, set status bar icons to dark
    ));

    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: 'DIN Next LT Arabic',
            ),
            onGenerateRoute: appRouter.generateRoute,
            home: TasmeaaScreen(),
          );
        });
  }
}
