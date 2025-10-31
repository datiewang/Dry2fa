Microsoft Store Submission Checklist (Dry2FA)

1) Package
- Build MSIX: build/windows/x64/runner/Release/flutter_2fa_manager.msix
- Version bump: pubspec.yaml version + msix_version (4-part)
- Identity: matches Partner Center (OK)

2) Listing (per language: en-US, zh-CN, ja-JP)
- Title: store/listing/<locale>/title.txt
- Short description: store/listing/<locale>/short_description.txt
- Description: store/listing/<locale>/description.txt
- Features: store/listing/<locale>/features.txt
- Keywords: store/listing/<locale>/keywords.txt
- Release notes: store/listing/<locale>/release_notes.txt
- Privacy policy URL: store/listing/<locale>/privacy_policy_url.txt (replace TODO with public URL)

3) Screenshots
- Place PNG/JPG in store/assets/screenshots/<locale>/
- 3–10 images, 16:9, recommended 1920×1080

4) Policies
- Privacy policy: publish PRIVACY.md to a public URL and paste link
- Minimal capabilities: no network (OK)

5) Category suggestion
- Category: Security
- Subcategory: Utilities / Tools

6) Support
- Provide contact (email or website) in listing Support info

7) Final checks
- Launch the MSIX after install; verify brand name and icons
- Verify localization strings appear correctly in each language
