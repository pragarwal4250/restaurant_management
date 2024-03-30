import 'package:flutter/material.dart';

class CartRoundedCard extends StatelessWidget {
  final String title;
  final int index;

  const CartRoundedCard({
    super.key,
    required this.title,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    
    final ThemeData theme = Theme.of(context);

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.125,
      child: Card(
        color: theme.colorScheme.secondaryContainer,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: theme.textTheme.bodyLarge!.copyWith(
              color: theme.colorScheme.onSecondaryContainer,
            ),
          ),
        ),
      ),
    );
  }
}

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  final List<String> titles = List.generate(
  25, // Replace 12 with the desired size n
  (index) => 'Cart Card ${index + 1}',
  );

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return CartRoundedCard(
            title: titles[index],
            index: index,
            );
        },
        childCount: titles.length,
      ),
    );
  }
}
