import 'package:flutter/material.dart';
import 'package:flutter_internship_2024_app/models/library.dart';
import 'package:flutter_internship_2024_app/theme.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SearchCardOverlay extends StatelessWidget {
  const SearchCardOverlay({super.key, required this.library});

  final Library library;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            library.name ?? "",
            style: Theme.of(context).textTheme.labelLarge,
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                MdiIcons.packageVariantClosed,
                color: textColor,
              ),
              const SizedBox(width: 5),
            ],
          ),
        ],
      ),
    );
  }
}
