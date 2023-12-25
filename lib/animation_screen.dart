import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:snowfall_christmas/card_item.dart';
import 'package:snowfall_christmas/color_picker.dart';
import 'package:snowfall_christmas/greeting_card.dart';
import 'package:snowfall_christmas/snowfall_animation.dart';

class AnimationScreen extends StatefulWidget {
  const AnimationScreen({super.key});

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen> {
  List<CardItem> cards = [];

  Widget _cardItem(int index, String wishFront, String wishBack,
      String frontAnimation, String backAnimation) {
    if (cards.isNotEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FlipCard(
            direction: FlipDirection.HORIZONTAL,
            speed: 500,
            front: GreetingCard(
                wish: wishFront,
                color: cards[index].selectedColor,
                assetAnimation: frontAnimation),
            back: GreetingCard(
                wish: wishBack,
                color: cards[index].selectedColor,
                assetAnimation: backAnimation),
          ),
          // ColorPicker(
          //   onSelectColor: (c) {
          //     setState(() {
          //       cards[index].selectedColor = c;
          //     });
          //   },
          //   direction: "row",
          // )
        ],
      );
    }
    return Container();
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      cards = [
        CardItem(
            widget: _cardItem(
                0,
                'Sending warmth, love, and joy your way.',
                'Wishing you a blessed and joyous Christmas.',
                'assets/animations/gift5.json',
                'assets/animations/gift1.json'),
            selectedColor: Colors.blueGrey[900]!),
        CardItem(
            widget: _cardItem(
                1,
                'Wishing you a season filled with joy and wonder.',
                'May the beauty of the nativity fill your heart with peace.',
                'assets/animations/gift6.json',
                'assets/animations/gift8.json'),
            selectedColor: Colors.blueGrey[900]!)
      ];
    });
  }

  @override
  void didChangeDependencies() {
    setState(() {
      cards = [
        CardItem(
            widget: _cardItem(
                0,
                'Sending warmth, love, and joy your way.',
                'Wishing you a blessed and joyous Christmas.',
                'assets/animations/gift5.json',
                'assets/animations/gift1.json'),
            selectedColor: Colors.blueGrey[900]!),
        CardItem(
            widget: _cardItem(
                1,
                'Wishing you a season filled with joy and wonder.',
                'May the beauty of the nativity fill your heart with peace.',
                'assets/animations/gift6.json',
                'assets/animations/gift8.json'),
            selectedColor: Colors.blueGrey[900]!)
      ];
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[800],
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
              child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              "assets/images/tinsel2.png",
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200,
            ),
          )),
          Positioned(
              child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.40,
            width: MediaQuery.of(context).size.width,
            child: const SnowfallAnimation(),
          )),
          Positioned(
              child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.55,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 240,
                  child: Lottie.asset(
                    "assets/animations/gift2.json",
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(
                  height: 500,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: cards.length,
                    shrinkWrap: false,
                    itemBuilder: (context, index) {
                      return cards[index].widget;
                    },
                    separatorBuilder: (_, __) {
                      return const Padding(
                        padding: EdgeInsets.only(right: 10),
                      );
                    },
                  ),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
