import 'package:feelcheck/example.dart';
import 'package:feelcheck/login.dart';
import 'package:feelcheck/profil.dart';
import 'package:feelcheck/landingpage.dart';
import 'package:flutter/material.dart';

// Tambahkan ini untuk RouteObserver global
final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FeelCheck',
      theme: ThemeData(
        useMaterial3: true,
      ),
      navigatorObservers: [routeObserver], // Tambahkan observer di sini
      initialRoute: '/', // Set the initial route to the landing page
      routes: {
        '/': (context) => Landingpage(), // Home or Landing Page route
        '/example': (context) => ExamplePage(), // Example page route
        '/login': (context) => LoginPage(), // Login page route
        '/profile': (context) => ProfilePage(username: '', password: ''), // Profile page route
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
