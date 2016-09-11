// Copyright (c) 2016, Pablo González Doval. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
@HtmlImport('user_description_element.html')
library dev_meetings_sample.userDescription;

import 'dart:html';

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart';


@PolymerRegister('user-description-element')
class UserDescriptionElement extends PolymerElement {

  /// Constructor used to create instance of MainApp.
  UserDescriptionElement.created() : super.created();

  @property
  Map user;


  @reflectable
  String getBackground(_user)
  {
    var image = _user['photo'];

    if(image==null)
      return "url(../../images/user.png)";


      return "url(../../images/$image)";
  }

}
