import 'package:face_net_authentication/core/service/affectation_service.dart';
import 'package:face_net_authentication/domain/entities/user.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DashboardController extends GetxController {
  var tabIndex = 0;

  final store = Get.put(AffectationServices());

  GetStorage box = GetStorage();
  CurrentUser? userData;
  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    userData = CurrentUser.fromJson(box.read('CurrentUser'));
    print(userData?.name);
  }
}
