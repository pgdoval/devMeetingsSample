// Copyright (c) 2016, Pablo González Doval. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
@HtmlImport('search_element.html')
library dev_meetings_sample.search;

import 'dart:html';

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart';
import 'package:dev_meetings_sample/user_description_element.dart';
import 'package:dev_meetings_sample/seeker_element.dart';
import 'package:polymer_elements/iron_ajax.dart';


@PolymerRegister('search-element')
class SearchElement extends PolymerElement {

  /// Constructor used to create instance of MainApp.
  SearchElement.created() : super.created();

  @property
  List<Map> users;

  //Whenever hay changes, searchUsers method is gonna get called
  @Property(observer: 'searchUsers')
  String hay;

  @reflectable
  void updateUsers(event, data)
  {
    var response = data.parseResponse();
    notifyPath("users", response);
  }

  @reflectable
  void searchUsers(newHay, _)
  {
    IronAjax ajax = querySelector("#findUsers");

    ajax.params = {"hay": newHay};

    ajax.generateRequest();
  }

}
