import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:meetmax/ui/route/app_route.dart';
import 'package:meetmax/ui/theme/app_theme.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme().lightTheme(context),
          themeMode: ThemeMode.light,
          getPages: getPages,
          initialRoute: signIn,
          unknownRoute: getPages.first,
        );
      },
    );
  }
}
