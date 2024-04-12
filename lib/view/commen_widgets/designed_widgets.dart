import 'package:flutter/material.dart';
import 'package:poll_app/constants/constants.dart';

class OptionTextfield extends StatelessWidget {
  const OptionTextfield(
      {super.key, required this.optionsController, required this.text});

  final TextEditingController optionsController;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: optionsController,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 10, top: 13),
          hintText: text,
          hintStyle: const TextStyle(color: Color.fromARGB(255, 63, 59, 59)),
          border: InputBorder.none,
          suffixIcon: GestureDetector(
            onTap: () {
              optionsController.clear();
            },
            child: const Icon(
              Icons.close,
              color: Colors.white,
            ),
          )),
    );
  }
}

class DesignedContainerTile extends StatelessWidget {
  final Widget? widget;
  final double? height;
  final double? width;
  final bool? changeBorderColor;
  const DesignedContainerTile({
    this.widget,
    this.height,
    this.width,
    this.changeBorderColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final borderColor = changeBorderColor != null && changeBorderColor!
        ? const Color.fromRGBO(245, 134, 0, 1)
        : GlobalVariables.borderColor;

    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.black,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border(
          top: BorderSide(color: borderColor, width: 0.2),
          left: BorderSide(color: borderColor, width: 1),
          right: BorderSide(color: borderColor, width: 1),
          bottom: BorderSide(color: borderColor, width: 1.0),
        ),
      ),
      child: widget,
    );
  }
}

class OptionContainStack extends StatefulWidget {
  final String text;

  const OptionContainStack({
    super.key,
    required this.text,
  });

  @override
  OptionContainStackState createState() => OptionContainStackState();
}

class OptionContainStackState extends State<OptionContainStack> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _expanded = !_expanded;
        });
      },
      child: Stack(
        children: [
          Container(
            height: _expanded ? 180 : 80,
            width: 150,
            decoration: BoxDecoration(
              color: Color.fromRGBO(236, 191, 4, 0.33),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          if (_expanded)
            Positioned(
              bottom: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  children: [
                    Container(
                      height: 7,
                      width: 250,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 156, 135, 70),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: FractionallySizedBox(
                        alignment: Alignment.centerLeft,
                        widthFactor: 30 / 100,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFF58600),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text('30%',
                        style: TextStyle(
                          color: Color(0xFFF58600),
                        )),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
            ),
          Align(
            alignment: Alignment.center,
            child: Text(
              widget.text,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
