import 'package:flutter_hooks/flutter_hooks.dart';
import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:get_6axis_nrf52840_data/component/app_scaffold.dart';
import 'package:get_6axis_nrf52840_data/foundation/app_color.dart';
import 'package:get_6axis_nrf52840_data/component/app_button.dart';
import 'package:get_6axis_nrf52840_data/provider/measure_result_provider.dart';
import 'package:get_6axis_nrf52840_data/provider/user_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_6axis_nrf52840_data/util/logger.dart';
import 'package:get_6axis_nrf52840_data/foundation/setting.dart';
import 'package:get_6axis_nrf52840_data/foundation/database_const.dart';
import 'package:get_6axis_nrf52840_data/provider/database_provider.dart';
import 'package:vibration/vibration.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TopPage extends HookConsumerWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final measureData = ref.watch(measureResultProvider);
    double w = 600;
    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: AppScaffold(
          appBar: AppBar(
              title: const Text(""),
              elevation: 0,
              backgroundColor: Colors.transparent,
              actions: []),
          body: SingleChildScrollView(
            child: measureData.when(
              loading: () => const CircularProgressIndicator(),
              error: (err, stack) => Text("Error: $err"),
              data: (measureData) {
                logger.i(measureData);
                return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 120,
                      ),
                      Container(
                        width: w * 0.4,
                        height: 240,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(70, 0, 0, 0), //色
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(1, 1),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      AppButton(
                        text: "生データ測定",
                        onPressed: () {
                          context.router.pushNamed("/raw_data_measure");
                        },
                        width: w * 0.6,
                      ),
                      const SizedBox(height: 20),
                      AppButton(
                        text: "設定",
                        onPressed: () {
                          context.router.pushNamed("/setting");
                        },
                        width: w * 0.6,
                      ),
                    ]);
              },
            ),
          ),
        ));
  }
}
