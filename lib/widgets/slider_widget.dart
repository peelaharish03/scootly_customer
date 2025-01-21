import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:scootly_customer/core/constants/colors.dart';
import 'package:scootly_customer/core/constants/img_const.dart';

class SliderWidget extends StatefulWidget {
  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  final List<String> imageList = [
    SLIDER1,
    SLIDER2,
    SLIDER3,
    SLIDER4,
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider.builder(
          itemCount: imageList.length,
          itemBuilder: (context, index, realIndex) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.asset(
                imageList[index],
                fit: BoxFit.cover,
              ),
            );
          },
          options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 18 / 8.5,
            viewportFraction: 0.95,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        Positioned(
          bottom: 14.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imageList.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => setState(() {
                  _currentIndex = entry.key;
                }),
                child: Container(
                  width: 8.0,
                  height: 8.0,
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == entry.key
                        ? AppColor.black // Active dot color
                        : AppColor.grey.withOpacity(0.2), // Inactive dot color
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
