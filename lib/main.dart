import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ogam_diary/providers/user_provider.dart';
import 'package:ogam_diary/routes.dart';
import 'package:ogam_diary/providers/auth.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // main 함수에서 async 사용

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<AuthService>(create: (_) => AuthService()),
      ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var initialRoute = PageRouter.loginRoute;

    if (AuthService().getCurrentUser() != null) {
      initialRoute = PageRouter.homeRoute;
    }

    return GetMaterialApp(
      title: '오감일기',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: PageRouter.generatedRoute,
      initialRoute: initialRoute,
    );
  }
}
