import 'dart:async';
import 'package:giphy/models/giphy.dart';
import 'package:giphy/providers/states/giphy_response_state.dart';
import 'package:giphy/repositories/giphy_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GiphyNotifier extends AsyncNotifier<GiphyState> {
  late GiphyRepository giphyRepository;

  @override
  FutureOr<GiphyState> build() async {
    giphyRepository = GiphyRepository();
    final response = await giphyRepository.trendingGifs(limit: 4, offset: 0);

    final initialState = GiphyState(
      gifs: response.body as List<Giphy>,
      limit: 2,
      offset: 0,
    );

    return initialState;
  }

  Future<void> getMoreGifs() async {
    final prevState = state.asData?.value ?? GiphyState.empty;

    final newLimit = prevState.limit + 2;
    final newOffset = newLimit > 60 ? prevState.offset + 2 : prevState.offset;

    final apiResponseGifs = await giphyRepository.trendingGifs(
      limit: newLimit,
      offset: newOffset,
    );

    final newGifs = apiResponseGifs.body as List<Giphy>;

    final newState = prevState.copyWith(
        gifs: [...prevState.gifs, ...newGifs],
        limit: newLimit,
        offset: newOffset);

    state = AsyncData(newState);
  }
}

final giphyNotifier = AsyncNotifierProvider<GiphyNotifier, GiphyState>(
  () => GiphyNotifier(),
);
