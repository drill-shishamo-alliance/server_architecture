/// 定義したインターフェースの実態を書いていきます．
import 'package:aqueduct/aqueduct.dart';
import 'package:server_architecture/domain/repository/ISampleRepository.dart';
import 'package:server_architecture/server_architecture.dart';

class SampleRepositoryImpl extends ResourceController implements ISampleRepository{
  @override
  Future<void> sample(ManagedContext context) {
    // TODO: implement sample
    return null;
  }
}