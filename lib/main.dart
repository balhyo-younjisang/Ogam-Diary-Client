import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:ogam_diary/providers/diary_provider.dart';
import 'package:ogam_diary/providers/home_provider.dart';
import 'package:ogam_diary/providers/join_provider.dart';
import 'package:ogam_diary/providers/login_provider.dart';
import 'package:ogam_diary/providers/read_provider.dart';
import 'package:ogam_diary/providers/write_provider.dart';
import 'package:ogam_diary/routes.dart';
import 'package:ogam_diary/providers/auth.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // main 함수에서 async 사용

  initializeDateFormatting().then((_) => runApp(MultiProvider(
        providers: [
          ChangeNotifierProvider<AuthService>(create: (_) => AuthService()),
          ChangeNotifierProvider<LoginProvider>(create: (_) => LoginProvider()),
          ChangeNotifierProvider<JoinProvider>(create: (_) => JoinProvider()),
          ChangeNotifierProvider<HomeProvider>(create: (_) => HomeProvider()),
          ChangeNotifierProvider<DiaryProvider>(create: (_) => DiaryProvider()),
          ChangeNotifierProvider<WriteProvder>(create: (_) => WriteProvder()),
          ChangeNotifierProvider<ReadProvider>(
            create: (_) => ReadProvider(),
          )
        ],
        child: const MyApp(),
      )));
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
