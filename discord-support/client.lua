local notificacoesAtivas = true

-- Atalho para traduções
local function T(chave, ...)
    local locale = Locales[Config.Idioma] or Locales["pt"]
    local texto  = locale[chave] or chave
    return string.format(texto, ...)
end

local function enviarNotificacao(mensagem, tipo, icone)
    if Config.Som then
        PlaySoundFrontend(-1, Config.SomNome, Config.SomSoundSet, true)
    end

    if Config.Notificacao == "oxlib" then
        lib.notify({
            id          = "support_aviso",
            title       = T("titulo"),
            description = mensagem,
            type        = tipo,
            position    = Config.Posicao,
            duration    = Config.Duracao,
            icon        = icone,
            iconColor   = "#FFD700",
        })
    elseif Config.Notificacao == "qbcore" then
        exports["qb-core"]:Notify(mensagem, tipo, Config.Duracao)
    elseif Config.Notificacao == "nativa" then
        SetNotificationTextEntry("STRING")
        AddTextComponentString("~y~🎫~n~~w~" .. mensagem)
        DrawNotification(false, true)
    end
end

-- ── Comando ativar/desativar ──────────────────
RegisterCommand(Config.Comando, function()
    notificacoesAtivas = not notificacoesAtivas

    if notificacoesAtivas then
        enviarNotificacao(T("notif_ativas"), "success", "bell")
    else
        enviarNotificacao(T("notif_desativas"), "error", "bell-slash")
    end
end, false)

-- ── Receber aviso ─────────────────────────────
RegisterNetEvent("support:aviso")
AddEventHandler("support:aviso", function(nome)
    if not notificacoesAtivas then return end
    enviarNotificacao(T("espera", nome), "warning", "headset")
end)
