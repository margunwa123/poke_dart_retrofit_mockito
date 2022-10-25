import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

import 'package:poke_dart/model/pokemon.dart';

part 'fetch_pokemon_response.g.dart';

@JsonSerializable()
class FetchPokemonResponse extends Equatable {
  final int count;
  final String? next;
  final String? previous;
  final List<Pokemon> results;

  const FetchPokemonResponse({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  @override
  String toString() {
    return "First Page:\n${results.join("\n")}\n...\nTotal $count Pokemons";
  }

  factory FetchPokemonResponse.fromJson(Map<String, dynamic> json) =>
      _$FetchPokemonResponseFromJson(json);

  @override
  List<Object?> get props => [results, count, next, previous];
}
