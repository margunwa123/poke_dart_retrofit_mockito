import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'pokemon.g.dart';

@JsonSerializable()
class Pokemon extends Equatable {
  final String name;
  final String url;

  const Pokemon({required this.name, required this.url});

  @override
  String toString() {
    return "This is $name";
  }

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);

  @override
  List<Object?> get props => [name, url];
}
