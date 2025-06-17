import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  final String username;
  
  const HistoryPage({Key? key, this.username = "pengguna"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sample history data
    final List<Map<String, dynamic>> historyItems = [
      {
        'date': '01 SEPTEMBER 2024',
        'result': 85,
        'emotion': 'BAHAGIA',
        'image': 'assets/images/happy_face.jpg', // You'll need to add these images to your assets
      },
      {
        'date': '03 SEPTEMBER 2024',
        'result': 60,
        'emotion': 'SEDIH',
        'image': 'assets/images/sad_face.jpg',
      },
      {
        'date': '05 SEPTEMBER 2024',
        'result': 85,
        'emotion': 'BAHAGIA',
        'image': 'assets/images/happy_face.jpg',
      },
    ];

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // App Bar with back button and title
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  const SizedBox(height: 16),
                  
                  // History Title
                  const Center(
                    child: Text(
                      "Riwayat Cek Ekspresi",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  // User Greeting Container
                  
                ],
              ),
            ),
            
            // History List
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ListView.builder(
                  itemCount: historyItems.length,
                  itemBuilder: (context, index) {
                    final item = historyItems[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: _buildHistoryCard(
                        date: item['date'],
                        result: item['result'],
                        emotion: item['emotion'],
                        imagePath: item['image'],
                      ),
                    );
                  },
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
  
  Widget _buildHistoryCard({
    required String date,
    required int result,
    required String emotion,
    required String imagePath,
  }) {
    // Determine background color based on emotion
    Color backgroundColor = emotion == 'BAHAGIA' 
        ? Colors.teal.shade500 
        : Colors.teal.shade400;
    
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Column(
          children: [
            // Date header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              color: Colors.blue,
              child: Text(
                "RIWAYAT CEK EKSPRESI $date",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            
            // Result content
            Container(
              height: 80,
              color: backgroundColor,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Hasil Cek",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "$result%",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 32.0),
                    child: Text(
                      emotion,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // Instead of using actual images (which we don't have),
                  // we'll use a placeholder container
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      // In a real app, you'd use Image.asset(imagePath) here
                      child: emotion == 'BAHAGIA'
                          ? const Icon(Icons.sentiment_very_satisfied, size: 40, color: Colors.grey)
                          : const Icon(Icons.sentiment_dissatisfied, size: 40, color: Colors.grey),
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
}