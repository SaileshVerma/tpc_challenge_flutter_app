import 'package:flutter/material.dart';

class GifCard extends StatefulWidget {
  const GifCard({required this.url, super.key});
  final String url;

  @override
  State<GifCard> createState() => _GifCardState();
}

class _GifCardState extends State<GifCard> {
  @override
  Widget build(BuildContext context) {
    return Image.network(widget.url);
  }
}
