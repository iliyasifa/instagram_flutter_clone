import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter_clone/firebase_options.dart';
// import 'package:instagram_flutter_clone/responsive/mobile_screen_layout.dart';
// import 'package:instagram_flutter_clone/responsive/responsive_layout_screen.dart';
// import 'package:instagram_flutter_clone/responsive/web_screen_layout.dart';
// import 'package:instagram_flutter_clone/screens/login_screen.dart';
import 'package:instagram_flutter_clone/screens/sign_up_screen.dart';
import 'package:instagram_flutter_clone/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram Clone',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      // home: const ReponsiveLayout(
      //   mobileScreenLayout: MobileScreenLayout(),
      //   webScreenLayout: WebScreenLayout(),
      // ),
      home: const SignUpScreen(),
    );
  }
}
