import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'views/settings_page.dart';
import 'views/home_page.dart';
import 'controllers/weather_controller.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => WeatherController(),
        child: Consumer<WeatherController>(
            builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'WeatherApp',
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode:
                themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            home: const HomePage(),
            routes: {
              '/settings': (context) => const SettingsPage(),
            },
          );
        }));
  }
}
