import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    super.key,
    required this.title,
    required this.trailingIcon,
    required this.onTap,
  });
  final String title;
  final IconData trailingIcon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        transitionBuilder: (child, animation) {
          return SlideTransition(
            position: Tween<Offset>(
                    begin: const Offset(0.0, 0.5), end: const Offset(0.0, 0.0))
                .animate(animation),
            child: child,
          );
        },
        child: Text(
          title,
          key: ValueKey<String>(title),
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
      ),
      trailing: Icon(trailingIcon),
    );
  }
}
