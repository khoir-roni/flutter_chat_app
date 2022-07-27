import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble(
    this.message,
    this.isMe,
     {this.key}
  );

  final String message;
  final bool isMe;
  final Key key;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    TextStyle style = theme.textTheme.headline6.copyWith(
      color:
          isMe ? Colors.black :
          theme.colorScheme.onSecondary,
      fontSize: 12,
    );

    return Row(
      mainAxisAlignment:
          isMe ? MainAxisAlignment.end :
          MainAxisAlignment.start,
      children: [
        Container(
            decoration: BoxDecoration(
              color:
                  isMe
                      ? Colors.grey[300]
                      :
                  Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(12),
                topRight: const Radius.circular(12),
                bottomLeft: !isMe ? Radius.circular(0) : Radius.circular(12),
                bottomRight: isMe ? Radius.circular(0) : Radius.circular(12),
              ),
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
