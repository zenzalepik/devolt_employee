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
  final TextEditingController? controller; // Tambahkan properti controller

  const TextInput({
    Key? key,
    required this.hintText,
    this.labelText = '',
    this.onChanged,
    this.controller, // Tambahkan properti controller
  }) : super(key: key);

  @override
  _TextInputState createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  late TextEditingController _textEditingController; // Buat controller lokal

  @override
  void initState() {
    super.initState();
    // Inisialisasi controller lokal berdasarkan properti controller yang diberikan atau buat baru jika null.
    _textEditingController = widget.controller ?? TextEditingController();
  }

  @override
  void dispose() {
    // Jangan lupa untuk membuang controller jika dibuat di dalam widget ini agar tidak ada memory leak.
    if (widget.controller == null) {
      _textEditingController.dispose();
    }
    super.dispose();
  }

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
          controller: _textEditingController, // Gunakan controller lokal
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
  final TextEditingController? controller;
  final String whatTipe;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;

  const TextInputWhite({
    Key? key,
    required this.hintText,
    this.labelText = '',
    this.whatTipe = '',
    this.onChanged,
    this.controller,
    this.validator,
  }) : super(key: key);

  @override
  _TextInputWhiteState createState() => _TextInputWhiteState();
}

class _TextInputWhiteState extends State<TextInputWhite> {
  late TextEditingController _textEditingController;
  bool _isFocused = false;
  @override
  void initState() {
    super.initState();
    // Inisialisasi controller lokal berdasarkan properti controller yang diberikan atau buat baru jika null.
    _textEditingController = widget.controller ?? TextEditingController();
  }

  @override
  void dispose() {
    // Jangan lupa untuk membuang controller jika dibuat di dalam widget ini agar tidak ada memory leak.
    if (widget.controller == null) {
      _textEditingController.dispose();
    }
    super.dispose();
  }

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
        TextFormField(
          validator: widget.validator,
          controller: _textEditingController,
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
          // onSubmitted: (value) {
          //   setState(() {
          //     _isFocused = false;
          //   });
          // },
        ),
      ],
    );
  }
}

//
//
class TextInputWhiteOutline extends StatefulWidget {
  final String hintText;
  final String labelText;
  final TextEditingController? controller;
  final String whatTipe;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;

  const TextInputWhiteOutline({
    Key? key,
    required this.hintText,
    this.labelText = '',
    this.whatTipe = '',
    this.onChanged,
    this.controller,
    this.validator,
  }) : super(key: key);

  @override
  _TextInputWhiteStateOutline createState() => _TextInputWhiteStateOutline();
}

class _TextInputWhiteStateOutline extends State<TextInputWhiteOutline> {
  late TextEditingController _textEditingController;
  bool _isFocused = false;
  @override
  void initState() {
    super.initState();
    // Inisialisasi controller lokal berdasarkan properti controller yang diberikan atau buat baru jika null.
    _textEditingController = widget.controller ?? TextEditingController();
  }

  @override
  void dispose() {
    // Jangan lupa untuk membuang controller jika dibuat di dalam widget ini agar tidak ada memory leak.
    if (widget.controller == null) {
      _textEditingController.dispose();
    }
    super.dispose();
  }

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
        TextFormField(
          validator: widget.validator,
          controller: _textEditingController,
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
              color: AppColors.inputBorder,
              width: 1,
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
                color: AppColors.inputBorder,
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
          // onSubmitted: (value) {
          //   setState(() {
          //     _isFocused = false;
          //   });
          // },
        ),
      ],
    );
  }
}
//
//

class DropDownOutlineW<T> extends StatefulWidget {
  final String hintText;
  final String labelText;
  final List<T> items;
  final T? value;
  final void Function(T?)? onChanged;
  final String? Function(T?)? validator;

  DropDownOutlineW({
    required this.hintText,
    this.labelText = '',
    required this.items,
    this.value,
    this.onChanged,
    this.validator,
  });

  @override
  _DropDownOutlineWState<T> createState() => _DropDownOutlineWState<T>();
}

