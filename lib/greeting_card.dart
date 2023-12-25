import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class GreetingCard extends StatelessWidget {
  final String wish;
  final String assetAnimation;
  final Color color;

  const GreetingCard(
      {Key? key,
      required this.wish,
      required this.color,
      required this.assetAnimation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Transform.translate(
            offset: const Offset(0, 25),
            child: Container(
              width: 80,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle
              ),
              child: Lottie.asset(
                "assets/animations/gift7.json",
                fit: BoxFit.contain,
              ),
            ),
          ),
          Card(
            elevation: 10,
            color: color,
            child: Container(
              width: 320,
              height: 380,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: const BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: Lottie.asset(assetAnimation),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      wish,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ).center(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

extension CenterText on Widget {
  Widget center() {
    return Center(
      child: this,
    );
  }
}
