import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_impl/countcontll/provider.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(title: const Text("riverpod")),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer(
                builder: (context, WidgetRef ref, Widget? child) {
                  return ref.watch(userProvider).when(
                    data: (String value) {
                      return Text(value);
                    },
                    error: (error, stackTrace) {
                      return const Text("error");
                    },
                    loading: () {
                      return const CircularProgressIndicator();
                    },
                  );
                },
              ),
              const SizedBox(
                height: 50,
              ),
              Consumer(
                builder: (context, WidgetRef ref, Widget? child) {
                  final count = ref.watch(counterProvider);
                  return Text("Basic : $count");
                },
              ),
              const SizedBox(
                height: 50,
              ),
              Consumer(
                builder: (context, WidgetRef ref, Widget? child) {
                  // return ref.watch(counterAsyncProvider).when(
                  //   data: (int value) {
                  //     return Text("AsyncValue + $value");
                  //   },
                  //   error: (error, stackTrace) {
                  //     return const Text("error");
                  //   },
                  //   loading: () {
                  //     return const CircularProgressIndicator();
                  //   },
                  // );
                   return const CircularProgressIndicator();
                },
              ),
              // const SizedBox(
              //   child: Text("Fake database Counter"),
              // ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {
                  ref.read(counterProvider.notifier).add();
                  // ref.read(counterAsyncProvider.notifier).add();
                },
                child: const Text("Add"),
              ),
              ElevatedButton(
                onPressed: () {
                  ref.read(counterProvider.notifier).subtract();
                },
                child: const Text("Subtract"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
