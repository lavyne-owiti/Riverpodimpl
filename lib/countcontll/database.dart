import 'package:flutter_riverpod/flutter_riverpod.dart';

final databaseProvider = Provider<Database>((ref) => Database());

class Database {
  Future<String> getUserData() {
    return Future.delayed(const Duration(seconds: 3), () {
      return "Lavyne";
    });
  }

  late int fakeDatabase;
  Future<int> intDatabase() async {
    fakeDatabase = 0;
    return fakeDatabase;
  }

  Future<int> increment() async {
    return Future.delayed(const Duration(seconds: 3), () {
      return fakeDatabase = fakeDatabase + 1;
    });
  }

  Future<int> decrement() async {
    return Future.delayed(const Duration(seconds: 3), () {
      return fakeDatabase = fakeDatabase - 1;
    });
  }
}
