import 'package:flutter/material.dart';

class TabButton extends StatelessWidget {
  final String label;
  final double width;

  const TabButton({Key? key, required this.label, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(21),
        border: Border.all(
          color: const Color(0xFFFFFFFF).withOpacity(0.07),
          width: 1,
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        style: const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 14,
          fontWeight: FontWeight.w400,
          height: 21 / 14,
          letterSpacing: 0,
          color: Color(0xFFFFFFFF),
        ),
      ),
    );
  }
}

class TabsRow extends StatelessWidget {
  const TabsRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 255,
      height: 45,
      child: Row(
        children: const [
          TabButton(label: 'Discover', width: 113),
          SizedBox(width: 10),
          TabButton(label: 'My tickets', width: 132),
        ],
      ),
    );
  }
}
