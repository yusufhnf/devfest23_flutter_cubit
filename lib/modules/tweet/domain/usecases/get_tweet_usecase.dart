import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/core.dart';
import '../../data/models/tweet_response_model.dart';
import '../repositories/tweet_repository.dart';

@lazySingleton
class GetTweetUsecase {
  final TweetRepository tweetRepository;

  GetTweetUsecase({required this.tweetRepository});

  Future<Either<AppException, List<TweetResponseModel>>> call() async {
    final result = await tweetRepository.getTweets();
    return result.fold((error) => Left(error), (tweets) => Right(tweets));
  }
}
