import 'package:unittest/unittest.dart';
import 'package:mutableuri/mutableuri.dart';

void main() {
  MutableUri uri;

  group('initialize', () {
    group('from fragments', () {
      test('using path and query', () {
        uri = new MutableUri(scheme: 'http', userInfo: 'wilker@dart', host: 'www.dartlang.org', port: 3000, path: 'path/here', query: 'some=query', fragment: 'fragment');

        expect(uri.toString(), 'http://wilker@dart@www.dartlang.org:3000/path/here?some=query#fragment');
      });

      test('using pathSegments and queryParameters', () {
        uri = new MutableUri(scheme: 'http', userInfo: 'wilker@dart', host: 'www.dartlang.org', port: 3000, pathSegments: ['path', 'here'], queryParameters: {'some': 'query'}, fragment: 'fragment');

        expect(uri.toString(), 'http://wilker@dart@www.dartlang.org:3000/path/here?some=query#fragment');
      });
    });

    test('initialize from http', () {
      uri = new MutableUri.http('www.dartlang.org', 'uri', {'a': 'b'});

      expect(uri.toString(), 'http://www.dartlang.org/uri?a=b');
    });

    test('initialize from https', () {
      uri = new MutableUri.https('www.dartlang.org', 'uri', {'a': 'b'});

      expect(uri.toString(), 'https://www.dartlang.org/uri?a=b');
    });

    test('initialize from file', () {
      uri = new MutableUri.file('some\\path', windows: true);

      expect(uri.toString(), 'some/path');
    });
  });

  group('proxy to Uri', () {
    setUp(() {
      uri = MutableUri.parse('http://www.dartlang.org/');
    });

    test('getters', () {
      expect(uri.host, 'www.dartlang.org');
      expect(uri.scheme, 'http');
    });

    test('functions', () {
      expect(uri.resolve('other').path, '/other');
    });

    test('fails when there is no method', () {
      expect(() { uri.invalid; }, throws);
      expect(() { uri.noMethod(); }, throws);
    });
  });

  group('mutating', () {
    test('scheme', () {
      uri = MutableUri.parse('http://www.dartlang.org/');
      uri.scheme = 'https';

      expect(uri.toString(), 'https://www.dartlang.org:80/');
    });

    test('host', () {
      uri = MutableUri.parse('http://www.dartlang.org/');
      uri.host = 'api.dartlang.org';

      expect(uri.toString(), 'http://api.dartlang.org/');
    });

    test('port', () {
      uri = MutableUri.parse('http://www.dartlang.org/');
      uri.port = 3000;

      expect(uri.toString(), 'http://www.dartlang.org:3000/');
    });

    test('path', () {
      uri = MutableUri.parse('http://www.dartlang.org/');
      uri.path = 'index.html';

      expect(uri.toString(), 'http://www.dartlang.org/index.html');
    });

    test('pathSegments', () {
      uri = MutableUri.parse('http://www.dartlang.org/');
      uri.pathSegments = ['hello', 'world'];

      expect(uri.toString(), 'http://www.dartlang.org/hello/world');
    });

    test('query', () {
      uri = MutableUri.parse('http://www.dartlang.org/');
      uri.query = 'a=b';

      expect(uri.toString(), 'http://www.dartlang.org/?a=b');
    });

    test('queryParameters', () {
      uri = MutableUri.parse('http://www.dartlang.org/');
      uri.queryParameters = {'a': 'b'};

      expect(uri.toString(), 'http://www.dartlang.org/?a=b');
    });

    test('fragment', () {
      uri = MutableUri.parse('http://www.dartlang.org/');
      uri.fragment = 'frag';

      expect(uri.toString(), 'http://www.dartlang.org/#frag');
    });

    test('', () {
      uri = MutableUri.parse('http://www.dartlang.org/');

      expect(uri.toString(), 'http://www.dartlang.org/');
    });
  });
}