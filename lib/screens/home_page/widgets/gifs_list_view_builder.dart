import 'package:flutter/material.dart';
import 'package:giphy/providers/giphy_provider.dart';
import 'package:giphy/screens/home_page/widgets/gifs_card.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GifsListViewBuilder extends ConsumerStatefulWidget {
  const GifsListViewBuilder({super.key});

  @override
  ConsumerState<GifsListViewBuilder> createState() =>
      _GifsListViewBuilderState();
}

class _GifsListViewBuilderState extends ConsumerState<GifsListViewBuilder> {
  final ScrollController controller = ScrollController();
  bool isLoading = false;

  @override
  void initState() {
    controller.addListener(() {
      loadMoreGifs();
    });

    super.initState();
  }

  loadMoreGifs() {
    if (controller.position.pixels == controller.position.maxScrollExtent) {
      setState(() {
        isLoading = true;
      });
      ref.read(giphyNotifier.notifier).getMoreGifs();
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final gifProvider = ref.watch(giphyNotifier);

    return gifProvider.when(
      data: (data) {
        return ListView.builder(
          controller: controller,
          itemCount: isLoading ? data.gifs.length + 1 : data.gifs.length,
          itemBuilder: (context, index) {
            if (index >= data.gifs.length && isLoading) {
              return const Padding(
                padding: EdgeInsets.all(4.0),
                child: Center(
                  child: Text(
                    'Loading More...',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              );
            }
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GifCard(
                url: data.gifs[index].url,
              ),
            );
          },
        );
      },
      loading: () => const Center(
        child: CircularProgressIndicator(
          color: Colors.purple,
        ),
      ),
      error: (error, stackTrace) => Text('$error'),
    );
  }
}
