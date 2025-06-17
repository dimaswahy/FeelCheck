import 'package:flutter/material.dart';

class LiteraturePage extends StatelessWidget {
  final String username;
  
  const LiteraturePage({Key? key, this.username = "pengguna"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // App Bar with back button and title
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(Icons.arrow_back, size: 24),
                      ),
                      const Spacer(),
                    ],
                  ),
                  const SizedBox(height: 10),
                  
                  // FeelCheck Title
                  Text(
                    "FeelCheck",
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Colors.black,
                      fontFamily: 'Cursive',
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  // Literature Title
                  const Center(
                    child: Text(
                      "Literatur & Inspirasi",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const SizedBox(height: 16),
                ],
              ),
            ),
            
            // Literature Content with Tips and Book Recommendations
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Tips Section
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Tips Singkat",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          
                          // Tips content with bullet points
                          BulletPoint(
                            text: "Lakukan meditasi selama 5 menit untuk menenangkan pikiran.",
                          ),
                          SizedBox(height: 4),
                          BulletPoint(
                            text: "Berjalan kaki singkat untuk menghilangkan stres.",
                          ),
                          SizedBox(height: 4),
                          BulletPoint(
                            text: "Cobalah menuliskan tiga hal yang Anda syukuri hari ini.",
                          ),
                          
                          SizedBox(height: 16),
                          Text(
                            "Buku dan Sumber Inspirasi",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          
                          // Book recommendations with bullet points
                          BulletPoint(
                            text: '"The Power of Now" oleh Eckhart Tolle: Buku ini membantu Anda fokus pada momen saat ini.',
                          ),
                          SizedBox(height: 4),
                          BulletPoint(
                            text: '"Emotional Intelligence" oleh Daniel Goleman: Pelajari cara meningkatkan kecerdasan emosional untuk hubungan yang lebih baik.',
                          ),
                          SizedBox(height: 4),
                          BulletPoint(
                            text: '"Man\'s Search for Meaning" oleh Viktor Frankl: Cerita inspiratif tentang menemukan tujuan dalam hidup.',
                          ),
                          
                          SizedBox(height: 16),
                          Text(
                            "Kutipan Inspiratif",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          
                          // Inspirational quotes
                          Text(
                            '"Apa yang Anda pikirkan tentang diri Anda lebih penting daripada apa yang orang lain pikirkan tentang Anda."',
                            style: TextStyle(
                              color: Colors.white,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '"Jangan takut untuk memulai kembali. Ini adalah kesempatan untuk membangun apa yang Anda benar-benar inginkan."',
                            style: TextStyle(
                              color: Colors.white,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
            
            // Bottom Navigation
            Container(
              width: double.infinity,
              height: 60,
              color: const Color.fromRGBO(27, 153, 203, 1),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
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
            ),
          ],
        ),
      ),
    );
  }
}

class BulletPoint extends StatelessWidget {
  final String text;
  
  const BulletPoint({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "• ",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
