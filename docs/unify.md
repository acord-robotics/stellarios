---
comments: true
title: Unity RPG
published: true
---

# Unity RPG

[Plot](#plot)
[Resources](#resources)
	[Inventory](#inventory)
[Dev Updates](#devlogs)

<iframe style="width: 90%; height: 1000px; overflow: show;" src="https://skinetics.notelet.so/bcbdcd59d2a443c9bc278318b8ce241d" width="100%" height="1000" scrolling="yes">Iframes not supported</iframe>


# Plot
Start as an astronaut (human) on a planet. Planets in the solar system you're in are starting to be "disintegrated" (aka being moved, see the Star Sailors story) and you need to gather as much alien DNA as possible. You travel from planet to planet using a ship that you repair with the help of your new alien friends and once you get aliens from each of the 5 biospheres on each planet (with a shared history between all life in the ecosystems this is enough data to retrieve) you need to mine asteroids and other space anomalies to prepare for a jump to the Galactic Capital, Midgard, where you will bring the aliens for safekeeping and bring word of the destruction of planets (by sentient forces like gravity and electromagnetism). 

# Resources
[Notion Documentation](https://skinetics.notelet.so/bcbdcd59d2a443c9bc278318b8ce241d)
Music (from Veonity) - Coming Soon!

## Inventory
<iframe style="width: 90%; height: 1000px; overflow: show;" src="https://skinetics.notelet.so/56c1cffce8ee403bb78314a979fe3210" width="100%" height="1000" scrolling="yes">IFrame</iframe>

### Components
| Component | Parent | Status | Desc |
|---|---|---|---|
| [Canvas Setup](https://www.notion.so/skinetics/Inscope-RPG-Inventory-56c1cffce8ee403bb78314a979fe3210#ca6ece24514e401797749af13eef316a) | [Corkboard Inventory](https://www.notion.so/skinetics/Inscope-RPG-Inventory-56c1cffce8ee403bb78314a979fe3210#d7c28861c14c43d7ad246646232e71e7) | 1.1 Done | Creating minimal inventory UI that will eventually behave like a multitool |

Github Actions
```yml
name: Acquire activation file
on: [push]
jobs:
  activation:
    name: Request manual activation file 🔑
    runs-on: ubuntu-latest
    steps:
        # Request manual activation file
        - name: Request manual activation file
          id: getManualLicenseFile
          uses: webbertakken/unity-request-manual-activation-file@v1.1
          with:
            unityVersion: 2019.3.14f1
        # Upload artifact (Unity_v20XX.X.XXXX.alf)
        - name: Expose as artifact
          uses: actions/upload-artifact@v1
          with:
            name: ${{ steps.getManualLicenseFile.outputs.filePath }}
            path: ${{ steps.getManualLicenseFile.outputs.filePath }} 
	    
	    https://dev.to/isaacbroyles/building-unity-with-github-actions-1l85
	    
```
[Github Docs](https://github.com/acord-robotics/Unity-Intro/blob/master/InscopeRPG/Inventory.md)

[Build Test](https://github.com/Gizmotronn/Unity-Intro/commit/f8f04f403e3d101086c02a8ea88438e045594fbe)

Do Notion toggle
`.github/workflows/main.yml`

```yml
name: Build

on:
  push:
    tags:
      - '*'

env:
  UNITY_LICENSE: ${{ secrets.UNITY_LICENSE }}

jobs:
  build:
    name: Build my project
    runs-on: ubuntu-latest
    steps:

      # Checkout
      - name: Checkout repository
        uses: actions/checkout@v2
        with:
          lfs: true

      # Cache
      - uses: actions/cache@v1.1.0
        with:
          path: Library
          key: Library

      # Test
      - name: Run tests
        uses: webbertakken/unity-test-runner@v1.3
        with:
          unityVersion: 2019.3.14f1

      # Build
      - name: Build project
        uses: webbertakken/unity-builder@v0.10
        with:
          unityVersion: 2019.3.14f1
          targetPlatform: StandaloneWindows64 

      # Output 
      - uses: actions/upload-artifact@v1
        with:
          name: Build
          path: build

      - name: Zip build
        run: |
          pushd build/StandaloneWindows64
          zip -r ../../StandaloneWindows64.zip .
          popd

      - name: Create Release
        id: create_release
        uses: actions/create-release@v1
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
        with:
          tag_name: ${{ github.ref }}
          release_name: Release ${{ github.ref }}
          draft: false
          prerelease: false

      - name: Upload Release Asset
        id: upload-release-asset 
        uses: actions/upload-release-asset@v1
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
        with:
          upload_url: ${{ steps.create_release.outputs.upload_url }} # This pulls from the CREATE RELEASE step above, referencing it's ID to get its outputs object, which include a `upload_url`. See this blog post for more info: https://jasonet.co/posts/new-features-of-github-actions/#passing-data-to-future-steps 
          asset_path: ./StandaloneWindows64.zip
          asset_name: StandaloneWindows64.zip
          asset_content_type: application/zip
```
Glitch Unity Git Workflow - version control on Glitch?
https://support.glitch.com/t/unable-to-connect-to-websocket-from-unity/30890-->

### Assets
| Component | Location |
|---|---|
| [Ufo Capture Pod](https://www.pixilart.com/art/ufo-capture-pod-d6de1cc5aeb3f9e) | Pixilart.com |

<iframe
    src="https://glitch.com/embed/#!/embed/larbuckle?path=README.md&previewSize=0"
    title="larbuckle on Glitch"
    allow="geolocation; microphone; camera; midi; vr; encrypted-media"
    style="height: 100%; width: 100%; border: 0;">
  </iframe>

### Devlogs
* [Update for Veonity - 16.3.2021]({{ site.baseurl }}/docs/unify16321)
* [441 Docklands - 31.3.2021]({{ site.baseurl }}/docs/unifydocklands31321)
