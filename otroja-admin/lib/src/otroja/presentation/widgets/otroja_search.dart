import 'package:flutter/material.dart';

import '../../core/utils/constants/colors.dart';

class OtrojaSearch extends SearchDelegate<String> {
  OtrojaSearch({
    required this.search,
    required this.widgetSearchBuilder,
    required this.searchBy,
  });

  final String searchBy;
  final Widget Function(dynamic) widgetSearchBuilder;
  final List search;

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return theme.copyWith(
      hintColor: Colors.white70,
      textTheme: const TextTheme(
          titleLarge: TextStyle(color: Colors.white, fontSize: 20)),
      appBarTheme: AppBarTheme(
        // brightness: colorScheme.brightness,
        backgroundColor: Colors.grey[900],
        iconTheme: theme.primaryIconTheme.copyWith(color: Colors.grey),
      ),
      inputDecorationTheme: searchFieldDecorationTheme ??
          InputDecorationTheme(
            hintStyle: searchFieldStyle ?? theme.inputDecorationTheme.hintStyle,
            border: InputBorder.none,
          ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = search
        .where((item) => item[searchBy]
        .toString()
        .toLowerCase()
        .contains(query.toLowerCase()))
        .toList();
    return Container(
      color: Colors.white,
      child: GridView.builder(
        itemCount: suggestionList.length,
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.75,
        ),
        itemBuilder: (context, index) {
          final item = suggestionList[index];
          return widgetSearchBuilder(item);
        },
      ),
    );
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  String get searchFieldLabel => 'Search';

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          if (query.isEmpty) {
            close(context, '');
          } else {
            query = '';
          }
        },
      ),
    ];
  }

  @override
  Widget buildResults(BuildContext context) {
    final suggestionList = search
        .where((item) => item[searchBy]
        .toString()
        .toLowerCase()
        .contains(query.toLowerCase()))
        .toList();
    return Container(
      color: Colors.white,
      child: GridView.builder(
        itemCount: suggestionList.length,
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.75,
        ),
        itemBuilder: (context, index) {
          final item = suggestionList[index];
          return widgetSearchBuilder(item);
        },
      ),
    );
  }
}
