import 'package:freezed_annotation/freezed_annotation.dart';

part 'tweet_response_model.freezed.dart';
part 'tweet_response_model.g.dart';

@freezed
class TweetResponseModel with _$TweetResponseModel {
  const factory TweetResponseModel({
    required int tweetId,
    required String tweet,
    required int likeCount,
    required int retweetCount,
    required UserResponseModel user,
  }) = _TweetResponseModel;

  factory TweetResponseModel.fromJson(Map<String, dynamic> json) =>
      _$TweetResponseModelFromJson(json);
}

@freezed
class UserResponseModel with _$UserResponseModel {
  const factory UserResponseModel({
    required int userId,
    required String username,
    required String fullname,
    required String userImage,
  }) = _UserResponseModel;

  factory UserResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UserResponseModelFromJson(json);
}
