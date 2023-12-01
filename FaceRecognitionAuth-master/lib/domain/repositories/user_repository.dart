

abstract class UserRepository {
  Future<bool> addToFavoritesPost(String annonceId);
  Future<bool> removeToFavoritesPost(String annonceId);
  Future<bool> getPostIsFavoriteByUser(String annonceId);

  
}