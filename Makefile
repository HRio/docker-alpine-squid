NAME = alpine-squid
VERSIONS =

.PHONY: allg versions latest

versions:
	for TAG in $(VERSIONS); do \
		echo "Building $$TAG" ; \
		docker build -t $(NAME):$$TAG --rm --no-cache  -f Dockerfile.$$TAG . ; \
	done

latest:
	docker build -t $(NAME):latest --rm --no-cache  .

run:
	docker run -d -v /srv/squid:/data -p 3128:3128 $(NAME):latest

all: latest versions
