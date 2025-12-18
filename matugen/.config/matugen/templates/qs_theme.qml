pragma Singleton
import QtQuick

QtObject {
    // --- 1. Primary Colors ---
    readonly property color primary: "{{colors.primary.default.hex}}"
    readonly property color on_primary: "{{colors.on_primary.default.hex}}"
    readonly property color primary_container: "{{colors.primary_container.default.hex}}"
    readonly property color on_primary_container: "{{colors.on_primary_container.default.hex}}"
    readonly property color primary_fixed: "{{colors.primary_fixed.default.hex}}"
    readonly property color on_primary_fixed: "{{colors.on_primary_fixed.default.hex}}"

    // --- 2. Secondary Colors ---
    readonly property color secondary: "{{colors.secondary.default.hex}}"
    readonly property color on_secondary: "{{colors.on_secondary.default.hex}}"
    readonly property color secondary_container: "{{colors.secondary_container.default.hex}}"
    readonly property color on_secondary_container: "{{colors.on_secondary_container.default.hex}}"
    readonly property color secondary_fixed: "{{colors.secondary_fixed.default.hex}}"
    readonly property color on_secondary_fixed: "{{colors.on_secondary_fixed.default.hex}}"

    // --- 3. Tertiary Colors (Good for accents/charts) ---
    readonly property color tertiary: "{{colors.tertiary.default.hex}}"
    readonly property color on_tertiary: "{{colors.on_tertiary.default.hex}}"
    readonly property color tertiary_container: "{{colors.tertiary_container.default.hex}}"
    readonly property color on_tertiary_container: "{{colors.on_tertiary_container.default.hex}}"
    readonly property color tertiary_fixed: "{{colors.tertiary_fixed.default.hex}}"
    readonly property color on_tertiary_fixed: "{{colors.on_tertiary_fixed.default.hex}}"

    // --- 4. Background & Surface (The most important for Bars) ---
    readonly property color background: "{{colors.background.default.hex}}"
    readonly property color on_background: "{{colors.on_background.default.hex}}"
    
    readonly property color surface: "{{colors.surface.default.hex}}"
    readonly property color on_surface: "{{colors.on_surface.default.hex}}"
    
    readonly property color surface_variant: "{{colors.surface_variant.default.hex}}"
    readonly property color on_surface_variant: "{{colors.on_surface_variant.default.hex}}"

    // Surface Containers (Best for panels/popups - Darker/Lighter shades)
    readonly property color surface_container_lowest: "{{colors.surface_container_lowest.default.hex}}"
    readonly property color surface_container_low: "{{colors.surface_container_low.default.hex}}"
    readonly property color surface_container: "{{colors.surface_container.default.hex}}"
    readonly property color surface_container_high: "{{colors.surface_container_high.default.hex}}"
    readonly property color surface_container_highest: "{{colors.surface_container_highest.default.hex}}"

    // --- 5. Errors ---
    readonly property color error: "{{colors.error.default.hex}}"
    readonly property color on_error: "{{colors.on_error.default.hex}}"
    readonly property color error_container: "{{colors.error_container.default.hex}}"
    readonly property color on_error_container: "{{colors.on_error_container.default.hex}}"

    // --- 6. Outlines (Borders) ---
    readonly property color outline: "{{colors.outline.default.hex}}"
    readonly property color outline_variant: "{{colors.outline_variant.default.hex}}"

    // --- 7. Inverse (High Contrast) ---
    readonly property color inverse_surface: "{{colors.inverse_surface.default.hex}}"
    readonly property color inverse_on_surface: "{{colors.inverse_on_surface.default.hex}}"
    readonly property color inverse_primary: "{{colors.inverse_primary.default.hex}}"

    // --- 8. Shadow / Scrim ---
    readonly property color shadow: "{{colors.shadow.default.hex}}"
    readonly property color scrim: "{{colors.scrim.default.hex}}"
}
