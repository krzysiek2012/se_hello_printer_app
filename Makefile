SERVICE_NAME = hello-world-printer
DOCKER_IMG_NAME = $(SERVICE_NAME)
#mowi zeby zignorowal ze test dziala i pusci test
.PHONY: test
.DEFAULT_GOAL := test
deps:
	pip install -r requirements.txt; \
	pip install -r test_requirements.txt

test:
	PYTHONPATH=. py.test  --verbose -s

test_cov:
	PYTHONPATH=. py.test --verbose -s --cov=.

test_xunit:
	PYTHONPATH=. py.test -s --cov=. -o junit_family=xunit2 --junit-xml=test_results.xml

test_smoke:
	curl --fail 127.0.0.1:5000

test_json:
	curl 127.0.0.1:5000/?output=json

test_xml:
	curl 127.0.0.1:5000/?output=xml

lint:
	flake8 hello_world test

run:
	PYTHONPATH=. FLASK_APP=hello_world flask run

docker_build:
	docker build -t $(DOCKER_IMG_NAME) .

USERNAME=krzysiek2012
TAG=$(USERNAME)/$(DOCKER_IMG_NAME)

docker_push: docker_build
	@docker login --username $(USERNAME) --password $${DOCKER_PASSWORD}; \
	docker tag $(DOCKER_IMG_NAME) $(TAG); \
	docker push $(TAG); \
	docker logout;

docker_run: docker_build
	docker run \
		--name $(DOCKER_IMG_NAME)-dev \
			-p 5000:5000 \
			-d $(DOCKER_IMG_NAME)

docker_stop:
	docker stop $(DOCKER_IMG_NAME)-dev
