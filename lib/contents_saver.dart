import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

import 'logos.dart';

enum InstagramID {
  instagramDp,
  instagramBio,
  instagramPost,
  instagramReels,
  instagramStory,
  instagramCaption,
}

class InstagramModal {
  final String contentName;
  Image logo = Logos.instagram;
  Uint8List? image;
  String? caption;

  InstagramModal({this.caption, required this.contentName, this.image});
}

class ContentsSaver extends ChangeNotifier {
  late List<InstagramModal> _contents;
  InstagramModal instagramDp = InstagramModal(contentName: 'Profile Picture');
  InstagramModal instagramBio = InstagramModal(contentName: 'Bio');
  InstagramModal instagramPost = InstagramModal(contentName: 'Post');
  InstagramModal instagramReels = InstagramModal(contentName: 'Reels');
  InstagramModal instagramStory = InstagramModal(contentName: 'Story');
  InstagramModal instagramCaption = InstagramModal(contentName: 'Caption');

  get content => _contents;
  get numberOfContents => _contents.length;

  hasContent() {
    displayContent();
    bool con = (instagramBio.caption == null &&
            instagramDp.image == null &&
            instagramPost.image == null &&
            instagramReels.image == null &&
            instagramStory.image == null &&
            instagramCaption.caption == null)
        ? false
        : true;
    return con;
  }

  displayContent() {
    List<InstagramModal> contents = [
      instagramDp,
      instagramBio,
      instagramPost,
      instagramReels,
      instagramStory,
      instagramCaption
    ];
    if (instagramCaption.caption == null) {
      contents.remove(instagramCaption);
    }
    if (instagramDp.image == null) {
      contents.remove(instagramDp);
    }
    if (instagramPost.image == null) {
      contents.remove(instagramPost);
    }
    if (instagramReels.image == null) {
      contents.remove(instagramReels);
    }
    if (instagramStory.image == null) {
      contents.remove(instagramStory);
    }
    if (instagramBio.caption == null) {
      contents.remove(instagramBio);
    }
    _contents = contents;
  }

  ///Picks Image from the given Source
  pickImage(ImageSource source) async {
    final ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: source);

    if (file != null) {
      return await file.readAsBytes();
    }
  }

  ///Picks Image from Gallery and Saves it to the variable
  selectImageFromGallery(InstagramID instagram) async {
    Uint8List image = await pickImage(ImageSource.gallery);
    saveFile(instagram, image);
  }

  ///Picks Image from Camera and Saves it to the variable
  selectImageFromCamera(InstagramID instagram) async {
    Uint8List image = await pickImage(ImageSource.camera);
    saveFile(instagram, image);
  }

  ///Saves the given file to its variable
  saveFile(InstagramID instagram, Uint8List file) {
    switch (instagram) {
      case InstagramID.instagramDp:
        instagramDp.image = file;
        break;
      case InstagramID.instagramPost:
        instagramPost.image = file;
        break;
      case InstagramID.instagramReels:
        instagramReels.image = file;
        break;
      case InstagramID.instagramStory:
        instagramStory.image = file;
        break;
      default:
        null;
    }
    notifyListeners();
  }

  ///Saves the given message to its variable
  saveCaption(InstagramID instagram, String caption) {
    switch (instagram) {
      case InstagramID.instagramBio:
        instagramBio.caption = caption;
        break;
      case InstagramID.instagramCaption:
        instagramCaption.caption = caption;
        break;
      default:
        null;
    }
    notifyListeners();
  }
}
