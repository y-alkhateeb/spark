# SPARK STARTER APP

SPARK is a template app if you want to start new project, it contain the basic codes every project wanted.

# Table of Contents
- [Supported Platforms](#Supported Platforms)
- [Installing](#lets-get-started)


## Supported Platforms

You can change the bundleId and appName in following folders

- IOS
- Android
- Web

# Lets Get Started

lets start with change App Package Name with single command after Update dependencies
```
flutter pub get
```
then run build runner command by following command
```
make br
```


Run this command to change the package name.
```
flutter pub run change_app_package_name:main com.new.package.name
```
Where com.new.package.name is the new package name that you want for your app. replace it with any name you want.

## setup our config like base url

- this app works on environments and flavors [dev] [stage] [prod]

```
config/
├── app_config_dev.json
├── app_config_prod.json
└── app_config_stage.json
```

## Run your app (in flutter run)

```
flutter run --flavor dev -t lib/main_dev.dart
flutter run --flavor stage -t lib/main_stage.dart
flutter run --flavor pro -t lib/main_prod.dart
```

## Release your app (in flutter build)

you can run this code
```
make stage
make prod
```
or you can execute shell script
```
./build_prod.sh
./build_stage.sh
```
anther way..
```
flutter build apk --flavor dev -t lib/main_dev.dart
flutter build apk --flavor stage -t lib/main_stage.dart
flutter build apk --flavor pro -t lib/main_prod.dart
```



## Contribute

Contributions are always welcome!

1. Fork it (<https://github.com/y-alkhateeb/spark/fork>)
2. Create your feature branch (`git checkout -b feature/fooBar`)
3. Commit your changes (`git commit -am 'Add some fooBar'`)
4. Push to the branch (`git push origin feature/fooBar`)
5. Create a new Pull Request