import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/services/shared_pref.dart';
import 'package:task/ui/screens/sign_In_screen.dart';
import 'controller_binder.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs.init();
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Task',
      debugShowCheckedModeBanner: false,
      navigatorKey: Get.key,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SignInScreen(),
    );
  }
}
