import 'dart:js';

import 'package:aqueduct/aqueduct.dart';
import 'package:server_architecture/application/controller/SampleController.dart';
import 'package:server_architecture/domain/service/SampleServiceImpl.dart';
import 'package:server_architecture/infrastructure/persistence/repository/SampleRepositoryImpl.dart';

import 'server_architecture.dart';

/// This type initializes an application.
///
/// Override methods in this class to set up routes and initialize services like
/// database connections. See http://aqueduct.io/docs/http/channel/.
class ServerArchitectureChannel extends ApplicationChannel {
  ManagedContext context;
  SampleServiceImpl sampleService;
  SampleRepositoryImpl sampleRepository;
  /// Initialize services in this method.
  ///
  /// Implement this method to initialize services, read values from [options]
  /// and any other initialization required before constructing [entryPoint].
  ///
  /// This method is invoked prior to [entryPoint] being accessed.
  @override
  Future prepare() async {
    logger.onRecord.listen((rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));
    final config = ServerArchitectureConfig(options.configurationFilePath);
    final dataModel = ManagedDataModel.fromCurrentMirrorSystem();
    final persistentStore = PostgreSQLPersistentStore.fromConnectionInfo(
        config.database.username,
        config.database.password,
        config.database.host,
        config.database.port,
        config.database.databaseName
    );
    context = ManagedContext(dataModel, persistentStore);
    sampleRepository = SampleRepositoryImpl();
    sampleService = SampleServiceImpl(sampleRepository);
  }

  /// Construct the request channel.
  ///
  /// Return an instance of some [Controller] that will be the initial receiver
  /// of all [Request]s.
  ///
  /// This method is invoked after [prepare].
  @override
  Controller get entryPoint {
    final router = Router();

    // Prefer to use `link` instead of `linkFunction`.
    // See: https://aqueduct.io/docs/http/request_controller/
    router
      .route("/example")
      .linkFunction((request) async {
        return Response.ok({"key": "value"});
      });

    router
      .route("/sample")
      .link(() => SampleController(context, sampleService));

    return router;
  }
}

class ServerArchitectureConfig extends Configuration {
  ServerArchitectureConfig(String path): super.fromFile(File(path));

  DatabaseConfiguration database;
}