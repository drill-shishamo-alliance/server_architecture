import 'package:server_architecture/domain/repository/ISampleRepository.dart';
///
import 'package:server_architecture/domain/service/interface/ISampleService.dart';
import 'package:server_architecture/server_architecture.dart';

class SampleServiceImpl implements ISampleService {
  SampleServiceImpl(this.sampleRepository);
  ISampleRepository sampleRepository;

  @override
  Future<void> sample(ManagedContext context) async {
    // TODO: implement sample
    final result = await sampleRepository.sample(context);
    return null;
  }
}