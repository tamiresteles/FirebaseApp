import 'package:flutter_test/flutter_test.dart';

// Cria um Map com o nome dos alunos e uma lista contendo suas notas.
Map<String, List<double>> alunos = {
  'Maria': [8.0, 9.0],
  'Bruna': [7.0, 7.0],
  'Carla': [10.0, 9.0],
};

void main() {
  // Testa a inclusão de um novo aluno no Map.
  test('Adicionar elemento', () {
    alunos.putIfAbsent('Elena', () => [9.0, 8.0]);

    // Verifica se a chave e as notas do aluno foram adicionadas.
    expect(alunos.containsKey('Elena'), isTrue);
    expect(alunos['Elena'], [9.0, 8.0]);
  });

  // Testa a inclusão de vários alunos utilizando addAll().
  test('Adicionar outro dicionário', () {
    alunos.addAll({
      'Elena': [9.0, 8.0],
      'Luiza': [8.0, 9.0],
    });

    // Confirma se os dois novos alunos estão presentes no Map.
    expect(alunos.containsKey('Elena'), isTrue);
    expect(alunos.containsKey('Luiza'), isTrue);
  });

  // Testa a remoção de um aluno por meio de sua chave.
  test('Remover elemento', () {
    alunos.remove('Bruna');

    // Verifica se o aluno Bruna foi removido corretamente.
    expect(alunos.containsKey('Bruna'), isFalse);
  });

  // Testa a atualização das notas de um aluno existente.
  test('Atualizar elemento', () {
    alunos.update('Carla', (value) => [9.0, 8.0]);

    // Confirma se as notas de Carla foram atualizadas.
    expect(alunos['Carla'], [9.0, 8.0]);

    // Também é possível atualizar um valor usando a chave diretamente.
    alunos['Carla'] = [8.0, 9.0];

    expect(alunos['Carla'], [8.0, 9.0]);
  });

  // Testa como percorrer as chaves e os valores armazenados no Map.
  test('Testar percorrer dicionário', () {
    // Verifica a lista de nomes dos alunos cadastrados.
    expect(alunos.keys, ['Maria', 'Carla', 'Elena', 'Luiza']);

    // Verifica as notas armazenadas para cada aluno.
    expect(alunos.values, [
      [8.0, 9.0],
      [8.0, 9.0],
      [9.0, 8.0],
      [8.0, 9.0],
    ]);

    // A variável soma será usada para acumular todas as notas.
    double soma = 0;

    // O forEach percorre cada aluno e suas respectivas notas.
    alunos.forEach((key, value) {
      for (double nota in value) {
        soma += nota;
      }
    });

    // Confirma se a soma de todas as notas é igual a 68.
    expect(soma, 68.0);
  });
  
  // Testa o cálculo da média das notas de cada aluno.
test('Calcular médias', () {

  // Cria um Map local com os alunos e suas notas.
  Map<String, List<double>> notasAlunos = {
    'Maria': [8.0, 9.0],
    'Carla': [8.0, 9.0],
    'Elena': [9.0, 8.0],
    'Luiza': [8.0, 9.0],
  };

  // Cria um Map para armazenar as médias calculadas.
  Map<String, double> medias = {};

  // Percorre cada aluno e calcula a média das notas.
  notasAlunos.forEach((nome, notas) {
    double soma = 0;

    for (double nota in notas) {
      soma += nota;
    }

    medias[nome] = soma / notas.length;
  });

  // Verifica se as médias foram calculadas corretamente.
  expect(medias, {
    'Maria': 8.5,
    'Carla': 8.5,
    'Elena': 8.5,
    'Luiza': 8.5,
  });
});
  
}