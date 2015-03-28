# ###############################################
# Makefile for edMarket build and deploy
#


# ###############################################
# QA build and deploy
#
qa-edmarket-search-build:
	docker build -t registry.edmodo.io/edmarket-search-qa .

qa-edmarket-search-deploy:
	docker push registry.edmodo.io/edmarket-search-qa:latest
	python ~/go/src/github.com/edmodo/catapult/deploy.py -i ~/.ssh/deployer_dsa -u deployer -e qa

qa-edmarket-run:
	docker run -d -p 9200:9200 registry.edmodo.io/edmarket-search-qa

# ###############################################
# PROD build and deploy
#
prod-edmarket-build: setup-docker setup-pip
	docker build -t registry.edmodo.io/edmarket-search-prod .

prod-edmarket-deploy:
	docker push registry.edmodo.io/edmarket-search-prod:latest
	python ~/go/src/github.com/edmodo/catapult/deploy.py -i ~/.ssh/deployer_dsa -u deployer -e production

prod-edmarket-run:
	docker run -d -p 9200:9200 registry.edmodo.io/edmarket-prod
