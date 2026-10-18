# Revisão e limitações

- Corrigidas junções que comparavam IDs independentes em vez das chaves estrangeiras.
- Média de duração calculada em segundos; duração total agrupada por álbum e expressa em minutos.
- Relatório de avaliações ligado corretamente ao usuário avaliador.
- GROUP BY explicitado para consultas agrupadas.
- Exemplos UPDATE separados da instalação.

Limitações: o campo `senha` e seus valores são didáticos, em texto simples; não implementam autenticação segura. Não use credenciais reais. Filtros com CURDATE() podem não retornar linhas devido às datas antigas da carga. A consulta 15 conta vínculos entre músicas e playlists, não músicas distintas. A consulta 17 retorna uma linha por álbum do artista.

Validação: revisão estática; sem servidor MySQL disponível para teste de execução.


Conferência adicional: schema e carga importados em SQLite após adaptação mínima de sintaxe, com chaves estrangeiras habilitadas. Não substitui teste no MySQL, nem valida as procedures ou todas as consultas.
