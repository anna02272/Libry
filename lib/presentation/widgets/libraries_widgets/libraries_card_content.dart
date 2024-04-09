

import 'package:flutter/material.dart';
import 'package:flutter_internship_2024_app/models/library.dart';

class LibrariesCardContet extends StatelessWidget{
  const LibrariesCardContet({super.key, required this.library});

  final Library library;

  @override
  Widget build(BuildContext context) {

    return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [ Text(library.name!),
                  const SizedBox(height: 3,),
                  Row(children: [
                    Text(library.latestReleaseNumber != null ? library.latestReleaseNumber.toString() : ''),
                    //Text(data[index].keywords != null ? data[index].keywords.join(',')  : ''),
                    Text(library.keywords?.join(',') ?? '',
                    maxLines: 1,
                   ),
                   ],)
                  ]
                  ),
    );
  }

}