class PluginInfo {
  const PluginInfo({
    required this.name,
    required this.version,
    required this.author,
    required this.authorLink,
    required this.publisher,
    required this.publisherLink,
    required this.iconBase64,
    required this.lastUpdated,
  });

  final String name;

  final String version;

  final String author;

  final String? authorLink;

  final String publisher;

  final String? publisherLink;

  final String? iconBase64;

  final DateTime lastUpdated;
}
