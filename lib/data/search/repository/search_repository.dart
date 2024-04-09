import 'dart:convert';

import 'package:flutter_internship_2024_app/data/search/data_provider/search_data_provider.dart';
import 'package:flutter_internship_2024_app/models/library.dart';

class SearchRepository {
  final SearchDataProvider _dataProvider;

  SearchRepository(this._dataProvider);

  Future<List<Library>> searchLibraries(String param) async {
    final body = jsonDecode(await _dataProvider.searchLibraries(param));
    final List<Library> libraries =
        body.map<Library>((json) => Library.fromMap(json)).toList();
    return libraries;
  }
}
