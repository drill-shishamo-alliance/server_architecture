import 'package:aqueduct/aqueduct.dart';

abstract class ISampleController {
  Future<Response> sample(ManagedContext context);
}