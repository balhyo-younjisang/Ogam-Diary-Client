import 'package:flutter/material.dart';

import 'package:ogam_diary/screens/home/home_view.dart';
import 'package:ogam_diary/screens/join/join_view.dart';
import 'package:ogam_diary/screens/login/login_view.dart';

class PageRouter {
  static const String homeRoute = "home";
  static const String loginRoute = "login";
  static const String joinRoute = "join";

  static Route<dynamic> generatedRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case loginRoute:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case joinRoute:
        return MaterialPageRoute(builder: (_) => JoinPage());
    }

    return MaterialPageRoute(builder: (_) => const HomePage());
  }
}
