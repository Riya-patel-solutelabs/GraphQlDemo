import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:graphqldemo/core/utils/validation_utils.dart';
import 'package:graphqldemo/features/mainApp/data/models/author_model.dart';
import 'package:graphqldemo/features/mainApp/data/models/blog_model.dart';
import 'package:graphqldemo/features/mainApp/presentation/cubit/blog_cubit.dart';
import 'package:graphqldemo/features/mainApp/presentation/widgets/text_form_field_widget.dart';

import '../../../../core/constants/constants.dart';
import '../widgets/button_widget.dart';

class AddBlogPage extends StatefulWidget {
  @override
  State<AddBlogPage> createState() => _AddBlogPageState();
}

class _AddBlogPageState extends State<AddBlogPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController excerptController = TextEditingController();
  TextEditingController authorController = TextEditingController();

  TextEditingController contentController = TextEditingController();

  late FocusNode titleNode;
  late FocusNode contentNode;
  late FocusNode authorNode;
  late FocusNode excerptNode;
  late FocusNode addNode;

  @override
  void initState() {
    titleNode = FocusNode();
    contentNode = FocusNode();
    authorNode = FocusNode();
    excerptNode = FocusNode();
    addNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    titleNode.dispose();
    contentNode.dispose();
    authorNode.dispose();
    excerptNode.dispose();
    addNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   elevation: 0,
      //   title: Text('Add New Blog'),
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back),
      //     onPressed: () {},
      //   ),
      // ),
      appBar: getAddBlogAppbar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Constants.minimumPadding),
          child: Column(
            children: [
              addPicture(),
              TextFormFieldWidget(
                labelText: 'Title',
                hintText: 'Enter Blog Title',
                textInputType: TextInputType.multiline,
                textInputAction: TextInputAction.next,
                controller: titleController,
                prefixIcon: Icon(Icons.title),
                currentNode: titleNode,
                isExpaned: false,
              ),
              TextFormFieldWidget(
                labelText: 'Author',
                hintText: 'Enter Author Name',
                textInputType: TextInputType.text,
                textInputAction: TextInputAction.next,
                controller: authorController,
                prefixIcon: Icon(Icons.person),
                currentNode: authorNode,
                isExpaned: false,
              ),
              TextFormFieldWidget(
                labelText: 'Excerpt',
                hintText: 'Enter excerpt',
                textInputType: TextInputType.text,
                textInputAction: TextInputAction.next,
                controller: excerptController,
                prefixIcon: Icon(Icons.message),
                currentNode: excerptNode,
                isExpaned: false,
              ),
              TextFormFieldWidget(
                labelText: 'Content',
                hintText: 'Enter content',
                textInputType: TextInputType.text,
                textInputAction: TextInputAction.next,
                controller: contentController,
                prefixIcon: Icon(Icons.message),
                currentNode: contentNode,
                isExpaned: true,
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ButtonWidget(
                    bgColor: Colors.grey,
                    buttonTitle: 'Cancel',
                    ontap: () {
                      context.pop();
                    },
                  ),
                  ButtonWidget(
                    buttonTitle: 'Add',
                    bgColor: Constants.darkBlue,
                    ontap: () {
                      onBlogAdded(context);
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void onBlogAdded(BuildContext context) {
    final ValidationUtils validation = ValidationUtils(context);
    final String blogtitle = titleController.text;
    final String blogauthor = authorController.text;
    final String blogexcerpt = excerptController.text;
    final String blogcontent = contentController.text;

    if (validation.isValidTitle(blogtitle) &&
        validation.isValidAuthor(blogauthor) &&
        validation.isValidExcerpt(blogexcerpt) &&
        validation.isValidContent(blogcontent)) {
      try {
        final AuthorModel newAuthor = AuthorModel(name: blogauthor);
        final BlogModel newBlog = BlogModel(
          title: blogtitle,
          excerpt: blogexcerpt,
          content: blogcontent,
          author: newAuthor,
        );
        BlocProvider.of<BlogCubit>(context).addNewBlog(newBlog);

        context.pop();
      } on Exception catch (_) {
        print('not able to add');
      }
    }
  }

  ///appbar widget
  PreferredSizeWidget getAddBlogAppbar(BuildContext context) => AppBar(
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.white),
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          color: Colors.black,
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            context.pop();
          },
        ),
        title: Text(
          'Add new Blog',
          style: const TextStyle(
            color: Constants.darkBlue,
            fontSize: 18,
          ),
        ),
      );

  ///add picture widget
  Widget addPicture() => Center(
        child: Padding(
          padding: const EdgeInsets.only(top: Constants.minimumPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const CircleAvatar(
                radius: 60,
                child: Icon(
                  Icons.add_a_photo,
                  color: Color.fromARGB(255, 208, 232, 252),
                  size: 50,
                ),
                backgroundColor: Color.fromARGB(255, 1, 23, 61),
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Add Blog Cover',
                    style: TextStyle(color: Colors.black),
                    textAlign: TextAlign.center,
                  )),
            ],
          ),
        ),
      );
}
