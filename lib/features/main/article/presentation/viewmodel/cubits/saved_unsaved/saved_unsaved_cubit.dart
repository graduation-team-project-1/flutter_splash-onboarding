import 'package:app/features/main/article/presentation/viewmodel/model/data_model.dart';
import 'package:bloc/bloc.dart';

part 'saved_unsaved_state.dart';

class SavedUnsavedCubit extends Cubit<SavedUnsavedState> {
  SavedUnsavedCubit() : super(SavedUnsavedInitial());
  final List<ItemModel> _favorites = [];

  List get favorites => _favorites;

  void addToFavorites(ItemModel item) {
    favorites.add(item);
    emit(Saved());
  }

  // Remove item from favorites
  void removeFromFavorites(ItemModel item) {
    favorites.remove(item);
    emit(UnSaved());
  }
}
