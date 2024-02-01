import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/presentation/providers/stream_provider.dart';


class StreamProviderScreen extends StatelessWidget {
  const StreamProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Provider'),
      ),
      body: const StreamView(),
    );
  }
}

class StreamView extends ConsumerWidget {
  const StreamView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final usersAsync = ref.watch(usersInChatProvider);

    if(usersAsync.isLoading){
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if(usersAsync.hasError){
      return Center(
        child: Text('${usersAsync.error}'),
      );
    }

    return ListView.builder(
      itemCount: usersAsync.value!.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(usersAsync.value![index]),
        );
      },
    ); 
  }
}