import 'dart:async';

import 'package:flutter/material.dart';
import 'package:timetable_view/src/styles/timetable_style.dart';

import '../utils/utils.dart';

class NowLine extends StatefulWidget {
  final Widget? nowLineLabel;
  final TimetableStyle timetableStyle;

  const NowLine({Key? key, this.nowLineLabel, required this.timetableStyle})
      : super(key: key);

  @override
  _NowLineState createState() => _NowLineState();
}

class _NowLineState extends State<NowLine> {
  Timer? _timer;
  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(minutes: 1), (timer) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.timetableStyle.showNowLine) {
      return _nowLine(context);
    } else {
      return SizedBox.shrink();
    }
  }

  Widget _nowLine(BuildContext context) {
    final now = DateTime.now();
    final children = [
      Divider(
        thickness: 2,
        color: Colors.black,
      ),
      widget.nowLineLabel
    ].whereType<Widget>().toList();

    return Positioned(
      top: Utils.topPosition(
        hour: now.hour,
        minute: now.minute,
        timeItemHeight: widget.timetableStyle.timeItemHeight,
        startHour: widget.timetableStyle.startHour,
      ),
      left: 0,
      right: 0,
      bottom: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}
