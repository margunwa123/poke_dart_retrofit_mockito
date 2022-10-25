import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:poke_dart/model/fetch_pokemon_response.dart';

part 'pokemon_service.g.dart';

@RestApi(baseUrl: "https://pokeapi.co/api/v2")
abstract class PokemonService {
  factory PokemonService(Dio dio, {String baseUrl}) = _PokemonService;

  @GET("/pokemon")
  Future<FetchPokemonResponse> fetchPokemon({@DioOptions() Options? options});
}
