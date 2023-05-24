import 'dart:async';
import 'package:flutter/material.dart';
import 'package:padel_arena/generated/l10n.dart';


class OnBoard {
  final String image, title, description;

  OnBoard({
    required this.image,
    required this.title,
    required this.description,
  });
}

 final List<OnBoard> demoData = [
  OnBoard(
    image: "assets/1.png",
    title: S.current.titleOnboarding01,
    description:
        S.current.textOnboarding01,
  ),
  OnBoard(
    image: "assets/2.png",
    title: S.current.titleOnboarding02,
    description:
        S.current.textOnboarding02,
  ),
  OnBoard(
    image: "assets/3.png",
    title: S.current.titleOnboarding03,
    description:
        S.current.textOnboarding03,
  ),
  OnBoard(
    image: "assets/4.png",
    title: S.current.titleOnboarding04,
    description:
        S.current.textOnboarding04,
  ),
];

