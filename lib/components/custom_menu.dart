import 'package:flutter/material.dart';
import 'package:memory_game/models/game_menu_settings.dart';

class CustomMenu extends StatefulWidget {
  final GameMenuSettings gameMenuSettings;

  const CustomMenu({
    Key? key,
    required this.gameMenuSettings,
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
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.38;

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
                  padding: const EdgeInsets.only(left: 10, top: 2),
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
                                size: 20,
                              ),
                              const SizedBox(width: 18),
                              Text(
                                dropdownValue ?? 'Selecione',
                                style: TextStyle(
                                  fontSize: 16,
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
          _dropDownMenu(
              width: width, itens: options, icons: icons)
        ],
      ),
    );
  }

  Widget _dropDownMenu(
      {required double width,
      required List<String> itens,
      required List<IconData> icons}) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, snapshot) {
        return Container(
          height: 56 * itens.length * _animationController.value,
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
