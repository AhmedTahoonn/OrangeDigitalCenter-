import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

PreferredSizeWidget customAppBar({
  required String title,
  IconData? leadingIcon,
  Color? leadingIconColor,
  IconData? actionIcon,
  Color? actionIconColor,
  required BuildContext context,
  bool needAction=false,
 Function() ?leadingOnPressed,
}) =>
    AppBar(
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(fontSize: 24, color: Colors.black),
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
      leading: IconButton(onPressed: leadingOnPressed,icon: Icon(leadingIcon,color:leadingIconColor,),),
      actions: [
      needAction==false?Container(): PopupMenuButton(
            icon: SvgPicture.asset("assets/icons/filter.svg",color: Colors.deepOrange,),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5)
            ),
            itemBuilder: (context) => [
              // popupmenu item 1
               PopupMenuItem(
                value: 1,
                child: Text("All $title"),
              ),
              // popupmenu item 2
               PopupMenuItem(
                value: 2,
                child: Text("Finished $title"),
              ),
               PopupMenuItem(
                value: 3,
                child: Text("Remaining $title"),
              ),

            ],
            color: Colors.white,
            elevation: 3
        ),
      ],
    );
