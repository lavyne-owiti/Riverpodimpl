
abstract class WebsocketClient {
  Stream<int> getCounterStream([int start]);
}

class FakeWebsocketClient implements WebsocketClient {
  @override
  Stream<int> getCounterStream([int start =0]) async* {
    int i = start;
    while (true) {
      await Future.delayed( const Duration(milliseconds: 500));
      yield i++;
    }
  }
}


// top of main 

/*final webSocketClientProvider = Provider<WebsocketClient>((ref) {
  return FakeWebsocketClient();
});

final counterProvider = StreamProvider.family<int,int>((ref,start) {
  final wsClient = ref.watch(webSocketClientProvider);
  return wsClient.getCounterStream(start);
});
*/

// inside the counter after the buildcontext widget

 /* final AsyncValue<int> counter = ref.watch(counterProvider(5));

  child: Text(counter.when(
          data: (int value) => value, 
          error: (Object e,_)=> e, 
          loading: ()=>5,
          ).toString(),
*/