class _DropDownOutlineWState<T> extends State<DropDownOutlineW<T>> {
  late T? _selectedValue;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    final labelColor =
        _isFocused ? AppColors.primaryColor : AppColors.blackColor;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.labelText.isEmpty
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
                  child: Text(widget.labelText),
                ),
              ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color:
                  _isFocused ? AppColors.primaryColor : AppColors.inputBorder,
              width: 1,
            ),
            color: _isFocused ? AppColors.whiteColor : AppColors.bgCardDetail,
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<T>(
              value: _selectedValue,
              items: widget.items.map((item) {
                return DropdownMenuItem<T>(
                  value: item,
                  child: Text(item.toString()),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedValue = value;
                });
                if (widget.onChanged != null) {
                  widget.onChanged!(value);
                }
              },
              isExpanded: true,
              hint: Text(
                widget.hintText,
                style: TextStyle(
                  color:
                      _isFocused ? AppColors.blackColor : AppColors.grey70Color,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class PasswordInput extends StatefulWidget {
  final String hintText;
  final String labelText;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller; // Tambahkan properti controller
  String? Function(String?)? validator;

  PasswordInput({
    Key? key,
    required this.hintText,
    this.labelText = '',
    this.onChanged,
    this.controller, // Tambahkan properti controller
    this.validator,
  }) : super(key: key);

  @override
  _PasswordInputState createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  late TextEditingController _textEditingController; // Buat controller lokal

  @override
  void initState() {
    super.initState();
    // Inisialisasi controller lokal berdasarkan properti controller yang diberikan atau buat baru jika null.
    _textEditingController = widget.controller ?? TextEditingController();
  }

  @override
  void dispose() {
    // Jangan lupa untuk membuang controller jika dibuat di dalam widget ini agar tidak ada memory leak.
    if (widget.controller == null) {
      _textEditingController.dispose();
    }
    super.dispose();
  }

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
        TextFormField(
          controller: _textEditingController, // Gunakan controller lokal
          validator: widget.validator,
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
          // onSubmitted: (value) {
          //   setState(() {
          //     _isFocused = false;
          //   });
          // },
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
class ButtonDark extends StatelessWidget {
  final String labelText;
  final VoidCallback onPressed;

  const ButtonDark({
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
        backgroundColor: AppColors.primaryDarkColor,
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
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const DateInputW({
    Key? key,
    required this.labelText,
    required this.onChanged,
    this.controller,
    this.validator,
  }) : super(key: key);

  @override
  _DateInputWState createState() => _DateInputWState();
}

class _DateInputWState extends State<DateInputW> {
  late TextEditingController _textEditingController; // Buat controller lokal

  String? _selectedDate;
  @override
  void initState() {
    super.initState();
    // Inisialisasi controller lokal berdasarkan properti controller yang diberikan atau buat baru jika null.
    _textEditingController = widget.controller ?? TextEditingController();
  }

  @override
  void dispose() {
    // Jangan lupa untuk membuang controller jika dibuat di dalam widget ini agar tidak ada memory leak.
    if (widget.controller == null) {
      _textEditingController.dispose();
    }
    super.dispose();
  }

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
                // validator: widget.validator,
                _selectedDate ?? widget.labelText,
                style: TextStyles.textInputActive(),
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

class DateInputOutlineW extends StatefulWidget {
  final String labelText;
  final Function(String) onChanged;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const DateInputOutlineW({
    Key? key,
    required this.labelText,
    required this.onChanged,
    this.controller,
    this.validator,
  }) : super(key: key);

  @override
  _DateInputOutlineWState createState() => _DateInputOutlineWState();
}

class _DateInputOutlineWState extends State<DateInputOutlineW> {
  late TextEditingController _textEditingController; // Buat controller lokal

  String? _selectedDate;
  @override
  void initState() {
    super.initState();
    // Inisialisasi controller lokal berdasarkan properti controller yang diberikan atau buat baru jika null.
    _textEditingController = widget.controller ?? TextEditingController();
  }

  @override
  void dispose() {
    // Jangan lupa untuk membuang controller jika dibuat di dalam widget ini agar tidak ada memory leak.
    if (widget.controller == null) {
      _textEditingController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showDatePicker,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: AppColors.whiteColor,
          border: Border.all(
            width: 1,
            color: AppColors.inputBorder,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                // validator: widget.validator,
                _selectedDate ?? widget.labelText,
                style: TextStyles.textInputActive(),
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
        _selectedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
      });
      widget.onChanged(_selectedDate!);
    }
  }
}
//
//

class DropdownOutlineW extends StatefulWidget {
  final List<String> items;
  final Function(String) onChanged;
  final String labelText;

  const DropdownOutlineW({
    super.key,
    required this.items,
    required this.onChanged,
    this.labelText = '',
  });

  @override
  _DropdownOutlineWState createState() => _DropdownOutlineWState();
}

class _DropdownOutlineWState extends State<DropdownOutlineW> {
  String? _selectedItem;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showDropdown,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.inputBorder),
          borderRadius: BorderRadius.circular(6),
          color: AppColors.whiteColor,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Flexible(
            //   flex: 2,
            //   child: Container(),
            // ),
            Expanded(
              child: Text(
                _selectedItem ?? widget.labelText,
                textAlign: TextAlign.left,
                style: TextStyles.text16px300(color: AppColors.blackColor),
              ),
            ),
            const CustomIcon(
              iconName: 'icon_arrow_down',
              size: 24,
              color: AppColors.inputBorder,
            ),
            // Flexible(
            //   flex: 2,
            //   child: Container(),
            // ),
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

class TextAreaWhiteOutline extends StatefulWidget {
  final String hintText;
  final String labelText;
  final TextEditingController? controller;
  final String whatTipe;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;

  const TextAreaWhiteOutline({
    Key? key,
    required this.hintText,
    this.labelText = '',
    this.whatTipe = '',
    this.onChanged,
    this.controller,
    this.validator,
  }) : super(key: key);

  @override
  _TextAreaWhiteOutlineState createState() => _TextAreaWhiteOutlineState();
}

class _TextAreaWhiteOutlineState extends State<TextAreaWhiteOutline> {
  late TextEditingController _textEditingController;
  bool _isFocused = false;
  @override
  void initState() {
    super.initState();
    // Inisialisasi controller lokal berdasarkan properti controller yang diberikan atau buat baru jika null.
    _textEditingController = widget.controller ?? TextEditingController();
  }

  @override
  void dispose() {
    // Jangan lupa untuk membuang controller jika dibuat di dalam widget ini agar tidak ada memory leak.
    if (widget.controller == null) {
      _textEditingController.dispose();
    }
    super.dispose();
  }

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
        TextFormField(
          maxLines: 5,
          validator: widget.validator,
          controller: _textEditingController,
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
              color: AppColors.inputBorder,
              width: 1,
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
                color: AppColors.inputBorder,
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
          // onSubmitted: (value) {
          //   setState(() {
          //     _isFocused = false;
          //   });
          // },
        ),
      ],
    );
  }
}
//
//