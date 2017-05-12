class Podcst {
  /// UUID podcast id
  final String id;
  /// Podcast homepage
  final String url;
  /// Podcast title
  final String title;
  /// Podcast description blurb
  final String description;
  /// Podcast large image
  final String cover;
  /// Podcast Category
  final String category;
  /// Can either be `audio` or `video`
  final String media;
  /// Podcast locale
  final String language;
  /// Podcast author
  final String author;
  /// Podcast small image
  final String thumbnail;

  const Podcst({
    this.id,
    this.url,
    this.title,
    this.description,
    this.cover,
    this.category,
    this.media,
    this.language,
    this.author,
    this.thumbnail
  });

  static Podcst Parse(Map raw) {
    return new Podcst(
      id: raw['id'],
      url: raw['url'],
      title: raw['title'],
      description: raw['description'],
      cover: raw['cover'],
      category: raw['category'],
      media: raw['media'],
      language: raw['language'],
      author: raw['author'],
      thumbnail: raw['thumbnail'],
    );
  }
}