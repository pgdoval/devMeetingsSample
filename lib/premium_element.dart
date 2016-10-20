
@HtmlImport('premium_element.html')
library dev_meetings_sample.premium;

import 'dart:html';

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart';


@PolymerRegister('premium-element')
class PremiumElement extends PolymerElement {

  PremiumElement.created() : super.created();

  @property
  List<Map> users;

  @Property(observer: 'searchUsers')
  String hay;

  @reflectable
  void updateUsers(event, data)
  {
    var response = data.parseResponse();
    notifyPath("users", response);
  }

}