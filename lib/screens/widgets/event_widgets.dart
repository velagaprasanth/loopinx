import 'package:flutter/material.dart';
import 'dart:ui';

class StatusBadge extends StatelessWidget {
  final String text;
  final IconData icon;
  final Gradient iconGradient;

  const StatusBadge({
    Key? key,
    required this.text,
    required this.icon,
    required this.iconGradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFF000000).withOpacity(0.10),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: iconGradient,
                ),
                child: Center(
                  child: Icon(icon, color: Colors.white, size: 14),
                ),
              ),
              const SizedBox(width: 6),
              Text(
                text,
                style: const TextStyle(
                  fontFamily: 'Nomixa',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  height: 21 / 16,
                  letterSpacing: 0,
                  color: Color(0xFFFFFFFF),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ScrollIndicators extends StatelessWidget {
  const ScrollIndicators({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 10,
          height: 4,
          decoration: BoxDecoration(
            color: const Color(0xFFD9D9D9),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 2),
        Container(
          width: 7,
          height: 4,
          decoration: BoxDecoration(
            color: const Color(0xFFD9D9D9).withOpacity(0.4),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 2),
        Container(
          width: 7,
          height: 4,
          decoration: BoxDecoration(
            color: const Color(0xFFD9D9D9).withOpacity(0.4),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }
}

class EventCard extends StatelessWidget {
  final String imageAsset;
  final Widget? badge;
  final String title;
  final String date;
  final String host;
  final double height;

  const EventCard({
    Key? key,
    required this.imageAsset,
    this.badge,
    required this.title,
    required this.date,
    required this.host,
    this.height = 401,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 346,
      height: height,
      child: Container(
        width: 346,
        height: height,
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
              // Background image
              Positioned.fill(
                child: Image.asset(
                  imageAsset,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(color: Colors.grey[800]);
                  },
                ),
              ),
              // Ellipse blur at bottom
              Positioned(
                bottom: -70,
                left: -78.5,
                right: -78.5,
                child: ClipPath(
                  clipper: EllipseClipper(),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.00, sigmaY: 10.00),
                    child: Container(
                      width: 483,
                      height: 335,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.05),
                      ),
                    ),
                  ),
                ),
              ),
              // Badge at top center
              if (badge != null)
                Positioned(
                  top: 16,
                  left: 0,
                  right: 0,
                  child: Center(child: badge!),
                ),
              // Content at bottom
              Positioned(
                bottom: 20,
                left: 24,
                right: 24,
                child: Column(
                  children: [
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: 'Bricolage Grotesque',
                        fontWeight: FontWeight.w700,
                        fontSize: 34,
                        height: 51 / 34,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                    Text(
                      date,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: 'Bricolage Grotesque',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        height: 24 / 14,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                    Text(
                      host,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: 'Bricolage Grotesque',
                        fontWeight: FontWeight.w500,
                        fontSize: 11.34,
                        height: 17.02 / 11.34,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const ScrollIndicators(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EllipseClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.addOval(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height * 0.8),
        width: size.width * 1.2,
        height: size.height * 0.9,
      ),
    );
    return path;
  }

  @override
  bool shouldReclip(EllipseClipper oldClipper) => false;
}
