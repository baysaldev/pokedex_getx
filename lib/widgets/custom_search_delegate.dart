// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pokedex_getx/model/pokemeon_model.dart';
import 'package:pokedex_getx/widgets/pokelist_item.dart';

class CustomSearchDelegate extends SearchDelegate {
  final List<PokemonModel> allPokemonModel;

  CustomSearchDelegate({required this.allPokemonModel});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query.isEmpty ? null : query = "";
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return GestureDetector(
      onTap: () {
        close(context, null);
      },
      child: Icon(
        Icons.arrow_back_ios,
        color: Colors.yellow,
        size: 24,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<PokemonModel> filteredList = [];

    return filteredList.length > 0
        ? GridView.builder(
            itemCount: 50,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    ScreenUtil().orientation == Orientation.portrait ? 2 : 3),
            itemBuilder: (context, index) {
              debugPrint('item builder çalıştı');
              return PokeListItem(pokemon: filteredList[index]);
            })
        : Center(
            child: Text("Sayfa bulunamadı"),
          );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
