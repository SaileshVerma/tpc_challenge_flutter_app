import 'package:flutter/material.dart';
import 'package:giphy/providers/giphy_provider.dart';
import 'package:giphy/screens/home_page/widgets/gifs_card.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gifProvider = ref.watch(giphyNotifier);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        title: const Text(
          'Giphy',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: gifProvider.when(
        data: (data) {
          return ListView(
            children: data.gifs
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GifCard(
                      url: e.url,
                    ),
                  ),
                )
                .toList(),
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(
            color: Colors.purple,
          ),
        ),
        error: (error, stackTrace) => Text('$error'),
      ),
    );
  }
}
