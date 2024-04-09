import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_internship_2024_app/bloc/libraries_bloc/libraries_bloc.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/card_widget.dart';

class LibrariesList extends StatefulWidget {
  const LibrariesList({super.key});

  @override
  State<LibrariesList> createState() {
    return _LibrariesListState();
  }
}

class _LibrariesListState extends State<LibrariesList> {
  @override
  void initState() {
    super.initState();
    context.read<LibrariesBloc>().add(LibrairesFetched());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LibrariesBloc, LibrariesState>(
        builder: (context, state) {
      if (state is LibrariesLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      if (state is LibrariesSuccess) {
        final data = state.libraries;
        return Center(
          child: ListView.builder(
              itemCount: state.libraries.length,
              itemBuilder: (context, index) {
                return CardWidget(
                  color: Colors.yellow,
                  onTap: () {
                    // Define your onTap functionality here
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data[index].name!),
                      const SizedBox(height: 3),
                      // Add more widgets here as needed
                    ],
                  ),
                );
              }),
        );
      }
      if (state is LibrariesFailure) {
        return Center(
          child: Text(state.error),
        );
      }
      return const SizedBox();
    });
  }
}
