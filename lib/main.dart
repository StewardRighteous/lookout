import 'package:flutter/material.dart';
import 'package:apptheme/apptheme.dart';
import 'package:lookout/contents_saver.dart';
import 'package:provider/provider.dart';

import 'app_navigator.dart';

//Todo: Mention falticon, icons8
Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<ThemeManager>(
            create: (_) => ThemeManager()..initializeTheme(),
          ),
          ChangeNotifierProvider<ContentsSaver>(
            create: (_) => ContentsSaver(),
          ),
        ],
        child: Consumer<ThemeManager>(
          builder: (context, theme, child) {
            return MaterialApp.router(
              title: 'LookOut - Plan your Social Media',
              theme: theme.getTheme(),
              debugShowCheckedModeBanner: false,
              routerConfig: AppNavigator.appRouter,
            );
          },
        ));
  }
}
