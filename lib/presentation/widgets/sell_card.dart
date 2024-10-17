import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SellCard extends StatelessWidget {
  const SellCard(
      {super.key,
      required this.iconPath,
      required this.title,
      required this.subtitle,
      this.info,
      required this.backgroundColor,
      required this.foregroundColor});

  final String iconPath;
  final String title;
  final String subtitle;
  final String? info;
  final Color backgroundColor;
  final Color foregroundColor;



  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 184,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
      color: backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(50)),
              color: foregroundColor,
            ),
            child: Center(
              child: SvgPicture.asset(
                iconPath,
                colorFilter:
                    const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
            ),
          ),
          Text(
            title,
            style: const TextStyle(
                fontFamily: "Poppins",
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 5,
          ),
          Column(
            children: [
              Text(
                subtitle,
                style: TextStyle(
                    fontFamily: "Poppins",
                    color: Theme.of(context).hintColor,
                    fontSize: 16),
              ),
              const SizedBox(
                height: 5,
              ),
              if (info != null)
                Text(
                  info!,
                  style: const TextStyle(
                      color: Colors.blue,
                      fontFamily: "Poppins",
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                )
            ],
          )
        ],
      ),
    );
  }
}
