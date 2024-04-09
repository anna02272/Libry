import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_internship_2024_app/bloc/search_bloc/search_bloc.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/card_widget.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/libraries_widgets/libraries_card_content.dart';

class SearchList extends StatefulWidget {
  const SearchList({super.key});

  @override
  State<SearchList> createState() => _SearchListState();
}

class _SearchListState extends State<SearchList>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool _showSearchList = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
      lowerBound: 0,
      upperBound: 1,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchBloc, SearchState>(
      listener: (context, state) {
        if (state is SearchSuccess) {
          setState(() {
            _showSearchList = state.libraries.isNotEmpty;
          });
          _animationController.forward();
        } else {
          setState(() {
            _showSearchList = false;
          });
        }
      },
      builder: (context, state) {
        if (_showSearchList) {
          return Center(
            child: AnimatedBuilder(
              animation: _animationController,
              child: ListView.builder(
                itemCount: (state as SearchSuccess).libraries.length,
                itemBuilder: (context, index) {
                  return CardWidget(
                    color: Colors.black,
                    onTap: () {},
                    child: LibrariesCardContet(
                      library: state.libraries[index],
                    ),
                  );
                },
              ),
              builder: (context, child) {
                return Opacity(
                  opacity: _animationController.value,
                  child: Transform.translate(
                    offset: Offset(0, 100 * (1 - _animationController.value)),
                    child: child,
                  ),
                );
              },
            ),
          );
        } else if (state is SearchLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is SearchFailure) {
          return Center(
            child: Text(state.errorMessage),
          );
        } else {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                state is SearchSuccess
                    ? const Icon(
                        Icons.emoji_nature_outlined,
                        size: 80,
                        color: Color.fromRGBO(72, 75, 73, 1),
                      )
                    : const Icon(
                        Icons.search,
                        size: 80,
                        color: Color.fromRGBO(72, 75, 73, 1),
                      ),
                const SizedBox(height: 20),
                Text(
                  state is SearchSuccess
                      ? 'There are no found packages for the entered search criteria!'
                      : 'Enter search keyword in order to find packages you are looking for.',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Color.fromRGBO(72, 75, 73, 1),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
