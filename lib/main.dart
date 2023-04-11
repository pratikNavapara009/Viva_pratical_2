import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:viva_pratical_2/models/controller/theme_controller.dart';
import 'package:viva_pratical_2/screens/homepage.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
      ],
      builder: (context, _) {
        return MaterialApp(
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: (Provider.of<ThemeProvider>(context).light.isDark == false)
              ? ThemeMode.light
              : ThemeMode.dark,
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (context) => const HomePage(),
          },
        );
      },
    ),
  );
}
