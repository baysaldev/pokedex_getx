// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable, use_key_in_widget_constructors, sized_box_for_whitespace
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex_getx/constant/constant.dart';
import 'package:pokedex_getx/constant/ui_helper.dart';
import 'package:pokedex_getx/widgets/custom_search_delegate.dart';

class AppTitle extends StatefulWidget {
  @override
  State<AppTitle> createState() => _AppTitleState();
}

class _AppTitleState extends State<AppTitle> {
  String pokeballImageUrl = "assets/images/pokeball.png";

  var _pokemonListFuture;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: UIHelper.getAppTitleWidgetHeight(),
      child: Stack(
        children: [
          Padding(
            padding: UIHelper.getDefaultPadding(),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'title',
                style: Constant.getTitleTextStyle(),
              ).tr(),
            ),
          ),
          Align(
              alignment: Alignment.bottomLeft,
              child: IconButton(
                  onPressed: () {
                    _showSearchPage();
                  },
                  icon: Icon(
                    Icons.search,
                    color: Colors.red,
                    size: 50,
                  ))),
          Align(
            alignment: Alignment.centerRight,
            child: Image.asset(
              pokeballImageUrl,
              width: ScreenUtil().orientation == Orientation.portrait
                  ? 0.2.sh
                  : 0.2.sw,
              fit: BoxFit.fitWidth,
            ),
          ),
        ],
      ),
    );
  }

  void _showSearchPage() {
    showSearch(
        context: context,
        delegate: CustomSearchDelegate(allPokemonModel: _pokemonListFuture));
  }
}
