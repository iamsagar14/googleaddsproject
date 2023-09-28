## Getting Started 🚀

_1. Supports iOS and Android_

_2. Starter project with GetX architecture_

This project contains 3 flavors:

- development
- staging
- production

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:

```sh
# Development
$ flutter run --flavor development --target lib/main_development.dart

# Staging
$ flutter run --flavor staging --target lib/main_staging.dart

# Production
$ flutter run --flavor production --target lib/main_production.dart
```

---

## Define flavor specific variables 🍭

```dart
String baseUrl get {
    switch(appFlavor) {
        case Flavor.development:
            return "api.dev"
        case Flavor.staging:
            return "api.staging"
        case Flavor.production:
            return "api.production"
    }
}
```
