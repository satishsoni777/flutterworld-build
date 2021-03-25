import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterworld/components/app_appbar.dart';
import 'package:flutterworld/style/app_colors.dart';

class BlogPage extends StatelessWidget {  
  List<Widget> pageContent = [
    Title(
      autofocus: true,
    ),
    ContentType()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppbar(),
      body: Row(
        children: [
          Expanded(
            child: Container(),
            flex: 3,
          ),
          Expanded(
            child: Scrollbar(
                child: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: ListView.builder(
                itemBuilder: (context, i) {
                  return pageContent[i];
                },
                itemCount: pageContent.length,
              ),
            )),
            flex: 7,
          ),
          Expanded(
            child: Container(),
            flex: 3,
          ),
        ],
      ),
    );
  }
}

class ContentModel {
  int index;
  num id;
  String title;
  String content;
  String type;
  ContentModel({this.content, this.id, this.index, this.title, this.type});
}

class ImageType extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ContentType extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AppTextField(hintText: "Content");
  }
}

class Title extends StatelessWidget {
  Title({this.autofocus = false});
  final autofocus;
  @override
  Widget build(BuildContext context) {
    return AppTextField(
      hintStyle: TextStyle(
        fontSize: 24,
        color: AppColors.lightGray,
      ),
      autofocus: autofocus,
    );
  }
}

// ignore: must_be_immutable
class AppTextField extends StatefulWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final bool autofocus;
  final TextStyle hintStyle;
  final int maxLine;
  AppTextField(
      {this.hintText,
      this.textEditingController,
      this.hintStyle,
      this.maxLine,
      this.autofocus = false});

  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

ValueNotifier<bool> hideIcon = ValueNotifier<bool>(false);

class _AppTextFieldState extends State<AppTextField> {
  var _focusNode = FocusNode();
  bool isTappedOnAddButton = false;
  final _textEditController = TextEditingController();
  @override
  void initState() {
    _textEditController.addListener(() {
      if (_textEditController.text.isNotEmpty) {
        hideIcon.value = false;
        setState(() {});
      } else {
        hideIcon.value = true;
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        ValueListenableBuilder(
          valueListenable: hideIcon,
          builder: (c, value, a) {
            return a;
          },
          child: Form(
            // key: key,
            child: RawKeyboardListener(
              onKey: (key) {},
              focusNode: _focusNode,
              child: TextField(
                maxLines: widget.maxLine,
                style: widget.hintStyle != null
                    ? TextStyle(fontSize: widget.hintStyle.fontSize)
                    : TextStyle(fontSize: 20),
                controller: widget.textEditingController ?? _textEditController,
                autofocus: widget.autofocus,
                // focusNode: _focusNode,
                onTap: () {
                  if (_textEditController.text.isEmpty)
                    hideIcon.value = _focusNode.hasFocus;
                  setState(() {});
                },
                decoration: InputDecoration(
                    hintText: widget.hintText ?? "Title",
                    alignLabelWithHint: true,
                    focusedBorder: InputBorder.none,
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    prefix: (hideIcon.value)
                        ? IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              isTappedOnAddButton = !isTappedOnAddButton;
                              setState(() {});
                            },
                            splashRadius: 20.0,
                          )
                        : Container(
                            height: 30.0,
                            width: 40.0,
                          ),
                    prefixIconConstraints:
                        BoxConstraints(maxHeight: 30.0, maxWidth: 30.0),
                    disabledBorder: InputBorder.none,
                    hintStyle: widget.hintStyle ??
                        TextStyle(color: AppColors.lightGray, fontSize: 20.0)),
                cursorHeight: 30.0,
                cursorWidth: 1.50,

                textInputAction: TextInputAction.send,
              ),
            ),
          ),
        ),
        Positioned(child: Visibility(visible: false, child: Options()))
      ],
    );
  }
}

class Options extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.0,
      height: 120.0,
      color: Colors.red,
    );
  }
}
