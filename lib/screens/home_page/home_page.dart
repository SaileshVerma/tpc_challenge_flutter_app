import 'package:flutter/material.dart';
import 'package:giphy/screens/home_page/widgets/gifs_list_view_builder.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isTextfieldVisible = false;

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
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          const GifsListViewBuilder(),
          Visibility(
            visible: isTextfieldVisible,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextField(
                decoration: InputDecoration(
                  labelStyle: const TextStyle(color: Colors.white),
                  hintStyle: const TextStyle(color: Colors.white),
                  fillColor: Colors.purpleAccent,
                  filled: true,
                  hintText: 'Enter keyword to search',
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(20)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.search,
          size: 28,
          color: Colors.purpleAccent,
        ),
        onPressed: () {
          setState(() {
            isTextfieldVisible = !isTextfieldVisible;
          });
        },
      ),
    );
  }
}
