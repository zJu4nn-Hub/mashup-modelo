# Modelo de mashup pro zJu4nn Hub

[English below](#english)

Este é o ponto de partida pra fazer um **mashup** (dois jogos de verdade juntos) que qualquer pessoa instala e joga
com 1 clique pela aba **Mashups** do [zJu4nn Hub](https://zju4nnhub.com/mashups).

## Passo a passo

1. **Copie este modelo**: botão verde **Use this template → Create a new repository** (deixe **público**).
2. **Edite o `hub.json`**: nome, versão, jogos e o que o Hub faz sozinho. As regras estão logo abaixo.
3. **Coloque o seu código** e diga no `build.ps1` como compilar. Tudo que for no `.zip` sai da pasta `dist/`.
4. **Compile no GitHub**: aba **Actions → build → Run workflow**. No fim aparece uma **release** com o `.zip`.
5. **Teste no seu Hub** (só você vê):
   - em https://zju4nnhub.com/mashups/enviar, entre com o Discord e, em **🧪 Testar no seu Hub**, libere o link deste repositório;
   - no Hub (mesmo Discord), ligue **Configurações → Geral → Modo criador de mashups**;
   - aba Mashups → **🧪 Testar meu mashup** → cole o link.
6. **Ponha 1 a 10 prints reais** na pasta `hub/` e preencha o `hub/ENVIO.md`.
7. **Envie** em https://zju4nnhub.com/mashups/enviar. O zJu4nn testa e te avisa por DM.

Não sabe programar? Em https://zju4nnhub.com/mashups/criar você escolhe os jogos e recebe um pedido pronto pra uma
IA (Claude Code, Codex, Cursor) construir com você.

## O `hub.json`

| campo | o que é |
|---|---|
| `formato` | sempre `2` |
| `nome`, `versao` | nome do mashup (até 60 letras) e versão (`0.1.0`) |
| `pacote` | nome do `.zip` da release; o `*` vira a versão |
| `jogos` | 1 a 3 jogos. Jogo que o Hub já conhece vai pelo nome curto (`"peak"`, `"elden-ring"`, `"minecraft"`…); jogo novo vai como `{"slug","nome","appid","exe"}` |
| `principal` | o jogo que o Hub abre e vigia |
| `minecraft` | se tiver Minecraft: `versao` (26.3, 1.21.1, 1.21.4 ou 1.21.11), `fabric` e `memoriaMB` |
| `bases` | o que o Hub instala sozinho: `bepinex`, `me3`, `skse`, `f4se`, `address-library`, `xnvse`, `red4ext`, `redscript`, `archivexl`, `codeware`, `asi-loader`, `e4mc`. **Não ponha no seu `.zip`.** O Fabric API do Minecraft também vem sozinho |
| `mapear` | pasta do `.zip` → destino: `{pasta}` (pasta do mashup), `{mods}` (mods do Minecraft) ou `{jogo:<slug>}/…` (dentro do jogo; o Hub tira ao desinstalar) |
| `iniciar` | opcional: os passos de abrir. Sem ele: Minecraft (se tiver) → espera → jogo principal pela Steam. SKSE/F4SE/xNVSE abrem pelo lançador e o Elden Ring pelo me3 (perfil `mashup.me3` na raiz do `.zip`), sozinhos |
| `vigiar`, `backupSave` | opcionais: o `.exe` que diz que o jogo está aberto; a pasta dos saves pra copiar antes de jogar |
| `textos` | descrição, "como funciona" e avisos em `pt` e `en` |
| `creditos` | obras de outras pessoas que você usou (`nome`, `licenca`, `url`). O seu repositório entra sozinho |

Passos de `iniciar`: `{"tipo":"steam","jogo":"<slug>","args":[]}`, `{"tipo":"exe","arquivo":"{pasta}/x.exe","args":[],"env":{}}`,
`{"tipo":"prism","env":{}}`, `{"tipo":"esperarProcesso","nome":"x.exe","seg":120}`,
`{"tipo":"esperarLog","arquivo":"{instancia}/logs/latest.log","contem":"texto","seg":300}`,
`{"tipo":"esperarPorta","porta":25565,"seg":60}`, `{"tipo":"esperar","seg":3}`.

## Regras

- Nada dos jogos vai no repositório nem no `.zip`: o mashup lê os arquivos da cópia instalada da própria pessoa.
- Só jogos de PC (Windows) que a pessoa tem. Sem emulador, ROM baixada ou cópia pirata.
- Nunca burle anti-cheat: jogo online com anti-cheat só entra como companheiro, sem ser modificado.
- Downloads só do GitHub e do Modrinth. Nunca coloque senha, chave ou token no repositório.

---

## English

The starting point for a **mashup** (two real games together) that anyone can install and play in one click from
zJu4nn Hub's **Mashups** tab.

1. **Copy this template**: green **Use this template → Create a new repository** button (keep it **public**).
2. **Edit `hub.json`**: name, version, games and what the Hub sets up by itself (table above; field names stay in
   Portuguese).
3. **Add your code** and tell `build.ps1` how to build it. Everything in the `.zip` comes from the `dist/` folder.
4. **Build on GitHub**: **Actions → build → Run workflow**. A **release** with the `.zip` shows up at the end.
5. **Test it in your Hub** (only you see it): allow this repository's link at https://zju4nnhub.com/mashups/enviar?lang=en
   (**🧪 Test it in your Hub**, signed in with Discord); in the Hub (same Discord) turn on **Settings → General →
   Mashup creator mode**; then Mashups tab → **🧪 Test my mashup** → paste the link.
6. **Add 1 to 10 real screenshots** to `hub/` and fill in `hub/ENVIO.md`.
7. **Submit** at https://zju4nnhub.com/mashups/enviar?lang=en. zJu4nn tests it and DMs you.

Can't code? At https://zju4nnhub.com/mashups/criar?lang=en you pick the games and get a ready prompt for an AI
(Claude Code, Codex, Cursor) to build it with you.

Rules: nothing from the games goes into the repository or the `.zip` (the mashup reads the player's own installed
copy); PC (Windows) games the player owns only, no emulators, downloaded ROMs or pirated copies; never get around an
anti-cheat; downloads only from GitHub and Modrinth; never put passwords, keys or tokens in the repository.

Licensed under MIT (see `LICENSE`).
