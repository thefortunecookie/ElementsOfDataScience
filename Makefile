PROJECT_NAME = ElementsOfDataScience
PYTHON_VERSION = 3.10
PYTHON_INTERPRETER = python

.PHONY: default

default:
	@echo "No command specified. Please specify a target."

create_environment:
	conda create -y --name $(PROJECT_NAME) python=$(PYTHON_VERSION)
	@echo ">>> conda env created. Activate with:\nconda activate $(PROJECT_NAME)"

delete_environment:
	conda env remove --name $(PROJECT_NAME)

requirements:
	$(PYTHON_INTERPRETER) -m pip install -U pip setuptools wheel
	$(PYTHON_INTERPRETER) -m pip install -r requirements.txt

clean:
	find . -type f -name "*.py[co]" -delete
	find . -type d -name "__pycache__" -delete

tests:
	pytest --nbmake [01]*.ipynb
