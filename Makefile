.PHONY: test
#mowi zeby zignorowal ze test dziala i pusci test
deps:
	pip install -r requirements.txt; \
	pip install -r test_requirements.txt

test:
	PYTHONPATH=. py.test  --verbose -s
	PYTHONPATH=. py.test --verbose -s --cov=.
	PYTHONPATH=. py.test --verbose -s --cov=. --cov-report xml
	PYTHONPATH=. py.test -s --cov=. --cov-report xml --junit-xml=test_results.xml

lint:
	flake8 hello_world test

run:
	PYTHONPATH=. FLASK_APP=hello_world flask run

docker_build:
	docker build -t hello-world-printer .

USERNAME=krzysiek2012
TAG=$(USERNAME)/hello-world-printer

docker_push: docker_build
	@docker login --username $(USERNAME) --password $${DOCKER_PASSWORD}; \
	docker tag hello-world-printer $(TAG); \
	docker push $(TAG); \
	docker logout;

docker_run: docker_build
	docker run \
		--name hello-world-printer-dev \
			-p 5000:5000 \
			-d hello-world-printer
