import 'package:get/get.dart';

import '../../presentation/pages/dashboard/dashboard_bindings.dart';
import '../../presentation/pages/dashboard/dashboard_page.dart';
import '../../presentation/ui/testwidget.dart';

final List<GetPage<dynamic>> routes = [

  GetPage(
    name: '/',
    page: () => Testwidget(),
  ),
  GetPage(
      name: '/Dashboard',
      page: () => DashboardPage(),
      binding: DashboardBinding(),
    ),

  
];
