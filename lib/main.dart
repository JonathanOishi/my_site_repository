import 'package:flutter/material.dart';
import 'package:jonathan_oishi_portfolio/core/scroll/custom_scroll_behavior.dart';
import 'package:jonathan_oishi_portfolio/core/theme/app_theme.dart';
import 'package:jonathan_oishi_portfolio/features/view/pages/home_page.dart';

void main() {
  runApp(JonathanPortifolio());
}

class JonathanPortifolio extends StatelessWidget {
  const JonathanPortifolio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jonathan Portfolio',
      theme: AppTheme.darkTheme,
      scrollBehavior: MyCustomScrollBehavior(),
      home: HomePage(),
    );
  }
}
