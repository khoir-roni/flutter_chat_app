import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String message;

  const MessageBubble(this.message);
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    TextStyle style = theme.textTheme.headline6.copyWith(
      color: theme.colorScheme.onSecondary,
      fontSize: 12,
    );

    return Row(
      children: [
        Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(12),
            ),
            width: 140,
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 16,
            ),
            margin: const EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 8,
            ),
            child: Text(
              message,
              style: style,
            )),
      ],
    );
  }
}
