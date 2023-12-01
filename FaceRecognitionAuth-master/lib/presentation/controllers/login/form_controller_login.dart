import 'package:face_net_authentication/core/service/auth/auth_firebase_storage.dart';
import 'package:face_net_authentication/presentation/pages/dashboard/dashboard_page.dart';
import 'package:face_net_authentication/presentation/pages/home/home_page.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tuple/tuple.dart';
import '../../../domain/usecases/signIn_use_case.dart';
import '../../pages/dashboard/dashboard_bindings.dart';
import '../../shared/device/device_utils.dart';

class FormLoginController extends GetxController {
  FormLoginController(this._loginUseCase);

  final store = Get.put(AuthFirebaseService());
  RxString email = RxString('');
  RxString password = RxString('');
  RxnString errorText = RxnString(null);
  RxnString errorTextPass = RxnString(null);
  RxBool isFormOk = RxBool(false);
  RxBool isPasswordOk = RxBool(false);
  RxBool isEmailOk = RxBool(false);
  var loading = false.obs;

  GetStorage box = GetStorage();
  Rxn<Function()> submitFunc = Rxn<Function()>(null);

  final RegExp emailValidatorRegExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  final SignInUseCase _loginUseCase;

  @override
  void onInit() {
    super.onInit();
    fetchData();
    debounce<String>(email, validationsEmail,
        time: const Duration(milliseconds: 500));
    debounce<String>(password, validationsPassword,
        time: const Duration(milliseconds: 500));
  }

  Future<void> fetchData() async {
    print("****controller initialliser***");
    // submitFunc.value = null;
    isPasswordOk.value = false;
    isEmailOk.value = false;
    validationsformOK(true);
  }

  void validationsEmail(String val) async {
    isFormOk.value = true;
    errorText.value = null;
    isEmailOk.value = false;
    if (val.isNotEmpty && emailOK(val)) {
      isEmailOk.value = true;
      errorText.value = null;
      print('function email: ${isEmailOk.value}');
    } else {
      isEmailOk.value = false;
    }
    validationsformOK(isFormOk.value);
  }

  void validationsPassword(String val) async {
    isFormOk.value = true;
    errorTextPass.value = null;
    isPasswordOk.value = false;
    if (val.isNotEmpty) {
      if (lengthOK(val)) {
        isPasswordOk.value = true;
        errorTextPass.value = null;
        print('function password: ${isPasswordOk.value}');
      } else {
        isPasswordOk.value = false;
      }
    }
    validationsformOK(isFormOk.value);
  }

  void validationsformOK(bool val) async {
    print('function form: ${isFormOk.value}');
    if (val == true) {
      if (isPasswordOk.value == true && isEmailOk.value == true) {
        submitFunc.value = submitLoginFunction();
      } else {
        submitFunc.value = null;
      }
    }
  }

  bool lengthOK(String val, {int minLen = 6}) {
    if (val.length < minLen) {
      errorTextPass.value = 'min. 6 chars';
      return false;
    }
    return true;
  }

  bool emailOK(String val) {
    if (!emailValidatorRegExp.hasMatch(val)) {
      errorText.value = 'adresse non valide';
      return false;
    }
    return true;
  }

  void emailChanged(String val) {
    email.value = val;
    isFormOk.value = true;
    print('email ${isFormOk.value}');
  }

  void passwordChanged(String val) {
    password.value = val;
    isFormOk.value = true;
    print('password ${isFormOk.value}');
  }

  Future<bool> Function() submitLoginFunction() {
    return () async {
      await Future.delayed(const Duration(seconds: 1), () async {
        try {
          DeviceUtils.hideKeyboard(Get.context!);
          loading(true);
          await _loginUseCase
              .execute(Tuple2(email.value.trim(), password.value.trim()))
              .then((result) {
            if (result!.email != null) {
              loading(false);
              box.remove('CurrentUser');
              box.write('CurrentUser', result.toJson());
              print('ok ok ooh');
              DashboardBinding().dependencies();
              Get.to(() => HomePage());
            } else {
              loading(false);
            }
          });
        } catch (error) {
          loading(false);
          print('ok ok hum ${error.toString()}');
          //showInformationMessage(Get.context!, error: StoreError(type: "Login Information",errorMessage:"Verify your email please."));
        }
      });
      return true;
    };
  }
}
