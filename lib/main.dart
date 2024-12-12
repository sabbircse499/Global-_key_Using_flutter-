import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LandingPage(),
    );
  }
}

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final ScrollController _scrollController = ScrollController();

  // Define GlobalKeys for each section
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _servicesKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    // Find the position of the section and scroll to it
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Landing Page"),
        actions: [
          TextButton(
            onPressed: () => _scrollToSection(_servicesKey), // Navigate to Services Section
            child: Text(
              "Services",
              style: TextStyle(color: Colors.black),
            ),
          ),
          TextButton(
            onPressed: () => _scrollToSection(_contactKey), // Navigate to Contact Section
            child: Text(
              "Contact",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(

          children: [
            Container(
              key: _homeKey,
              height: 600,
              color: Colors.blue,
              child: Center(
                child: Text(
                  "Home Section",
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
            ),
            Container(
              key: _aboutKey,
              height: 600,
              color: Colors.green,
              child: Center(
                child: Text(
                  "About Section",
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
            ),
            Container(
              key: _servicesKey,
              height: 600,
              color: Colors.orange,
              child: Center(
                child: Text(
                  "Services Section",
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
            ),
            Container(
              key: _contactKey,
              height: 600,
              color: Colors.red,
              child: Center(
                child: Text(
                  "Contact Section",
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
