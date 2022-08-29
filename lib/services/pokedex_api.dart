import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:pokedex_getx/model/pokemeon_model.dart';

//internetten çekeceğimiz veri kodalrını bu alana yazıyoruz widgetlar sade biçimde kalsın diye((internnetten veri getirmeye yarar))
//static tanımlıyoruz çünkü herhangi bir nesne üretmeden burdan ulaşabiliriz

class PokeApi {
  static const String _url =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-pokedex/master/pokedex.json";

  static Future<List<PokemonModel>> getPokemonData() async {
    List<PokemonModel> _list = [];

//Dio static tanımladığımı _url kısmına URli çekip eklememizi sağlar
    var result = await Dio().get(_url); //bu alan ile verileri getiridk
    var pokeList = jsonDecode(result.data)[
        "pokemon"]; //bu alan ile yazdırdık text olarak //bu alan ilede list haline döndürdük

    if (pokeList is List) {
      _list = pokeList.map((e) => PokemonModel.fromJson(e)).toList();
    } else {
      return [];
    }

    return _list;
  }
}
