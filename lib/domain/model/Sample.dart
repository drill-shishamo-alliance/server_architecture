import 'package:aqueduct/aqueduct.dart';
import 'package:server_architecture/server_architecture.dart';

class Sample extends ManagedObject<_Sample> implements _Sample {
  @override
  void willUpdate() {
    updatedAt = DateTime.now().toUtc();
  }

  @override
  void willInsert() {
    createdAt = DateTime.now().toUtc();
    updatedAt = DateTime.now().toUtc();
  }
}

class _Sample {
  @primaryKey
  int id;

  @Column(indexed: true)
  DateTime createdAt;

  @Column(indexed: true)
  DateTime updatedAt;
}