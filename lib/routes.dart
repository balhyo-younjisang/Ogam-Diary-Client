import 'package:flutter/material.dart';

import 'package:ogam_diary/screens/home/home_view.dart';
import 'package:ogam_diary/screens/join/join_view.dart';
import 'package:ogam_diary/screens/login/login_view.dart';
import 'package:ogam_diary/screens/read/read_view.dart';
import 'package:ogam_diary/screens/write/write_view.dart';

class PageRouter {
  static const String homeRoute = "home";
  static const String loginRoute = "login";
  static const String joinRoute = "join";
  static const String writeRoute = "write";
  static const String readRoute = "read";

  static Route<dynamic> generatedRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case loginRoute:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case joinRoute:
        return MaterialPageRoute(builder: (_) => JoinPage());
      case writeRoute:
        return MaterialPageRoute(builder: (_) => const WritePage());
      case readRoute:
        return MaterialPageRoute(builder: (_) => const ReadPage());
    }

    return MaterialPageRoute(builder: (_) => const HomePage());
  }
}
