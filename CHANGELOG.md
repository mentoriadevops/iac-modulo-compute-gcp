# Changelog

Todas as mudanças importantes neste projeto serão documentas neste arquivo.

O formato é baseado no [Mantenha um Changelog](https://keepachangelog.com/pt-BR/1.0.0/),
e este projeto segue o [Versionamento Semântico](https://semver.org/lang/pt-BR/spec/v2.0.0.html).

## [Não publicado]

### Adicionado
- Opção para configuração de IP público da instância [[GH-23](https://github.com/mentoriaiac/iac-modulo-compute-gcp/pull/23)]

## [0.2.1] - 2022-07-22

### Modificado
- Uso de IAM roles ao invés de service account scope [[GH-20](https://github.com/mentoriaiac/iac-modulo-compute-gcp/pull/20)]

### Corrigido
- Corrigido a associação de IAM roles com a service account [[GH-21](https://github.com/mentoriaiac/iac-modulo-compute-gcp/pull/21)]

## [0.2.0] 2021-11-06

### Adicionado
 - Adiciona o escopo do service account [[GH-11](https://github.com/mentoriaiac/iac-modulo-compute-gcp/pull/11)]
 - Adiciona uma validação para o tfsec ao ci [[GH-12](https://github.com/mentoriaiac/iac-modulo-compute-gcp/pull/12)]

## [0.1.0] - 2021-09-08

### Adicionado
- Cria usuário e adiciona chave ssh [[GH-7](https://github.com/mentoriaiac/iac-modulo-compute-gcp/pull/7)]
- Implementação de network tags para as instâncias [[GH-6](https://github.com/mentoriaiac/iac-modulo-compute-gcp/pull/6)]
- Implementação do script executado na inicialização do SO  [[GH-4](https://github.com/mentoriaiac/iac-modulo-compute-gcp/pull/4)]
- Criando a versão 0.1 do modulo de compute do GCP [[GH-1]](https://github.com/mentoriaiac/iac-modulo-compute-gcp/pull/1)

[Não publicado]: https://github.com/mentoriaiac/iac-modulo-compute-gcp/compare/0.2.1...HEAD
[0.2.1]: https://github.com/mentoriaiac/iac-modulo-compute-gcp/releases/tag/0.2.1
[0.2.0]: https://github.com/mentoriaiac/iac-modulo-compute-gcp/releases/tag/0.2.0
[0.1.0]: https://github.com/mentoriaiac/iac-modulo-compute-gcp/releases/tag/0.1.0
