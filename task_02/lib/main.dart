import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Card',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ProfileCardPage(),
    );
  }
}

class ProfileCardPage extends StatelessWidget {
  const ProfileCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile Card')),
      body: Center(
        child: SizedBox(
          width: 300,
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                      'data:image/jpeg;base64,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',
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Nouman Tahir',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Nust Student',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Passionate about mobile app development and want fully to avail this course to become better developer.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors
                                  .blue, // Changed from primary to backgroundColor
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Text('Follow'),
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          side: const BorderSide(color: Colors.blue),
                        ),
                        child: const Text('Message'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
