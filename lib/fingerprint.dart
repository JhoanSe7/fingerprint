import 'package:flutter/services.dart';

class Fingerprint {
  static const MethodChannel _methodChannel = MethodChannel('fingerprint');

  Future<String?> getPlatformVersion() async {
    final version = await _methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  /// Funcion para inicializar y obtener datos de ubicacion
  static Future<void> initialize() async {
    await _methodChannel.invokeMethod<String>('initialize');
  }

  /// Funcion para llamar al sdk y generar el objeto json de fingerprint
  static Future<String?> getInfoDevice() async {
    final result = await _methodChannel.invokeMethod<String>('generate');
    return result;
  }
}
