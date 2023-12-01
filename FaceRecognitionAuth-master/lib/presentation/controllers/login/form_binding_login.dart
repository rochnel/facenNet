import 'package:face_net_authentication/data/repositories/auth_repository.dart';
import 'package:get/get.dart';
import '../../../domain/usecases/signIn_use_case.dart';
import 'form_controller_login.dart';

class FormLoginBinding extends Bindings {
 
  
  @override
  void dependencies() {
    Get.lazyPut(()=> AuthenticationRepositoryIml());
    Get.lazyPut(() => SignInUseCase(Get.find<AuthenticationRepositoryIml>()));
    Get.put(FormLoginController(Get.find()), permanent: true);
  }
}
