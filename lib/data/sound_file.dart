class SoundFile {
  final String url;
  final String type;
  final int length;

  const SoundFile({
    this.url,
    this.type,
    this.length
  });

  static parse(Map raw) {
    return new SoundFile(
      type: raw['type'],
      url: raw['url'],
      length: raw['length'],
    );
  }
}