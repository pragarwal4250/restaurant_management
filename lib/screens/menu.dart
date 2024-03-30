import 'package:flutter/material.dart';
import '../rest/rest.dart';

class MenuRoundedCard extends StatelessWidget {
  final Dish dish;
  final int index;

  const MenuRoundedCard({
    super.key,
    required this.dish,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.33,
      child: Card(
        color: theme.colorScheme.secondaryContainer,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dish.name,
                      style: theme.textTheme.bodyLarge!.copyWith(
                        color: theme.colorScheme.onSecondaryContainer,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        dish.description,
                        style: theme.textTheme.bodySmall!.copyWith(
                          color: theme.colorScheme.onSecondaryContainer,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        dish.category,
                        style: theme.textTheme.bodyMedium!.copyWith(
                          color: theme.colorScheme.onSecondaryContainer,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset('lib/common/logo.gif'),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  late Future<List<Dish>> _fetchDishesFuture;

  @override
  void initState() {
    super.initState();
    setState(() {
      _fetchDishesFuture = fetchDishes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Dish>>(
      future: _fetchDishesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(); // Or any other loading indicator
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          List<Dish> dishList = snapshot.data!;
          // Use the fetched dishList in your UI
          return MenuScreenFetched(dishList: dishList);
        }
      },
    );
  }
}


class MenuScreenFetched extends StatelessWidget {

  final List<Dish> dishList;

  const MenuScreenFetched({
    super.key,
    required this.dishList,
    });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return MenuRoundedCard(
            dish: dishList[index],
            index: index,
            );
        },
        childCount: dishList.length,
      ),
    );
  }
}
