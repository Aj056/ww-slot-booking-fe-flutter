import 'package:flutter/material.dart';

class BasicAppbar extends StatelessWidget implements PreferredSizeWidget{
  final Widget ? title;
  const BasicAppbar({
    this.title,
    super.key
    });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation:0,
      centerTitle: true,
      title:title ?? const Text(''),
      leading: IconButton(
        onPressed: (){
         Navigator.pop(context);
        },
        icon: Container(
          height:50,
          width:50,
          decoration: const BoxDecoration(
          color: Color.fromARGB(92, 255, 255, 255), // Predefined color with opacity
          shape: BoxShape.circle,
),
 
          child: const Icon(
            Icons.arrow_back_ios_new,
            size:15,
            color: Colors.black,
          ),
        ),
      )
    );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}