import 'package:flutter/material.dart';
import 'package:qr_visitor/constant/color_manager.dart';
import 'package:qr_visitor/presentation/widgest/form_input.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({super.key});

  @override
  State<DatePicker> createState() => _DateFieldState();
}
TextEditingController _dateController = TextEditingController();
class _DateFieldState extends State<DatePicker> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2101),
        );
        if (pickedDate != null) {
          setState(() {
            _dateController.text = '${pickedDate.toLocal()}'.split(' ')[0];
          });
        }
      },
      child: buildTextField(
        isEnable: false,
        'Expected Visit Date',
        'Click to pick a date',
        'assets/icons/date.svg', 22, 22,
         ColorManager.primaryColor,
        controller: _dateController,
      ),
    );
  }
}
