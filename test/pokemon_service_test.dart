import 'dart:math';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import 'package:poke_dart/model/fetch_pokemon_response.dart';
import 'package:poke_dart/model/pokemon.dart';
import 'package:poke_dart/service/pokemon_service.dart';

import 'pokemon_service_test.mocks.dart';

@GenerateMocks([PokemonService])
void main() {
  group("#fetchPokemon", () {
    late PokemonService service;

    setUp(() {
      service = MockPokemonService();
    });

    test('Fetch Pokemon Successfull Call', () async {
      final randomListOfPokemon = List.generate(10, (_) => randomPokemon());

      when(service.fetchPokemon()).thenAnswer((realInvocation) async =>
          FetchPokemonResponse(count: 15, results: randomListOfPokemon));

      final expected =
          FetchPokemonResponse(count: 15, results: randomListOfPokemon);

      expect(await service.fetchPokemon(), expected);
    });
  });
}

final random = Random();

Pokemon randomPokemon() {
  final id = random.nextInt(100);

  return Pokemon(
      name: "Pokemon #$id", url: "https://pokeapi.co/api/v2/pokemon/$id");
}
