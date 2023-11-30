import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../../../../core/core.dart';
import '../models/tweet_response_model.dart';

abstract class TweetLocalDataSource {
  Future<List<TweetResponseModel>> getTweets();
}

@LazySingleton(as: TweetLocalDataSource)
class TweetLocalDataSourceImpl implements TweetLocalDataSource {
  @override
  Future<List<TweetResponseModel>> getTweets() async {
    try {
      // Network call simulation with local json file asset
      // You can change this code with network call
      final result = await rootBundle.loadString('assets/json/tweet_list.json');
      await Future.delayed(const Duration(seconds: 2));
      List decodedResult = jsonDecode(result)["result"];
      List<TweetResponseModel> tweetsList =
          decodedResult.map((e) => TweetResponseModel.fromJson(e)).toList();
      return tweetsList;
    } on AppException catch (_) {
      rethrow;
    } on Exception catch (e) {
      throw DefaultAppException(message: e.toString());
    }
  }
}
