import 'package:dyvolt_employee/utils/colors.dart';
import 'package:dyvolt_employee/utils/fonts.dart';
import 'package:dyvolt_employee/utils/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class TextInput extends StatefulWidget {
  final String hintText;
  final String labelText;
  final ValueChanged<String>? onChanged;

  const TextInput({
    Key? key,
    required this.hintText,
    this.labelText = '',
    this.onChanged,
  }) : super(key: key);

  @override
  _TextInputState createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  bool _isFocused = false;

  @override
  Widget build(BuildContext context) {
    final labelColor =
        _isFocused ? AppColors.primaryColor : AppColors.blackColor;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _isFocused = true;
            });
          },
          child: AnimatedDefaultTextStyle(
            style: TextStyles.textLabelInput().copyWith(color: labelColor),
            duration: const Duration(milliseconds: 200),
            child: Text(
              widget.labelText,
            ),
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          style: TextStyles.textInputActive(),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
            hintText: widget.hintText,
            hintStyle: TextStyles.textPlaceholderInput(),
            border: const OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.primaryColor,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.inputBorder,
              ),
            ),
          ),
          onChanged: widget.onChanged,
          onTap: () {
            setState(() {
              _isFocused = true;
            });
          },
          onEditingComplete: () {
            setState(() {
              _isFocused = false;
            });
          },
          onSubmitted: (value) {
            setState(() {
              _isFocused = false;
            });
          },
        ),
      ],
    );
  }
}

//
//
class TextInputWhite extends StatefulWidget {
  final String hintText;
  final String labelText;

  final String whatTipe;
  final ValueChanged<String>? onChanged;

  const TextInputWhite({
    Key? key,
    required this.hintText,
    this.labelText = '',
    this.whatTipe = '',
    this.onChanged,
  }) : super(key: key);

  @override
  _TextInputWhiteState createState() => _TextInputWhiteState();
}

class _TextInputWhiteState extends State<TextInputWhite> {
  bool _isFocused = false;

  @override
  Widget build(BuildContext context) {
    final labelColor =
        _isFocused ? AppColors.primaryColor : AppColors.blackColor;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.labelText == ''
            ? const SizedBox(
                height: 0,
              )
            : GestureDetector(
                onTap: () {
                  setState(() {
                    _isFocused = true;
                  });
                },
                child: AnimatedDefaultTextStyle(
                  style:
                      TextStyles.textLabelInput().copyWith(color: labelColor),
                  duration: const Duration(milliseconds: 200),
                  child: Text(
                    widget.labelText,
                  ),
                ),
              ),
        const SizedBox(height: 8),
        TextField(
          enabled: widget.whatTipe == 'filled_disable' ? false : true,
          style: TextStyles.textInputActive(),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
            hintText: widget.hintText,
            hintStyle: TextStyles.textPlaceholderInput(
                color: widget.whatTipe == 'filled_disable'
                    ? AppColors.blackColor
                    : AppColors.grey70Color),
            filled: true,
            fillColor: widget.whatTipe == 'filled_disable'
                ? AppColors.bgCardDetail
                : AppColors.whiteColor,
            border: const OutlineInputBorder(
                borderSide: BorderSide(
              color: AppColors.whiteColor,
            )),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.primaryColor,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.whiteColor,
              ),
            ),
            disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.bgCardDetail),
            ),
          ),
          onChanged: widget.onChanged,
          onTap: () {
            setState(() {
              _isFocused = true;
            });
          },
          onEditingComplete: () {
            setState(() {
              _isFocused = false;
            });
          },
          onSubmitted: (value) {
            setState(() {
              _isFocused = false;
            });
          },
        ),
      ],
    );
  }
}
//
//

class PasswordInput extends StatefulWidget {
  final String hintText;
  final String labelText;
  final ValueChanged<String>? onChanged;

  const PasswordInput({
    Key? key,
    required this.hintText,
    required this.labelText,
    this.onChanged,
  }) : super(key: key);

