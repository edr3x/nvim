# 🚀 Neovim Config

## 🧠 Minimum Supported Version

> **Neovim `v0.11` or later is required**

---

## HomePage

![Greeting](https://user-images.githubusercontent.com/45848083/233694894-7c6370d0-8e57-4bbb-ace5-f626738230a0.png)

## FileTree

![nvim-tree](https://user-images.githubusercontent.com/45848083/233694988-5251c531-beca-4a8d-9a2c-ba723e0e6443.png)

## Code Environment

![environment](https://user-images.githubusercontent.com/45848083/233695048-2e9889af-210b-4a4e-90c6-cc4528322a43.png)

## Picker

![picker](https://user-images.githubusercontent.com/45848083/233695134-5abbd833-74a2-4d21-8d03-5618c7784643.png)

## Terminal
![terminal](https://user-images.githubusercontent.com/45848083/233695183-b03c4d6c-8830-449a-8b8c-8c4ba9071c25.png)

## Requirements

```bash
sudo pacman -S wget tar curl unzip git nodejs npm gzip xclip 
```

- For Markdown preview we need `deno` and `webkit2gtk`

```bash
sudo pacman -S deno webkit2gtk
```

> Every plugin used can be found in `lua/plugins/`

## 🛠️ Install LSP Client Configs

To fetch and enable an LSP client configuration from the [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) repository, use the included helper script.

> NOTE:
>
> `curl`, `jq`, and `fzf` is required for this step

### 📥 Steps

1. Make the script executable:

```bash
chmod +x getlsp
```

2. Run the script

```bash
./getlsp
```

3. You’ll see a fuzzy-search menu (powered by fzf) listing available LSP client configs.

4. Select one — e.g. clangd.lua — and the script will:
    - Download the file from the official nvim-lspconfig GitHub repo.
    - Save it locally as `clangd.lua` in `lsp/` directory .


**🧠 This allows you to install individual LSP configurations quickly, without cloning or browsing GitHub manually.**
