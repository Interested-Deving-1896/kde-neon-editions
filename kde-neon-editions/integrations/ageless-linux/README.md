# Ageless Linux integration for KDE Neon editions

**Status: opt-in profile contract; compatibility unknown; conversion disabled.**

Ageless Linux is treated as an OS identity and policy conversion layer, not as a KDE Neon edition, kernel source, or package manager. The integration is intended to let a future Debian-based KDE image evaluate Ageless without changing the existing KDE Neon edition defaults.

## Important base-system boundary

The current KDE Neon edition manifests in this repository declare Ubuntu Noble and use the KDE Neon archive and signing key. The BDFS Ageless integration currently models Debian-derived base identity as its intended test path and keeps compatibility unknown.

Therefore:

- Do not apply Ageless conversion to the existing Ubuntu Noble Neon images by default.
- Do not claim that Ubuntu Noble is an Ageless-supported base.
- Do not replace the current Neon package manifests or archive configuration.
- A future Debian-based KDE image must be a separately declared edition/profile with its own package source, archive trust, installer, and kernel provenance.
- The Ageless identity must never be used to infer package manager, base release, architecture, init system, kernel source, or kernel ABI.

## Relationship with BDFS

Use the read-only inventory and compatibility contracts from:

- https://github.com/Interested-Deving-1896/btrfs-dwarfs-framework/tree/main/integrations/ageless-linux
- https://github.com/Interested-Deving-1896/btrfs-dwarfs-framework/pull/54

The BDFS inventory is descriptive only. It does not execute the Ageless converter or authorize package installation, kernel builds, or image publication.

## Readiness gates

1. Identify a supported Debian base image and pin its immutable digest.
2. Record base OS identity, release, architecture, package manager, init system, and kernel provenance independently.
3. Pin the Ageless converter and verify its assembled source and licensing.
4. Test conversion only in a disposable isolated image/VM with no host mounts, credentials, or network access.
5. Verify rollback, idempotence, file permissions, service/timer behavior, and failure recovery.
6. Build the KDE desktop layer and installer independently of the conversion step.
7. Run image boot, package, update, and rollback smoke tests before declaring support.

## Current state

- Existing Ubuntu-based KDE Neon editions: unchanged.
- Ageless on Ubuntu Noble: **unverified / not enabled**.
- Debian-derived KDE + Ageless profile: **planned / inventory-only**.
- Conversion execution: disabled.
- Kernel build, install, and publication: disabled.

This integration keeps Ageless available as a future edition profile without misrepresenting the existing Neon image base.
