## Profile boundary

Nitrux Standard and Aesthetic FHS should be offered as a distinct, opt-in KDE Neon profile. They must not alter the existing Neon User, Testing, Developer Stable, or Developer Unstable defaults, and must not be conflated with the separate ChromiumOS-derived KairoOS track.

## Upstream facts

- Nitrux Standard builds an `Architecture: all` metapackage from a dependency list that currently includes `afhs`.
- `Architecture: all` does not guarantee every dependency is available in every Ubuntu/Neon release or architecture.
- Aesthetic FHS currently supplies the userspace `afhs` Generic Netlink controller; the inspected repository does not include the kernel-side implementation.
- The repository declares BSD-3-Clause, while `src/afhs.c` and `include/afhs.h` carry GPL-2.0 SPDX identifiers. Resolve file-level licensing before redistribution or vendoring.

## Profile requirements

- Keep the profile opt-in and separate from the standard Neon manifests.
- Validate package availability against the selected Neon archive, Ubuntu base series, and architecture. Report available, renamed, unavailable, and policy-excluded dependencies distinctly.
- Install/enable `afhs` only when the selected kernel has a verified compatible `aesthetic_fhs` Generic Netlink family and ABI. Do not infer support from a Kconfig symbol alone.
- Keep Plasma as the native desktop environment; this profile does not replace or rebrand the KDE Neon edition.
- Record upstream refs, package versions, license metadata, and build provenance.

## Acceptance gates

1. Confirm package availability for each supported Neon series/architecture.
2. Obtain and verify kernel-side Aesthetic FHS implementation.
3. Resolve per-file licensing and redistribution terms.
4. Validate manifest and build the optional image.
5. Smoke-test install, boot, `afhs` operations, and rollback; verify the default Neon image is unchanged.

Upstream: https://github.com/Nitrux/nitrux-standard and https://github.com/Nitrux/aesthetic-fhs

This is an implementation contract, not a claim that the optional image or kernel feature is currently buildable.