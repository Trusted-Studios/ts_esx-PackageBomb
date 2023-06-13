# FiveM Basic Package Bomb

EN: 

"Packet Bomb Script" for FiveM is a simple yet powerful system designed for explosive immersion. Utilizing the ox_target library, this script ensures the best performance and synchronized gameplay. Deploy packet bombs strategically and create a dynamic multiplayer experience. Elevate your FiveM server with thrilling chaos and excitement.


DE: 

Das "Packet Bomb Script" für FiveM ist ein einfaches, aber leistungsstarkes System, das explosive Immersion ermöglicht. Mit der Nutzung der ox_target-Bibliothek sorgt dieses Skript für optimale Leistung und synchronisiertes Gameplay. Platziere Paketbomben strategisch und schaffe eine dynamische Multiplayer-Erfahrung. Steigere dein FiveM-Servererlebnis mit aufregendem Chaos und Spannung.

---

## Configuration Options

```lua
Config.Item = 'package_bomb'
```
The name of the item that can be used to place the packagebomb.

---

```lua
Config.Prop = "prop_cs_box_clothes"
```
The name of the prop that will spawn.

---

```lua
Config.Text {
    ['open_package'] = "Paket öffnen"
}
```
Locale display text. 

---

## Dependencies

- [es_extended (Legacy)](https://github.com/esx-framework/esx_core/releases/tag/1.9.4)
- [ox_target](https://github.com/overextended/ox_target/releases/tag/v1.9.2)