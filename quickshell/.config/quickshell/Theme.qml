pragma Singleton
import QtQuick

QtObject {
    // --- 1. Primary Colors ---
    readonly property color primary: "#ffb689"
    readonly property color on_primary: "#512300"
    readonly property color primary_container: "#6e3810"
    readonly property color on_primary_container: "#ffdbc8"
    readonly property color primary_fixed: "#ffdbc8"
    readonly property color on_primary_fixed: "#311300"

    // --- 2. Secondary Colors ---
    readonly property color secondary: "#e5bfa9"
    readonly property color on_secondary: "#432b1c"
    readonly property color secondary_container: "#5c4130"
    readonly property color on_secondary_container: "#ffdbc8"
    readonly property color secondary_fixed: "#ffdbc8"
    readonly property color on_secondary_fixed: "#2b1709"

    // --- 3. Tertiary Colors (Good for accents/charts) ---
    readonly property color tertiary: "#cbc992"
    readonly property color on_tertiary: "#323209"
    readonly property color tertiary_container: "#49491e"
    readonly property color on_tertiary_container: "#e7e5ac"
    readonly property color tertiary_fixed: "#e7e5ac"
    readonly property color on_tertiary_fixed: "#1d1d00"

    // --- 4. Background & Surface (The most important for Bars) ---
    readonly property color background: "#19120d"
    readonly property color on_background: "#f0dfd7"
    
    readonly property color surface: "#19120d"
    readonly property color on_surface: "#f0dfd7"
    
    readonly property color surface_variant: "#52443c"
    readonly property color on_surface_variant: "#d7c2b8"

    // Surface Containers (Best for panels/popups - Darker/Lighter shades)
    readonly property color surface_container_lowest: "#140d08"
    readonly property color surface_container_low: "#221a15"
    readonly property color surface_container: "#261e19"
    readonly property color surface_container_high: "#312823"
    readonly property color surface_container_highest: "#3d332d"

    // --- 5. Errors ---
    readonly property color error: "#ffb4ab"
    readonly property color on_error: "#690005"
    readonly property color error_container: "#93000a"
    readonly property color on_error_container: "#ffdad6"

    // --- 6. Outlines (Borders) ---
    readonly property color outline: "#9f8d83"
    readonly property color outline_variant: "#52443c"

    // --- 7. Inverse (High Contrast) ---
    readonly property color inverse_surface: "#f0dfd7"
    readonly property color inverse_on_surface: "#382e29"
    readonly property color inverse_primary: "#8b4f25"

    // --- 8. Shadow / Scrim ---
    readonly property color shadow: "#000000"
    readonly property color scrim: "#000000"
}
