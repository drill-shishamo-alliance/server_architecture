import 'package:server_architecture/server_architecture.dart';

/// インフラ層のインターフェースを定義します

abstract class ISampleRepository {
  Future<void> sample(ManagedContext context);
}