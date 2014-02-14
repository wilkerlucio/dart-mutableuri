Dart MutableUri
===============

Mutable version of Dart Uri core class

Install
-------

Just add to your `pubspec.yaml`:

```yaml
dependencies:
  mutableuri: any
```

Usage
-----

`MutableUri` implements the `Uri` core class, so you can use it as an Uri anywhere, it also has all default `Uri` initializers.
The difference is that in MutableUri you can change any field anytime:

```dart
import 'package:mutableuri/mutableuri.dart';

void main() {
  MutableUri uri = MutableUri.parse('http://www.dartlang.org');
  
  uri.scheme = 'https';
  
  uri.toString(); // returns https://www.dartlang.org
}
```

In addition to the default `Uri` initializers, you can also started a `MutableUri` from an `Uri`:

```dart
MutableUri uri = new MutableUri.fromUri(uriInstance);
```

Just a catch, the way `MutableUri` works is by recreating an internal representation of an `Uri` object and delegating the getters to it.
So, you can't mutate `pathSegments` or `queryParameters` direct, but you can replace them, as:

```dart
import 'package:mutableuri/mutableuri.dart';

void main() {
  MutableUri uri = MutableUri.parse('http://www.dartlang.org/?a=1');
  
  Map<String, String> params = new Map.from(uri.queryParameters);
  params['b'] = '2';
  uri.queryParameters = params;
  
  uri.toString(); // returns https://www.dartlang.org/?a=1&b=2
}
```

I think we can create a solution for that by having an observable list/map to update the instance, Dart 1.2 seems to going to have this [ObservableList](https://api.dartlang.org/apidocs/channels/be/#observe/observe.ObservableList) built in, so I'm waiting for it to add this feature in future.
