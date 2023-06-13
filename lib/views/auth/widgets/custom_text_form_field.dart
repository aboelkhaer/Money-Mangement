import 'package:money_mangement/exports.dart';

class CustomTextFormField extends StatelessWidget {
  final String title;
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final FocusNode focusNode;
  const CustomTextFormField({
    Key? key,
    required this.title,
    required this.textEditingController,
    required this.focusNode,
    required this.textInputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 66,
      child: TextFormField(
        focusNode: focusNode,
        keyboardType: textInputType,
        controller: textEditingController,
        obscureText: title == 'Password' ? true : false,
        decoration: InputDecoration(
          hintText: title,
          helperMaxLines: 1,
          hintStyle: const TextStyle(color: Colors.grey),
          filled: true,
          fillColor: const Color(0xFFF9F9F9),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
