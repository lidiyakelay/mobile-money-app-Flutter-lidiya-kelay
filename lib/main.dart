import 'package:flutter/material.dart';
import 'package:mobile_money_app_flutter/presentation/pages/add_money.dart';
import 'package:mobile_money_app_flutter/presentation/pages/home_page.dart';

import 'app/routes/app_route.dart';
import 'core/utils/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      theme: SAppTheme.lightTheme,
      darkTheme: SAppTheme.lightTheme,
      //themeMode: ThemeMode.system,
      routerConfig: appRouter,
    );

  }
}
