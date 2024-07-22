import 'package:cargo/bindings.dart';
import 'package:cargo/firebase_options.dart' as firebase_options;
import 'package:cargo/services/auth_service.dart';
import 'package:cargo/views/auth/login_page.dart';
import 'package:cargo/views/home/landing/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  firebase_options.loadFirebaseOptions();
  await Firebase.initializeApp(
    options: firebase_options.DefaultFirebaseOptions.currentPlatform,
  );
  AppBindings().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'CarGo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: Get.find<AuthService>().firestoreUser.value == null
          ? const LoginPage()
          : const HomePage(),
    );
  }
}
