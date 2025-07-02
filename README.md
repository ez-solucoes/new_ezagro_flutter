# Ez Agro Flutter

Versão 2 do projeto EZ Agro - Aplicativo móvel para gestão agrícola

## 📱 Configuração do Aplicativo iOS

### Informações do App
- **Nome do App**: Ez Agro
- **Bundle Identifier**: `br.com.ezsolucoes.newEzagroFlutter`
- **Versão**: 1.0.1
- **Build**: 4

## 🌐 Configuração de Ambientes

O aplicativo suporta diferentes ambientes com APIs específicas:

### Ambientes Disponíveis
- **Desenvolvimento/TestFlight**: `https://api.dev.temp.ezagro.com.br`
- **Produção/App Store**: `https://api.ezagro.com.br`

### Detecção Automática de Ambiente
O app detecta automaticamente o ambiente baseado em:

1. **Configuração Explícita**: Via `--dart-define=FLUTTER_ENV=development/production`
2. **Modo de Build**: Debug = dev API, Release = production API

## 🏗️ Comandos de Build

### Usando Scripts de Build (Recomendado)

Primeiro, torne o script executável:
```bash
chmod +x build_scripts.sh
```

#### Builds de Desenvolvimento
```bash
# Debug para desenvolvimento local
./build_scripts.sh dev-debug

# Release para TestFlight (com API de desenvolvimento)
./build_scripts.sh dev-release
```

#### Builds de Produção
```bash
# Release para App Store (com API de produção)
./build_scripts.sh prod-release
```

#### Utilitários
```bash
# Limpar artefatos de build
./build_scripts.sh clean

# Mostrar ajuda
./build_scripts.sh help
```

### Comandos Flutter Manuais

Se preferir usar comandos Flutter diretamente:

#### Para TestFlight (API de Desenvolvimento)
```bash
flutter build ios --release --dart-define=FLUTTER_ENV=development
```

#### Para App Store (API de Produção)
```bash
flutter build ios --release --dart-define=FLUTTER_ENV=production
```

#### Para Desenvolvimento Local
```bash
flutter build ios --debug --dart-define=FLUTTER_ENV=development
```

## 📱 Workflow de Publicação

### 1. TestFlight (Ambiente de Desenvolvimento)
1. Execute: `./build_scripts.sh dev-release`
2. Abra o Xcode: `open ios/Runner.xcworkspace`
3. Archive o build
4. Faça upload para o TestFlight
5. **Resultado**: Build do TestFlight usará `https://api.dev.temp.ezagro.com.br`

### 2. App Store (Ambiente de Produção)
1. Execute: `./build_scripts.sh prod-release`
2. Abra o Xcode: `open ios/Runner.xcworkspace`
3. Archive o build
4. Faça upload para a App Store
5. **Resultado**: Build de produção usará `https://api.ezagro.com.br`

## 🛠️ Configuração de Desenvolvimento

### Pré-requisitos
- Flutter SDK (versão mais recente)
- Xcode (para builds iOS)
- CocoaPods
- Conta Apple Developer (para publicação)

### Configuração Inicial
```bash
# Clone o repositório
git clone [repository-url]
cd new_ezagro_flutter

# Instale dependências
flutter pub get

# Para iOS
cd ios
pod install
cd ..

# Execute em modo debug
flutter run --dart-define=FLUTTER_ENV=development
```

## 🔍 Debug de Ambiente

Para verificar qual ambiente está sendo usado, você pode:

### 1. Usar o Widget de Debug
```dart
import 'package:new_ezagro_flutter/core/config/environment_debug_widget.dart';

// Adicione ao seu widget para ver a configuração atual
const EnvironmentDebugWidget()

// Ou use a extensão
MyWidget().withEnvironmentDebug()
```

### 2. Verificar no Console
```dart
import 'package:new_ezagro_flutter/core/config/environment_config.dart';

print('Environment Info: ${EnvironmentConfig.environmentInfo}');
```

## 📋 Referência Rápida

| Comando | API Usada | Caso de Uso |
|---------|-----------|-------------|
| `dev-debug` | api.dev.temp.ezagro.com.br | Desenvolvimento local |
| `dev-release` | api.dev.temp.ezagro.com.br | **TestFlight** |
| `prod-release` | api.ezagro.com.br | **App Store** |

## 🏗️ Estrutura do Projeto

```
lib/
├── app_modules/           # Módulos e injeção de dependência
├── core/
│   ├── config/           # Configurações de ambiente
│   ├── http_client/      # Cliente HTTP
│   └── ...
├── features/
│   ├── data/             # Camada de dados
│   ├── domain/           # Regras de negócio
│   └── presenter/        # Interface do usuário
└── design_system/        # Sistema de design
```

## 🧪 Testes

```bash
# Executar todos os testes
flutter test

# Executar testes com coverage
flutter test --coverage
```

## 📚 Recursos Úteis

### Flutter
- [Documentação Flutter](https://docs.flutter.dev/)
- [Dart Language](https://dart.dev/)
- [Pub.dev](https://pub.dev/)

### iOS
- [iOS App Store Guidelines](https://developer.apple.com/app-store/guidelines/)
- [TestFlight Documentation](https://developer.apple.com/testflight/)

## ⚠️ Notas Importantes

1. **Builds para TestFlight**: Sempre use `dev-release` para garantir que o TestFlight use a API de desenvolvimento
2. **Builds para App Store**: Use `prod-release` para releases de produção
3. **Nome do App**: Já está configurado como "Ez Agro" na configuração iOS
4. **Limpeza**: Execute `./build_scripts.sh clean` se encontrar problemas de build

## 🤝 Contribuição

1. Faça fork do projeto
2. Crie uma branch para sua feature (`git checkout -b feature/AmazingFeature`)
3. Commit suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Push para a branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

## 📄 Licença

Este projeto é proprietário da EZ Soluções.

---

**Ez Agro Flutter** - Transformando a gestão agrícola através da tecnologia 🌱
