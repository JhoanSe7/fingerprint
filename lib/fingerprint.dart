import 'package:flutter/services.dart';

class Fingerprint {
  static const MethodChannel methodChannel = MethodChannel('fingerprint');

  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  /// Funcion para llamar al sdk y generar el objeto json de fingerprint
  static Future<String?> generate() async {
    final result = await methodChannel.invokeMethod<String>('generate');
    return result;
  }
}
