import 'package:podcst_app/data/constants.dart';
import 'package:podcst_app/data/episode.dart';

class Feed {
  final String title;
  final String link;
  final int published;
  final String description;
  final String author;
  final String cover;
  final List<String> keywords;
  final bool explicit;
  final List<Episode> episodes;

  const Feed({
    this.title,
    this.link,
    this.published,
    this.description,
    this.author,
    this.cover,
    this.keywords,
    this.explicit,
    this.episodes,
  });

  static Feed parse(Map raw) {
    return new Feed(
      title: raw['title'],
      link: raw['link'],
      published: raw['published'] != null ? raw['published'] : DEFAULT_INT,
      description: raw['description'],
      author: raw['author'],
      cover: raw['cover'],
      keywords: raw['keywords'],
      explicit: raw['explicit'],
      episodes: raw['episodes'].map(Episode.parse).toList(),
    );
  }
}