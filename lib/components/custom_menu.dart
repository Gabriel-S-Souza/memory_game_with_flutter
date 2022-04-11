import 'package:flutter/material.dart';

class CustomMenu extends StatefulWidget {
  final List<String> options;
  final List<IconData> icons;
  final String label;

  const CustomMenu(
      {Key? key,
      required this.options,
      required this.icons,
      required this.label})
      : super(key: key);

  @override
  State<CustomMenu> createState() => _CustomMenuState();
}

class _CustomMenuState extends State<CustomMenu> {
  String? dropdownValue;
  IconData? dropdownIconValue;
  bool expanded = false;

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.options[0];
    dropdownIconValue = widget.icons[0];
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.38;

    return GestureDetector(
      onTap: () {
        setState(() {
          expanded = !expanded;
        });
      },
      child: Column(
        children: [
          Container(
            width: width,
            height: 56,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.label,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                dropdownIconValue,
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                dropdownValue ?? 'Selecione',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Roboto',
                                  color: Theme.of(context).colorScheme.onPrimary,
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 2,
                  height: 0,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ],
            ),
          ),
          expanded ? _dropDownMenu(width: width, itens: widget.options, icons: widget.icons) : Container(),
        ],
      ),
    );
  }

  Widget _dropDownMenu({required double width, required List<String> itens, required List<IconData> icons}) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: itens.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(
              icons[index],
              color: Theme.of(context).colorScheme.secondary,
            ),
            title: Text(
              itens[index],
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Roboto',
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            onTap: () {
              setState(() {
                dropdownValue = itens[index];
                dropdownIconValue = icons[index];
                expanded = !expanded;
              });
            },
          );
        },
      ),
    );
  }
}


// child: DropdownButtonFormField(

      //   value: dropdownValue,
      //   elevation: 4,
      //   dropdownColor: Theme.of(context).colorScheme.primaryContainer,
      //   style: TextStyle(
      //     fontFamily: 'Roboto',
      //     fontSize: 18,
      //     color: Theme.of(context).colorScheme.secondary,
      //   ),
      //   iconEnabledColor: Theme.of(context).colorScheme.primaryContainer,
      //   isExpanded: true,
      //   decoration: InputDecoration(
      //     label: Text(
      //       widget.label,
      //       style: TextStyle(
      //         fontSize: 18,
      //         color: Theme.of(context).colorScheme.primaryContainer,
      //         height: 0.5,
      //       ),
      //     ),
      //     contentPadding: EdgeInsets.only(left: 8, top: 8, right: 8, bottom: 4),
      //     focusedBorder: UnderlineInputBorder(
      //       borderSide: BorderSide(
      //         color: Theme.of(context).colorScheme.secondary,
      //         width: 2,
      //       ),
      //     ),
      //     enabledBorder: UnderlineInputBorder(
      //       borderSide: BorderSide(
      //         color: Theme.of(context).colorScheme.secondary,
      //         width: 2,
      //       ),
      //     ),
      //   ),
        
      //   items: widget.options.map<DropdownMenuItem<String>>((String value) {
      //     return DropdownMenuItem<String>(
      //       value: value,
      //       alignment: AlignmentDirectional.center,
      //       child: Row(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           Icon(
      //             widget.icons[widget.options.indexOf(value)],
      //           ),
      //           SizedBox(width: 8),
      //           Text(value),
      //         ],
      //       ),
      //     );
      //   }).toList(),
      //   onChanged: (dynamic newValue) {
      //     setState(() {
      //       dropdownValue = newValue;
      //     });
      //   },
      // )