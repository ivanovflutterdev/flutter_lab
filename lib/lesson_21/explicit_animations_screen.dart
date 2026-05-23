import 'dart:math' as math;

import 'package:flutter/material.dart';

class ExplicitAnimationsScreen extends StatefulWidget {
  const ExplicitAnimationsScreen({super.key});

  @override
  State<ExplicitAnimationsScreen> createState() =>
      _ExplicitAnimationsScreenState();
}

class _ExplicitAnimationsScreenState extends State<ExplicitAnimationsScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _ballY;
  late final Animation<double> _rotation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();

    _ballY = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(
          begin: 0.0,
          end: -520.0,
        ).chain(CurveTween(curve: Curves.easeOutCubic)),
        weight: 28,
      ),

      TweenSequenceItem(
        tween: Tween(
          begin: -520.0,
          end: 0.0,
        ).chain(CurveTween(curve: Curves.easeInCubic)),
        weight: 24,
      ),

      TweenSequenceItem(
        tween: Tween(
          begin: 0.0,
          end: -160.0,
        ).chain(CurveTween(curve: Curves.easeOutCubic)),
        weight: 18,
      ),

      TweenSequenceItem(
        tween: Tween(
          begin: -160.0,
          end: 0.0,
        ).chain(CurveTween(curve: Curves.easeInCubic)),
        weight: 16,
      ),

      TweenSequenceItem(
        tween: Tween(
          begin: 0.0,
          end: -60.0,
        ).chain(CurveTween(curve: Curves.easeOutCubic)),
        weight: 8,
      ),

      TweenSequenceItem(
        tween: Tween(
          begin: -60.0,
          end: 0.0,
        ).chain(CurveTween(curve: Curves.easeInCubic)),
        weight: 6,
      ),
    ]).animate(_controller);

    _rotation = Tween<double>(begin: 0, end: math.pi * 4).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Explicit Animations'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Stack(
            fit: StackFit.expand,
            children: [
              Image.asset('assets/images/kremlin_bg.jpeg', fit: BoxFit.cover),

              Container(color: Colors.black.withValues(alpha: 0.15)),

              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 110),
                  child: Transform.translate(
                    offset: Offset(0, _ballY.value),
                    child: Transform.rotate(
                      angle: _rotation.value,
                      child: Image.asset(
                        'assets/images/putin_head.png',
                        width: 120,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
