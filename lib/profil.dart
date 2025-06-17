import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String username;
  final String password;

  const ProfilePage({
    Key? key,
    required this.username,
    required this.password,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header with back button and FeelCheck title
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context); // Going back to previous page
                        },
                        child: const Icon(Icons.arrow_back, size: 24),
                      ),
                      const Spacer(),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'FeelCheck',
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Colors.black,
                      fontFamily: 'Cursive',
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Profil Data title
          const Padding(
            padding: EdgeInsets.only(top: 16.0),
            child: Text(
              'PROFIL DATA',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),

          // Profile image placeholder
          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                color: Color(0xFFD3CFCF),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.person_outline,
                size: 50,
                color: Colors.black,
              ),
            ),
          ),

          // User Information Fields
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 36, 24, 0),
            child: Column(
              children: [
                // User ID field
                buildProfileField(
                  'User Id : $username',
                  'ubah user id',
                  Colors.grey.shade300,
                ),
                const SizedBox(height: 16),
                // Password field
                buildProfileField(
                  'Password : $password',
                  'ubah\nPassword',
                  Colors.grey.shade300,
                ),
              ],
            ),
          ),

          // Logout button
          Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Handle logout functionality here
                  // Example: Clear session or authentication data
                  // You can also use shared preferences or a state management solution like Provider or Riverpod to store login state
                  // For now, we just show a snackbar and pop the user back to the login page
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Logging out...")),
                  );

                  // Replace the current screen with the login screen
                  Navigator.pushReplacementNamed(context, '/login'); // Make sure '/login' is registered in your routes
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(27, 153, 203, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text(
                  'Log Out',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),

      // Bottom Navigation
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 60,
        color: const Color.fromRGBO(27, 153, 203, 1),
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);  // Go back to the previous screen (Beranda)
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
    );
  }

  // Function to build each profile field
  Widget buildProfileField(String label, String action, Color backgroundColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
          Text(
            action,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.blue,
            ),
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }
}
