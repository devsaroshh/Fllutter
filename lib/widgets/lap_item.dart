import 'package:flutter/material.dart';

class LapItem extends StatelessWidget {
  const LapItem({super.key, required this.index, required this.duration});
  final int index;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        '$index',
      ),
      title: Text(
        duration.toString(),
      ),
    );
  }
}
