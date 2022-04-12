import 'package:flutter/material.dart';

class CustomMainButton extends StatelessWidget {
  final VoidCallback onPressed;
  const CustomMainButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ElevatedButton(
        style: ButtonStyle(
          shape:
              MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          )),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: const [
            Padding(
              padding: EdgeInsets.only(bottom: 12),
              child: Text('Iniciar'),
            ),
            Icon(Icons.double_arrow, size: 30),
          ],
        ),
        onPressed: onPressed,
      ),
    );
  }
}
