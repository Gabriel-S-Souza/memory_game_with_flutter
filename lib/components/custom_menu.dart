import 'package:flutter/material.dart';
import 'package:memory_game/models/game_menu_settings.dart';

class CustomMenu extends StatefulWidget {
  final GameMenuSettings gameMenuSettings;
  final double width;
  final double height;
  const CustomMenu({
    Key? key,
    required this.gameMenuSettings, 
    required this.width, 
    required this.height,
  }) : super(key: key);

  @override
  State<CustomMenu> createState() => _CustomMenuState();
}

//Utilizando o mixim SingleTickerProviderStateMixin para poder usar o vsync
class _CustomMenuState extends State<CustomMenu> with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final List<String> options;
  late final List<IconData> icons;
  late final String label;
  late final void Function(String? selectedItem) onSelected;
  String? dropdownValue;
  IconData? dropdownIconValue;
  bool expanded = true;
  late final double width;
  late final double height;
  late final double fontSize = width * 0.102;
  late final double iconSize = width * 0.14;

  @override
  void initState() {
    super.initState();
    options = widget.gameMenuSettings.options;
    icons = widget.gameMenuSettings.icons;
    label = widget.gameMenuSettings.label;
    onSelected = widget.gameMenuSettings.onSelected;
    dropdownValue = options[0];
    dropdownIconValue = icons[0];
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 130),
    );
    _animationController.forward();
    onSelected(dropdownValue);
    width = widget.width;
    height = widget.height;
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          expanded == false
              ? _animationController.forward()
              : _animationController.reverse();
          expanded = !expanded;
        });
      },
      child: Column(
        children: [
          Container(
            width: width,
            height: height,
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
                  padding: EdgeInsets.only(left: width * 0.11, top: height * 0.04),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        label,
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
                                size: iconSize,
                              ),
                              SizedBox(width: width * 0.08),
                              Text(
                                dropdownValue ?? 'Selecione',
                                style: TextStyle(
                                  fontSize: fontSize,
                                  fontFamily: 'Roboto',
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            expanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
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
          _dropDownMenu(itens: options, icons: icons)
        ],
      ),
    );
  }

  Widget _dropDownMenu({required List<String> itens, required List<IconData> icons}) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, snapshot) {
        return Container(
          height: height * 1.05 * itens.length * _animationController.value,
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
              return GestureDetector(
                child: Container(
                  height: height,
                  color: Theme.of(context).colorScheme.primaryContainer,
                  padding: EdgeInsets.only(
                    left: width * 0.11),
                  child: Row(
                    children: [
                      Icon(
                        icons[index],
                        color: Theme.of(context).colorScheme.onSecondary,
                        size: iconSize,
                      ),
                      SizedBox(width: width * 0.08),
                      Text(
                        itens[index],
                        style: TextStyle(
                          fontSize: fontSize,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  setState(() {
                    dropdownValue = itens[index];
                    dropdownIconValue = icons[index];
                    expanded = !expanded;
                    _animationController.reset();
                    onSelected(dropdownValue);
                  });
                },
              );
            },
          ),
        );
      });
  }
}
