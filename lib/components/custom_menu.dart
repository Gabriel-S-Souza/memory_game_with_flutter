import 'package:flutter/material.dart';

class CustomMenu extends StatefulWidget {
  final List<String> options;
  final List<IconData> icons;
  final String label;

  const CustomMenu({Key? key, required this.options, required this.icons, required this.label})
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
    return Container(
      width: MediaQuery.of(context).size.width * 0.36,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        color: Theme.of(context).colorScheme.primary,
      ),
      child: DropdownButtonFormField(

        value: dropdownValue,
        elevation: 4,
        dropdownColor: Theme.of(context).colorScheme.primaryContainer,
        style: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 18,
          color: Theme.of(context).colorScheme.secondary,
        ),
        iconEnabledColor: Theme.of(context).colorScheme.primaryContainer,
        isExpanded: true,
        decoration: InputDecoration(
          label: Text(
            widget.label,
            style: TextStyle(
              fontSize: 18,
              color: Theme.of(context).colorScheme.primaryContainer,
              height: 0.5,
            ),
          ),
          contentPadding: EdgeInsets.only(left: 8, top: 8, right: 8, bottom: 4),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.secondary,
              width: 2,
            ),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.secondary,
              width: 2,
            ),
          ),
        ),
        
        items: widget.options.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            alignment: AlignmentDirectional.center,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  widget.icons[widget.options.indexOf(value)],
                ),
                SizedBox(width: 8),
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
      ),
    );
  }
}
