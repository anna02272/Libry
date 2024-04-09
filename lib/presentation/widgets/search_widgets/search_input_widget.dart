import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_internship_2024_app/bloc/search_bloc/search_bloc.dart';

class SearchInput extends StatefulWidget {
  const SearchInput({super.key});

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 60,
      margin: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
        color: Color.fromRGBO(239, 245, 243, 1),
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: TextField(
                autofocus: true,
                controller: _controller,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                onSubmitted: (searchText) {
                  _submitSearch(context, searchText);
                },
              ),
            ),
            GestureDetector(
              onTap: () {
                _controller.clear();
              },
              child: const Icon(
                Icons.close,
                color: Color.fromRGBO(72, 75, 73, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submitSearch(BuildContext context, String searchText) {
    if (searchText.isNotEmpty) {
      context.read<SearchBloc>().add(LibrariesSearched(searchText));
    }
    _controller.clear();
  }
}
