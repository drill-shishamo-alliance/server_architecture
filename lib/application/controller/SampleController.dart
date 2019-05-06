import 'package:aqueduct/aqueduct.dart';
import 'package:server_architecture/application/controller/interface/ISampleController.dart';
import 'package:server_architecture/domain/model/Sample.dart';
import 'package:server_architecture/domain/service/interface/ISampleService.dart';
import 'package:server_architecture/server_architecture.dart';

class SampleController extends QueryController<Sample> implements ISampleController {
  SampleController(ManagedContext context, this.sampleService): super(context);
  final ISampleService sampleService;

  @override
  Future<Response> sample(ManagedContext context) async {
    // TODO: implement sample
    final result = await sampleService.sample(context);
    return Response.ok(null);
  }
}