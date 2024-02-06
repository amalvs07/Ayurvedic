import 'package:ayurvedic_clinic/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomCardView extends StatelessWidget {
  const CustomCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: KLightGreyColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  flex: 1,
                  child: Text(
                    '1 ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Vikram',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Couple Combo Package (Rejuven...",
                        style: TextStyle(
                            color: KGreenColor,
                            fontSize: 13,
                            overflow: TextOverflow.ellipsis),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              child: Row(
                                children: [
                                  Icon(Icons.date_range,size: 20, color: Colors.red),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "31/11/2024",
                                    style: TextStyle(color: Colors.grey),
                                  )
                                ],
                              ),
                            ),
                          ),
                          KWidth10,
                          Expanded(
                            child: SizedBox(
                              child: Row(
                                children: [
                                  Icon(Icons.people,size: 20, color: Colors.red),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Name",
                                    style: TextStyle(color: Colors.grey),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            KHeight10,
            const Divider(),
            KHeight10,
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'View Booking details ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios, color: Colors.green),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
