import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/core.dart';
import '../../data/models/notification_response_model.dart';
import '../../domain/usecases/get_notification_usecase.dart';

@lazySingleton
class NotificationCubit extends LoadListedDataCubit<NotificationResponseModel> {
  NotificationCubit({required GetNotificationUsecase getNotificationUsecase})
      : _getNotificationUsecase = getNotificationUsecase;

  final GetNotificationUsecase _getNotificationUsecase;

  @override
  Future<Either<AppException, List<NotificationResponseModel>>>
      fetchData() async {
    return await _getNotificationUsecase();
  }
}
