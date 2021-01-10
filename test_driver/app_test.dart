import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  final warning = find.byValueKey('warning');
  final buttonWarning = find.byValueKey('buttonWarning');
  final listGitHubRepositories = find.byValueKey('list');
  final scrollListGitHubRepositories = find.byValueKey('scroll');

  FlutterDriver driver;

  //Checa se um determinado Widget está na tela, a partir da key
  Future<bool> isPresent(SerializableFinder byValueKey,
      {Duration timeout = const Duration(seconds: 1)}) async {
    try {
      await driver.waitFor(byValueKey, timeout: timeout);
      return true;
    } catch (e) {
      return false;
    }
  }

  group('Home page', () {
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test(
        'Should show the repositories list from API, but occurs a error should show a warning',
        () async {
      if (await isPresent(
        listGitHubRepositories,
        timeout: Duration(seconds: 30),
      )) {
        //checando se está mostrando alguma coisa da lista de repositórios
        await driver.waitFor(find.text('grit'));
      } else {
        print('erro');
        expect(await isPresent(warning), true);
      }
    });

    test('Should pull to refresh list', () async {
      if (await isPresent(
        listGitHubRepositories,
        timeout: Duration(seconds: 30),
      )) {
        await driver.scroll(
          scrollListGitHubRepositories,
          0,
          500,
          Duration(milliseconds: 500),
        );

        bool repositoriesListIsShowing = await isPresent(
          listGitHubRepositories,
          timeout: Duration(seconds: 30),
        );

        print('repositories exist $repositoriesListIsShowing');

        //Se não estiver exibindo mais a lista, deve estar exibindo o Widget de warning
        if (!repositoriesListIsShowing) {
          expect(await isPresent(warning), true);
        }
      } else {
        expect(await isPresent(warning), true);
      }
    });

    test(
        'Should show list or warning again when button to try again is pressed',
        () async {
      if (await isPresent(warning)) {
        print('Warning found');

        await driver.tap(buttonWarning);

        if (await isPresent(listGitHubRepositories,
            timeout: Duration(seconds: 30))) {
          print('List found when had error');
          expect(await isPresent(find.text('grit')), true);
        } else {
          await driver.waitFor(warning);

          print('Warning found when had error and tried to get list again');
          expect(await isPresent(warning), true);
        }
      } else {
        print('Im here warning not found');
        //Não está mostrando o warning, então deve estar mostrando a lista
        expect(await isPresent(listGitHubRepositories), true);
      }
    });
  });
}
