import 'package:giphy/models/giphy.dart';

class GiphyState {
  final List<Giphy> gifs;

  final int limit;
  final int offset;

  const GiphyState({
    required this.gifs,
    required this.limit,
    required this.offset,
  });

  static const empty = GiphyState(gifs: [], limit: 0, offset: 0);

  GiphyState copyWith({
    List<Giphy>? gifs,
    int? limit,
    int? offset,
  }) {
    return GiphyState(
      gifs: gifs ?? this.gifs,
      limit: limit ?? this.limit,
      offset: offset ?? this.offset,
    );
  }
}
