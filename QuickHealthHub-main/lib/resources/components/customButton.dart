import 'package:qhhub/consts/consts.dart';

class CustomButton extends StatelessWidget {
  final Function()? onTap;
  final String buttonText;
  const CustomButton({super.key, required this.onTap, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidth,
      height: 44,
      child:
          ElevatedButton(onPressed: onTap, child: buttonText.text.make()),
    );
  }
}
