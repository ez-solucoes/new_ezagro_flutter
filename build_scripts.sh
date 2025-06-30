#!/bin/bash
# build_scripts.sh - Environment-specific build commands for Ez Agro Flutter

echo "Ez Agro Flutter Build Scripts"
echo "=============================="

# Function to display available commands
show_help() {
    echo ""
    echo "Available commands:"
    echo ""
    echo "Development builds (uses api.dev.temp.ezagro.com.br):"
    echo "  ./build_scripts.sh dev-debug         # Debug build for development"
    echo "  ./build_scripts.sh dev-release       # Release build for TestFlight with dev API"
    echo ""
    echo "Production builds (uses api.ezagro.com.br):"
    echo "  ./build_scripts.sh prod-release      # Production release for App Store"
    echo ""
    echo "Utility commands:"
    echo "  ./build_scripts.sh clean             # Clean build artifacts"
    echo "  ./build_scripts.sh help              # Show this help"
    echo ""
}

# Clean function
clean_build() {
    echo "🧹 Cleaning build artifacts..."
    flutter clean
    cd ios && rm -rf build/ && cd ..
    echo "✅ Clean completed"
}

# Development Debug Build
dev_debug() {
    echo "🔧 Building development debug version..."
    echo "API: https://api.dev.temp.ezagro.com.br"
    flutter build ios --debug --dart-define=FLUTTER_ENV=development
    echo "✅ Development debug build completed"
}

# Development Release Build (for TestFlight with dev API)
dev_release() {
    echo "🚀 Building development release version for TestFlight..."
    echo "API: https://api.dev.temp.ezagro.com.br"
    flutter build ios --release --dart-define=FLUTTER_ENV=development
    echo "✅ Development release build completed (ready for TestFlight with dev API)"
}

# Production Release Build
prod_release() {
    echo "🏭 Building production release version..."
    echo "API: https://api.ezagro.com.br"
    flutter build ios --release --dart-define=FLUTTER_ENV=production
    echo "✅ Production release build completed (ready for App Store)"
}

# Main script logic
case "$1" in
    "dev-debug")
        dev_debug
        ;;
    "dev-release")
        dev_release
        ;;
    "prod-release")
        prod_release
        ;;
    "clean")
        clean_build
        ;;
    "help"|"--help"|"-h"|"")
        show_help
        ;;
    *)
        echo "❌ Unknown command: $1"
        show_help
        exit 1
        ;;
esac
