import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:next_top_tech/core/sources/local/local.dart';

class SecureStorage implements Local {
  SecureStorage({required this.storage});

  final FlutterSecureStorage storage;

  @override
  Future<bool> contains({required String key}) async {
    return storage.containsKey(key: key);
  }

  @override
  Future<bool?> readBool({required String key}) async {
    final query = await storage.read(key: key);
    if (query == null) {
      return null;
    }

    return query.toLowerCase() == 'true';
  }

  @override
  Future<int?> readInt({required String key}) async {
    final query = await storage.read(key: key);
    if (query == null) {
      return null;
    }

    return int.tryParse(query);
  }

  @override
  Future<double?> readDouble({required String key}) async {
    final query = await storage.read(key: key);
    if (query == null) {
      return null;
    }

    return double.tryParse(query);
  }

  @override
  Future<String?> readString({required String key}) async {
    return storage.read(key: key);
  }

  @override
  Future<dynamic> readJson({required String key}) async {
    final query = await storage.read(key: key);
    if (query == null) {
      return null;
    }

    return jsonDecode(query);
  }

  @override
  Future<void> writeBool({required String key, required bool value}) async {
    await storage.write(key: key, value: value.toString());
  }

  @override
  Future<void> writeInt({required String key, required int value}) async {
    await storage.write(key: key, value: value.toString());
  }

  @override
  Future<void> writeDouble({required String key, required double value}) async {
    await storage.write(key: key, value: value.toString());
  }

  @override
  Future<void> writeString({required String key, required String value}) async {
    await storage.write(key: key, value: value);
  }

  @override
  Future<void> writeJson({required String key, required Object value}) async {
    return storage.write(key: key, value: jsonEncode(value));
  }

  @override
  Future<void> delete({required String key}) async {
    return storage.delete(key: key);
  }

  @override
  Future<void> deleteAll() async {
    return storage.deleteAll();
  }
}
