library mutableuri;

import 'dart:mirrors';

class MutableUri implements Uri {
  Uri _uri;

  MutableUri({
    String scheme,
    String userInfo: "",
    String host: "",
    int port: 0,
    String path,
    Iterable<String> pathSegments,
    String query,
    Map<String, String> queryParameters,
    String fragment: ""}) {

    _uri = new Uri(scheme: scheme,
                   userInfo: userInfo,
                   host: host,
                   port:port,
                   path: path,
                   pathSegments: pathSegments,
                   query: query,
                   queryParameters: queryParameters,
                   fragment: fragment);
  }

  MutableUri.http(String authority,
                  String unencodedPath,
                  [Map<String, String> queryParameters]) {
    this._uri = new Uri.http(authority, unencodedPath, queryParameters);
  }

  MutableUri.https(String authority,
                  String unencodedPath,
                  [Map<String, String> queryParameters]) {
    this._uri = new Uri.https(authority, unencodedPath, queryParameters);
  }

  MutableUri.file(String path, {bool windows}) {
    this._uri = new Uri.file(path, windows: windows);
  }

  MutableUri.fromUri(this._uri);

  static MutableUri parse(String uri) => new MutableUri.fromUri(Uri.parse(uri));

  void set scheme(String scheme) {
    _uri = new Uri(scheme: scheme,
                   userInfo: userInfo,
                   host: host,
                   port: port,
                   path: path,
                   query: query,
                   fragment: fragment);
  }

  void set host(String host) {
    _uri = new Uri(scheme: scheme,
                   userInfo: userInfo,
                   host: host,
                   port: port,
                   path: path,
                   query: query,
                   fragment: fragment);
  }

  void set port(int port) {
    _uri = new Uri(scheme: scheme,
                   userInfo: userInfo,
                   host: host,
                   port: port,
                   path: path,
                   query: query,
                   fragment: fragment);
  }

  void set path(String path) {
    _uri = new Uri(scheme: scheme,
                   userInfo: userInfo,
                   host: host,
                   port: port,
                   path: path,
                   query: query,
                   fragment: fragment);
  }

  void set pathSegments(List<String> pathSegments) {
    _uri = new Uri(scheme: scheme,
                   userInfo: userInfo,
                   host: host,
                   port: port,
                   pathSegments: pathSegments,
                   query: query,
                   fragment: fragment);
  }

  void set query(String query) {
    _uri = new Uri(scheme: scheme,
                   userInfo: userInfo,
                   host: host,
                   port: port,
                   path: path,
                   query: query,
                   fragment: fragment);
  }

  void set queryParameters(Map<String, String> queryParameters) {
    _uri = new Uri(scheme: scheme,
                   userInfo: userInfo,
                   host: host,
                   port: port,
                   path: path,
                   queryParameters: queryParameters,
                   fragment: fragment);
  }

  void set fragment(String fragment) {
    _uri = new Uri(scheme: scheme,
                   userInfo: userInfo,
                   host: host,
                   port: port,
                   path: path,
                   query: query,
                   fragment: fragment);
  }

  String toString() => _uri.toString();

  dynamic noSuchMethod(Invocation msg) {
    InstanceMirror mirror = reflect(_uri);

    if (msg.isGetter)
      return mirror.getField(msg.memberName).reflectee;
    else if (msg.isMethod)
      return mirror.invoke(msg.memberName, msg.positionalArguments, msg.namedArguments).reflectee;
    else
      return super.noSuchMethod(msg);
  }
}