PODMAN_BIN ?= podman
RUN_OPTS ?=
IMAGE_NAME ?= log-viewer
IMAGE_TAG ?= latest
HOST_PORT ?= 8765

container-image:
	$(PODMAN_BIN) build -t $(IMAGE_NAME):$(IMAGE_TAG) .

server:
	$(PODMAN_BIN) run $(RUN_OPTS) -p $(HOST_PORT):8765 $(IMAGE_NAME):$(IMAGE_TAG)
