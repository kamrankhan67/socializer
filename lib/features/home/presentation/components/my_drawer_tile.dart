import 'package:flutter/material.dart';

class MyDrawerTile extends StatelessWidget {
  const MyDrawerTile({
    super.key,
    required this.title,
    this.onTap,
    required this.icon,
  });
  final String title;
  final void Function()? onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 13,color: Theme.of(context).colorScheme.inversePrimary),
      ),
      leading: Icon(icon, color: Theme.of(context).colorScheme.primary),
      onTap: onTap,
    );
  }
}
