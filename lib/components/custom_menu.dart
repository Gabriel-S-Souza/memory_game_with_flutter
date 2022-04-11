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
  bool expanded = true;

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
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.shadow,
                  blurRadius: 4,
                  offset: const Offset(0, 0),
                ),
              ],
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
                                size: 20,
                              ),
                              const SizedBox(width: 18),
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
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: itens.length,
        itemBuilder: (context, index) {
          return ListTile(
            style: ListTileStyle.drawer,
            leading: Icon(
              icons[index],
              color: Theme.of(context).colorScheme.onSecondary,
              size: 20,
            ),
            horizontalTitleGap: 0,
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