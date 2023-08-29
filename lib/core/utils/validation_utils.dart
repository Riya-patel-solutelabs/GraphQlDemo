import 'package:flutter/material.dart';
import 'package:graphqldemo/core/utils/snack_bar_extension.dart';

class ValidationUtils {
  ///default constructor
  ValidationUtils(this.context);

  ///context var
  final BuildContext context;

  ///function to validate title
  bool isValidTitle(String title) {
    if (title.isEmpty || title == '') {
      context.showSnackBar('Please Enter Title');
      return false;
    } else {
      return true;
    }
  }

  ///function to validate title
  bool isValidAuthor(String author) {
    if (author.isEmpty || author == '') {
      context.showSnackBar('Please Enter Author Name');
      return false;
    } else {
      return true;
    }
  }

  ///function to validate title
  bool isValidExcerpt(String excerpt) {
    if (excerpt.isEmpty || excerpt == '') {
      context.showSnackBar('Please Enter Excerpt');
      return false;
    } else {
      return true;
    }
  }

  ///function to validate title
  bool isValidContent(String content) {
    if (content.isEmpty || content == '') {
      context.showSnackBar('Please Enter Content');
      return false;
    } else {
      return true;
    }
  }
}
