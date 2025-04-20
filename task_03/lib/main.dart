import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vibrant Dashboard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF5F7FA),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF4A6FA5),
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
      home: const DashboardPage(),
    );
  }
}

class DashboardPage extends StatelessWidget {
  final List<Map<String, dynamic>> cards = const [
    {
      'title': 'Statistics',
      'icon': Icons.bar_chart,
      'color': Color(0xFF4A6FA5),
      'gradient': [Color(0xFF6A11CB), Color(0xFF2575FC)],
      'content': 'View your monthly statistics and analytics',
    },
    {
      'title': 'Notifications',
      'icon': Icons.notifications,
      'color': Color(0xFFE74C3C),
      'gradient': [Color(0xFFFF416C), Color(0xFFFF4B2B)],
      'content': 'You have 5 new notifications',
    },
    {
      'title': 'Messages',
      'icon': Icons.message,
      'color': Color(0xFF2ECC71),
      'gradient': [Color(0xFF11998E), Color(0xFF38EF7D)],
      'content': '3 unread messages in your inbox',
    },
    {
      'title': 'Tasks',
      'icon': Icons.task,
      'color': Color(0xFFF39C12),
      'gradient': [Color(0xFFFF8008), Color(0xFFFFC837)],
      'content': '2 pending tasks to complete',
    },
    {
      'title': 'Calendar',
      'icon': Icons.calendar_today,
      'color': Color(0xFF9B59B6),
      'gradient': [Color(0xFF4776E6), Color(0xFF8E54E9)],
      'content': 'Upcoming events this week',
    },
    {
      'title': 'Settings',
      'icon': Icons.settings,
      'color': Color(0xFF34495E),
      'gradient': [Color(0xFF485563), Color(0xFF29323C)],
      'content': 'Configure your app settings',
    },
  ];

  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          int crossAxisCount = 2;
          if (constraints.maxWidth > 600) crossAxisCount = 3;
          if (constraints.maxWidth > 900) crossAxisCount = 4;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 1.0,
              ),
              itemCount: cards.length,
              itemBuilder: (context, index) {
                return _buildDashboardCard(context, index);
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildDashboardCard(BuildContext context, int index) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${cards[index]['title']} tapped'),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
      },
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: cards[index]['gradient'] as List<Color>,
          ),
          boxShadow: [
            BoxShadow(
              color: (cards[index]['gradient'] as List<Color>)[1].withOpacity(
                0.4,
              ),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              top: -20,
              right: -20,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      cards[index]['icon'],
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    cards[index]['title'],
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    cards[index]['content'],
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 18,
                      ),
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
