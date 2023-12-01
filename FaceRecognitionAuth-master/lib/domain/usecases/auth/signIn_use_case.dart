import 'package:face_net_authentication/core/usecases/pram_usecase.dart';
import 'package:tuple/tuple.dart';
import '../../entities/user.dart';
import '../../repositories/auth_repository.dart';



class SignInUseCase extends ParamUseCase<CurrentUser? , Tuple2<String, String>> {
  final AuthenticationRepository _repo;
  SignInUseCase(this._repo);

  @override
  Future<CurrentUser? > execute(Tuple2 param) {
    return _repo.signIn(param.item1, param.item2);
  }
}