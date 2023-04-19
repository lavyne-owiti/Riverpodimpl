import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_impl/countcontll/database.dart';

// user provider for the app
final userProvider = FutureProvider<String>((ref) async {
  var database = ref.read(databaseProvider);
  return database.getUserData();
});

// counter state notifer for the app
final counterProvider =
    StateNotifierProvider<CounterController, int>((ref) => CounterController());

class CounterController extends StateNotifier<int> {
  CounterController() : super(0);

  void add() {
    state = state + 1;
  }

  void subtract() {
    state = state - 1;
  }
}

// async statenotifier provoder for state that doesn't change in real time
// final counterAsyncProvider =
//     StateNotifierProvider<CounterAsyncController, AsyncValue<int>>(
//         (ref) => CounterAsyncController(ref.read(databaseProvider)));

// class CounterAsyncController extends StateNotifier<AsyncValue<int>> {
//   CounterAsyncController(this.read) : super(const AsyncLoading()) {
//     _init();
//   }

//   final Reader read;

//   void _init() async {
//     await read(databaseProvider).initDatabase();
//     state = const AsyncData(0);
//   }

//   void add() {
//     state = const AsyncLoading();
//     int count = read(databaseProvider).increment();
//     state = AsyncData(count);
//   }

//   void subtract() {
//     state = const AsyncLoading();
//     int count = read(databaseProvider).decrement();
//     state = AsyncData(count);
//   }
// }
