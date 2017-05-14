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
      title: raw['title'] as String,
      link: raw['link'] as String,
      published: raw['published'] != null ? raw['published'] as int : kDefaultInt,
      description: raw['description'] as String,
      author: raw['author'] as String,
      cover: raw['cover'] as String,
      keywords: raw['keywords'] as List<String>,
      explicit: raw['explicit'] as bool,
      episodes: (raw['episodes'] as List<Map>).map(Episode.parse).toList(),
    );
  }
}
