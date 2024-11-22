import 'package:cat_breeds/src/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({super.key, this.icon = Icons.arrow_back_ios, this.onPressed});

  final IconData icon;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
   return InkWell(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.all(SpaceConstants.small),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(99),
        ),
        child:  Icon(icon,size: 16,) ,
      ),
    );
  }
}
