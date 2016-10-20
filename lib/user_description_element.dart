
@HtmlImport('user_description_element.html')
library dev_meetings_sample.userDescription;

import 'dart:html';

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart';

import 'package:polymer_elements/iron_ajax.dart';

@PolymerRegister('user-description-element')
class UserDescriptionElement extends PolymerElement {

  UserDescriptionElement.created() : super.created();

  @property
  Map user;

  // 2/ Adding premium property
  @property
  boolean premium;

  @reflectable
  String getBackground(_user)
  {
    var image = _user['photo'];

    if(image==null)
      return "url(../../images/user.png)";


      return "url(../../images/$image)";
  }

  @reflectable
  void togglePremium(a, _)
  {
    IronAjax ajax = querySelector("#premium-ajax");

    ajax.params = {"value": !user['premium']};

    ajax.generateRequest();
  }

  @reflectable
  void reflectPremiumChange(event, data)
  {
    var response = data.parseResponse();
    notifyPath("user", response);
  }

}
