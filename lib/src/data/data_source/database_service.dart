import 'dart:io';

import 'package:mysql_client/mysql_client.dart';

/// Connects to the database
/// execute passed queries  by [execute]
class DatabaseService {
  /// the appp consumes only one instance during its lifetime
  factory DatabaseService() {
    return _inst;
  }

  DatabaseService._internal() {
    _connect();
  }
  static final DatabaseService _inst = DatabaseService._internal();

  MySQLConnection? _connection;

  Future<void> _connect() async {
    try {
      _connection = await MySQLConnection.createConnection(
        host: '127.0.0.1',
        port: 3306,
        userName: 'root',
        password: 'Doudy2k23!',
        databaseName: 'isimm',
      );
      await _connection?.connect();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  ///
  Future<IResultSet> execute(
    String query, {
    Map<String, dynamic>? params,
    bool iterable = false,
  }) async {
    if (_connection == null || _connection?.connected == false) {
      await _connect();
    }
    if (_connection?.connected == false) {
      throw Exception('unkown error: connection');
    }
    return _connection!.execute(query, params, iterable);
  }
}
