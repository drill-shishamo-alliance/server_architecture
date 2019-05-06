import 'package:server_architecture/server_architecture.dart';

/// Service/domain層のインターフェースを定義

abstract class ISampleService {
  Future<void> sample(ManagedContext context);
}