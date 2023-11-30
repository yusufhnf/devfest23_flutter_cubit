import 'package:flutter/material.dart';

import '../../data/models/notification_response_model.dart';

class NotificationTile extends StatelessWidget {
  const NotificationTile({
    Key? key,
    required this.notification,
  }) : super(key: key);

  final NotificationResponseModel notification;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(
        Icons.notifications,
        size: 24.0,
        color: Colors.grey,
      ),
      contentPadding: EdgeInsets.zero,
      title: Text(notification.notificationText),
    );
  }
}
