import 'package:feelcheck/kamera.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Landingpage extends StatelessWidget {
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
                Text(
                  'FeelCheck',
                  style: TextStyle(
                    fontFamily: 'Cursive', // Ubah sesuai font yang tersedia
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        offset: Offset(1.5, 1.5),
                        blurRadius: 2.0,
                        color: Colors.black26,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Image.asset(
                  'assets/logo/logo.png', // Pastikan path benar
                  width: 300,
                ),
                const SizedBox(height: 30),
                Text(
                  'CEK EKSPRESI SISWA/SISWI ANDA',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
              
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Memperbaiki navigasi ke LoginPage
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => KameraPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: const Color.fromRGBO(27, 153, 203, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'Mulai',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
