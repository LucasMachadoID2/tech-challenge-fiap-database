## 💬 Justificativa da Migração para DynamoDB

A migração do MongoDB para o Amazon DynamoDB foi motivada pela necessidade de maior escalabilidade, menor custo operacional, integração nativa com a AWS e simplificação da manutenção.

🔹 Principais Benefícios:

**Escalabilidade automática e alto desempenho**: banco serverless e totalmente gerenciado, que ajusta a capacidade conforme a demanda sem necessidade de administração manual.

**Baixa latência e alta disponibilidade**: replicação automática entre zonas de disponibilidade e latências inferiores a 10 ms, garantindo resiliência.

**Integração com o ecossistema AWS**: integração nativa com Lambda, API Gateway, IAM, CloudWatch e EKS, reduzindo complexidade de configuração e aumentando a observabilidade.

**Modelo NoSQL flexível**: mantém estrutura similar ao MongoDB, com tabelas usando partition key e sort key, facilitando consultas por status, cliente ou data.

**Custo e segurança**: serviço pay-per-request, com backups automáticos, criptografia nativa e integração com AWS KMS.
