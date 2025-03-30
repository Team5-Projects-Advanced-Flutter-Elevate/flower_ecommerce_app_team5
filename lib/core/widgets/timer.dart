import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';

class Timer extends StatelessWidget {
  const Timer({
    super.key,
    required ValueNotifier<bool> isLessThan5Minutes,
    required this.examDuration,
    required this.onTimeEnd,
  }) : _isLessThan5Minutes = isLessThan5Minutes;

  final ValueNotifier<bool> _isLessThan5Minutes;
  final int examDuration;
  final VoidCallback onTimeEnd;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 12.w, left: 8.w),
      child: ValueListenableBuilder<bool>(
        valueListenable: _isLessThan5Minutes,
        builder: (context, isLessThan5Minutes, child) {
          return TimerCountdown(
            enableDescriptions: false,
            format: CountDownTimerFormat.minutesSeconds,
            timeTextStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: isLessThan5Minutes ? Colors.red : Colors.green,
                ),
            endTime: DateTime.now().add(
              Duration(
                minutes: 0,
                seconds: examDuration,
              ),
            ),
            onEnd: () {
              onTimeEnd();
            },
            onTick: (duration) {
              // Update the ValueNotifier without calling setState
              _isLessThan5Minutes.value = duration.inMinutes < 5;
            },
          );
        },
      ),
    );
  }
}
