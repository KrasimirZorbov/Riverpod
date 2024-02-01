import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/presentation/providers/future_providers.dart';


class FamilyFutureScreen extends ConsumerStatefulWidget {
  const FamilyFutureScreen({super.key});

  @override
  FamilyFutureScreenState createState() => FamilyFutureScreenState();
}

class FamilyFutureScreenState extends ConsumerState<FamilyFutureScreen> {
  int pokemonId = 3;
  @override
  Widget build(BuildContext context) {
    final pokemonAsync = ref.watch(pokemonProvider(pokemonId));
    return Scaffold(
      appBar: AppBar(
        title: Text('Family Future Provider $pokemonId'),
      ),
      body: Center(
        child: pokemonAsync.when(
          data: (pokemon) => Text(pokemon),
          loading: () => const CircularProgressIndicator(),
          error: (error, stackTrace) => Text('Error: $error'),
        )
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'refresh',
            child: const Icon( Icons.exposure_minus_1_outlined ),
            onPressed: () { 
              if(pokemonId <= 1) return;
                pokemonId--;
                setState(() {});
             },
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: 'previous',
            child: const Icon( Icons.plus_one_rounded ),
            onPressed: () { 
              pokemonId++;
                setState(() {});
             },
          ),
        ],
      ),
    );
  }
}