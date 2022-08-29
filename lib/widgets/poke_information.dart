// ignore_for_file: prefer_const_constructors

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex_getx/constant/constant.dart';
import 'package:pokedex_getx/model/pokemeon_model.dart';

class PokeInformation extends StatelessWidget {
  final PokemonModel pokemon;

  const PokeInformation({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10.w),
          ),
          color: Colors.white),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildInformationRow('information1'.tr(), pokemon.name),
            _buildInformationRow('information2'.tr(), pokemon.height),
            _buildInformationRow('information3'.tr(), pokemon.weight),
            _buildInformationRow('information4'.tr(), pokemon.spawnTime),
            _buildInformationRow('information5'.tr(), pokemon.spawnTime),
            _buildInformationRow('information6'.tr(), pokemon.weaknesses),
            _buildInformationRow('information7'.tr(), pokemon.prevEvolution),
            _buildInformationRow('information8'.tr(), pokemon.nextEvolution),
          ],
        ),
      ),
    );
  }

  _buildInformationRow(String label, dynamic value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: Constant.getPokemonLabelTextStyle()),
        if (value is List && value.isNotEmpty)
          Text(
            value.join(' , '),
            style: Constant.getPokemonInfoTextStyle(),
          )
        else if (value == null)
          Text(
            'text',
            style: Constant.getPokemonInfoTextStyle(),
          ).tr()
        else
          Text(
            value,
            style: Constant.getPokemonInfoTextStyle(),
          ),
      ],
    );
  }
}
