import 'package:flutter/material.dart';

class NotificationModel with ChangeNotifier {
  final List<Map<String, String>> _notifications = [];

  List<Map<String, String>> get notifications => _notifications;

  void addNotification(Map<String, String> notification) {
    _notifications.add(notification);
    notifyListeners();
  }
}
