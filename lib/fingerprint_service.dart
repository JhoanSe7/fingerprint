import 'dart:convert';

import 'package:fingerprint/model/fingerprint_data_model.dart';
import 'package:flutter/material.dart';

import 'fingerprint.dart';

class FingerprintService {
  static Future<FingerprintDataModel?> generate() async {
    try {
      final data = await Fingerprint.getInfoDevice();
      return FingerprintDataModel.fromJson(jsonDecode(data ?? ""));
    } catch (e) {
      debugPrint("Couldn't be decoded: $e");
    }
    return null;
  }
}
