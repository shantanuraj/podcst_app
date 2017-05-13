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
      id: raw['id'],
      feed: raw['feed'],
      author: raw['author'],
      count: raw['count'],
      cover: raw['cover'],
      explicit: raw['explicit'],
      thumbnail: raw['thumbnail'],
      title: raw['title'],
    );
  }
}