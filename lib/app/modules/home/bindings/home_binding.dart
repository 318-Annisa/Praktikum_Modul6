import 'package:cake_baru/app/modules/home/controllers/AcoountController.dart';
import 'package:cake_baru/app/modules/home/controllers/ClientController.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ClientController>(ClientController());
    Get.put<AccountController>(AccountController());
  }
}
