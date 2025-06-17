import 'package:feelcheck/example.dart';
import 'package:feelcheck/login.dart';
import 'package:feelcheck/profil.dart';
import 'package:flutter/material.dart';
import 'package:feelcheck/landingpage.dart'; // Pastikan path file sesuai
// Pastikan path file profile sesuai

void main() async {
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
      initialRoute: '/', // Set the initial route to the landing page
      routes: {
        '/': (context) => Landingpage(),  // Home or Landing Page route
        '/example': (context) => ExamplePage(),  // Example page route
        '/login': (context) => LoginPage(),  // Login page route
        '/profile': (context) => ProfilePage(username: '', password: ''),  // Profile page route
      },
      debugShowCheckedModeBanner: false, // Hapus pesan debug
    );
  }
}
