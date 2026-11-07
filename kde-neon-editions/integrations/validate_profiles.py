#!/usr/bin/env python3
"""Validate opt-in integration profile metadata without building or mutating images."""
from pathlib import Path
import sys

import yaml

ROOT = Path(__file__).resolve().parent


def main() -> int:
    profile_path = ROOT / "ageless-linux" / "profile.yaml"
    discover_doc = ROOT / "discover" / "README.md"

    profile = yaml.safe_load(profile_path.read_text(encoding="utf-8"))
    assert isinstance(profile, dict), "Ageless profile must be a YAML mapping"
    assert profile.get("schema_version") == 1, "Unsupported profile schema_version"

    data = profile.get("profile")
    assert isinstance(data, dict), "Missing profile mapping"
    assert data.get("id") == "ageless-linux", "Unexpected profile id"
    assert data.get("profile_type") == "os-identity-policy-layer"
    assert data.get("status") == "planned"
    assert data.get("support_status") == "unknown"
    assert data.get("base_os_family") == "debian"
    assert data.get("compatibility", {}).get("ubuntu_noble_neon") == "unverified"

    capabilities = data.get("capabilities", {})
    for key in ("conversion", "image_build", "kernel_build", "package_install", "publish"):
        assert capabilities.get(key) is False, f"{key} must remain disabled"

    safety = data.get("safety", {})
    assert safety.get("execute_converter_in_ci") is False
    assert safety.get("modify_host") is False
    assert safety.get("require_disposable_image") is True
    assert safety.get("require_immutable_base_image") is True

    discover_text = discover_doc.read_text(encoding="utf-8")
    for marker in (
        "Interested-Deving-1896/discover",
        "KDE/discover",
        "distro-provided",
        "not yet pinned",
    ):
        assert marker in discover_text, f"Discover integration doc missing {marker!r}"

    print("Integration profile contracts valid (metadata-only; no image actions).")
    return 0


if __name__ == "__main__":
    try:
        raise SystemExit(main())
    except (AssertionError, OSError, yaml.YAMLError) as exc:
        print(f"Integration profile validation failed: {exc}", file=sys.stderr)
        raise SystemExit(1)
