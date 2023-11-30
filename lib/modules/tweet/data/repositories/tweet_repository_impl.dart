import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/core.dart';
import '../../domain/repositories/tweet_repository.dart';
import '../datasources/tweet_local_data_source.dart';
import '../models/tweet_response_model.dart';

@LazySingleton(as: TweetRepository)
class TweetRepositoryImpl implements TweetRepository {
  final TweetLocalDataSource localDataSource;

  TweetRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<AppException, List<TweetResponseModel>>> getTweets() async {
    try {
      final result = await localDataSource.getTweets();
      return Right(result);
    } on DefaultAppException catch (e) {
      return Left(e);
    }
  }
}
