pragma Singleton
import QtQuick

QtObject {
    // --- 1. Primary Colors ---
    readonly property color primary: "#c7bfff"
    readonly property color on_primary: "#2f295f"
    readonly property color primary_container: "#463f77"
    readonly property color on_primary_container: "#e4dfff"
    readonly property color primary_fixed: "#e4dfff"
    readonly property color on_primary_fixed: "#1a1249"

    // --- 2. Secondary Colors ---
    readonly property color secondary: "#c8c3dc"
    readonly property color on_secondary: "#302e41"
    readonly property color secondary_container: "#474459"
    readonly property color on_secondary_container: "#e5dff9"
    readonly property color secondary_fixed: "#e5dff9"
    readonly property color on_secondary_fixed: "#1b192c"

    // --- 3. Tertiary Colors (Good for accents/charts) ---
    readonly property color tertiary: "#ecb8ce"
    readonly property color on_tertiary: "#482537"
    readonly property color tertiary_container: "#613b4d"
    readonly property color on_tertiary_container: "#ffd8e8"
    readonly property color tertiary_fixed: "#ffd8e8"
    readonly property color on_tertiary_fixed: "#301121"

    // --- 4. Background & Surface (The most important for Bars) ---
    readonly property color background: "#141318"
    readonly property color on_background: "#e5e1e9"
    
    readonly property color surface: "#141318"
    readonly property color on_surface: "#e5e1e9"
    
    readonly property color surface_variant: "#47464f"
    readonly property color on_surface_variant: "#c9c5d0"

    // Surface Containers (Best for panels/popups - Darker/Lighter shades)
    readonly property color surface_container_lowest: "#0e0e13"
    readonly property color surface_container_low: "#1c1b20"
    readonly property color surface_container: "#201f25"
    readonly property color surface_container_high: "#2a292f"
    readonly property color surface_container_highest: "#35343a"

    // --- 5. Errors ---
    readonly property color error: "#ffb4ab"
    readonly property color on_error: "#690005"
    readonly property color error_container: "#93000a"
    readonly property color on_error_container: "#ffdad6"

    // --- 6. Outlines (Borders) ---
    readonly property color outline: "#928f99"
    readonly property color outline_variant: "#47464f"

    // --- 7. Inverse (High Contrast) ---
    readonly property color inverse_surface: "#e5e1e9"
    readonly property color inverse_on_surface: "#313036"
    readonly property color inverse_primary: "#5d5791"

    // --- 8. Shadow / Scrim ---
    readonly property color shadow: "#000000"
    readonly property color scrim: "#000000"
}
