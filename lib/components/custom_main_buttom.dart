import 'package:flutter/material.dart';

class CustomMainButton extends StatelessWidget {
  const CustomMainButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ElevatedButton(
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
        onPressed: () {},
      ),
    );
  }
}
