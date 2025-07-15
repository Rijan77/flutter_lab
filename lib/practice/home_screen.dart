
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterPage extends ConsumerWidget {
   CounterPage({super.key});

  final counterProvider = StateProvider<int>((ref){
    return 0;
  });
  
  final switchProvider = StateProvider<bool>((ref){
    return false;
});

  @override
  Widget build(BuildContext context, WidgetRef ref) {// watch the counter state
    print("Build1");
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod Counter App'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer(builder: (context, ref, child){
              final counter = ref.watch(counterProvider);
              print("Build 3");
              return Center(
                child:
                  Text("Count: $counter")
              );

            }),
            
            Consumer(builder: (context, ref, chiild){
              final counter = ref.watch(switchProvider);
              print("Build5");
              
              return Switch(value: counter, onChanged: (value){
                ref.read(switchProvider.notifier).state = value;
              });
            }),


            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ref.read(counterProvider.notifier).state = 0; // reset counter
              },
              child: const Text('Reset Counter'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).state++; // increment counter
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
