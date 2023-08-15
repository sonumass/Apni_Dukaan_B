import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:mcsofttech/ui/module/profile/profile_page.dart';

class AccountRoutes {
  AccountRoutes._();

  static List<GetPage> get routes => [
        GetPage(name: EditProfile.routeName, page: () => EditProfile()),
      ];
}
