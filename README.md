# helm-charts

## Adiciona o repositório localmente
helm repo add meus-charts https://seu-usuario.github.io/meus-helm-charts/

## Atualiza o índice
helm repo update

## Instala a aplicação usando o seu chart base
helm install minha-api meus-charts/helm-base-microservice -f values-prod.yaml