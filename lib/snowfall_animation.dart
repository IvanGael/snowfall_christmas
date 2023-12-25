import 'dart:math';

import 'package:flutter/material.dart';

class SnowfallAnimation extends StatefulWidget {
  const SnowfallAnimation({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SnowfallAnimationState createState() => _SnowfallAnimationState();
}

class _SnowfallAnimationState extends State<SnowfallAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  List<Snowflake>? _snowflakes;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();
    _controller.addListener(_updateSnowflakes);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Initialize _snowflakes only if it's not already initialized
    _snowflakes ??= List.generate(
      100,
      (index) => Snowflake(
        x: Random().nextDouble() * MediaQuery.of(context).size.width,
        y: Random().nextDouble() * MediaQuery.of(context).size.height,
        size: Random().nextDouble() * 5 + 2,
        speed: Random().nextDouble() * 2 + 1,
      ),
    );
  }

  void _updateSnowflakes() {
    setState(() {
      for (var snowflake in _snowflakes!) {
        snowflake.fall(context);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: SnowfallPainter(_snowflakes!),
    );
  }
}

class SnowfallPainter extends CustomPainter {
  final List<Snowflake> snowflakes;

  SnowfallPainter(this.snowflakes);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..strokeCap = StrokeCap.round;

    for (var snowflake in snowflakes) {
      canvas.drawCircle(
        Offset(snowflake.x, snowflake.y),
        snowflake.size,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class Snowflake {
  double x;
  double y;
  double size;
  double speed;

  Snowflake({
    required this.x,
    required this.y,
    required this.size,
    required this.speed,
  });

  void fall(BuildContext context) {
    y += speed;

    if (y > MediaQuery.of(context).size.height) {
      y = 0;
      x = Random().nextDouble() * MediaQuery.of(context).size.width;
    }
  }
}
