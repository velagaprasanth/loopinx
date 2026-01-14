import 'package:flutter/material.dart';
import 'dart:ui';

class LocationWidget extends StatelessWidget {
  const LocationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 346,
      height: 42,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(99),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
              child: Container(
                width: 40,
                height: 40,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF).withOpacity(0.10),
                  borderRadius: BorderRadius.circular(99),
                ),
                child: const Icon(
                  Icons.location_on_outlined,
                  color: Color(0xFFFFFFFF),
                  size: 24,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          SizedBox(
            width: 88,
            height: 42,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Pick your scene',
                  style: TextStyle(
                    fontFamily: 'Nomixa',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    height: 21 / 12,
                    letterSpacing: 0,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
                Text(
                  'Bengaluru',
                  style: TextStyle(
                    fontFamily: 'Nomixa',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    height: 21 / 14,
                    letterSpacing: 0,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
