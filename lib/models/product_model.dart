class Product {
  final String title;
  final String shortDescription;
  final String description;
  final String logo;
  final List<String> screenshots;
  final String liveUrl;
  final String githubUrl;
  final String status;

  Product({
    required this.title,
    required this.shortDescription,
    required this.description,
    required this.logo,
    required this.screenshots,
    required this.liveUrl,
    required this.githubUrl,
    required this.status,
  });
}
