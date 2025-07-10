import 'dart:async'; // Impor library async untuk menggunakan Timer
import 'package:feelcheck/kamera.dart';
import 'package:flutter/material.dart';

class Landingpage extends StatefulWidget {
  @override
  _LandingpageState createState() => _LandingpageState();
}

class _LandingpageState extends State<Landingpage> {
  @override
  void initState() {
    super.initState();
    // Memulai timer saat halaman pertama kali dibuka
    Timer(const Duration(seconds: 2), () {
      // Menggunakan pushReplacement agar pengguna tidak bisa kembali ke landing page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => KameraPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo/logo edit.png', // Pastikan path benar
                  width: 300,
                  height: 300,
                ),
                Image.asset(
                  'assets/logo/logo text.png', // Pastikan path benar
                  width: 300,
                ),
                const SizedBox(height: 100),
                const Text(
                  'CEK EKSPRESI ANDA',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                // Tombol "Mulai" sudah dihapus dari sini
              ],
            ),
          ),
        ),
      ),
    );
  }
}