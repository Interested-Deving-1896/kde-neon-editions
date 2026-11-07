# KDE Discover integration

**Status: existing distro package remains default; user fork is a build candidate only.**

The KDE Neon edition manifests already include the distribution-provided `discover`, `plasma-discover`, and optional Flatpak/Snap Discover backend packages. This integration records the maintained fork as a separately testable source candidate:

- Maintained fork: https://github.com/Interested-Deving-1896/discover
- Upstream parent: https://github.com/KDE/discover
- Homepage: https://invent.kde.org/plasma/discover
- Observed fork version: 6.6.80
- Source branch: `master`
- Immutable source revision: not yet pinned

## Integration policy

1. Keep the distro-provided `plasma-discover` package in all current edition manifests.
2. Do not replace it with the fork until its source revision, upstream divergence, license, package dependencies, and backend compatibility are audited.
3. Build the fork as a separate candidate package in an isolated build environment.
4. Verify PackageKit, Flatpak, Snap, and other enabled backends independently; backend availability depends on the target image and build dependencies.
5. Keep the candidate package distinguishable from the distro package to avoid file ownership and upgrade conflicts.
6. Only promote it to an edition manifest after install/upgrade/remove tests and booted-image smoke tests pass.

## KPort relationship

KPort may eventually provide a reviewed Pacscript for the same pinned source. A native KPort backend inside Discover is a separate feature and is not implied by packaging Discover through KPort. See the KPort integration contract once available.

## Current state

- Existing Neon Discover package: retained.
- User fork: candidate only.
- KPort package recipe: not yet reproducible.
- Native KPort backend: not implemented.
- Automatic replacement in edition manifests: disabled.
