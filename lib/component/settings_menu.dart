import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_6axis_nrf52840_data/foundation/app_color.dart';
import 'package:get_6axis_nrf52840_data/foundation/app_text_theme.dart';
import 'package:get_6axis_nrf52840_data/component/app_scaffold.dart';
import 'package:get_6axis_nrf52840_data/foundation/database_const.dart';
import 'package:get_6axis_nrf52840_data/component/settings_menu_item.dart';
import "package:get_6axis_nrf52840_data/provider/model_providers.dart";
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingsMenu extends ConsumerWidget {
  const SettingsMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      backgroundColor: Colors.transparent,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          AppScaffold(
            appBar: AppBar(
              elevation: 0.0,
              centerTitle: false,
              title: Text(
                '',
                style: AppText.title.bold(),
                textAlign: TextAlign.left,
              ),
              automaticallyImplyLeading: false,
            ),
            body: SafeArea(
              child: Container(
                margin: const EdgeInsets.only(bottom: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        Container(
                          height: 16.0,
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: AppColor.white10),
                            ),
                          ),
                        ),
                        SettingMenuItem(
                          title: '設定',
                          onTap: () => {context.router.pushNamed("/setting")},
                        ),
                        Container(
                          height: 16.0,
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: AppColor.white10),
                            ),
                          ),
                        ),
                        SettingMenuItem(
                          title: 'ヘルプ',
                          onTap: () => {},
                        ),
                        SettingMenuItem(
                          title: 'コピーライト',
                          onTap: () => {},
                        ),
                        SettingMenuItem(
                          title: '利用規約',
                          onTap: () => {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
