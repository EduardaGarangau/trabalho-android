import 'package:flutter/material.dart';

class ItemDetailsField extends StatelessWidget {
  final String title;
  final String value;

  const ItemDetailsField({
    required this.title,
    required this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 15,
        left: 15,
        top: 8,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  color: Color.fromRGBO(6, 48, 96, 1),
                  fontFamily: 'Lato',
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 3),
              Text(
                value,
                maxLines: 3,
                softWrap: true,
                overflow: TextOverflow.visible,
                style: const TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 16,
                  //color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Divider(
            color: Colors.grey.shade600,
            thickness: 1.0,
          ),
        ],
      ),
    );
  }
}
