import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Constant {
  Constant._(); //Kurucu methodu gizli yaptık nesne üretilmesin diye

  // static const String title = "Pokedex";

  static TextStyle getTitleTextStyle() {
    return TextStyle(
        fontSize: _calculateFontSize(44),
        fontWeight: FontWeight.bold,
        color: Colors.white);
  }

  static TextStyle getPokemonNameTextStyle() {
    return TextStyle(
        fontSize: _calculateFontSize(28),
        fontWeight: FontWeight.bold,
        color: Colors.white);
  }

  static TextStyle getTypeChipTextStyle() {
    return TextStyle(fontSize: _calculateFontSize(20), color: Colors.white);
  }

//KULLANICI AYARLARDAN YAZI BOYUTUNU BÜYÜTTÜĞÜNDE OTOMATİK OLARAK BÜYÜMESİ İÇİN YAZARIZ BU KODU
  static _calculateFontSize(int size) {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return size.sp;
    } else {
      return (size * 0.6).sp;
    }
  }

  static getPokemonLabelTextStyle() {
    return TextStyle(
        fontSize: _calculateFontSize(20),
        fontWeight: FontWeight.bold,
        color: Colors.black);
  }

  static getPokemonInfoTextStyle() {
    return TextStyle(fontSize: _calculateFontSize(16), color: Colors.black);
  }
}
