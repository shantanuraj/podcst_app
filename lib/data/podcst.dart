class Podcst {
  /// Podcast id
  final int id;
  /// Podcast feed
  final String feed;
  /// Podcast author
  final String author;
  /// Podcast episode count
  final int count;
  /// Podcast large image
  final String cover;
  /// Podcast explicitness
  final String explicit;
  /// Podcast small image
  final String thumbnail;
  /// Podcast title
  final String title;

  const Podcst({
    this.id,
    this.feed,
    this.author,
    this.count,
    this.cover,
    this.explicit,
    this.thumbnail,
    this.title
  });

  static Podcst parse(Map raw) {
    return new Podcst(
      id: raw['id'] as int,
      feed: raw['feed'] as String,
      author: raw['author'] as String,
      count: raw['count'] as int,
      cover: raw['cover'] as String,
      explicit: raw['explicit'] as String,
      thumbnail: raw['thumbnail'] as String,
      title: raw['title'] as String,
    );
  }
}
