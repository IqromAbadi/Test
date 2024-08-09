import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:pt_biis_griya_nadi/app/Service/api_service.dart';
import 'package:pt_biis_griya_nadi/app/models/user_model.dart';

class UserController extends GetxController {
  var users = <User>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  void fetchUsers() async {
    isLoading(true);
    var fetchedUsers = await ApiServiceReqresin().fetchUsers();
    if (fetchedUsers.isNotEmpty) {
      users.assignAll(fetchedUsers);
    }
    isLoading(false);
  }

  void addUser(User user) {
    users.add(user);
  }
}
