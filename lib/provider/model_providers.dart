import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:get_6axis_nrf52840_data/provider/ble_provider.dart";
import "package:get_6axis_nrf52840_data/provider/user_provider.dart";
import "package:get_6axis_nrf52840_data/provider/setting_provider.dart";

final bleProvider = ChangeNotifierProvider<BleNotifier>((ref) {
  return BleNotifier(ref);
});

final settingProvider = ChangeNotifierProvider<SettingNotifier>((ref) {
  return SettingNotifier(ref);
});

final userProvider = ChangeNotifierProvider<UserNotifier>((ref) {
  return UserNotifier(ref);
});
