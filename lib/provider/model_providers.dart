import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:get_6axis_nrf52840_data/provider/ble_provider.dart";

final bleProvider = ChangeNotifierProvider<BleNotifier>((ref) {
  return BleNotifier(ref);
});
