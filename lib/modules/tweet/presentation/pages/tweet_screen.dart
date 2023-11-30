import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/core.dart';
import '../../../../ui/ui.dart';
import '../../data/models/tweet_response_model.dart';
import '../cubit/tweet_cubit.dart';
import '../widgets/tweet_tile.dart';

class TweetScreen extends StatelessWidget {
  const TweetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: GetIt.I<TweetCubit>(),
      child: BlocBuilder<TweetCubit, LoadListedDataState<TweetResponseModel>>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => const SizedBox.expand(),
            loading: () => const LoadingView(),
            error: (error) => CustomEmpty(
              title: "Error",
              desc: error.message,
              type: CustomEmptyType.error,
            ),
            empty: () => const CustomEmpty(
              title: "Empty",
              desc: "No Data",
              type: CustomEmptyType.empty,
            ),
            success: (items) {
              return ListView.separated(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(16.0),
                  itemBuilder: (context, index) {
                    return TweetTile(
                      tweet: items[index],
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: items.length);
            },
          );
        },
      ),
    );
  }
}
