import 'package:flutter/material.dart';
import 'package:giphy/repositories/giphy_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
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
      body: Column(children: [
        Text('Here will load the gifs'),
        TextButton(
            onPressed: () async {
              await GiphyRepository().trendingGifs(limit: 2, offset: 0);
            },
            child: Text("Generate"))
      ]),
    );
  }
}
