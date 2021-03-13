.PHONY: tuist
format:
	swiftformat ./Sources ./Tests

tuist: 
	which tuist >/dev/null || (curl -Ls https://install.tuist.io | bash)
	tuist up

generate:
	tuist generate

bootstrap: tuist generate

NAME= AppName
rename:
	grep -rl 'AppName' --exclude=Makefile ./ | xargs sed -i '' 's/AppName/$(NAME)/g'

clean: 
	rm -rf *.xcodeproj 
	rm -rf *.xcworkspace
	rm -rf Pods
	tuist clean || true
