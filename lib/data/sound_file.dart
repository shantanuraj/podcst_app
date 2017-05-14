class SoundFile {
  final String url;
  final String type;
  final int length;

  const SoundFile({
    this.url,
    this.type,
    this.length
  });

  static SoundFile parse(Map raw) {
    return new SoundFile(
      type: raw['type'] as String,
      url: raw['url'] as String,
      length: raw['length'] as int,
    );
  }
}
