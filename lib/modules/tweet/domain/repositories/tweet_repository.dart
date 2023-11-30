import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../../data/models/tweet_response_model.dart';

abstract class TweetRepository {
  Future<Either<AppException, List<TweetResponseModel>>> getTweets();
}
