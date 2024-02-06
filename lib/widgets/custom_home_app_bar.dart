import 'package:ayurvedic_clinic/constants/constants.dart';
import 'package:flutter/material.dart';



class CustomHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final TextEditingController controller;

  CustomHomeAppBar({
    super.key,
    required this.controller,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 10.0,
              left: 10,
              right: 30,
            ),
            child: AppBar(
              elevation: 0,
              actions: [
                Image.asset("assets/images/notify.png"),
              ],
            ),
          ),
          KHeight10,
          Padding(
            padding:const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 2,
                  child: CustomSearchField(
                      hintText: "Search for treatments",
                      controller: controller),
                ),
                Flexible(
                    flex: 1,
                    child: CustomSearchButton(
                        buttonText: "search", onPressed: () {}))
              ],
            ),
          ),
          KHeight10,
          Padding(
            padding:const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               const Expanded(
                  flex: 2,
                  child: Text("Sort by:",style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                PopupMenuButton(
                  itemBuilder: (BuildContext context) {
                    return <PopupMenuEntry>[
                      PopupMenuItem(
                        child: Text('Option 1'),
                        value: 1,
                      ),
                      PopupMenuItem(
                        child: Text('Option 2'),
                        value: 2,
                      ),
                      PopupMenuItem(
                        child: Text('Option 3'),
                        value: 3,
                      ),
                    ];
                  },
                  offset:const Offset(0, kToolbarHeight + 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    padding:const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: KBlackColor),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding:const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: Text(
                              'Date',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: KGreenColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          const Divider()
        ]);
  }

  @override
  Size get preferredSize =>
    const  Size.fromHeight(kToolbarHeight + 140.0); // Adjust the height as needed
}

class CustomSearchField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  final bool isPassword;
 const CustomSearchField({
    super.key,
    required this.hintText,
    required this.controller,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword,
      controller: controller,
      decoration: InputDecoration(
          prefixIcon:const Icon(
            Icons.search,
            size: 18,
          ),
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(10)),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.grey,
                width: .5,
              ),
              borderRadius: BorderRadius.circular(10)),
          filled: true,
          fillColor: KLightGreyColor,
          contentPadding:const EdgeInsets.symmetric(horizontal: 10, vertical: 12)),
    );
  }
}

class CustomSearchButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
 const CustomSearchButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: KGreenColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Container(
        height: 45,
        width: 50,
        child: Center(
          child: Text(
            buttonText,
            style: const TextStyle(
              color: KWhiteColor,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
