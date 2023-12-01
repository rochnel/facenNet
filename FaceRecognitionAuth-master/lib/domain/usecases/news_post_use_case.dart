/*
import 'package:karkoo/domain/entities/post.dart';
import 'package:karkoo/domain/repositories/post_repositories.dart';
import 'package:tuple/tuple.dart';

import '../../app/core/usecases/pram_usecase.dart';
import '../entities/paging.dart';
import '../repositories/article_repository.dart';

class NewsPostUseCase extends ParamUseCase<Post, Tuple13<int, String, String, String, String, String, String, String, String,String,String, double, bool>> {
  final PostRepository _repo;
  NewsPostUseCase(this._repo);

  @override
  Future<Post> execute(Tuple7 param) {
    return _repo.newPost(param.item1, param.item2, param.item3,param.item4, param.item5, param.item6, param.item7);
  }
}
*/