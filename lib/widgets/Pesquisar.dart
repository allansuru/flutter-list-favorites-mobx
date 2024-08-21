import 'package:flutter/material.dart';

class Pesquisar extends StatelessWidget {
  final TextEditingController searchController;
  final Function(String) onSearch;

  const Pesquisar({
    Key? key,
    required this.searchController,
    required this.onSearch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: searchController,
        decoration: InputDecoration(
          hintText: 'Pesquisar personagens...',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          suffixIcon: IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => onSearch(searchController.text),
          ),
        ),
        onSubmitted: (value) => onSearch(value),
      ),
    );
  }
}
