

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/config/config.dart';

part 'future_providers.g.dart';


@Riverpod(keepAlive: true)
Future<String> pokemonName(PokemonNameRef ref) async {
  final pokemonId = ref.watch(pokemonIdProvider);
  final pokemonName = await PokemonInformation.getPokemonName(pokemonId);
  
  ref.onDispose(() { print('FutureProvider disposed');});
  return pokemonName;
}

@Riverpod(keepAlive: true)
class PokemonId extends _$PokemonId {
  @override
  int build() {
    return 1;
  }

  void nextPokemon(){
    state = state + 1;
  }

  void previousPokemon(){
    if (state > 1){
      state = state - 1;
    }
  }
}

@Riverpod(keepAlive: true)
Future<String> pokemon(PokemonRef ref, int pokemonId) async{
  final pokemonName = await PokemonInformation.getPokemonName(pokemonId);
  return pokemonName;
}