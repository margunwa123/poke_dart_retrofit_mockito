import 'package:dio/dio.dart';
import 'package:poke_dart/service/pokemon_service.dart';

void main(List<String> args) async {
  final response = await PokemonService(Dio()).fetchPokemon();

  print(response);
}
