import 'package:flutter/material.dart';
import '../utils/constants.dart';

class CustomSearchField extends StatefulWidget {
  const CustomSearchField({
    super.key,
    required this.onChanged,
    required this.onClose,
  });
  final ValueChanged<String> onChanged;
  final Function onClose;

  @override
  State<CustomSearchField> createState() => _CustomSearchFieldState();
}

class _CustomSearchFieldState extends State<CustomSearchField> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(SpaceConstants.medium),
      child: SizedBox(
        width: double.infinity,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 40,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(StyleConstants.borderRadius),
              ),
              child: Row(
                children: [
                  _prefixIcon(),
                  Expanded(
                    child: TextField(
                      scribbleEnabled: false,
                      controller: _controller,
                      textAlign: TextAlign.start,
                      cursorColor: Colors.black,
                      cursorHeight: 20,
                      cursorWidth: 2,
                      onChanged: widget.onChanged,
                      autofocus: false,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  _suffixIcon()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _prefixIcon() {
    return const Padding(
      padding: EdgeInsets.only(left: SpaceConstants.small, right: SpaceConstants.small),
      child: Icon(Icons.search),
    );
  }

  Widget _suffixIcon() {
    return Visibility(
      visible: _controller.value.text.isNotEmpty,
      child: InkWell(
        onTap: () {
          _controller.clear();
          widget.onClose();
        },
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: SpaceConstants.small),
          child: Icon(Icons.close),
        ),
      ),
    );
  }
}
