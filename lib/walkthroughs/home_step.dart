import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/components/home_step1_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

// Focus widget keys for this walkthrough
final buttonM64rcv1s = GlobalKey();
final buttonSeieiq47 = GlobalKey();
final lottieAnimation5xrn9ktv = GlobalKey();

/// HomeStep
///
///
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Step 1
      TargetFocus(
        keyTarget: buttonM64rcv1s,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => HomeStep1Widget(),
          ),
        ],
      ),

      /// Step 2
      TargetFocus(
        keyTarget: buttonSeieiq47,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => HomeStep1Widget(),
          ),
        ],
      ),

      /// Step 3
      TargetFocus(
        keyTarget: lottieAnimation5xrn9ktv,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => HomeStep1Widget(),
          ),
        ],
      ),
    ];
