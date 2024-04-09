import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_internship_2024_app/bloc/bloc/platforms_bloc.dart';
import 'package:flutter_internship_2024_app/bloc/libraries_bloc/libraries_bloc.dart';
import 'package:flutter_internship_2024_app/data/libraries/data_provider/libraries_provider.dart';
import 'package:flutter_internship_2024_app/data/libraries/repository/libraries_repository.dart';
import 'package:flutter_internship_2024_app/data/platforms/data_provider/platforms_data_provider.dart';
import 'package:flutter_internship_2024_app/data/platforms/repository/platforms_repository.dart';
import 'package:flutter_internship_2024_app/presentation/screens/libraries_screen.dart';
import 'package:flutter_internship_2024_app/presentation/screens/platforms_screen.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // open to refactoring
    return RepositoryProvider(
      create: (context) => LibrariesRepository(LibrariesProvider()),
      child: BlocProvider(
        create: (context) => LibrariesBloc(context.read<LibrariesRepository>()),
        child: MaterialApp(
          title: 'Package Manager App',
          theme: ThemeData.light().copyWith(
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 205, 232, 223),
            ),
            textTheme: ThemeData.light().textTheme.copyWith(
                  headlineSmall: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 72, 75, 73),
                  ),
                ),
          ),
          home: const LibrariesScreen(),
        ),
      ),
    );
  }
}
