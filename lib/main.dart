import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:viva_pratical_2/models/controller/theme_controller.dart';
import 'package:viva_pratical_2/screens/homepage.dart';
import 'package:viva_pratical_2/screens/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
      ],
      builder: (context, _) {
        return MaterialApp(
          theme: ThemeData.light(
            useMaterial3: true,
          ),
          darkTheme: ThemeData.dark(),
          themeMode: (Provider.of<ThemeProvider>(context).light.isDark == false)
              ? ThemeMode.light
              : ThemeMode.dark,
          debugShowCheckedModeBanner: false,
          initialRoute: "splash",
          routes: {
            '/': (context) => const HomePage(),
            'splash': (context) => const Splash(),
          },
        );
      },
    ),
  );
}
