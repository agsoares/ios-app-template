.PHONY: pods
format:
	mint run swiftformat swiftformat ./Sources ./Tests

swiftgen:
	mint run swiftgen

mint: 
	brew install mint
	brew install libxml2
	mint bootstrap

pods:
	bundle install && pod install --repo-update

xcodegen: swiftgen
	mint run xcodegen

bootstrap: swiftgen xcodegen pods

NAME= AppName
rename:
	grep -rl 'AppName' --exclude=Makefile ./ | xargs sed -i '' 's/AppName/$(NAME)/g'

clean: 
	rm -rf *.xcodeproj 
	rm -rf *.xcworkspace
	rm -rf Pods