  @override
  _PasswordInputState createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedBuilder(
          animation: _focusNode,
          builder: (context, child) {
            final labelColor = _focusNode.hasFocus
                ? AppColors.primaryColor
                : AppColors.blackColor;
            return Text(
              widget.labelText,
              style: TextStyles.textLabelInput().copyWith(color: labelColor),
            );
          },
        ),
        const SizedBox(height: 8),
        TextField(
          focusNode: _focusNode,
          obscureText: true,
          style: TextStyles.textInputActive(),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
            hintText: widget.hintText,
            hintStyle: TextStyles.textPlaceholderInput(),
            border: const OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.primaryColor,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.inputBorder,
              ),
            ),
          ),
          onChanged: widget.onChanged,
        ),
      ],
    );
  }
}

//
//
class Button extends StatelessWidget {
  final String labelText;
  final VoidCallback onPressed;

  const Button({
    Key? key,
    required this.labelText,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        elevation: 0,
        backgroundColor: AppColors.primaryColor,
        minimumSize: const Size(double.infinity, 58),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: SizedBox(
          width: double.infinity,
          height: 22,
          child: Text(labelText,
              textAlign: TextAlign.center, style: TextStyles.textButton())),
    );
  }
}

class ButtonMedium extends StatelessWidget {
  final String labelText;
  final VoidCallback onPressed;

  const ButtonMedium({
    Key? key,
    required this.labelText,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        elevation: 0,
        backgroundColor: AppColors.primaryColor,
        minimumSize: const Size(double.infinity, 48),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 10,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: SizedBox(
          width: double.infinity,
          height: 22,
          child: Text(labelText,
              textAlign: TextAlign.center, style: TextStyles.textButton())),
    );
  }
}

class ButtonCustom extends StatelessWidget {
  final String labelText;
  final VoidCallback onPressed;

  const ButtonCustom({
    Key? key,
    required this.labelText,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        elevation: 0,
        backgroundColor: AppColors.primaryColor,
        minimumSize: const Size(double.infinity, 58),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: SizedBox(
          width: double.infinity,
          height: 22,
          child: Text(labelText,
              textAlign: TextAlign.center, style: TextStyles.textButton())),
    );
  }
}

//
//

class TextButtonCustom extends StatefulWidget {
  final String labelText;
  final VoidCallback onPressed;
  final bool tabActive;
  final bool tabDisable;

  const TextButtonCustom({
    Key? key,
    required this.labelText,
    required this.onPressed,
    this.tabActive = false,
    this.tabDisable = false,
  }) : super(key: key);

  @override
  _TextButtonCustomState createState() => _TextButtonCustomState();
}

class _TextButtonCustomState extends State<TextButtonCustom> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTapDown: (TapDownDetails details) {
        setState(() {
          isPressed = true;
        });
      },
      onTapUp: (TapUpDetails details) {
        setState(() {
          isPressed = false;
        });
        widget.onPressed();
      },
      onTapCancel: () {
        setState(() {
          isPressed = false;
        });
      },
      child: SizedBox(
        height: 32,
        child: Text(widget.labelText,
            textAlign: TextAlign.center,
            style: TextStyles.text20px600(
              color: widget.tabActive == true
                  ? AppColors.primaryColor
                  : widget.tabDisable == true && widget.tabActive == false
                      ? AppColors.grey63Color
                      : isPressed
                          ? AppColors.primaryColor
                          : AppColors.greyBlackColor,
            )),
      ),
    );
  }
}
//
//

class DropdownW extends StatefulWidget {
  final List<String> items;
  final Function(String) onChanged;
  final String labelText;

  const DropdownW({
    super.key,
    required this.items,
    required this.onChanged,
    this.labelText = '',
  });

  @override
  _DropdownWState createState() => _DropdownWState();
}

