import 'package:flutter/material.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/search_widgets/search_input_widget.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/search_widgets/search_list.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            'Search',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        centerTitle: false,
        shape: const Border(
          bottom: BorderSide(color: Color.fromRGBO(239, 245, 243, 1), width: 1),
        ),
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SearchInput(),
          Expanded(
            child: SearchList(),
          ),
        ],
      ),
    );
  }
}
