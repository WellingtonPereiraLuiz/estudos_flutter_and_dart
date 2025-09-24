// Tipo    Nome         Valor
String nomeCompleto = "Wellington Luiz";
int idade = 30;
double peso = 92.2;
bool velho = true;

// Mas tambem podemos declarar dessa forma:
// Tipo    Nome         Valor
var nomeCompletos = "Wellington Luiz";
var idades = 30;
var pesos = 92.2;
var velhos = true;

// Aqui colocamos o 'final' no inicio para declararmos que o valor dessa variavel nao ira mudar
final String paisDeNascimento = "Brasil";

// A linha abaixo causaria um ERRO, porque a variável é 'final'.
// paisDeNascimento = "Portugal";

// Listas
List<String> listaDePalavras = ["Wellington", "Testando"];
void main() {
  print(
    'Meu nome e ${listaDePalavras[0]} e eu estou ${listaDePalavras[1]} o Dart.',
  );
}
