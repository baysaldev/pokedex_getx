// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex_getx/model/pokemeon_model.dart';
import 'package:pokedex_getx/services/pokedex_api.dart';
import 'package:pokedex_getx/widgets/pokelist_item.dart';

class PokemonList extends StatefulWidget {
  PokemonList({Key? key}) : super(key: key);

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  late Future<List<PokemonModel>> _pokemonListFuture;
//kullancağımızı şuan initilaize etmedik ama kullanmdan hemen önce initialize edeceğiz anlamına gelir

//initstate bikere çalışacağı için tekrar tekrr web sitesinden api çekmeyle uğraşma
  @override
  void initState() {
    super.initState();
    _pokemonListFuture = PokeApi.getPokemonData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PokemonModel>>(
      future: _pokemonListFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<PokemonModel> _listem = snapshot.data!;

          return GridView.builder(
              itemCount: 50,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      ScreenUtil().orientation == Orientation.portrait ? 2 : 3),
              itemBuilder: (context, index) {
                debugPrint('item builder çalıştı');
                return PokeListItem(pokemon: _listem[index]);
              });
        } else if (snapshot.hasError) {
          return Center(
            child: Text("text2").tr(),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}












/*ListView.builder(
            itemCount: _listem.length,
            itemBuilder: (context, index) {
              var oankiPokemon = _listem[index];

              return PokeListItem(pokemon: oankiPokemon);
            },
          ); */