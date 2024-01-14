import 'package:get/get.dart';
import 'package:tecom/utils/helpers/network_manager.dart';

import '../features/authentication/controllers/forget_password/forget_password_controller.dart';

class GeneralBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(NetworkManager());
    //Get.lazyPut(()=>ForgetPasswordController(), fenix: true);
  }
}