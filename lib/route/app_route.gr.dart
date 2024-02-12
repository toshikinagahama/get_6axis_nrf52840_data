// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:get_6axis_nrf52840_data/view/raw_data_measure_page.dart' as _i2;
import 'package:get_6axis_nrf52840_data/view/setting_page.dart' as _i3;
import 'package:get_6axis_nrf52840_data/view/top_page.dart' as _i1;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    TopRoute.name: (routeData) {
      return _i4.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.TopPage(),
      );
    },
    RawDataMeasureRoute.name: (routeData) {
      return _i4.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.RawDataMeasurePage(),
      );
    },
    SettingRoute.name: (routeData) {
      return _i4.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i3.SettingPage(),
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          TopRoute.name,
          path: '/',
        ),
        _i4.RouteConfig(
          RawDataMeasureRoute.name,
          path: '/raw_data_measure',
        ),
        _i4.RouteConfig(
          SettingRoute.name,
          path: '/setting',
        ),
      ];
}

/// generated route for
/// [_i1.TopPage]
class TopRoute extends _i4.PageRouteInfo<void> {
  const TopRoute()
      : super(
          TopRoute.name,
          path: '/',
        );

  static const String name = 'TopRoute';
}

/// generated route for
/// [_i2.RawDataMeasurePage]
class RawDataMeasureRoute extends _i4.PageRouteInfo<void> {
  const RawDataMeasureRoute()
      : super(
          RawDataMeasureRoute.name,
          path: '/raw_data_measure',
        );

  static const String name = 'RawDataMeasureRoute';
}

/// generated route for
/// [_i3.SettingPage]
class SettingRoute extends _i4.PageRouteInfo<void> {
  const SettingRoute()
      : super(
          SettingRoute.name,
          path: '/setting',
        );

  static const String name = 'SettingRoute';
}
