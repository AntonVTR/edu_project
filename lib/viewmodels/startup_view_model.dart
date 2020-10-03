import 'package:edo_app/services/navigation_service.dart';

import '../locator.dart';
import 'base_model.dart';

class StartUpViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();

  Future handleStartUpLogic() async {}
}
