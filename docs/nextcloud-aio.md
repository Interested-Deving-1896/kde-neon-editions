# Optional Nextcloud All-in-One integration

This project may expose [Nextcloud All-in-One (AIO)](https://github.com/nextcloud/all-in-one)
as an optional server deployment/documentation integration for KDE Neon.

The maintained project mirror is
[Interested-Deving-1896/All-In-One-NextCloud-Installer](https://github.com/Interested-Deving-1896/All-In-One-NextCloud-Installer).
It is a fork of the official `nextcloud/all-in-one` project and declares
AGPL-3.0. The official upstream remains authoritative for releases, supported
deployment methods, security notices, and operational documentation.

## Desktop versus server

KDE Neon is the desktop operating system. Nextcloud AIO is a containerized
server stack. The integration is therefore optional and must not make a
Nextcloud server part of the default desktop installation.

Appropriate desktop integration includes:

- a clearly labelled optional application/documentation entry;
- opening an administrator-provided Nextcloud URL in the user's browser;
- optional client-side discovery/documentation for supported Nextcloud desktop
  and mobile clients;
- an administrator-invoked deployment guide for a separate server or VM.

It must not silently install Docker/Podman, enable a privileged daemon, expose
ports, configure public DNS/TLS, or start a server during desktop login.

## Deployment model

When an administrator chooses to host AIO on a KDE Neon machine, follow the
official AIO requirements and compose configuration. Treat the machine as a
server for that deployment and explicitly explain the security and maintenance
implications.

The AIO mastercontainer may require access to the container runtime socket.
That access can grant host-level control. Do not hide this permission behind a
desktop launcher or grant it to ordinary desktop users.

## BDFS storage option

Where BDFS is installed, administrators may choose BDFS/Btrfs-managed host
storage for persistent AIO data if the selected AIO deployment method supports
the corresponding host paths. AIO's own BorgBackup workflow remains the
application-level backup and restore mechanism. BDFS snapshots are an
additional recovery layer and must be coordinated with database consistency;
a raw snapshot of a live database is not a verified backup.

See the BDFS integration design:
[Nextcloud AIO on BDFS](https://github.com/Interested-Deving-1896/btrfs-dwarfs-framework/tree/main/integrations/nextcloud-aio).

## Licensing and upstream policy

Preserve the AGPL-3.0 notices of the maintained installer fork and all
third-party notices. Do not vendor or modify upstream application code as part
of KDE Neon packaging without a separate license/provenance review.

## Acceptance criteria for a future package

- optional installation only, not part of the default Neon image;
- no auto-start or public network exposure without explicit administrator
  action;
- clear distinction between a desktop client and a self-hosted server;
- supported AIO version and container runtime documented;
- no secrets in package defaults, logs, or generated desktop files;
- uninstall leaves user data untouched and explains the manual data-removal
  process;
- integration tested on each Neon edition before being advertised as supported.
