import 'package:flutter/material.dart';
import 'package:flutter_bloc_architecture/application/screen/advice/advice_screen.dart';
import 'package:provider/provider.dart';

import 'application/core/service/theme_service.dart';
import 'theme.dart';

void main() => runApp(ChangeNotifierProvider(
      create: (context) => ThemeService(),
      child: const MyApp(),
    ));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(
      builder: (context, themeService, child) => MaterialApp(
        themeMode: themeService.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        home: const AdviceScreenWrapperProvider(),
      ),
    );
  }
}
