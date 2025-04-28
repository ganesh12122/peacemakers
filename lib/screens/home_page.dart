import 'package:flutter/material.dart';
import '../widgets/project_tile.dart';

class HomePage extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback onToggleTheme;

  const HomePage({
    Key? key,
    required this.isDarkMode,
    required this.onToggleTheme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Peacemakers'),
        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: onToggleTheme,
          ),
          IconButton(
            icon: const Icon(Icons.shopping_bag),
            onPressed: () {
              Navigator.pushNamed(context, '/products');
            },
          ),
          IconButton(
            icon: const Icon(Icons.contact_mail),
            onPressed: () {
              Navigator.pushNamed(context, '/contact');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Text(
                    'Peacemakers',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Empowering Ideas. Delivering Innovation.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'We build powerful digital products & services for startups, creators, and businesses.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Text('Ongoing Projects', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 10),
            const ProjectTile(
              title: 'MangaSphere',
              description: 'An immersive manga & eBook reader coming soon!',
              githubUrl: 'https://github.com/ganesh12122/mangasphere',
            ),
            const ProjectTile(
              title: 'Stark Products',
              description: 'An inventory & product manager for businesses!',
              githubUrl: 'https://github.com/ganesh12122/Stark-Products-E-Commerce-Website',
            ),
            const ProjectTile(
              title: 'Daily Spark',
              description: 'A discipline tracker app to build positive habits!',
              githubUrl: 'https://github.com/ganesh12122/Daily_Spark',
            ),
          ],
        ),
      ),
    );
  }
}
