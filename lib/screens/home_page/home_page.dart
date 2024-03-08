import 'package:flutter/material.dart';
import 'package:giphy/providers/giphy_provider.dart';
import 'package:giphy/screens/home_page/widgets/gifs_list_view_builder.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      body: const GifsListViewBuilder(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          ref.read(giphyNotifier.notifier).getMoreGifs();
        },
      ),
    );
  }
}
