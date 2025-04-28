import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'screens/products_page.dart';
import 'screens/contact_page.dart';

void main() {
  runApp(const PeacemakersApp());
}

class PeacemakersApp extends StatefulWidget {
  const PeacemakersApp({super.key});

  @override
  State<PeacemakersApp> createState() => _PeacemakersAppState();
}

class _PeacemakersAppState extends State<PeacemakersApp> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peacemakers | Empowering Ideas',
      theme: ThemeData(
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
        primarySwatch: Colors.deepPurple,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(
              isDarkMode: isDarkMode,
              onToggleTheme: () => setState(() => isDarkMode = !isDarkMode),
            ),
        '/products': (context) => ProductsPage(),
        '/contact': (context) => ContactPage(),
      },
    );
  }
}
