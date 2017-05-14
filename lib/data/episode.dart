import 'package:podcst_app/data/constants.dart';
import 'package:podcst_app/data/sound_file.dart';

class Episode {
  final String title;
  final String summary;
  final int published;
  final String cover;
  final bool explicit;
  final int duration;
  final String link;
  final SoundFile file;
  final String author;
  final String episodeArt;
  final String showNotes;

  const Episode({
    this.title,
    this.summary,
    this.published,
    this.cover,
    this.explicit,
    this.duration,
    this.link,
    this.file,
    this.author,
    this.episodeArt,
    this.showNotes
  });

  static Episode parse(Map raw) {
    return new Episode(
      title: raw['title'] as String,
      summary: raw['summary'] as String,
      published: raw['published'] != null ? raw['published'] as int : kDefaultInt,
      cover: raw['cover'] != null ? raw['cover'] as String : kDefaultStr,
      explicit: raw['explicit'] as bool,
      duration: raw['duration'] as int,
      link: raw['link'] as String,
      file: SoundFile.parse(raw['file'] as Map),
      author: raw['author'] as String,
      episodeArt: raw['episodeArt'] as String,
      showNotes: raw['showNotes'] as String,
    );
  }
}
