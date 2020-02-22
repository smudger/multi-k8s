docker build -t smudja/multi-client:latest -t smudja/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t smudja/multi-server:latest -t smudja/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t smudja/multi-worker:latest -t smudja/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push smudja/multi-client:latest
docker push smudja/multi-client:$SHA
docker push smudja/multi-server:latest
docker push smudja/multi-server:$SHA
docker push smudja/multi-worker:latest
docker push smudja/multi-worker:$SHA
kubectl apply -f k8s
kubectl set image deployments/client-deployment client=smudja/multi-client:$SHA
kubectl set image deployments/server-deployment server=smudja/multi-server:$SHA
kubectl set image deployments/worker-deployment worker=smudja/multi-worker:$SHA
