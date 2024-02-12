import 'dart:async';
import "dart:convert";
import 'dart:math';
import 'package:flutter/foundation.dart';
import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:get_6axis_nrf52840_data/util/logger.dart';
import 'package:get_6axis_nrf52840_data/util/func.dart';

//生データのクラス
class MeasureRawData {
  List<double> timeList = [];
  List<double> acc_xList = [];
  List<double> acc_yList = [];
  List<double> acc_zList = [];
  List<double> gyr_xList = [];
  List<double> gyr_yList = [];
  List<double> gyr_zList = [];

  String csvTextData = "";
  int cnt = 0;
  DateTime now = DateTime.now();

  void update(List<int> value) {
    List<int> rawEMG = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
    cnt = value[2] | value[3] << 8 | value[4] << 16 | value[5] << 24;
    int accRange = value[6] | value[7] << 8;
    int gyrRange = value[8] | value[9] << 8;
    int gyrRangeDiv = (gyrRange / 125).toInt();
    if (gyrRange == 245) gyrRangeDiv = 2;
    double acc_x = (value[10] | value[11] << 8).toDouble();
    double acc_y = (value[12] | value[13] << 8).toDouble();
    double acc_z = (value[14] | value[15] << 8).toDouble();
    double gyr_x = (value[16] | value[17] << 8).toDouble();
    double gyr_y = (value[18] | value[19] << 8).toDouble();
    double gyr_z = (value[20] | value[21] << 8).toDouble();
    if (acc_x > 32768) acc_x -= 65536;
    if (acc_y > 32768) acc_y -= 65536;
    if (acc_z > 32768) acc_z -= 65536;
    if (gyr_x > 32768) gyr_x -= 65536;
    if (gyr_y > 32768) gyr_y -= 65536;
    if (gyr_z > 32768) gyr_z -= 65536;
    acc_x = acc_x * 0.061 * (accRange >> 1) / 1000;
    acc_y = acc_y * 0.061 * (accRange >> 1) / 1000;
    acc_z = acc_z * 0.061 * (accRange >> 1) / 1000;
    gyr_x = gyr_x * 4.375 * gyrRangeDiv / 1000;
    gyr_y = gyr_y * 4.375 * gyrRangeDiv / 1000;
    gyr_z = gyr_z * 4.375 * gyrRangeDiv / 1000;

    timeList.add((cnt) / 100.0);
    acc_xList.add(acc_x);
    acc_yList.add(acc_y);
    acc_zList.add(acc_z);
    gyr_xList.add(gyr_x);
    gyr_yList.add(gyr_y);
    gyr_zList.add(gyr_z);
    csvTextData +=
        '${cnt},${acc_x},${acc_y},${acc_z},${gyr_x},${gyr_y},${gyr_z}\n';
    if (cnt > 0) {}
  }

  //データの初期化
  void initialize() {
    csvTextData = "cnt,acc_x,acc_y,acc_z,gyro_x,gyro_x,gyro_y,gyro_z\n";
    now = DateTime.now();
    cnt = 0;
    timeList.clear();
    acc_xList.clear();
    acc_yList.clear();
    acc_zList.clear();
    gyr_xList.clear();
    gyr_yList.clear();
    gyr_zList.clear();
  }
}
