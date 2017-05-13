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
      title: raw['title'],
      summary: raw['summary'],
      published: raw['published'] ? raw['published'] : -1,
      cover: raw['cover'] ? raw['cover'] : '',
      explicit: raw['explicit'],
      duration: raw['duration'],
      link: raw['link'],
      file: SoundFile.parse(raw['file']),
      author: raw['author'],
      episodeArt: raw['episodeArt'],
      showNotes: raw['showNotes'],
    );
  }
}