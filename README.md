![image](https://github.com/user-attachments/assets/99ae2107-25ad-473c-85d6-0e738e858522)


# GammaOS Next

GammaOS Next is a highly customized Android firmware for handhelds, built on both **Android 13 / LineageOS 20** and **Android 14 / LineageOS 21** depending on device. It delivers a streamlined, performance-optimized experience with extensive tweaks to improve responsiveness, battery life, visual quality, and user control.

## Features

### Core System
- **Android 13 / LineageOS 20 & Android 14 / LineageOS 21**  
  Modern, debloated bases tuned for handheld use, with reduced background overhead and a focus on smooth, consistent performance.
- **Full & Lite Editions**  
  - **Full**: Includes Google Play Store, Google Play Services, and Google-dependent components for users who rely on Google account sync and Play Store distribution.  
  - **Lite**: Ships without Google services for a minimal, self-contained handheld environment, ideal for users who sideload or use alternative stores.
- **Aurora Store (where included)**  
  Seamlessly sideload apps without needing a Google account.

### User Interface & Navigation
- **Daijisho Launcher**  
  Pre-configured for RetroArch on supported devices (GB, GBC, GBA, NES, SNES, Genesis, PSX). BIOS files must be supplied by the user.  
- **App Drawer in Navigation Bar**  
  Instantly access any installed app from the navigation bar without returning to the home screen.  
- **Screen Rotation Controls**  
  Enforce landscape-first behavior when rotation is disabled, keeping games and apps in a consistent orientation.  
- **Immersive Mode**  
  Console-style fullscreen experience with status/navigation bars hidden by default and accessible via edge swipes or Quick Settings.

### Input & Controls
- **Universal Button Remapping**  
  Remap any physical button to any key or input, giving full control over your gamepad layout.  
- **Analog Stick Calibration**  
  Fine-tune stick range and deadzones to correct drift and improve precision.  
- **L2/R2 Fixes**  
  Corrected L2/R2 handling on supported devices for better compatibility in games and apps.  
- **Layout Persistence**  
  Once you select a button layout (e.g. Xbox, Nintendo-style), it persists across reboots.

### Display, Shaders & Lighting
- **Global Shader Pipeline (on supported devices)**  
  System-wide post-processing shaders such as CRT-Simple and LCD3x, integrated at the display pipeline and configurable via a dedicated Shader Quick Settings tile.
- **Global BFI (Black Frame Insertion, on supported devices)**  
  Integrated BFI path to improve motion clarity on supported panels and refresh-rate configurations.
- **HDMI Docking Mode (on supported devices)**  
  When connected to HDMI, the internal screen can power down and the system resizes to the external display’s resolution for a docked “console” experience.
- **DC Dimming Emulation**  
  Reduces perceived PWM flicker on panels that exhibit it, improving comfort in long sessions.  
- **GammaRGB LED Sync (on supported devices)**  
  Mirrors on-screen colors to RGB LEDs, and synchronizes LED brightness with display brightness.  
- **60 Hz Refresh Rate & Oversharpening Fixes (where applicable)**  
  Corrected refresh behavior and oversharpening fixes on devices that require it.

### Performance, Power & Audio
- **Performance Governors & Modes**  
  CPU, GPU, and related components are tuned to clear performance profiles:
  - **Max Performance**: Highest performance, highest power draw.  
  - **Normal Performance**: Dynamic scaling based on load.  
  - **Power Save**: Lower frequencies for extended battery life (ideal for light emulation).  
- **Quick Settings Tiles**  
  One-tap toggles for performance profiles, analog sensitivity, ABXY remapping, axis inversion, D-pad/analog swap, shaders, BFI, HDMI docking behavior, Deep Sleep Mode, and more.
- **Deep Sleep Mode (cgroup Freeze)**  
  Force-freezes background apps to prevent emulators or other apps from running unnecessarily. Use with care, as some apps may not resume correctly.
- **GammaEQ (on supported devices)**  
  System-level audio equalizer integrated near the audio fast-mixer path, with a dedicated UI on newer builds for managing presets and tuning without manual properties.

### Root & Modding
- **Magisk Root**  
  Pre-installed root access via Magisk on supported devices, ready for modules, custom tweaks, and deeper system modifications (subject to OS version constraints).

### Storage & Security
- **Relaxed Scoped Storage**  
  Loosened storage constraints (where appropriate) so front-ends, emulators, and tools can access files more easily without constant permission friction.

Enjoy the combination of performance, flexibility, and console-like UX that GammaOS Next brings to Android handhelds.

## Supported Devices

| Device                               | Release                                                                                  |
|--------------------------------------|------------------------------------------------------------------------------------------|
| Anbernic RG556                       | [GammaOS Next - Anbernic T820 - v1](https://github.com/TheGammaSqueeze/GammaOSNext/releases/tag/v.1.0.0-T820) |
| Anbernic RG-CUBE                     | [GammaOS Next - Anbernic T820 - v1](https://github.com/TheGammaSqueeze/GammaOSNext/releases/tag/v.1.0.0-T820) |
| Anbernic RG406H                      | [GammaOS Next - Anbernic T820 - v1](https://github.com/TheGammaSqueeze/GammaOSNext/releases/tag/v.1.0.0-T820) |
| Anbernic RG406V                      | [GammaOS Next - Anbernic RG406V - v1.2](https://github.com/TheGammaSqueeze/GammaOSNext/releases/tag/v.1.2.0-ANBERNIC406V) |
| Anbernic RG476H                      | [GammaOS Next - Anbernic RG476H - v1.2](https://github.com/TheGammaSqueeze/GammaOSNext/releases/tag/v.1.2.0-ANBERNICRG476H) |
| Anbernic RG Slide                    | **PLANNED**                                                                              |
| Anbernic RG405M / RG405V / RG505     | [GammaOS Next - Anbernic RG405M / RG405V / RG505 - v1.1](https://github.com/TheGammaSqueeze/GammaOSNext/releases/tag/v.1.1.0-ANBERNICT618) |
| AYANEO Pocket Micro                  | [GammaOS Next - AYANEO Pocket Micro - v1](https://github.com/TheGammaSqueeze/GammaOSNext/releases/tag/v.1.0.0-AYANEOPOCKETMICRO) |
| AYANEO Pocket-S / DMG                | **PLANNED**                                                                              |
| AYANEO Pocket AIR                    | **PLANNED**                                                                              |
| Retroid Pocket 4 PRO                 | [GammaOS Next - Retroid Pocket 4 Pro - v1](https://github.com/TheGammaSqueeze/GammaOSNext/releases/tag/v.1.0.0-RETROIDPOCKET4PRO) |
| Retroid Pocket Mini v1/v2            | **PLANNED**                                                                              |
| Retroid Pocket Flip 2                | **PLANNED**                                                                              |
| Retroid Pocket 5                     | **PLANNED**                                                                              |
| Retroid Pocket Classic               | [GammaOS Next - Retroid Pocket Classic - v1](https://github.com/TheGammaSqueeze/GammaOSNext/releases/tag/v.1.0.0-RETROIDPOCKETCLASSIC) |
| KT Pocket KT-R1                      | [GammaOS Next - KTPocket KT-R1 - v1](https://github.com/TheGammaSqueeze/GammaOSNext/releases/tag/v.1.0.0-KTR1) |
| ZPG Unicorn A1                       | [GammaOS Next - ZPG A1 Unicorn - v1](https://github.com/TheGammaSqueeze/GammaOSNext/releases/tag/v.1.0.0-ZPGA1UNICORN) |
| GameMT E6 MAX                        | [GammaOS Next - GameMT E6 Max - v1.1.0](https://github.com/TheGammaSqueeze/GammaOSNext/releases/tag/v.1.1.0-GAMEMTE6MAX) |
| Powkiddy X28                         | **PLANNED**                                                                              |
| Mangmi Air X                         | [GammaOS Next - Mangmi Air X - v1.1.1](https://github.com/TheGammaSqueeze/GammaOSNext/releases/tag/v.1.1.1-MANGMIAIRX) |

## Download & Changelog

- **Download Latest Release**: [GammaOS Next Releases](https://github.com/TheGammaSqueeze/GammaOSNext/releases)
- **Changelog**: See the [GammaOS Next Changelog](https://github.com/TheGammaSqueeze/GammaOSNext/wiki/GammaOS-Next-Changelog) for detailed per-device updates.

## Installation

For installation instructions, including brand-new installs, upgrades from previous versions, and returning to stock firmware, refer to the official GammaOS Next documentation:

- [Installation Guide](https://github.com/TheGammaSqueeze/GammaOSNext/wiki/GammaOS-Next-Installation)

## Credits

- **TheGammaSqueeze** – Lead development and maintenance  
- **Contributors & Testers** – Community support, feedback, and QA (support on https://www.patreon.com/GammaOS)  
- **LineageOS Team** – Upstream Android 13 / LineageOS 20 and Android 14 / LineageOS 21 sources

GammaOS Next brings a console-focused, highly tunable Android experience to your favorite handheld devices, with a clear focus on performance, control, and long-term playability.
