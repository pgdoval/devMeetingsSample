// Copyright (c) 2016, Pablo González Doval. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
@HtmlImport('seeker_element.html')
library dev_meetings_sample.seeker;

import 'dart:html';

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart';


@PolymerRegister('seeker-element')
class SeekerElement extends PolymerElement {

  SeekerElement.created() : super.created();

  @property
  String toSeek;

  @Property(notify:true)
  String outerToSeek;

  @reflectable
  void search(event, _)
  {
    notifyPath("outerToSeek", toSeek);
  }

}
