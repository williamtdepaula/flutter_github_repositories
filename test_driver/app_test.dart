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
        'Should show the list of API repositories, but if an error occurs it should show a warning Widget',
        () async {
      if (await isPresent(
        listGitHubRepositories,
        timeout: Duration(seconds: 5),
      )) {
        //Checando se está mostrando alguma coisa da lista de repositórios
        await driver.waitFor(find.text('grit'));
      } else {
        await driver.waitFor(warning);
      }
    }, timeout: Timeout.none);

    test(
        'Should pull to refresh the list and if an error occurs show a warning Widget',
        () async {
      if (await isPresent(
        listGitHubRepositories,
        timeout: Duration(seconds: 5),
      )) {
        //Pull to refresh
        await driver.scroll(
          scrollListGitHubRepositories,
          0,
          500,
          Duration(milliseconds: 500),
        );

        bool repositoriesListIsShowing = await isPresent(
          listGitHubRepositories,
          timeout: Duration(seconds: 5),
        );

        //Se não estiver exibindo mais a lista, deve estar exibindo o Widget de warning
        if (!repositoriesListIsShowing) {
          await driver.waitFor(warning);
        }
      } else {
        await driver.waitFor(warning);
      }
    }, timeout: Timeout.none);

    test(
        'Should show the list or a warning again, when the button to try again is pressed',
        () async {
      if (await isPresent(warning)) {
        await driver.tap(buttonWarning);

        if (await isPresent(
          listGitHubRepositories,
          timeout: Duration(seconds: 5),
        )) {
          await driver.waitFor(find.text('grit'));
        } else {
          await driver.waitFor(warning);
        }
      } else {
        //Não está mostrando o warning, então deve estar mostrando a lista
        await driver.waitFor(listGitHubRepositories);
      }
    }, timeout: Timeout.none);
  });
}
