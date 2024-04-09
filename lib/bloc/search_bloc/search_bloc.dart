import 'package:bloc/bloc.dart';
import 'package:flutter_internship_2024_app/data/search/repository/search_repository.dart';
import 'package:flutter_internship_2024_app/models/library.dart';
import 'package:meta/meta.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRepository _repository;

  SearchBloc(this._repository) : super(SearchInitial()) {
    on<LibrariesSearched>(_searchLibraries);
  }

  void _searchLibraries(
      LibrariesSearched event, Emitter<SearchState> emit) async {
    emit(SearchLoading());

    try {
      final libraries = await _repository.searchLibraries(event.searchText);
      emit(SearchSuccess(libraries));
    } catch (e) {
      emit(SearchFailure(e.toString()));
    }
  }
}
