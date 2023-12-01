import 'package:face_net_authentication/core/service/users/user_firebase_service.dart';
import 'package:get/get.dart';
import '../../domain/repositories/user_repository.dart';

class UserRepositoryIml extends UserRepository {
  final store = Get.put(UserFirebaseService());
  @override
  Future<bool> addToFavoritesPost(String annonceId) {
    return store.addToFavoritesPost(annonceId);
  }

  @override
  Future<bool> removeToFavoritesPost(String annonceId) {
    return store.removeToFavoritesPost(annonceId);
  }
   @override
  Future<bool> getPostIsFavoriteByUser(String annonceId) {
    return store.getPostIsFavoriteByUser(annonceId);
  }
}