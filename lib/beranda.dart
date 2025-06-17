import 'package:flutter/material.dart';
import 'package:feelcheck/kamera.dart';
import 'package:feelcheck/galery.dart';
import 'package:feelcheck/literatur.dart';
import 'package:feelcheck/profil.dart';
import 'package:feelcheck/riwayat.dart';

class Beranda extends StatelessWidget {
  final String username;
  final String password;

  const Beranda({Key? key, required this.username, required this.password}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Center(
                      child: Text(
                        "FeelCheck",
                        style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          color: Colors.black,
                          fontFamily: 'Cursive',
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: Image.asset(
                        'assets/logo/logo.png',
                        width: 100,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Welcome Text
                    const Text(
                      "Selamat Datang Di Menu Utama",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // Greeting Box
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Row(
                        children: [
                          Text(
                            "Hallo, $username!",
                            style: const TextStyle(fontSize: 16),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProfilePage(
                                    username: username,
                                    password: password,
                                  ),
                                ),
                              );
                            },
                            child: const CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(Icons.person_outline, color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),

                    const Text(
                      "Silahkan Pilih Menu Yang Diinginkan",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Menu Grid
                    Flexible(
                      child: GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        children: [
                          _buildMenuItem(
                            icon: Icons.camera_alt,
                            iconColor: Colors.blue,
                            title: "Kamera",
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => KameraPage(),
                                ),
                              );
                            },
                          ),
                          _buildMenuItem(
                            icon: Icons.photo,
                            iconColor: Colors.orange,
                            title: "Gallery",
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => GalleryPage(),
                                ),
                              );
                            },
                          ),
                          _buildMenuItem(
                            icon: Icons.history,
                            iconColor: Colors.green,
                            title: "Riwayat",
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HistoryPage(),
                                ),
                              );
                            },
                          ),
                          _buildMenuItem(
                            icon: Icons.book,
                            iconColor: const Color.fromRGBO(208, 72, 72, 1),
                            title: "Literatur",
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LiteraturePage(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Bottom Navigation Bar
            Container(
              width: double.infinity,
              height: 60,
              color: const Color.fromRGBO(27, 153, 203, 1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.home, color: Colors.white, size: 30),
                  Text(
                    "Beranda",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required Color iconColor,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(27, 153, 203, 1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(
                icon,
                color: iconColor,
                size: 35,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
