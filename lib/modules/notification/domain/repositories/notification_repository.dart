import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../../data/models/notification_response_model.dart';

abstract class NotificationRepository {
  Future<Either<AppException, List<NotificationResponseModel>>>
      getNotifications();
}
