part of 'home_directory_cubit.dart';



mixin _HomeDirectoryCubitMixin on Cubit<HomeDirectoryState>{
  bool isAlreadyExist(
      List<FavoritesDirectoryModel?>? favoriteDirectoryModel,
      BaseDirectoryModel directoryModel,
      ) {
    final isAlreadyExist =
    favoriteDirectoryModel!.any((element) {
      final item = element?.directoryModel?.id;
      if(item == null) return true;
      return element?.directoryModel?.id == directoryModel.id;
    });
    return isAlreadyExist;
  }



}