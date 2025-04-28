import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectTile extends StatelessWidget {
  final String title;
  final String description;
  final String githubUrl;

  const ProjectTile({
    Key? key,
    required this.title,
    required this.description,
    required this.githubUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 5,
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
