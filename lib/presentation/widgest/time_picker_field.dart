import 'package:flutter/material.dart';
import 'package:qr_visitor/presentation/widgest/form_input.dart';

class TimePicker extends StatefulWidget {
  const TimePicker({super.key});

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  final TextEditingController _timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () async {
        TimeOfDay? pickedTime = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
        );
        if (pickedTime != null) {
          setState(() {
            _timeController.text = pickedTime.format(context);
          });
        }
      },
      child: buildTextField(
        'Expected Visit Time',
        'Click to pick a time',
        'assets/icons/clock.svg', 22, 22,
        isEnable: false,
        const Color(0xff2CBBD2),
        controller: _timeController,
      ),
    );
  }
}
