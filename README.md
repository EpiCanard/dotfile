# dotfile

Configuration personnelle de Neovim et de Zsh, avec un environnement de développement
orienté Scala/Java, des outils Git et un thème clair/sombre Oneduck.
Le dépôt contient aussi une configuration StyLua et des keymaps de claviers QMK
Ergodox et Sweep dans [`keymap/`](keymap/).

## Installation

### Prérequis

Installer les outils suivants et les rendre accessibles dans le `PATH` :

| Usage | Dépendances |
| --- | --- |
| Configuration de base | Neovim **0.12+**, Git, Zsh disponible dans `/bin/zsh`, StyLua |
| Analyse syntaxique Treesitter | `tree-sitter` CLI **0.26.1+** (via le gestionnaire de paquets, pas npm), un compilateur C, `curl`, `tar` |
| Recherche et sélecteurs | `ripgrep` (`rg`), `fzf`, `make` et un compilateur C pour l'extension native de Telescope |
| Historique Smart Open | Bibliothèque partagée SQLite (`libsqlite3`) |
| Installation des serveurs avec Mason | `curl` ou `wget`, `unzip`, `tar`, `gzip` |
| Presse-papiers système | Un fournisseur compatible avec Neovim : `wl-copy` / `wl-paste` sous Wayland, `xclip` sous X11, par exemple |

Selon les langages et intégrations utilisés :

| Usage | Dépendances complémentaires |
| --- | --- |
| Java | Un JDK compatible avec la version installée de JDT LS et Python 3 pour son lanceur ; définir `JAVA_HOME` si nécessaire |
| Scala / Metals | Un JDK compatible, Coursier (`cs` ou `coursier`) et les outils du projet, comme sbt ou Bloop |
| JavaScript / TypeScript, HTML, SQL, Pyright | Node.js et npm |
| Robot Framework | Python 3, `venv`, pip et les bibliothèques Robot du projet |
| GitHub avec Atlas | GitHub CLI (`gh`), authentifié avec `gh auth login` |
| Alias GitLab | GitLab CLI (`glab`), authentifié avec `glab auth login` |
| Alias de sessions terminal | tmux et tmuxinator |
| Icônes et apparence | Une Nerd Font ; `dark-notify` sur macOS pour suivre le thème système |

Un accès réseau est nécessaire au premier lancement pour télécharger les plugins,
les parseurs Treesitter, les serveurs de langage et le moteur Sqmeow.

### Installer les configurations

```sh
git clone https://github.com/EpiCanard/dotfile.git
cd dotfile
./setup.sh
```

Le script vérifie la présence de `nvim` et `stylua`, puis crée deux liens symboliques :

| Source dans le dépôt | Destination |
| --- | --- |
| `nvim/` | `${XDG_CONFIG_HOME:-$HOME/.config}/nvim` |
| `stylua/` | `${XDG_CONFIG_HOME:-$HOME/.config}/stylua` |

Le script peut être relancé et appelé depuis n'importe quel répertoire. Si une
destination existe déjà et pointe ailleurs, il la conserve et signale un conflit :
déplacer ou sauvegarder cette configuration avant de relancer le script.
Conserver le dépôt à son emplacement pour que les liens restent valides.

### Activer les alias Zsh

Ajouter ces lignes à `~/.zshrc`, en adaptant le chemin du dépôt et celui des projets :

```zsh
export BASE_PROJECTS="$HOME/Projects"
source "/chemin/vers/dotfile/zsh/alias.sh"
```

Puis recharger le shell :

```zsh
source ~/.zshrc
```

`BASE_PROJECTS` est partagé entre les fonctions Zsh et le sélecteur de projets
Neovim. Sans valeur explicite, il vaut `$HOME/Projects`.

### Premier lancement de Neovim

Lancer `nvim` : lazy.nvim est téléchargé automatiquement et installe les plugins
manquants. Exécuter ensuite `:Lazy restore` pour utiliser les révisions enregistrées
dans [`nvim/lazy-lock.json`](nvim/lazy-lock.json), puis redémarrer Neovim une fois
les téléchargements et compilations terminés.

