import 'package:flutter/material.dart';
import 'package:flutter_clean/application/core/services/theme_service.dart';
import 'package:flutter_clean/application/screens/home/home_screen.dart';
import 'package:provider/provider.dart';
import 'injection.dart' as di; // dependency injection

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeService(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(
      builder: (context, themeService, child) {
        return MaterialApp(
          themeMode: themeService.isDark ? ThemeMode.dark : ThemeMode.light,
          theme: ThemeData.light(useMaterial3: true),
          darkTheme: ThemeData.dark(useMaterial3: true),
          debugShowCheckedModeBanner: false,
          title: 'Clean Architecture',
          home: const HomeScreenWrapperProvider(),
        );
      },
    );
  }
}
