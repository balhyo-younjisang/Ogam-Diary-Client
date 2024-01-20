import 'package:flutter/material.dart';

import 'package:ogam_diary/screens/home/home_view.dart';
import 'package:ogam_diary/screens/join/join_view.dart';
import 'package:ogam_diary/screens/login/login_view.dart';
import 'package:ogam_diary/screens/read/read_view.dart';
import 'package:ogam_diary/screens/write/write_details_view.dart';
import 'package:ogam_diary/screens/write/write_view.dart';

class PageRouter {
  static const String homeRoute = "home";
  static const String loginRoute = "login";
  static const String joinRoute = "join";
  static const String writeRoute = "write";
  static const String writeDetailsRoute = "writeDetails";
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
        return MaterialPageRoute(
            builder: (_) => WritePage(), settings: settings);
      case writeDetailsRoute:
        return MaterialPageRoute(
            builder: (_) => WriteDetailsPage(), settings: settings);
      case readRoute:
        return MaterialPageRoute(
            builder: (_) => const ReadPage(), settings: settings);
    }

    return MaterialPageRoute(builder: (_) => const HomePage());
  }
}
