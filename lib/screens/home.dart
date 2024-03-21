import 'package:flutter/material.dart';

class HomeCards extends StatelessWidget {
  HomeCards({super.key});

  final List<Widget> cards = [
    const RoundedCard(
      title: 'Card 1',
    ),
    const RoundedCard(
      title: 'Card 2',
    ),
    const RoundedCard(
      title: 'Card 3',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: cards,
    );
  }
}

class RoundedCard extends StatelessWidget {
  final String title;

  const RoundedCard({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8, // Adjust width as needed
      height: MediaQuery.of(context).size.height * 0.28, // Adjust height as needed
      child: Align(
        alignment: Alignment.center,
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
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: HomeCards(),
        )
      ],
    );
  }
}
