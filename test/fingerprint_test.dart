import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFingerprintPlatform with MockPlatformInterfaceMixin {
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {}
