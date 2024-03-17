# Flutter Movies

O Flutter Movies é um projeto que permite conectar-se à API do site themoviedb.org e obter informações sobre os filmes mais populares. Ele fornece uma interface de usuário intuitiva para visualizar os filmes em destaque, exibir detalhes de filmes individuais e pesquisar filmes por título.

## Estrutura do Projeto

O projeto Flutter Movies segue uma estrutura organizada em pastas, conforme descrito abaixo:

- `lib`: Pasta principal do projeto.
  - `src`: Pasta contendo o código-fonte do projeto.
    - `components`: Pasta contendo componentes reutilizáveis do Flutter.
    - `models`: Pasta contendo as classes de modelo utilizadas para representar os dados dos filmes.
    - `pages`: Pasta contendo as páginas do aplicativo.
    - `services`: Pasta contendo os serviços responsáveis por se conectar à API do themoviedb.org e obter os dados dos filmes.
    - `stores`: Pasta contendo as classes MobX responsáveis pelo gerenciamento do estado do aplicativo.
    - `utils`: Pasta contendo utilitários e funções auxiliares.

## Pacotes Utilizados

O projeto Flutter Movies utiliza os seguintes pacotes:

- dio: ^5.4.1
- get_it: ^7.6.7
- intl: ^0.19.0
- mobx: ^2.3.0+1
- flutter_mobx: ^2.2.0+2
- mobx_codegen: ^2.6.0+1
- build_runner: ^2.4.8

Certifique-se de adicionar essas dependências ao arquivo `pubspec.yaml` do seu projeto Flutter antes de executá-lo.

## Instalação e Execução

Siga as etapas abaixo para instalar e executar o projeto Flutter Movies:

1. Clone o repositório do projeto Flutter Movies em seu ambiente de desenvolvimento local.
2. Abra o projeto no seu IDE preferido (por exemplo, Visual Studio Code).
3. Certifique-se de ter todas as dependências listadas no arquivo `pubspec.yaml` instaladas. Você pode executar o comando `flutter pub get` para instalá-las.
4. Inicie um emulador ou conecte um dispositivo físico ao seu computador.
5. Execute o comando `flutter run` no terminal dentro do diretório do projeto para iniciar o aplicativo Flutter Movies no emulador ou dispositivo conectado.
