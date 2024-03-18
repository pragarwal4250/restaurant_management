import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatelessWidget {

  final int currentIndex;
  final Function(int) onTap;
  final ThemeData theme;

  const MyBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.theme,
    });

  @override
  Widget build(BuildContext context) {
    
    return BottomNavigationBar(
      backgroundColor: theme.colorScheme.surface,
      selectedItemColor: theme.colorScheme.primary,
      unselectedItemColor: theme.colorScheme.onSurface,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu),
          label: 'Menu',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      currentIndex: currentIndex,
      onTap: onTap,
    );
  }
}