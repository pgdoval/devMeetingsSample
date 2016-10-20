
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


  @reflectable
  String getBackground(_user)
  {
    var image = _user['photo'];

    if(image==null)
      return "url(../../images/user.png)";


      return "url(../../images/$image)";
  }

  // 9/ Generating and executing the ajax request when needed
  @reflectable
  void togglePremium(a, _)
  {
    IronAjax ajax = querySelector("#premium-ajax");

    ajax.params = {"value": !user['premium']};

    ajax.generateRequest();
  }

  // 6/ When the backend does its job, it returns the user. We just want to notify that the user has changed
  @reflectable
  void reflectPremiumChange(event, data)
  {
    var response = data.parseResponse();
    notifyPath("user", response);
  }

}
