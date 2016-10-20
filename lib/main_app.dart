
@HtmlImport('main_app.html')
library dev_meetings_sample.main_app;

import 'dart:html';

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart';

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


@PolymerRegister('main-app')
class MainApp extends PolymerElement {

  MainApp.created() : super.created();


  @property
  final List<Page> pages = [
    new Page('Search users', 'search', 'search-element', isDefault: true),
    new Page('Premium users', 'premium', 'premium-element')
  ];

  @Property(notify: true)
  int selectedIndex = 0;

  @Property(notify: true)
  String selectedName;


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

      for(var child in pageContainer.children)
      {
        child.remove();
      }

      notifyPath("selectedName", newPage.name);

      pageContainer.append(new Element.tag(newPage.element));

    }
  }

  ready() {
    changePage();
  }


}
