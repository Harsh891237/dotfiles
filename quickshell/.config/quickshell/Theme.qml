pragma Singleton
import QtQuick

QtObject {
    // --- 1. Primary Colors ---
    readonly property color primary: "#85d6c0"
    readonly property color on_primary: "#00382e"
    readonly property color primary_container: "#005143"
    readonly property color on_primary_container: "#a1f2dc"
    readonly property color primary_fixed: "#a1f2dc"
    readonly property color on_primary_fixed: "#00201a"

    // --- 2. Secondary Colors ---
    readonly property color secondary: "#b1ccc3"
    readonly property color on_secondary: "#1d352f"
    readonly property color secondary_container: "#334b45"
    readonly property color on_secondary_container: "#cde8df"
    readonly property color secondary_fixed: "#cde8df"
    readonly property color on_secondary_fixed: "#07201a"

    // --- 3. Tertiary Colors (Good for accents/charts) ---
    readonly property color tertiary: "#aacbe3"
    readonly property color on_tertiary: "#103447"
    readonly property color tertiary_container: "#2a4a5f"
    readonly property color on_tertiary_container: "#c7e7ff"
    readonly property color tertiary_fixed: "#c7e7ff"
    readonly property color on_tertiary_fixed: "#001e2e"

    // --- 4. Background & Surface (The most important for Bars) ---
    readonly property color background: "#0e1513"
    readonly property color on_background: "#dee4e0"
    
    readonly property color surface: "#0e1513"
    readonly property color on_surface: "#dee4e0"
    
    readonly property color surface_variant: "#3f4945"
    readonly property color on_surface_variant: "#bfc9c4"

    // Surface Containers (Best for panels/popups - Darker/Lighter shades)
    readonly property color surface_container_lowest: "#090f0e"
    readonly property color surface_container_low: "#171d1b"
    readonly property color surface_container: "#1b211f"
    readonly property color surface_container_high: "#252b29"
    readonly property color surface_container_highest: "#303634"

    // --- 5. Errors ---
    readonly property color error: "#ffb4ab"
    readonly property color on_error: "#690005"
    readonly property color error_container: "#93000a"
    readonly property color on_error_container: "#ffdad6"

    // --- 6. Outlines (Borders) ---
    readonly property color outline: "#89938f"
    readonly property color outline_variant: "#3f4945"

    // --- 7. Inverse (High Contrast) ---
    readonly property color inverse_surface: "#dee4e0"
    readonly property color inverse_on_surface: "#2b322f"
    readonly property color inverse_primary: "#0a6b5a"

    // --- 8. Shadow / Scrim ---
    readonly property color shadow: "#000000"
    readonly property color scrim: "#000000"
}
