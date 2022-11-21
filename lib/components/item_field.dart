import 'package:flutter/material.dart';

class ItemField extends StatelessWidget {
  final String title;
  final String value;

  const ItemField({
    required this.title,
    required this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          textAlign: TextAlign.start,
          style: const TextStyle(
            fontFamily: 'Lato',
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 5),
        Text(
          value,
          maxLines: 3,
          softWrap: true,
          overflow: TextOverflow.visible,
          style: const TextStyle(
            fontFamily: 'Lato',
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
