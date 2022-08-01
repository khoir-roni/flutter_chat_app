import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble(this.message, this.username, this.userImage, this.isMe,
      {Key key})
      : super(key: key);

  final String message;
  final String username;
  final String userImage;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    TextStyle messageStyle = theme.textTheme.bodyText1.copyWith(
      color: isMe ? Colors.black : theme.colorScheme.onSecondary,
      fontSize: 12,
    );
    TextStyle userStyle = theme.textTheme.bodyLarge.copyWith(
      fontWeight: FontWeight.bold,
      color: isMe ? Colors.black : theme.colorScheme.onSecondary,
      // fontSize: 12,
    );

    return Stack(
      children: [
        Row(
          mainAxisAlignment:
              isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: isMe
                    ? Colors.grey[300]
                    : Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(12),
                  topRight: const Radius.circular(12),
                  bottomLeft: !isMe
                      ? const Radius.circular(0)
                      : const Radius.circular(12),
                  bottomRight: isMe
                      ? const Radius.circular(0)
                      : const Radius.circular(12),
                ),
              ),
              width: 140,
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 16,
              ),
              margin: const EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 8,
              ),
              child: Column(
                crossAxisAlignment:
                    isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  Text(username, style: userStyle),
                  Text(
                    message,
                    style: messageStyle,
                    textAlign: isMe ? TextAlign.end : TextAlign.start,
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: -4,
          left: isMe ? null : 120,
          right: isMe ? 120 : null,
          child: CircleAvatar(
            backgroundImage: NetworkImage(userImage),
          ),
        ),
      ],
      clipBehavior: Clip.none,
    );
  }
}
