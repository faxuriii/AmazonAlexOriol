import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/product_page.dart';

void main() {
  runApp(const AmazonCloneApp());
}

class AmazonCloneApp extends StatelessWidget {
  const AmazonCloneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amazon Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: const Color(0xFFF3F3F3),
      ),
      home: const AppShell(),
    );
  }
}

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  final TextEditingController _searchController = TextEditingController();
  bool _isOnProductPage = false;

  void _onSearch() {
    final query = _searchController.text.trim().toLowerCase();
    if (query == 'laptop') {
      setState(() => _isOnProductPage = true);
    }
    // If query is not 'laptop', stay on main page
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isOnProductPage) {
      return ProductPage(
        searchController: _searchController,
        onSearch: _onSearch,
      );
    }
    return HomePage(
      searchController: _searchController,
      onSearch: _onSearch,
    );
  }
}
