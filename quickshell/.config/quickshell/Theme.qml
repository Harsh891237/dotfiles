pragma Singleton
import QtQuick

QtObject {
    // --- 1. Primary Colors ---
    readonly property color primary: "#80d5d1"
    readonly property color on_primary: "#003735"
    readonly property color primary_container: "#00504d"
    readonly property color on_primary_container: "#9cf1ed"
    readonly property color primary_fixed: "#9cf1ed"
    readonly property color on_primary_fixed: "#00201f"

    // --- 2. Secondary Colors ---
    readonly property color secondary: "#b0ccca"
    readonly property color on_secondary: "#1b3533"
    readonly property color secondary_container: "#324b4a"
    readonly property color on_secondary_container: "#cce8e6"
    readonly property color secondary_fixed: "#cce8e6"
    readonly property color on_secondary_fixed: "#051f1e"

    // --- 3. Tertiary Colors (Good for accents/charts) ---
    readonly property color tertiary: "#b1c8e8"
    readonly property color on_tertiary: "#1a324b"
    readonly property color tertiary_container: "#324862"
    readonly property color on_tertiary_container: "#d1e4ff"
    readonly property color tertiary_fixed: "#d1e4ff"
    readonly property color on_tertiary_fixed: "#021d35"

    // --- 4. Background & Surface (The most important for Bars) ---
    readonly property color background: "#0e1514"
    readonly property color on_background: "#dde4e2"
    
    readonly property color surface: "#0e1514"
    readonly property color on_surface: "#dde4e2"
    
    readonly property color surface_variant: "#3f4948"
    readonly property color on_surface_variant: "#bec9c7"

    // Surface Containers (Best for panels/popups - Darker/Lighter shades)
    readonly property color surface_container_lowest: "#090f0f"
    readonly property color surface_container_low: "#161d1c"
    readonly property color surface_container: "#1a2120"
    readonly property color surface_container_high: "#252b2b"
    readonly property color surface_container_highest: "#2f3635"

    // --- 5. Errors ---
    readonly property color error: "#ffb4ab"
    readonly property color on_error: "#690005"
    readonly property color error_container: "#93000a"
    readonly property color on_error_container: "#ffdad6"

    // --- 6. Outlines (Borders) ---
    readonly property color outline: "#889392"
    readonly property color outline_variant: "#3f4948"

    // --- 7. Inverse (High Contrast) ---
    readonly property color inverse_surface: "#dde4e2"
    readonly property color inverse_on_surface: "#2b3231"
    readonly property color inverse_primary: "#006a67"

    // --- 8. Shadow / Scrim ---
    readonly property color shadow: "#000000"
    readonly property color scrim: "#000000"
}
