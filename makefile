prod:
	sudo chmod +x ./build_prod.sh
	./build_prod.sh


stage:
	sudo chmod +x ./build_stage.sh
	./build_stage.sh


br:
	flutter packages pub run build_runner build --delete-conflicting-outputs
