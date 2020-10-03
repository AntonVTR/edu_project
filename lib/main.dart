import 'package:edo_app/services/dialog_service.dart';
import 'package:edo_app/services/navigation_service.dart';
import 'package:edo_app/ui/views/role_select.dart';
import 'package:flutter/material.dart';

import 'locator.dart';
import 'managers/dialog_manager.dart';
import 'ui/views/home/startup_view.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Salary',
      theme: ThemeData(
        primaryColor: Color(0xff19c7c1),
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'Open Sans',
            ),
      ),
      builder: (context, child) => Navigator(
        key: locator<DialogService>().dialogNavigationKey,
        onGenerateRoute: (settings) => MaterialPageRoute(
            builder: (context) => DialogManager(child: child)),
      ),
      navigatorKey: locator<NavigationService>().navigationKey,
      home: RoleSelectView(),
      //onGenerateRoute: generateRoute,
    );
  }
}
