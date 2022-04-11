import 'package:flutter/material.dart';

class CustomMenu extends StatefulWidget {
  final List<String> options;
  final List<IconData> icons;

  const CustomMenu({
    Key? key, 
    required this.options, 
    required this.icons
  })
      : super(key: key);

  @override
  State<CustomMenu> createState() => _CustomMenuState();
}

class _CustomMenuState extends State<CustomMenu> {
  String? dropdownValue;

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.options[0];
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: dropdownValue,
      elevation: 4,
      underline: Container(
        height: 2,
        color: Theme.of(context).colorScheme.secondary,
      ),
      items: widget.options.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                widget.icons[widget.options.indexOf(value)],
              ),
              Text(value),
            ],
          ),
        );
      }).toList(),
      onChanged: (dynamic newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
    );
  }
}
