import 'package:flutter/material.dart';
import 'dart:ui';

class HoliEventCard extends StatelessWidget {
  const HoliEventCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 346,
      height: 470,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              width: 346,
              height: 55,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(28),
                  topRight: Radius.circular(28),
                ),
                gradient: const RadialGradient(
                  center: Alignment.center,
                  radius: 1.0,
                  colors: [Color(0xFFFF9028), Color(0xFFFF5E00)],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 19,
                    height: 19,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.5),
                          blurRadius: 16,
                        ),
                        BoxShadow(
                          color: Colors.white.withOpacity(0.5),
                          blurRadius: 14,
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.local_fire_department,
                      color: Colors.white,
                      size: 19,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    "You're Going!",
                    style: TextStyle(
                      fontFamily: 'Bricolage Grotesque',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      letterSpacing: -0.16,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 35,
            left: 0,
            right: 0,
            child: Container(
              height: 430,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                border: Border.all(
                  color: const Color(0xFFFFFFFF).withOpacity(0.40),
                  width: 2,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(26),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        'assets/images/holi_party.jpg',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xFF87CEEB),
                                  Color(0xFFFFD700),
                                  Color(0xFFFF69B4),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 280,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              const Color(0xFF000000).withOpacity(0.7),
                              const Color(0xFF000000).withOpacity(0.4),
                              const Color(0xFF000000).withOpacity(0.0),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      left: 24,
                      right: 24,
                      child: Column(
                        children: [
                          const Text(
                            'Holi party',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Bricolage Grotesque',
                              fontWeight: FontWeight.w700,
                              fontSize: 34,
                              height: 51 / 34,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                          const Text(
                            '7 Jun 25, Bastian garden city',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Bricolage Grotesque',
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              height: 24 / 14,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                          const Text(
                            'Hosted by Anya',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Bricolage Grotesque',
                              fontWeight: FontWeight.w500,
                              fontSize: 11.34,
                              height: 17.02 / 11.34,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Container(
                            width: 298,
                            height: 56,
                            decoration: BoxDecoration(
                              color: const Color(0xFFB78EF5),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: const Color(
                                  0xFFFFFFFF,
                                ).withOpacity(0.30),
                                width: 0.5,
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                'View ticket',
                                style: TextStyle(
                                  fontFamily: 'Bricolage Grotesque',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  letterSpacing: 0.18,
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
