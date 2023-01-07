import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

enum GenopetsGradient {
  standard,
  topBottom,
  yellowTopBottom,
  orangeTopBottom,
  yellowCelebrate,
  bottom25,
  bottom75,
  bottom90,
  alert,
  tooltipShade,
  cardGradient
}

class GenopetsLinearGradient {
  final alert = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [HexColor('#0C1F22'), Colors.transparent],
  );

  final yellowTopBottom = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    tileMode: TileMode.decal,
    colors: [
      HexColor('#564900'),
      Colors.transparent,
      Colors.transparent,
      HexColor('#564900'),
    ],
  );
  final orangeTopBottom = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    tileMode: TileMode.decal,
    colors: [
      HexColor('#0C1F22'),
      Colors.transparent,
      Colors.transparent,
      HexColor('#0C1F22'),
    ],
  );

  final yellowCelebrate = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        HexColor('#1E1B0D'),
        HexColor('#756300').withOpacity(0.7),
        HexColor('#716000').withOpacity(0.7),
        HexColor('#1C190B'),
      ],
      stops: const [
        0,
        52.42,
        62.12,
        100
      ]);

  final topBottom = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      HexColor('#08160C'),
      Colors.transparent,
      Colors.transparent,
      HexColor('#08160C'),
    ],
  );

  final tealTopBottom = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      HexColor('#0C1F22'),
      Colors.transparent,
      Colors.transparent,
      HexColor('#0C1F22'),
    ],
  );

  final standard = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        HexColor('#08160C').withOpacity(0),
        HexColor('#08160C'),
      ]);

  final bottom25 = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        HexColor('#08160C').withOpacity(0),
        HexColor('#08160C').withOpacity(0),
        HexColor('#08160C').withOpacity(0),
        HexColor('#08160C'),
      ]);

  final bottom50 = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        HexColor('#0C1F22').withOpacity(0),
        HexColor('#0C1F22'),
      ]);

  final bottom75 = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        HexColor('#08160C').withOpacity(0),
        HexColor('#08160C'),
        HexColor('#08160C'),
        HexColor('#08160C'),
      ]);

  final bottom90 = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        HexColor('#08160C').withOpacity(0),
        HexColor('#08160C'),
        HexColor('#08160C'),
        HexColor('#08160C'),
        HexColor('#08160C'),
        HexColor('#08160C'),
        HexColor('#08160C'),
        HexColor('#08160C'),
        HexColor('#08160C'),
        HexColor('#08160C'),
      ]);

  final bottom90yellow = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        HexColor('#22200C').withOpacity(0),
        HexColor('#22200C'),
        HexColor('#22200C'),
        HexColor('#22200C'),
        HexColor('#22200C'),
        HexColor('#22200C'),
        HexColor('#22200C'),
        HexColor('#22200C'),
        HexColor('#22200C'),
        HexColor('#22200C'),
      ]);

  final bottom50yellow = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      HexColor('#22200C').withOpacity(0),
      HexColor('#22200C').withOpacity(0),
      HexColor('#22200C').withOpacity(0.2),
      HexColor('#22200C'),
      HexColor('#22200C'),
      HexColor('#22200C'),
    ],
  );

  final tealGradient50 = LinearGradient(
      transform: const GradientRotation(2.96077654),
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
      colors: [
        HexColor('#0C1F22').withOpacity(0),
        HexColor('#0C1F22'),
        HexColor('#0C1F22'),
      ]);

  final tealGradient30 = LinearGradient(
      transform: const GradientRotation(2.96077654),
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
      colors: [
        HexColor('#0C1F22').withOpacity(0),
        HexColor('#0C1F22').withOpacity(0),
        HexColor('#0C1F22').withOpacity(0),
        HexColor('#0C1F22'),
        HexColor('#0C1F22'),
      ]);

  final hudTeal = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color.fromRGBO(0, 224, 255, 0.009),
      Color.fromRGBO(0, 224, 255, 0.02),
      Color.fromRGBO(0, 255, 200, 0.08),
      Color.fromRGBO(0, 224, 255, 0.125),
    ],
  );

  final hudBlue = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color.fromRGBO(0, 224, 255, 0.009),
      Color.fromRGBO(0, 224, 255, 0.02),
      Color.fromRGBO(0, 224, 255, 0.08),
      Color.fromRGBO(0, 224, 255, 0.125),
    ],
  );

  final hudYellow = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color.fromRGBO(255, 190, 0, 0.009),
      Color.fromRGBO(255, 190, 0, 0.02),
      Color.fromRGBO(255, 190, 0, 0.08),
      Color.fromRGBO(255, 190, 0, 0.125),
    ],
  );

  final hudOrange = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color.fromRGBO(255, 122, 0, 0.009),
      Color.fromRGBO(255, 122, 0, 0.02),
      Color.fromRGBO(255, 122, 0, 0.08),
      Color.fromRGBO(255, 122, 0, 0.125),
    ],
  );
  final hudPink = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color.fromRGBO(255, 0, 99, 0.009),
      Color.fromRGBO(255, 0, 99, 0.02),
      Color.fromRGBO(255, 0, 99, 0.08),
      Color.fromRGBO(255, 0, 99, 0.125),
    ],
  );

  final hudPurple = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color.fromRGBO(183, 0, 255, 0.009),
      Color.fromRGBO(183, 0, 255, 0.02),
      Color.fromRGBO(183, 0, 255, 0.08),
      Color.fromRGBO(183, 0, 255, 0.125),
    ],
  );

  final tooltipShade = LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    stops: const [0, 0.5],
    colors: [
      HexColor('#130618').withOpacity(0.9),
      Colors.transparent,
    ],
  );

  final cardGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    tileMode: TileMode.mirror,
    colors: [
      HexColor('#410857').withOpacity(0.6),
      HexColor('#291930').withOpacity(0.6),
    ],
    stops: const [0.31, 1],
  );

  final blurBgPurple = LinearGradient(
    stops: const [0.25, 1],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      HexColor('#291930').withOpacity(0.3177),
      HexColor('#410857'),
    ],
  );
  final blurBgBlue = LinearGradient(
    stops: const [0.25, 1],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      HexColor('#1c2529').withOpacity(0.2448),
      HexColor('#00435c'),
    ],
  );
  final blurBgTeal = LinearGradient(
    stops: const [0.25, 1],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      HexColor('#172B26').withOpacity(0.3474),
      HexColor('#004B3B'),
    ],
  );
  final blurBgYellow = LinearGradient(
    stops: const [0.25, 1],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      HexColor('#251f11').withOpacity(0.2813),
      HexColor('#513e08'),
    ],
  );
  final blurBgOrange = LinearGradient(
    stops: const [0.25, 1],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      HexColor('#34231b').withOpacity(0.2679),
      HexColor('#582b00'),
    ],
  );
  final blurBgPink = LinearGradient(
    stops: const [0.25, 1],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      HexColor('#341E25').withOpacity(0.2679),
      HexColor('#4a0b24'),
    ],
  );
}
