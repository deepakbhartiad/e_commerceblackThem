

import 'package:get/get.dart';
import '../App/Modules/Dasboard/Binding/DashBoardBinding.dart';
import '../App/Modules/Dasboard/Controller/DasboardController.dart';
import '../App/Modules/Dasboard/DasboardView.dart';
import 'app_routes.dart';

class AppPages{

  AppPages(_);

  static const INITIAL=Routes.DASHBOARD;

  static final routes=[

    GetPage(
        transition: Transition.cupertinoDialog,
        transitionDuration: 350.milliseconds,
        name: Routes.DASHBOARD, page:()=> DashBoardPage(),
        binding: DashBoardBinding()),

  ];
}