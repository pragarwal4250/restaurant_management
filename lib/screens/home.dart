import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RoundedCard extends StatelessWidget {
  final String title;
  final int index;

  const RoundedCard({
    super.key,
    required this.title,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    
    final ThemeData theme = Theme.of(context);

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8, // Adjust width as needed
      height: MediaQuery.of(context).size.height * 0.33, // Adjust height as needed
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          decoration: BoxDecoration(
            color: theme.colorScheme.secondaryContainer,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0),
            ),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: theme.colorScheme.onSecondaryContainer,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<String> titles = [
    'Card 1',
    'Card 2',
    'Card 3',
    'Card 4',
    'Card 5',
  ];

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return RoundedCard(
            title: titles[index],
            index: index,
            );
        },
        childCount: titles.length,
      ),
    );
  }
}
