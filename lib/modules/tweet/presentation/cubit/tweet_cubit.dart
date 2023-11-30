import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/core.dart';
import '../../data/models/tweet_response_model.dart';
import '../../domain/usecases/get_tweet_usecase.dart';

@lazySingleton
class TweetCubit extends LoadListedDataCubit<TweetResponseModel> {
  TweetCubit({required GetTweetUsecase getTweetUsecase})
      : _getTweetUsecase = getTweetUsecase;

  final GetTweetUsecase _getTweetUsecase;

  @override
  Future<Either<AppException, List<TweetResponseModel>>> fetchData() async {
    return await _getTweetUsecase();
  }
}
