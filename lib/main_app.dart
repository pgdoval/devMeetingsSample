// Copyright (c) 2016, Pablo González Doval. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
@HtmlImport('main_app.html')
library dev_meetings_sample.main_app;

import 'dart:html';

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart';


//We will use it to emulate the different routes in our website
//JsProxy to make a model class reflectable
class Page extends JsProxy{

  @property
  String name;

  @property
  String path;

  String element;

  bool isDefault;

  Page(this.name, this.path, this.element, {this.isDefault: false});

  String toString() => '$name';
}





/// Uses [PaperInput, PaperMenu]
@PolymerRegister('main-app')
class MainApp extends PolymerElement {

  /// Constructor used to create instance of MainApp.
  MainApp.created() : super.created();




  /// The list of pages in our app.
  @property
  final List<Page> pages = [
    new Page('Search users', 'search', 'search-element', isDefault: true),
    new Page('Premium users', 'premium', 'premium-element')
  ];

  ///notify true for double binding
  ///We should let it be -1, but we are hacking a little bit because we know
  ///that the default page is page number 0
  @Property(notify: true)
  int selectedIndex = 0;

  @Property(notify: true)
  String selectedName;





  //"Hook" method which is bound by the template
  @reflectable
  void navigateToPage(event, [_]) {
    changePage();
  }




  void changePage() {
    Element pageContainer = querySelector("#pages");

    Page newPage = null;

    if((selectedIndex < pages.length) && (selectedIndex>=0))
    {
      newPage = pages[selectedIndex];
    }

    if(newPage==null){
      newPage = pages.firstWhere((page) => page.isDefault);
    }

    if(newPage!=null){


      //Remove currently loaded page
      for(var child in pageContainer.children)
      {
        child.remove();
      }

      //Update the title. Sometimes you need to call notifyPath, which updates
      //a property's value and tells its observers to look for its new value.
      //This usually happens with subproperties.

      notifyPath("selectedName", newPage.name);

      //Load new page
      pageContainer.append(new Element.tag(newPage.element));

    }
  }



  /// We call changePage to automatically load the default page
  ready() {
    changePage();
  }


}
