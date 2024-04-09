import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_internship_2024_app/bloc/search_bloc/search_bloc.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/card_widget.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/search_widgets/search_card_overlay.dart';

class SearchList extends StatefulWidget {
  const SearchList({super.key});

  @override
  State<SearchList> createState() => _SearchListState();
}

class _SearchListState extends State<SearchList>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
      if (state is SearchLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is SearchSuccess) {
        _animationController.forward();
        return Center(
          child: AnimatedBuilder(
            animation: _animationController,
            child: ListView.builder(
              itemCount: state.libraries.length,
              itemBuilder: (context, index) {
                return CardWidget(
                    color: Colors.black,
                    onTap: () {},
                    child: SearchCardOverlay(
                      library: state.libraries[index],
                    ));
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
      }
      if (state is SearchFailure) {
        return Center(
          child: Text(state.errorMessage),
        );
      }
      return const SizedBox();
    });
  }
}
