import 'package:app/features/pregnant_home/presentation/manager/cubits/general_article_cubit/general_article_cubit.dart';
import 'package:app/features/pregnant_home/presentation/view/widgets/custom_article_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenralArticleListView extends StatelessWidget {
  const GenralArticleListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GeneralArticleCubit, GeneralArticleState>(
      builder: (context, state) {
        if (state is GeneralArticleSuccess) {
          return ListView.builder(
            shrinkWrap: true,
            reverse: true,
            itemCount: state.generalArticleList.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: CustomArticleItem(
                  generalArticleModel: state.generalArticleList[index],
                ),
              );
            },
          );
        } else if (state is GeneralArticleFailure) {
          return const Center(
            child: Text('Error'),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