class _DropdownWState extends State<DropdownW> {
  String? _selectedItem;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showDropdown,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          // border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(6),
          color: AppColors.primaryColor,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              flex: 2,
              child: Container(),
            ),
            Text(
              _selectedItem ?? widget.labelText,
              textAlign: TextAlign.center,
              style: TextStyles.text16px700(color: AppColors.whiteColor),
            ),
            const CustomIcon(
              iconName: 'icon_arrow_down',
              size: 24,
              color: AppColors.whiteColor,
            ),
            Flexible(
              flex: 2,
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }

  void _showDropdown() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: ListView(
            shrinkWrap: true,
            children: widget.items.map((String item) {
              return ListTile(
                title: Text(item),
                onTap: () {
                  setState(() {
                    _selectedItem = item;
                  });
                  widget.onChanged(item);
                  Navigator.pop(
                      context); // Menutup BottomSheet setelah memilih item
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }
}

//
//
class DropdownWhiteW extends StatefulWidget {
  final List<String> items;
  final Function(String) onChanged;
  final String labelText;

  const DropdownWhiteW({
    super.key,
    required this.items,
    required this.onChanged,
    this.labelText = '',
  });

  @override
  _DropdownWhiteWState createState() => _DropdownWhiteWState();
}

class _DropdownWhiteWState extends State<DropdownWhiteW> {
  String? _selectedItem;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showDropdown,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        decoration: BoxDecoration(
          // border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(6),
          color: AppColors.whiteColor,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                _selectedItem ?? widget.labelText,
                style: TextStyles.text15px500(color: AppColors.grey63Color),
              ),
            ),
            const CustomIcon(
              iconName: 'icon_arrow_down',
              size: 16,
              color: AppColors.greyBlackColor,
            ),
          ],
        ),
      ),
    );
  }

  void _showDropdown() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: ListView(
            shrinkWrap: true,
            children: widget.items.map((String item) {
              return ListTile(
                title: Text(item),
                onTap: () {
                  setState(() {
                    _selectedItem = item;
                  });
                  widget.onChanged(item);
                  Navigator.pop(
                      context); // Menutup BottomSheet setelah memilih item
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }
}

//
//
class DateInputW extends StatefulWidget {
  final String labelText;
  final Function(String) onChanged;

  const DateInputW({
    Key? key,
    required this.labelText,
    required this.onChanged,
  }) : super(key: key);

  @override
  _DateInputWState createState() => _DateInputWState();
}

class _DateInputWState extends State<DateInputW> {
  String? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showDatePicker,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.white,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                _selectedDate ?? widget.labelText,
                style: TextStyle(color: Colors.grey[600], fontSize: 15),
              ),
            ),
            const Icon(
              Icons.calendar_today,
              size: 16,
              color: Colors.black87,
            ),
          ],
        ),
      ),
    );
  }

  void _showDatePicker() async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (selectedDate != null) {
      setState(() {
        _selectedDate = DateFormat('dd - MMMM - yyyy').format(selectedDate);
      });
      widget.onChanged(_selectedDate!);
    }
  }
}
//
//

class ClockInputW extends StatefulWidget {
  final String labelText;
  final Function(String) onChanged;

  const ClockInputW({
    Key? key,
    required this.labelText,
    required this.onChanged,
  }) : super(key: key);

  @override
  _ClockInputWState createState() => _ClockInputWState();
}

class _ClockInputWState extends State<ClockInputW> {
  final bool _isFocused = false;
  late TextEditingController _textEditingController;
  TimeOfDay? _selectedTime;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final labelColor = _isFocused ? Colors.blue : Colors.black;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            _showTimePicker();
          },
          child: AnimatedDefaultTextStyle(
            style: TextStyle(
              fontSize: 16,
              color: labelColor,
            ),
            duration: const Duration(milliseconds: 200),
            child: widget.labelText == ''
                ? const SizedBox(height: 0)
                : Text(widget.labelText),
          ),
        ),
        widget.labelText == ''
            ? const SizedBox(height: 0)
            : const SizedBox(height: 8),
        TextField(
          controller: _textEditingController,
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(4),
          ],
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
            hintText: '01:01',
            hintStyle: const TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
            filled: true,
            fillColor: AppColors.whiteColor,
            border: const OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.primaryColor,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(6),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.whiteColor,
              ),
            ),
          ),
          style: const TextStyle(
            fontSize: 16,
            color: AppColors.blackColor,
          ),
          onTap: () {
            _showTimePicker();
          },
          readOnly: true,
        ),
      ],
    );
  }

  void _showTimePicker() async {
    final TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
    );

    if (selectedTime != null) {
      setState(() {
        _selectedTime = selectedTime;
        final formattedTime =
            '${selectedTime.hour.toString().padLeft(2, '0')}:${selectedTime.minute.toString().padLeft(2, '0')}';
        _textEditingController.text = formattedTime;
      });
      widget.onChanged(_textEditingController.text);
    }
  }
}
