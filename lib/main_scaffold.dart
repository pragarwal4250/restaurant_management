import 'package:flutter/material.dart';
import 'screens/screens.dart';
import 'package:restaurant_management/my_bottom_navigation_bar.dart';

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  
  int _currentIndex = 0;

  final List<Widget> _childern = [
    const HomeScreen(),
    const MenuScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];
  
  @override
  Widget build(BuildContext context) {
  
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: Image.asset('lib/common/logo.gif'),
            centerTitle: true,
            title: Text(
              "Restaurant",
              style: TextStyle(
                color: theme.colorScheme.onPrimaryContainer
                ),
            ),
            expandedHeight: 0,
            floating: false,
            pinned: true,
            backgroundColor: theme.colorScheme.primaryContainer,
            titleTextStyle: theme.textTheme.headlineLarge,
          ),
          SliverFillRemaining(
            child: _childern[_currentIndex],
          )
        ],
      ),
      bottomNavigationBar: MyBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => {
          setState(() {
            _currentIndex = index;
          })
        },
      ),
    );
  }
}