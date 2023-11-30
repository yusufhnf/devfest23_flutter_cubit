import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/core.dart';
import '../../domain/repositories/notification_repository.dart';
import '../datasources/notification_local_data_source.dart';
import '../models/notification_response_model.dart';

@LazySingleton(as: NotificationRepository)
class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationLocalDataSource localDataSource;

  NotificationRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<AppException, List<NotificationResponseModel>>>
      getNotifications() async {
    try {
      final result = await localDataSource.getNotifications();
      return Right(result);
    } on DefaultAppException catch (e) {
      return Left(e);
    }
  }
}
