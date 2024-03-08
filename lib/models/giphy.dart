class Giphy {
  final String id;
  final String url;

  const Giphy({
    required this.id,
    required this.url,
  });

  factory Giphy.fromJson({required Map<String, dynamic> json}) {
    return Giphy(
      id: json['id'],
      url: json['url'],
    );
  }
}
