import 'package:flutter_test/flutter_test.dart';

// Cria uma lista de números inteiros para realizar os testes.
List<int> numeros = [1, 2, 3];

void main() {
  // Testa a adição de um único elemento na lista.
  test('Adicionar elemento', () {
    numeros.add(4);

    // Verifica se o número 4 foi inserido corretamente.
    expect(numeros.contains(4), isTrue);
  });

  // Testa a adição de vários elementos ao mesmo tempo.
  test('Adicionar outra lista', () {
    numeros.addAll([5, 6]);

    // Verifica se os números 5 e 6 estão presentes na lista.
    expect(numeros.contains(5), isTrue);
    expect(numeros.contains(6), isTrue);
  });

  // Testa a inserção de um elemento em uma posição específica.
  test('Adicionar na posição', () {
    numeros.insert(0, 0);

    // Confirma se o número 0 foi inserido na primeira posição.
    expect(numeros.indexOf(0), 0);
  });

  // Testa a remoção de um elemento pelo seu valor.
  test('Remover elemento', () {
    numeros.remove(2);

    // Verifica se o número 2 foi removido da lista.
    expect(numeros.contains(2), isFalse);
  });

  // Testa a remoção de um elemento pelo seu índice.
  test('Remover na posição', () {
    numeros.removeAt(0);

    // Confirma que o número 0 não está mais presente na lista.
    expect(numeros.contains(0), isFalse);
  });

  // Verifica a quantidade de elementos existentes na lista.
  test('Testar tamanho', () {
    expect(numeros.length, 5);
  });

  // Testa se a lista está vazia ou possui elementos.
  test('Testar vazio e não vazio', () {
    expect(numeros.isEmpty, isFalse);
    expect(numeros.isNotEmpty, isTrue);
  });

  // Testa a inversão e a ordenação dos elementos da lista.
  test('Testar ordenação', () {
    expect(numeros.reversed.toList(), [6, 5, 4, 3, 1]);
    expect(numeros, [1, 3, 4, 5, 6]);

    // Inverte a ordem dos elementos da lista.
    numeros = numeros.reversed.toList();
    expect(numeros, [6, 5, 4, 3, 1]);

    // Organiza os números em ordem crescente.
    numeros.sort();
    expect(numeros, [1, 3, 4, 5, 6]);
  });

  // Testa diferentes formas de percorrer e modificar a lista.
  test('Testar percorrer lista', () {
    int soma = 0;

    // Percorre cada número da lista e calcula a soma dos elementos.
    for (int numero in numeros) {
      soma += numero;
    }

    // Verifica se a soma dos números é igual a 19.
    expect(soma, 19);

    // Multiplica cada elemento da lista por 2.
    numeros = numeros.map((numero) => numero * 2).toList();
    expect(numeros, [2, 6, 8, 10, 12]);

    // Mantém somente os números divisíveis por 3.
    numeros = numeros.where((numero) => numero % 3 == 0).toList();
    expect(numeros, [6, 12]);
  });
}