import 'package:auto_route/auto_route.dart';
import 'package:get_6axis_nrf52840_data/view/raw_data_measure_page.dart';
import 'package:get_6axis_nrf52840_data/view/setting_page.dart';
import 'package:get_6axis_nrf52840_data/view/top_page.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(path: "/", page: TopPage, initial: true),
    AutoRoute(path: "/raw_data_measure", page: RawDataMeasurePage),
    AutoRoute(path: "/setting", page: SettingPage),
  ],
)
class $AppRouter {}
