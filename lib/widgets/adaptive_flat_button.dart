import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveFlatButton extends StatelessWidget {
  final String _text;
  final Function _action;

  AdaptiveFlatButton(this._text, this._action);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Platform.isIOS
        ? CupertinoButton(
            color: _theme.primaryColor,
            child: Text(
              _text,
              style: TextStyle(
                color: _theme.textTheme.button.color,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: _action,
          )
        : FlatButton(
            color: _theme.primaryColor,
            textColor: _theme.textTheme.button.color,
            child: Text(
              _text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: _action,
          );
  }
}
