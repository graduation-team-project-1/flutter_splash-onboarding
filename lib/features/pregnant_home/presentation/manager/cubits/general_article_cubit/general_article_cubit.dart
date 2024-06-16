import 'package:app/features/pregnant_home/data/models/general_article_model.dart';
import 'package:app/features/pregnant_home/data/repos/home_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'general_article_state.dart';

class GeneralArticleCubit extends Cubit<GeneralArticleState> {
  GeneralArticleCubit(this.homeRepo) : super(GeneralArticleInitial());
final HomeRepo homeRepo;
  Future<void> fetchGeneralArticle() async {
    emit(GeneralArticleLoading());
    var generalArticleModel = await homeRepo.fetchGeneralArticles();

    generalArticleModel.fold(
        (failure) => emit(GeneralArticleFailure(errorMessage: failure.errMessage)),
        (generalArticle) => emit(GeneralArticleSuccess(generalArticle)));
  }
}






