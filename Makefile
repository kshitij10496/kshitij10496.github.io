.PHONY: build
build:
	hugo

.PHONY: deploy
deploy: build
	cd public/
	git remote add deploy git@github.com:kshitij10496/kshitij10496.github.io.git
	git add .
	git commit -m $(firstword $(MAKECMDGOALS))
	git push deploy HEAD

.PHONY: clean
clean:
	rm -r public/
