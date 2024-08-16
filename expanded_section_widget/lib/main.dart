import 'package:flutter/material.dart';

import 'ExpandedSectionWidget.dart';
import 'TextWidget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Expanded Section Demo',
      debugShowCheckedModeBanner: false,
      home: SectionList(),
    );
  }
}

class SectionList extends StatefulWidget {
  const SectionList({super.key});

  @override
  State<SectionList> createState() => _SectionListState();
}

class _SectionListState extends State<SectionList> {
  final listMap = {
    "Section-1": ["Row-1", "Row-2", "Row-3"],
    "Section-2": ["Row-1", "Row-2", "Row-3"],
    "Section-3": ["Row-1", "Row-2", "Row-3"],
    "Section-4": ["Row-1", "Row-2", "Row-3"],
    "Section-5": ["Row-1", "Row-2", "Row-3"],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Expanded Section Widget"),
      ),
      body: ListView(
        children: List.generate(
          listMap.length,
          (index) => ExpandedSectionWidget(
              initiallyExpanded: index == 0,
              title: listMap.keys.elementAt(index),
              childrenPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              children: listMap.values
                  .elementAt(index)
                  .map((e) => ItemWidget(title: e))
                  .toList()),
        ),
      ),
    );
  }
}

class ItemWidget extends StatelessWidget {
  final String title;

  const ItemWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              const EdgeInsets.only(right: 8, top: 0, left: 16, bottom: 16),
          child: TextWidget(
            txt: title,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
            styles: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        // const Divider(
        //   thickness: 0.5,
        //   color: Colors.grey,
        // )
      ],
    );
  }
}