Les parseurs Treesitter configurés sont installés automatiquement. Mason installe
les serveurs `lua_ls`, `jdtls`, `pyright`, `robotframework_ls`, `html`, `ts_ls`,
`eslint` et `sqlls`. Metals est téléchargé séparément via nvim-metals et Coursier
à l'ouverture d'un fichier Scala/sbt. Les runtimes système du tableau ci-dessus
restent à installer séparément.

Pour vérifier l'installation, utiliser `:checkhealth`, `:checkhealth mason` et
`:checkhealth vim.lsp`. `:Mason` affiche les serveurs installés et `:Lazy` l'état
des plugins. Pour mettre volontairement les plugins à jour, utiliser `:Lazy update`.

### Personnaliser la machine

Depuis la racine du dépôt, copier le modèle de configuration locale :

```sh
cp nvim/lua/local.lua.example nvim/lua/local.lua
```

`local.lua` est ignoré par Git et chargé après les options par défaut, avant
l'initialisation des plugins. Il permet notamment d'ajuster les options de l'éditeur :

```lua
vim.opt.colorcolumn = "100"
vim.g.scalafix_config = vim.fn.expand("~/config/scalafix.conf")
```

Les variables suivantes peuvent être exportées dans `~/.zshrc`, avant de lancer Neovim :

| Variable | Rôle | Valeur par défaut |
| --- | --- | --- |
| `BASE_PROJECTS` | Racine des projets pour Telescope et les fonctions Zsh de traitement par lots. | `$HOME/Projects` |
| `SCALAFIX_CONFIG` | Fichier Scalafix pour l'organisation des imports avec Metals. | Répertoire de configuration Neovim + `/scalafix.conf` |
| `NOTES_PATH` | Dossier ouvert par la commande `:Note`. | `$HOME/.notes/` |
| `JIRA_URL` | URL de base Jira pour ouvrir les tickets avec `<leader>J`. | Aucune |

`vim.g.scalafix_config` prend la priorité sur `SCALAFIX_CONFIG`.
`vim.g.jira_url` peut aussi définir l'URL Jira si `JIRA_URL` est vide ou absent.
La touche `<leader>` correspond à **Espace**.

### Hook Git du dépôt (facultatif)

```sh
git config --local core.hooksPath .githooks
```

Le hook impose un sujet de commit au format `[dossier] Message` avec une majuscule
au début du message, par exemple `[nvim] Update plugins`. Utiliser `[root]` pour
les fichiers à la racine du dépôt.

## Plugins Neovim

Les plugins sont déclarés dans [`nvim/lua/plugins/`](nvim/lua/plugins/).
Le tableau inclut le gestionnaire et les dépendances ; `dark-notify` est activé
uniquement sur macOS.

