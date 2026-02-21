# 🎫 Discord Waiting Room — FiveM Script

<p align="center">
  <img src="https://img.shields.io/badge/FiveM-QBCore-F40552?style=for-the-badge"/>
  <img src="https://img.shields.io/badge/ox__lib-required-blue?style=for-the-badge"/>
  <img src="https://img.shields.io/badge/Lua-5.4-000080?style=for-the-badge&logo=lua&logoColor=white"/>
  <img src="https://img.shields.io/badge/license-MIT-green?style=for-the-badge"/>
</p>

---

## 🇵🇹 Português

### Descrição
Resource FiveM para servidores QBCore que recebe alertas do bot Discord e notifica
todos os staffs online in-game quando alguém entra na sala de espera.

### Funcionalidades
- Notificação in-game para todos os staffs online
- Compatível com ox_lib, QBCore e notificação nativa do GTA V
- Comando `/suporte` para desativar notificações durante RP
- Suporte a múltiplos idiomas (PT, EN, ES, FR)
- Som de alerta configurável
- Fácil configuração via `config.lua`

### Requisitos
- FiveM com QBCore
- [ox_lib](https://github.com/overextended/ox_lib)
- [Connection](https://github.com/PJSMartins/connection)

### Instalação

**1. Copiar a pasta**

Copia a pasta `discord-support` para a pasta `resources` do teu servidor FiveM.

**2. Configurar**

Abre o `config.lua` e preenche:
```lua
Config.Chave = "CHAVE_SECRETA"  -- igual ao FIVEM_KEY do bot
```

Altera as restantes opções conforme necessário:
```lua
Config.Idioma      = "pt"       -- idioma das mensagens
Config.Notificacao = "oxlib"    -- "oxlib" | "qbcore" | "nativa"
Config.StaffGroups = { "god", "admin", "mod" }
Config.Comando     = "suporte"  -- comando para ligar/desligar
```

**3. Adicionar ao `server.cfg`**
```
ensure ox_lib
ensure discord-support
```

**4. Reiniciar o servidor ou executar na consola**
```
refresh
start discord-support
```

### Configuração completa

| Opção | Descrição | Padrão |
|---|---|---|
| `Config.Idioma` | Idioma das mensagens | `"pt"` |
| `Config.Chave` | Chave secreta partilhada com o bot | `"suporte2026"` |
| `Config.StaffGroups` | Permissões QBCore que recebem avisos | `{ "god", "admin", "mod" }` |
| `Config.DebugTodos` | Envia para todos os jogadores (modo teste) | `false` |
| `Config.Notificacao` | Sistema de notificação | `"oxlib"` |
| `Config.Duracao` | Duração da notificação (ms) | `8000` |
| `Config.Posicao` | Posição da notificação (ox_lib) | `"top-right"` |
| `Config.Comando` | Comando para ligar/desligar | `"suporte"` |
| `Config.Som` | Ativar som na notificação | `true` |

### Estrutura
```
discord-support/
├── fxmanifest.lua
├── config.lua
├── server.lua
├── client.lua
└── locales/
    ├── pt.lua
    ├── en.lua
    ├── es.lua
    └── fr.lua
```

---

## 🇬🇧 English

### Description
FiveM resource for QBCore servers that receives alerts from a Discord bot and notifies
all online staff in-game when someone joins the waiting room voice channel.

### Features
- Real-time in-game notifications for all online staff
- Compatible with ox_lib, QBCore and native GTA V notifications
- `/suporte` command to toggle notifications during RP sessions
- Multi-language support (PT, EN, ES, FR)
- Configurable alert sound
- Easy configuration via `config.lua`

### Requirements
- FiveM with QBCore
- [ox_lib](https://github.com/overextended/ox_lib)
- [discord-waiting-room connection](https://github.com/PJSMartins/connection) running

### Installation

**1. Copy the folder**

Copy the `discord-support` folder into your FiveM server's `resources` directory.

**2. Configure**

Open `config.lua` and set:
```lua
Config.Chave = "YOUR_SECRET_KEY"  -- must match FIVEM_KEY in the bot
```

Adjust the remaining options as needed:
```lua
Config.Idioma      = "en"       -- message language
Config.Notificacao = "oxlib"    -- "oxlib" | "qbcore" | "nativa"
Config.StaffGroups = { "god", "admin", "mod" }
Config.Comando     = "suporte"  -- toggle command
```

**3. Add to `server.cfg`**
```
ensure ox_lib
ensure discord-support
```

**4. Restart or run in console**
```
refresh
start discord-support
```

### Full configuration

| Option | Description | Default |
|---|---|---|
| `Config.Idioma` | Message language | `"pt"` |
| `Config.Chave` | Secret key shared with the bot | `"suporte2026"` |
| `Config.StaffGroups` | QBCore permissions that receive alerts | `{ "god", "admin", "mod" }` |
| `Config.DebugTodos` | Send to all players (test mode) | `false` |
| `Config.Notificacao` | Notification system | `"oxlib"` |
| `Config.Duracao` | Notification duration (ms) | `8000` |
| `Config.Posicao` | Notification position (ox_lib) | `"top-right"` |
| `Config.Comando` | Toggle command | `"suporte"` |
| `Config.Som` | Enable alert sound | `true` |

### Folder structure
```
discord-support/
├── fxmanifest.lua
├── config.lua
├── server.lua
├── client.lua
└── locales/
    ├── pt.lua
    ├── en.lua
    ├── es.lua
    └── fr.lua
```

### License
MIT © [Paulo Martins](https://github.com/PJSMartins)
