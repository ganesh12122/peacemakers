import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const PeacemakersApp());

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
        cardColor: isDarkMode ? Colors.grey[800] : Colors.white,
      ),
      home: HomePage(
        isDarkMode: isDarkMode,
        onToggleTheme: () => setState(() => isDarkMode = !isDarkMode),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  final bool isDarkMode;
  final VoidCallback onToggleTheme;
  const HomePage({super.key, required this.isDarkMode, required this.onToggleTheme});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            floating: true,
            snap: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
            actions: [
              IconButton(
                icon: Icon(widget.isDarkMode ? Icons.light_mode : Icons.dark_mode),
                onPressed: widget.onToggleTheme,
              )
            ],
          )
        ],
        body: FadeTransition(
          opacity: _animation,
          child: SingleChildScrollView(
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
                        'We build powerful digital products & services for startups, creators and businesses.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                Text('Our Projects', style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: 10),
                ProjectTile(
                  title: 'MangaSphere',
                  description: 'An immersive manga & eBook reader in development. Features like auto-scroll, real-time translation, and AI-based tools coming soon.',
                  githubUrl: 'https://github.com/ganesh12122/MangaSphere',
                ),
                ProjectTile(
                  title: 'Stark Products',
                  description: 'An inventory & product manager for small businesses. MVP release in progress.',
                  githubUrl: 'https://github.com/ganesh12122/starkproducts',
                ),
                ProjectTile(
                  title: 'Daily Spark',
                  description: 'A completed discipline tracker that helps users build positive habits and maintain streaks. Built with Flutter + Provider.',
                  githubUrl: 'https://github.com/ganesh12122/Daily_Spark',
                ),
                const SizedBox(height: 40),
                Text('Our Mission', style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: 10),
                const Text('To empower visionary developers, creators, and entrepreneurs by building innovative digital solutions that solve real-world problems.'),
                const SizedBox(height: 40),
                Text('Get In Touch', style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 10),
                const Text('Email: peacemakers.dev@gmail.com'),
                const Text('GitHub: github.com/ganesh12122'),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () async {
                    final url = 'https://www.linkedin.com/in/ganesh-prasath-k-r-301523309/';
                    if (await canLaunchUrl(Uri.parse(url))) {
                      await launchUrl(Uri.parse(url));
                    }
                  },
                  child: const Text('Hire Us on LinkedIn'),
                ),
                const SizedBox(height: 30),
                Text('Contact Form', style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: 10),
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _nameController,
                            decoration: const InputDecoration(
                              labelText: 'Name',
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) => value!.isEmpty ? 'Please enter your name' : null,
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: _emailController,
                            decoration: const InputDecoration(
                              labelText: 'Email',
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) => value!.isEmpty ? 'Please enter your email' : null,
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: _messageController,
                            maxLines: 4,
                            decoration: const InputDecoration(
                              labelText: 'Message',
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) => value!.isEmpty ? 'Please enter your message' : null,
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                final url = Uri.parse(
                                  'https://formsubmit.co/peacemakers.dev@gmail.com,ganeshprasath12122@gmail.com'
                                  '?name=${_nameController.text}&email=${_emailController.text}&message=${_messageController.text}'
                                );
                                if (await canLaunchUrl(url)) {
                                  await launchUrl(url);
                                }
                              }
                            },
                            child: const Text('Submit'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProjectTile extends StatelessWidget {
  final String title;
  final String description;
  final String githubUrl;

  const ProjectTile({
    required this.title,
    required this.description,
    required this.githubUrl,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).cardColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
        trailing: IconButton(
          icon: const Icon(Icons.launch),
          onPressed: () async {
            if (await canLaunchUrl(Uri.parse(githubUrl))) {
              await launchUrl(Uri.parse(githubUrl));
            }
          },
        ),
      ),
    );
  }
}
