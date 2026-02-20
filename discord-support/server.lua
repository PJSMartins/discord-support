local QBCore = exports["qb-core"]:GetCoreObject()

-- Atalho para traduções
local function T(chave, ...)
    local locale = Locales[Config.Idioma] or Locales["pt"]
    local texto  = locale[chave] or chave
    return string.format(texto, ...)
end

SetHttpHandler(function(req, res)
    if req.path ~= "/notify" or req.method ~= "POST" then
        res.writeHead(404)
        res.send(json.encode({ error = "not found" }))
        return
    end

    req.setDataHandler(function(rawBody)
        local body = json.decode(rawBody)

        if not body then
            res.writeHead(400)
            res.send(json.encode({ error = "bad request" }))
            return
        end

        if tostring(body.key or "") ~= Config.Chave then
            res.writeHead(403)
            res.send(json.encode({ error = "unauthorized" }))
            return
        end

        local nome = body.playerName or "Desconhecido"
        AvisarStaffs(nome)

        res.writeHead(200)
        res.send(json.encode({ ok = true }))
    end)
end)

function IsStaff(src)
    if Config.DebugTodos then return true end
    for _, perm in ipairs(Config.StaffGroups) do
        if QBCore.Functions.HasPermission(src, perm) then
            return true
        end
    end
    return false
end

function AvisarStaffs(nome)
    local total = 0
    for _, id in ipairs(GetPlayers()) do
        local src = tonumber(id)
        if IsStaff(src) then
            TriggerClientEvent("support:aviso", src, nome)
            total = total + 1
        end
    end
    print(("^3[Suporte] " .. T("print_espera", nome, total) .. "^7"))
end
