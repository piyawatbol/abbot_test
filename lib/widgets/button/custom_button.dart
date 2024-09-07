import '../../config/app_import.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double? width;
  final double height;
  final VoidCallback ontap;
  const CustomButton({
    super.key,
    required this.text,
    required this.ontap,
    this.width,
    this.height = 50,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 50,
      child: ElevatedButton(
        onPressed: ontap,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.black,
        ),
        child: AutoText(
          text,
          color: Colors.white,
          translate: true,
        ),
      ),
    );
  }
}

class CustomButton2 extends StatelessWidget {
  final String text;
  final double? width;
  final double height;
  final VoidCallback ontap;
  const CustomButton2({
    super.key,
    required this.text,
    required this.ontap,
    this.width,
    this.height = 50,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 50,
      child: ElevatedButton(
        onPressed: ontap,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
        ),
        child: AutoText(
          text,
          color: Colors.black,
          translate: true,
        ),
      ),
    );
  }
}
