pragma Singleton
import QtQuick

QtObject {
    // --- 1. Primary Colors ---
    readonly property color primary: "#d7bafb"
    readonly property color on_primary: "#3b255a"
    readonly property color primary_container: "#533c73"
    readonly property color on_primary_container: "#eddcff"
    readonly property color primary_fixed: "#eddcff"
    readonly property color on_primary_fixed: "#250e44"

    // --- 2. Secondary Colors ---
    readonly property color secondary: "#cfc2da"
    readonly property color on_secondary: "#352d40"
    readonly property color secondary_container: "#4c4357"
    readonly property color on_secondary_container: "#ebddf7"
    readonly property color secondary_fixed: "#ebddf7"
    readonly property color on_secondary_fixed: "#20182a"

    // --- 3. Tertiary Colors (Good for accents/charts) ---
    readonly property color tertiary: "#f2b7c1"
    readonly property color on_tertiary: "#4b252d"
    readonly property color tertiary_container: "#653b43"
    readonly property color on_tertiary_container: "#ffd9df"
    readonly property color tertiary_fixed: "#ffd9df"
    readonly property color on_tertiary_fixed: "#321019"

    // --- 4. Background & Surface (The most important for Bars) ---
    readonly property color background: "#151218"
    readonly property color on_background: "#e7e0e8"
    
    readonly property color surface: "#151218"
    readonly property color on_surface: "#e7e0e8"
    
    readonly property color surface_variant: "#4a454e"
    readonly property color on_surface_variant: "#ccc4cf"

    // Surface Containers (Best for panels/popups - Darker/Lighter shades)
    readonly property color surface_container_lowest: "#100d12"
    readonly property color surface_container_low: "#1d1a20"
    readonly property color surface_container: "#211e24"
    readonly property color surface_container_high: "#2c292f"
    readonly property color surface_container_highest: "#37333a"

    // --- 5. Errors ---
    readonly property color error: "#ffb4ab"
    readonly property color on_error: "#690005"
    readonly property color error_container: "#93000a"
    readonly property color on_error_container: "#ffdad6"

    // --- 6. Outlines (Borders) ---
    readonly property color outline: "#958e99"
    readonly property color outline_variant: "#4a454e"

    // --- 7. Inverse (High Contrast) ---
    readonly property color inverse_surface: "#e7e0e8"
    readonly property color inverse_on_surface: "#322f35"
    readonly property color inverse_primary: "#6b538c"

    // --- 8. Shadow / Scrim ---
    readonly property color shadow: "#000000"
    readonly property color scrim: "#000000"
}
