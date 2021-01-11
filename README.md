# GitHub Repositories

Este aplicativo tem como objetivo a exibição dos 100 primeiros repositórios do GitHub.

# Ícone

De início implementei para o ícone e para a splash screen a logo do GitHub, porém pesquisando sobre, vi que na política do GitHub não é permitido utilizar seus ícones como launcher de um aplicativo, porém não dizia se essa restrição era apenas para uso em produção. Mas por segurança e por questão da logo do GitHub não combinar com o tema do aplicativo, resolvi criar um logo, simples porém que remete ao que o aplicativo propoem e que se encaixe com o tema roxo do aplicativo.

# O aplicativo foi desenvolvido utilizando:

* Programação Modular, pois torna o código sustentável e reutilizável e facilita a injeção de dependência;
* MobX como gerenciador de estado;
* Dartz para trabalhar com as respostas das requisições;
* Dio para executar as requisições para APIs;
* Inversão de Controle;
* Injeção de Dependências;
* Testes Unitários;
* Testes Instrumentados;
* TDD.

## Bibliotecas utilizadas

* flutter_modular: Utilizado para modularizar o aplicativo, além de facilitar injeção de dependências;
* mobx e flutter_mobx: Utilizados para o gerenciamento do estado;
* dio: Executar requisições em APIs;
* dartz: Utilizada para facilitar o tratamento das respostas das APIs, utilizando o Either;
* cached_network_image: Utilizada para fazer o cache das imagens e melhorar a experiência do usuário;
* connectivity: Utilizada para a checar a conexão;
* url_launcher: Utilizada para abrir o repositório no browser;
* shimmer: Utilizada para implementar as animações de loading da lista de repositórios;
* fluttertoast: Utilizada para exibir toast caso não seja possível abrir o repositório no browser ou se o dispositivo estiver sem conexão com a internet;

## Bibliotecas para testes

* flutter_test: Executar testes unitários;
* flutter_driver: Executar testes instrumentados;
* test: Para usar funções de teste e asserções reais.

## Como executar os testes

Para executar os testes unitários:
 * Entre na pasta test localizada na raiz do projeto
 * Abra um arquivo que deseja executar os testes 
 * Clique em "Run"
 
Para executar os testes instrumentados: 
 * Com um emulador ou um dispositivo conectado 
 * Na raiz do projeto execute o seguinte comando: 
```
$ flutter drive --target=test_driver/app.dart
```

## O aplicativo

![](preview/preview_illustrated.gif)
![](preview/preview_img_warning.jpeg)
![](preview/preview_img_connection.jpeg)

## 🤓 Author

**William Tristão de Paula**  [Profile](https://github.com/williamtdepaula "GitHub Profile")

## Instalação

Clone o projeto:
```
$ git clone https://github.com/williamtdepaula/flutter_github_repositories
```

Abra o projeto:
```
$ cd flutter_github_repositories
```

Agora inicie o aplicativo no seu emulador ou dispositivo conectado (Usando o terminal):
```
$ flutter run