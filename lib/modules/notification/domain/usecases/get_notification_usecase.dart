import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/core.dart';
import '../../data/models/notification_response_model.dart';
import '../repositories/notification_repository.dart';

@lazySingleton
class GetNotificationUsecase {
  final NotificationRepository notificationRepository;

  GetNotificationUsecase({required this.notificationRepository});

  Future<Either<AppException, List<NotificationResponseModel>>> call() async {
    final result = await notificationRepository.getNotifications();
    return result.fold(
        (error) => Left(error), (notifications) => Right(notifications));
  }
}