| Plugin | Rôle |
| --- | --- |
| [atlas.nvim](https://github.com/emrearmagan/atlas.nvim) | Consulte les pull requests et issues GitHub et permet de faire des revues. |
| [auto-hlsearch.nvim](https://github.com/asiryk/auto-hlsearch.nvim) | Gère automatiquement la surbrillance des résultats de recherche. |
| [auto-save.nvim](https://github.com/okuuva/auto-save.nvim) | Sauvegarde automatiquement les fichiers, notamment en quittant le mode insertion. |
| [blink.cmp](https://github.com/saghen/blink.cmp) | Fournit la complétion LSP, les chemins, les mots du buffer, les snippets LuaSnip et les signatures de fonctions. |
| [clangd_extensions.nvim](https://github.com/p00f/clangd_extensions.nvim) | Ajoute des fonctionnalités à l'intégration du serveur C/C++ clangd. |
| [coerce.nvim](https://github.com/gregorias/coerce.nvim) | Convertit la casse des identifiants, comme camelCase ou snake_case. |
| [Comment.nvim](https://github.com/numToStr/Comment.nvim) | Commente et décommente le code selon le langage. |
| [dark-notify](https://github.com/cormacrelf/dark-notify) | Adapte le thème Neovim à l'apparence claire ou sombre de macOS. |
| [diffview.nvim](https://github.com/sindrets/diffview.nvim) | Affiche les différences Git et l'historique des fichiers. |
| [dressing.nvim](https://github.com/stevearc/dressing.nvim) | Améliore les interfaces de saisie et de sélection de Neovim. |
| [gitmoji.nvim](https://github.com/Dynge/gitmoji.nvim) | Propose des gitmojis lors de la rédaction des commits. |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Affiche les modifications Git dans la marge et permet d'agir sur les hunks. |
| [glance.nvim](https://github.com/DNLHC/glance.nvim) | Prévisualise les définitions et références LSP dans une fenêtre dédiée. |
| [hop.nvim](https://github.com/smoka7/hop.nvim) | Saute rapidement vers une position du texte à l'aide de repères. |
| [hydra.nvim](https://github.com/nvimtools/hydra.nvim) | Regroupe des raccourcis dans des modes temporaires avec une aide à l'écran. |
| [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) | Affiche les guides d'indentation et la portée du bloc courant. |
| [lazy.nvim](https://github.com/folke/lazy.nvim) | Installe, charge et met à jour les plugins. |
| [lsp-status.nvim](https://github.com/wbthomason/lsp-status.nvim) | Expose l'état et la progression des serveurs LSP pour la barre de statut. |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Affiche une barre de statut avec les informations de l'éditeur. |
| [LuaSnip](https://github.com/L3MON4D3/LuaSnip) | Développe des snippets de code avec des champs à compléter. |
| [marks.nvim](https://github.com/chentoast/marks.nvim) | Facilite l'affichage et la gestion des marques Vim. |
| [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) | Relie Mason aux configurations LSP et installe les serveurs déclarés. |
| [mason.nvim](https://github.com/williamboman/mason.nvim) | Gère l'installation des outils de développement externes à Neovim. |
| [mini.icons](https://github.com/nvim-mini/mini.icons) | Fournit des icônes, notamment pour le rendu Markdown. |
| [mini.map](https://github.com/nvim-mini/mini.map) | Affiche une minimap du fichier courant. |
| [multiple-cursors.nvim](https://github.com/brenton-leighton/multiple-cursors.nvim) | Permet d'éditer le texte avec plusieurs curseurs. |
| [nap.nvim](https://github.com/liangxianzhe/nap.nvim) | Facilite les déplacements répétés entre diagnostics, changements et autres éléments. |
| [neogit](https://github.com/NeogitOrg/neogit) | Fournit une interface Git pour les commits, branches et opérations courantes. |
| [nui.nvim](https://github.com/MunifTanjim/nui.nvim) | Fournit les composants d'interface utilisés par Sqmeow. |
| [nvim-autopairs](https://github.com/windwp/nvim-autopairs) | Ferme automatiquement les parenthèses, crochets et guillemets. |
| [nvim-bqf](https://github.com/kevinhwang91/nvim-bqf) | Améliore la liste quickfix avec une prévisualisation et des sélections. |
| [nvim-colorizer.lua](https://github.com/norcalli/nvim-colorizer.lua) | Prévisualise les codes couleur directement dans le texte. |
| [nvim-dap](https://github.com/mfussenegger/nvim-dap) | Intègre le débogage via le protocole DAP. |
| [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui) | Affiche les panneaux de variables, piles d'appels et points d'arrêt du débogueur. |
| [nvim-dap-virtual-text](https://github.com/theHamsta/nvim-dap-virtual-text) | Affiche les valeurs du débogueur à côté du code. |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | Fournit les configurations des serveurs de langage. |
| [nvim-metals](https://github.com/scalameta/nvim-metals) | Intègre Metals pour le développement Scala et sbt. |
| [nvim-navic](https://github.com/SmiteshP/nvim-navic) | Affiche le chemin des symboles jusqu'à la position du curseur. |
| [nvim-neoclip.lua](https://github.com/AckslD/nvim-neoclip.lua) | Conserve l'historique des copies pour le retrouver avec Telescope. |
| [nvim-nio](https://github.com/nvim-neotest/nvim-nio) | Fournit les utilitaires asynchrones utilisés par l'interface de débogage. |
| [nvim-surround](https://github.com/kylechui/nvim-surround) | Ajoute, remplace ou supprime les délimiteurs autour du texte. |
| [nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua) | Affiche un explorateur de fichiers en arborescence. |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Installe les parseurs pour la coloration et l'analyse syntaxique du code. |
| [nvim-treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects) | Ajoute des sélections et échanges basés sur les fonctions, classes et paramètres. |
| [nvim-various-textobjs](https://github.com/chrisgrieser/nvim-various-textobjs) | Ajoute des objets de texte pour sélectionner et modifier des blocs courants. |
| [nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons) | Fournit des icônes de fichiers aux interfaces Neovim. |
| [plenary.nvim](https://github.com/nvim-lua/plenary.nvim) | Fournit des utilitaires Lua partagés par plusieurs plugins. |
| [render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim) | Améliore l'affichage des titres, listes, cases à cocher et blocs Markdown. |
| [smart-open.nvim](https://github.com/danielfalk/smart-open.nvim) | Classe les fichiers recherchés selon leur fréquence et leur historique d'ouverture. |
| [sqlite.lua](https://github.com/kkharji/sqlite.lua) | Permet aux plugins Lua d'accéder à SQLite. |
| [sqmeow.nvim](https://github.com/2giosangmitom/sqmeow.nvim) | Fournit une interface pour explorer les bases de données et exécuter du SQL. |
| [stylua-nvim](https://github.com/ckipp01/stylua-nvim) | Formate le code Lua avec StyLua. |
| [tabby.nvim](https://github.com/nanozuki/tabby.nvim) | Personnalise l'affichage des onglets. |
| [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim) | Accélère le filtrage de Telescope avec un moteur fzf natif. |
| [telescope-project.nvim](https://github.com/nvim-telescope/telescope-project.nvim) | Permet de sélectionner et d'ouvrir un projet dans Telescope. |
| [telescope-symbols.nvim](https://github.com/nvim-telescope/telescope-symbols.nvim) | Ajoute un sélecteur de symboles et d'émojis à Telescope. |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Recherche des fichiers, du texte et des éléments de l'éditeur avec prévisualisation. |
| [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) | Ouvre et masque des terminaux intégrés. |
| [treesitter-parser-registry](https://github.com/neovim-treesitter/treesitter-parser-registry) | Fournit le registre des parseurs utilisés par nvim-treesitter. |
| [treewalker.nvim](https://github.com/aaronik/treewalker.nvim) | Navigue entre les nœuds de l'arbre syntaxique du code. |
| [trouble.nvim](https://github.com/folke/trouble.nvim) | Regroupe les diagnostics et résultats de navigation dans une liste dédiée. |
| [vim-expand-region](https://github.com/terryma/vim-expand-region) | Agrandit ou réduit progressivement la sélection. |
| [vim-smoothie](https://github.com/psliwka/vim-smoothie) | Anime le défilement des pages. |
| [vim-test](https://github.com/vim-test/vim-test) | Lance les tests du projet depuis l'éditeur. |

## Alias et fonctions Zsh

Définis dans [`zsh/alias.sh`](zsh/alias.sh). Les commandes avec sélection interactive
utilisent `fzf` ; certaines utilisent également `rg`. Les alias Bloop et GitLab ne
sont définis que si `bloop` ou `glab` est disponible au chargement du fichier.

### Shell et fichiers

| Alias | Description |
| --- | --- |
| `sc` | Recharge `~/.zshrc`. |
| `zsc` | Édite `~/.zshrc` avec Neovim puis le recharge si l'éditeur termine sans erreur. |
| `al` | Sélectionne un alias avec fzf et le place sur la ligne de commande. |
| `..` | Remonte d'un répertoire. |
| `...` | Remonte de deux répertoires. |
| `l` | Liste les fichiers avec `ls`. |
| `la` | Liste aussi les fichiers cachés. |
| `ll` | Liste les fichiers au format détaillé. |
| `lr` | Liste récursivement les sous-répertoires. |

### tmux et Neovim

| Alias / fonction | Description |
| --- | --- |
| `mux` | Lance tmuxinator. |
| `tl` | Liste les sessions tmux. |
| `tn` | Crée une session tmux nommée d'après le répertoire courant, avec une fenêtre Neovim. |
| `t [session]` (fonction) | Crée ou rejoint la session tmux indiquée ; sans argument, lance tmux. |
| `n [arguments…]` (fonction) | Lance Neovim et, sous tmux, nomme la fenêtre `[N] <répertoire>` pendant l'exécution. |
| `nn` | Ouvre Neovim directement sur Neogit. |
| `nf` | Ouvre Neovim avec la recherche de fichiers Telescope. |
| `ng` | Ouvre Neovim avec la recherche de texte Telescope. |

### Bloop

| Alias | Description |
| --- | --- |
| `blr` | Sélectionne un projet hors tests et le lance avec Bloop. |
| `blt` | Sélectionne un ou plusieurs projets de tests et les exécute. |
| `bll` | Sélectionne un projet et lance son édition de liens avec `bloop link -p`. |
| `blc` | Sélectionne des projets et les compile avec `--cascade`. |

### Git

| Alias / fonction | Description |
| --- | --- |
| `g` | Lance Git. |
| `ga` | Ajoute des fichiers à l'index. |
| `gb` | Liste ou gère les branches. |
| `gbd` | Sélectionne et supprime des branches avec `git branch -d`, en excluant les noms contenant `master` ou `next`. |
| `gbD` | Même sélection que `gbd`, avec suppression forcée (`-D`). |
| `gmm` | Crée un commit avec le message fourni. |
| `grh [cible]` (fonction) | Exécute `fetch`, puis un reset dur vers la cible ou, par défaut, `origin/<branche courante>`, en supprimant les modifications suivies locales. |
| `gc` | Change de branche ou restaure des fichiers avec `git checkout`. |
| `gcb` | Crée une branche et s'y positionne. |
| `gcp` | Applique un commit avec `cherry-pick`. |
| `gcr` (fonction) | Sélectionne des fichiers modifiés et abandonne leurs changements non indexés avec `git restore`. |
| `gf` | Récupère les références distantes avec `fetch`. |
| `gp` | Récupère et intègre les changements avec `pull`. |
| `gl` | Affiche les 30 derniers commits avec auteur, dates et références. |
| `gL` | Affiche le même historique sans limite de nombre de commits. |
| `grb` | Lance un rebase. |
| `grbi` | Lance un rebase interactif. |
| `gsta` | Met les modifications de côté avec `stash push`. |
| `gstaa` | Applique un stash en le conservant. |
| `gstc` | Supprime tous les stashs. |
| `gstd` | Supprime un stash. |
| `gstl` | Liste les stashs. |
| `gstp` | Applique un stash puis le retire de la liste si l'application réussit. |
| `gsts` | Affiche le résumé textuel d'un stash. |
| `gss` | Affiche l'état Git au format court. |
| `gst` | Affiche l'état Git complet. |
| `gsh` | Affiche un objet Git, par exemple un commit. |
| `gP` | Pousse les commits avec `push`. |
| `gpo` | Pousse les commits vers `origin`. |
| `gpsk` | Pousse avec l'option `ci.skip` pour ignorer le pipeline lorsque le serveur la prend en charge. |
| `gpf` | Force le push avec la protection `--force-with-lease`. |
| `gpf!` | Force le push avec `--force`. |
| `gr` | Se place à la racine du dépôt courant. |
| `gup` | Définit `origin/<branche courante>` comme branche de suivi. |
| `gas` | Ajoute toutes les modifications à l'index puis les met dans un stash. |
| `gmf` | Fusionne uniquement si une avance rapide est possible (`--ff-only`). |

### Fonctions Git sur les projets

Les fonctions de traitement par lots parcourent les dépôts situés directement sous
`BASE_PROJECTS`, repérés par leur entrée `.git`.

| Fonction | Description |
| --- | --- |
| `bsync` | Lance `git pull` sur tous ces dépôts, avec jusqu'à dix traitements en parallèle. |
| `btmm` | Dans le dépôt courant, met les modifications en stash, passe sur `master` (ou `main` à défaut), puis lance `pull`. |
| `prupru` | Liste les branches locales de ces dépôts, sauf `master`, `main` et `develop`. |
| `pruneTags` | Lance `fetch --prune --prune-tags` sur ces dépôts, avec jusqu'à dix traitements en parallèle. |
| `_dotfile_project_repositories` | Fonction interne qui fournit la liste des dépôts aux fonctions de traitement par lots. |

### GitLab

| Alias | Description |
| --- | --- |
| `gml` | Liste les merge requests. |
| `gmv` | Affiche une merge request. |
| `gmV` | Sélectionne une merge request avec fzf puis l'affiche. |
| `gmc` | Affiche une merge request avec ses commentaires. |
| `gcv` | Ouvre le visualiseur de pipeline CI de glab. |
| `gps` | Suit l'état du pipeline en direct. |
| `gro` | Ouvre le dépôt GitLab dans le navigateur. |
