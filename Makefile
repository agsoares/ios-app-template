.PHONY: pods
format:
	mint run swiftformat swiftformat ./Sources ./Tests

swiftgen:
	mint run swiftgen

brew:
	brew install mint
	brew install libxml2

mint: brew
	mint bootstrap

pods:
	bundle install && pod install --repo-update

xcodegen: swiftgen
	mint run xcodegen

ci: swiftgen xcodegen pods

bootstrap: mint swiftgen xcodegen pods

NAME= AppName
rename:
	grep -rl 'AppName' --exclude=Makefile ./ | xargs sed -i '' 's/AppName/$(NAME)/g'

clean: 
	rm -rf *.xcodeproj 
	rm -rf *.xcworkspace
	rm -rf Pods