import 'package:flutter/services.dart';

class Fingerprint {
  static const MethodChannel _methodChannel = MethodChannel('fingerprint');

  Future<String?> getPlatformVersion() async {
    final version = await _methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  /// Funcion para llamar al sdk y generar el objeto json de fingerprint
  static Future<String?> getInfoDevice() async {
    final result = await _methodChannel.invokeMethod<String>('generate');
    return result;
  }
}
