import 'package:drift/drift.dart';

export 'connection_native.dart' if (dart.library.js_interop) 'connection_web.dart';

/// Implemented by both connection_native.dart and connection_web.dart.
typedef ConnectionOpener = QueryExecutor Function();
