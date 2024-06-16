part of 'general_article_cubit.dart';

sealed class GeneralArticleState extends Equatable {
  const GeneralArticleState();

  @override
  List<Object> get props => [];
}

final class GeneralArticleInitial extends GeneralArticleState {}

final class GeneralArticleLoading extends GeneralArticleState {}

final class GeneralArticleSuccess extends GeneralArticleState {
  final List<GeneralArticleModel> generalArticleList;

  const GeneralArticleSuccess(this.generalArticleList);
}

final class GeneralArticleFailure extends GeneralArticleState {
  final String errorMessage;

  const GeneralArticleFailure({required this.errorMessage});
}
