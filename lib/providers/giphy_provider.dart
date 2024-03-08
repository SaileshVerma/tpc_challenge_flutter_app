import 'dart:async';
import 'package:giphy/providers/states/giphy_response_state.dart';
import 'package:giphy/repositories/giphy_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GiphyNotifier extends AsyncNotifier<GiphyState> {
  @override
  FutureOr<GiphyState> build() {
    final giphyRepository = GiphyRepository();

    return giphyRepository.trendingGifs(limit: 2, offset: 0);
  }
}

final giphyNotifier = AsyncNotifierProvider<GiphyNotifier, GiphyState>(
  () => GiphyNotifier(),
);
