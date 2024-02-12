import 'package:auto_route/auto_route.dart';
import 'package:get_6axis_nrf52840_data/provider/model_providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_6axis_nrf52840_data/component/app_scaffold.dart';
import 'package:get_6axis_nrf52840_data/component/app_button.dart';
import 'package:get_6axis_nrf52840_data/foundation/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get_6axis_nrf52840_data/data/model/user.dart';
import 'package:get_6axis_nrf52840_data/data/model/setting.dart';
import 'package:get_6axis_nrf52840_data/util/logger.dart';

class SettingPage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double w = 400;

    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: AppScaffold(
            appBar: AppBar(
              title: const Text(""),
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
            body: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                  const SizedBox(
                    height: 80,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 50),
                      child: Text(
                        '設定',
                        style: AppText.h4,
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ]))));
  }
}
