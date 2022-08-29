import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pokedex_getx/constant/constant.dart';
import 'package:pokedex_getx/constant/ui_helper.dart';
import 'package:pokedex_getx/model/pokemeon_model.dart';
import 'package:pokedex_getx/pages/detail_page.dart';
import 'package:pokedex_getx/widgets/poke_img_and_ball.dart';

class PokeListItem extends StatelessWidget {
  final PokemonModel pokemon;

  const PokeListItem({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(DetailPage(pokemon: pokemon));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.w),
        ),
        elevation: 3,
        shadowColor: Colors.white,
        color: UIHelper.getColorFromType(pokemon.type![0]),
        child: Padding(
          padding: UIHelper.getDefaultPadding(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(pokemon.name ?? "N/A",
                    style: Constant.getPokemonNameTextStyle()),
              ),
              Expanded(
                child: Chip(
                  label: Text(
                    pokemon.type![0],
                    style: Constant.getTypeChipTextStyle(),
                  ),
                ),
              ),
              Expanded(child: PokeImageAndBall(pokemon: pokemon)),
            ],
          ),
        ),
      ),
    );
  }
}
