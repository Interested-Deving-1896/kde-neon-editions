## Profile boundary

Nitrux Standard and Aesthetic FHS should be offered as a distinct, opt-in KDE Neon profile. They must not alter the existing Neon User, Testing, Developer Stable, or Developer Unstable defaults, and must not be conflated with the separate ChromiumOS-derived KairoOS track.

## Upstream facts

- Nitrux Standard builds an `Architecture: all` metapackage from a dependency list that currently includes `afhs`.
- `Architecture: all` does not guarantee every dependency is available in every Ubuntu/Neon release or architecture.
- The `aesthetic-fhs` repository supplies the userspace `afhs` Generic Netlink controller and ABI declarations.
- The kernel implementation is available as [Nitrux/linux-kernel patch 0009-aesthetic-fhs.patch](https://github.com/Nitrux/linux-kernel/blob/linux-nitrux/patches/0009-aesthetic-fhs.patch), included in Nitrux's patch series for kernel source version 7.3.1. Patch applicability to KDE Neon target kernels remains unverified.
- The userspace repository declares BSD-3-Clause, while `src/afhs.c` and `include/afhs.h` carry GPL-2.0 SPDX identifiers. Resolve file-level licensing before redistribution or vendoring.

## Profile requirements

- Keep the profile opt-in and separate from the standard Neon manifests.
- Validate package availability against the selected Neon archive, Ubuntu base series, and architecture. Report available, renamed, unavailable, and policy-excluded dependencies distinctly.
- Enable `afhs` only when the selected kernel has the reviewed implementation and a verified compatible `aesthetic_fhs` Generic Netlink family/ABI. Do not infer support from a Kconfig symbol alone.
- Review patch applicability, namespace/inode lifetime behavior, ABI compatibility, and boot/runtime behavior for each supported kernel.
- Keep Plasma as the native desktop environment; this profile does not replace or rebrand the KDE Neon edition.
- Record upstream refs, package versions, license metadata, and build provenance.

## Acceptance gates

1. Confirm package availability for each supported Neon series/architecture.
2. Pin, review, and validate the kernel patch against each target kernel.
3. Resolve per-file licensing and redistribution terms.
4. Validate manifest and build the optional image.
5. Smoke-test install, boot, `afhs` operations, and rollback; verify the default Neon image is unchanged.

Upstream: https://github.com/Nitrux/nitrux-standard ; https://github.com/Nitrux/aesthetic-fhs ; https://github.com/Nitrux/linux-kernel/blob/linux-nitrux/patches/0009-aesthetic-fhs.patch

This is an implementation contract, not a claim that the optional image or kernel feature is currently buildable.