import 'package:flutter/material.dart';

class AppFab extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final double size;

  const AppFab({
    super.key,
    required this.onPressed,
    this.icon = Icons.add,
    this.size = 28,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return FloatingActionButton(
      onPressed: onPressed,
      shape: const CircleBorder(),
      elevation: 2,
      backgroundColor: colorScheme.primary,
      foregroundColor: colorScheme.onPrimary,
      child: Icon(icon, size: size),
    );
  }
}
