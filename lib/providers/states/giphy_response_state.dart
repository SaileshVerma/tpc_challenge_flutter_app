import 'package:giphy/models/giphy.dart';

class GiphyState {
  final List<Giphy> gifs;
  final dynamic error;

  const GiphyState({
    required this.gifs,
    this.error,
  });
}
