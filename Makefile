qa-edmarket-search-build:
	docker build -t registry.edmodo.io/edmarket-search-qa .

qa-edmarket-search-deploy:
	docker push registry.edmodo.io/edmarket-search-qa:latest
	python ~/go/src/github.com/edmodo/catapult/deploy.py -i ~/.ssh/deployer_dsa -u deployer -e qa

qa-edmarket-search-run:
	docker run -p 9200:9200 -p 9300:9300  registry.edmodo.io/edmarket-search-qa

prod-edmarket-search-build:
	docker build -t registry.edmodo.io/edmarket-search-prod .

prod-edmarket-search-deploy:
	docker push registry.edmodo.io/edmarket-search-prod:latest
	python ~/go/src/github.com/edmodo/catapult/deploy.py -i ~/.ssh/deployer_dsa -u deployer -e production

prod-edmarket-search-run:
	docker run -p 9200:9200 -p 9300:9300 registry.edmodo.io/edmarket-search-prod
