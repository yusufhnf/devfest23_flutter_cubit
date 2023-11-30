import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../../../../core/core.dart';
import '../models/notification_response_model.dart';

abstract class NotificationLocalDataSource {
  Future<List<NotificationResponseModel>> getNotifications();
}

@LazySingleton(as: NotificationLocalDataSource)
class NotificationLocalDataSourceImpl implements NotificationLocalDataSource {
  @override
  Future<List<NotificationResponseModel>> getNotifications() async {
    try {
      // Network call simulation with local json file asset
      // You can change this code with network call
      final result =
          await rootBundle.loadString('assets/json/notification_list.json');
      await Future.delayed(const Duration(seconds: 2));
      List decodedResult = jsonDecode(result)["result"];
      List<NotificationResponseModel> notificationsList = decodedResult
          .map((e) => NotificationResponseModel.fromJson(e))
          .toList();
      return notificationsList;
    } on AppException catch (_) {
      rethrow;
    } on Exception catch (e) {
      throw DefaultAppException(message: e.toString());
    }
  }
}
