// models/draft.dart
class Draft {
  final String title;
  final String subtitle;
  final String imageUrl;
  final bool isNew;

  const Draft({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    this.isNew = false,
  });
}
