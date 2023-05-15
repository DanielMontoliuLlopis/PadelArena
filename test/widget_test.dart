import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:padel_arena/View/OnBoarding/OnBoarding.dart';

import 'package:padel_arena/main.dart';

void  main() {
  testWidgets("Contains skip",
   (WidgetTester tester) async{
    await tester.pumpWidget(OnBoardingScreen());
    expect(find.text("Skip"), findsOneWidget);
  });

    testWidgets("Contains Login/Registration",
   (WidgetTester tester) async{
     await tester.pumpWidget(OnBoardingScreen());
      expect(find.byType(InkWell().runtimeType), findsOneWidget);
  });
}

