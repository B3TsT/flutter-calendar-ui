import 'package:flutter/material.dart';

class CircleButton extends StatefulWidget {
  const CircleButton(
      {super.key,
      this.width,
      required this.height,
      required this.color,
      required this.text,
      this.inButtonPressed = false,
      this.size = 18,
      this.onTap,
      this.controller = 0,
      this.border = true});
  final double? width;
  final double height;
  final double size;
  final Color color;
  final bool border;
  final String text;
  final bool inButtonPressed;
  final int controller;
  final VoidCallback? onTap;

  @override
  State<CircleButton> createState() => _CircleButtonState();
}

class _CircleButtonState extends State<CircleButton> {
  bool _isPressed = false;
  late bool _select;
  @override
  void initState() {
    super.initState();
    _select = widget.inButtonPressed;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      onTap: () {
        // print("ejecutando");
        if (_select == true) {
          _select = false;
        } else {
          switch (widget.controller) {
            case 1:
              _select = true;
              break;
            case 2:
              _select = true;
              break;
            case 3:
              _select = true;
              break;
            default:
              _select = true;
          }
        }
        setState(() {});
      },
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          decoration: BoxDecoration(
            color: _select ? Colors.black : widget.color,
            border: _select
                ? Border.all(width: 0)
                : widget.border
                    ? Border.all(width: 1, color: const Color(0xffbabbb6))
                    : null,
            borderRadius: BorderRadius.circular(widget.height / 2),
            boxShadow: [
              BoxShadow(
                color: _isPressed ? Colors.grey.shade400 : Colors.transparent,
                offset: const Offset(2, 1),
                blurRadius: 2,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Center(
            child: Text(
              widget.text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: widget.size,
                  color: _select ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _isPressed = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _isPressed = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _isPressed = false;
    });
  }
}
