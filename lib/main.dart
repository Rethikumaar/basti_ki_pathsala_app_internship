import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/volunteer_form_page.dart';

void main() => runApp(const NGOApp());

class NGOApp extends StatelessWidget {
  const NGOApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basti Ki Pathshala',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal.shade600,
        ).copyWith(
          secondary: Colors.amber.shade600,
          surface: Colors.white,
          background: Colors.grey.shade100,
        ),
        scaffoldBackgroundColor: Colors.grey.shade100,
        appBarTheme: const AppBarTheme(centerTitle: true),
      ),
      home: const MainPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final List<Widget> _pages = const [
    HomePage(),
    VolunteerFormPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (i) => setState(() => _currentIndex = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.volunteer_activism), label: 'Volunteer'),
        ],
      ),
    );
  }
}
