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
    image: "assets/splash.jpg",
    title: S.current.titleOnboarding01,
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
  ),
  OnBoard(
    image: "assets/splash.jpg",
    title: "Title 02",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
  ),
  OnBoard(
    image: "assets/splash.jpg",
    title: "Title 03",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
  ),
  OnBoard(
    image: "assets/splash.jpg",
    title: "Title 04",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
  ),
];

