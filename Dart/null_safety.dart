void main() {
  /// O Null Safety é uma garantia da linguagem Dart de que nenhuma variável
  /// pode conter o valor `null` unless you explicitly say it can.
  /// Isso torna o código mais seguro e evita crashes inesperados.

  // -------------------------------------------------------------------

  /// TÓPICO 1: Permitindo valores nulos com '?'
  ///
  /// Por padrão, uma variável não pode ser nula. Para permitir que uma variável
  /// possa conter `null`, adicionamos uma interrogação `?` após o tipo.
  String? nome;
  nome = "Wellington";
  print('O valor de "nome" é: $nome'); // Funciona perfeitamente.

  String? cidade; // Declarada, mas não inicializada, então seu valor é `null`.
  print('O valor de "cidade" é: $cidade'); // Imprime 'null' sem erros.

  /// TÓPICO 2: Afirmando que um valor não é nulo com '!'
  ///
  /// O operador `!` (chamado de "bang operator") é um pacto de confiança.
  /// Você diz ao Dart: "Eu tenho 100% de certeza que esta variável não é nula agora".
  /// Se você estiver errado, o aplicativo irá quebrar IMEDIATAMENTE.
  /// Use com extrema cautela.

  String? talvezUmNome;
  talvezUmNome = "Ana"; // Demos um valor a ela.
  print(talvezUmNome); // Confiamos que não é nulo, e estamos certos.

  // O código abaixo irá causar um erro e quebrar o programa!
  // String? nomeQueEstaNulo;
  // print(nomeQueEstaNulo!); // Erro! Você quebrou a confiança.

  /// TÓPICO 3: Inicialização tardia com 'late'
  ///
  /// A palavra-chave `late` é uma promessa. Você diz ao Dart:
  /// "Esta variável não é nula, mas eu prometo que vou dar um valor a ela
  /// ANTES da primeira vez que eu tentar usá-la."
  /// Útil para variáveis que dependem de algum cálculo ou inicialização posterior.

  late String sobrenome;
  // print(sobrenome); // Erro! Você tentou usar antes de inicializar.

  sobrenome = "Luiz"; // Cumprindo a promessa.
  print('O sobrenome é: $sobrenome'); // Agora sim, funciona!
}
