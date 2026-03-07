## shit-thesis-template / SHIT \LaTeX 模板

这是一个面向 **S.H.I.T 期刊 / 学位论文** 的中文友好 LaTeX 模板工程，通过类文件 `shittemplate.cls` 提供统一的版面、字体与参考文献配置，让你专注写内容，而不是和格式死磕。

示例文档为搞笑风格，但排版逻辑是严肃认真的，你可以在此基础上直接改成自己的正式论文。

---

## 特性一览

- **XeLaTeX 专用**：基于 `ctexart`，强制使用 `xelatex`，方便调用本地中文/英文字体。
- **双栏正文 + 通栏标题区**：首页标题、摘要等通栏展示，正文自动双栏排版。
- **完整的前置环境**：内置 `abstract`、`impactstatement`（影响声明）、`keywords`、`acknowledgment`（致谢）等环境。
- **国标参考文献**：集成 `gbt7714-bibtex-style`，支持 GB/T 7714-2015 数字型格式。
- **统一字体方案**：推荐将字体放在 `fonts/` 目录，保证不同机器上排版一致。
- **语义化命令接口**：`\\titlecn`、`\\titleen`、`\\authorlist`、`\\affiliation`、`\\authorfootnote` 等命令统一管理元信息。

---

## 目录结构

典型项目结构（与当前仓库基本一致）：

```text
shit-thesis-template/
  main.tex               # 你的主论文入口
  shittemplate.cls       # 模板类文件
  guide.tex              # 详细使用说明示例（强烈建议先读）
  fonts/                 # 建议放本项目专用字体
  figures/
    logs/
      word-logo.pdf      # 页眉左侧 word logo（可替换）
      pic-logo.pdf       # 页眉右侧图形 logo（可替换）
  frontmatter/
    abstract.tex         # 摘要 / 影响声明 / 关键词等
    acknowledgement.tex  # 致谢
  chapters/
    01_introduction.tex
    02_methodology.tex
    03_conclusion.tex
  references.bib         # BibTeX 文献数据库
  gbt7714-bibtex-style/  # GB/T 7714 BibTeX 样式
```

---

## 环境要求

- **编译引擎**：必须使用 `xelatex`（`pdflatex`、`lualatex` 均不支持，会直接报错）。
- **TeX 发行版**：推荐 TeX Live 2021 及以上 / MiKTeX 最新版。
- **BibTeX**：用于生成参考文献（配合 `gbt7714-bibtex-style`）。
- **操作系统**：Windows / macOS / Linux 均可，只要支持 XeLaTeX。

---

## 快速开始

1. **准备字体（推荐）**
  - 在项目根目录创建 `fonts/` 文件夹，将所需字体放入，例如：
    - Times New Roman：`times.ttf`, `timesbd.ttf`, `timesi.ttf`, `timesbi.ttf`
    - Arial：`arial.ttf`, `arialbd.ttf`
    - 中文：方正仿宋 `FZFSK.TTF`、方正黑体 `FZHTK.TTF`、方正楷体 `FZKTK.TTF`、标题宋体 `FZSSK.TTF`
  - 如果你使用其他字体或文件名不同，可以修改 `shittemplate.cls` 中的 `\\setmainfont` / `\\setCJKmainfont` 设置。
2. **修改主文档信息**
  - 打开 `main.tex`，根据自己的论文修改：
    - `\\titlecn{...}`：中文题目（必填）
    - `\\titleen{...}`：英文题目（可选）
    - `\\authorlist{...}`：作者列表，使用 `\\and` 分隔
    - `\\affiliation{...}`：作者单位
    - `\\authorfootnote{...}`：通讯作者、资助信息等脚注
3. **编辑内容章节**
  - 在 `frontmatter/abstract.tex` 中填写摘要、影响声明和关键词等内容。
  - 在 `chapters/01_introduction.tex`、`02_methodology.tex`、`03_conclusion.tex` 中撰写正文。
  - 如需增加章节，可在 `chapters/` 新建 `XX_something.tex`，并在 `main.tex` 里用 `\\input{chapters/XX_something}` 引入。
4. **配置参考文献**
  - 在 `references.bib` 中维护文献条目。
  - 保持 `main.tex` 文末类似写法：
    ```tex
    \\bibliographystyle{gbt7714-bibtex-style/gbt7714-numerical}
    \\bibliography{references}
    ```
  - 文中引用可以使用：
    - `\\cite{key}`：数字引用
    - `\\citet{key}`：作者-年份风格句中引用
    - `\\citep{key}`：括号引用
5. **编译命令示例**
  在项目根目录执行：
   若使用 `latexmk`，可以：

---

## 主要命令速查

- **文档类**：`\\documentclass[a4paper,10pt]{shittemplate}`
- **标题与作者相关（导言区）**
  - `\\titlecn{中文题目}`
  - `\\titleen{English Title}`
  - `\\authorlist{作者 A$^{1}$ \\and 作者 B$^{2}$}`
  - `\\affiliation{某某大学 某某学院}`
  - `\\authorfootnote{作者介绍 / 通讯方式 / 资助信息...}`
- **前置环境（通常位于 `\\twocolumn[ ... ]` 内）**
  - `abstract`：`\\begin{abstract} ... \\end{abstract}`
  - `impactstatement`：`\\begin{impactstatement} ... \\end{impactstatement}`
  - `keywords`：`\\begin{keywords} 关键词1; 关键词2; ... \\end{keywords}`
- **致谢**
  - 在 `frontmatter/acknowledgement.tex` 中使用：
    ```tex
    \\begin{acknowledgment}
    在这里写致谢内容……
    \\end{acknowledgment}
    ```

---

## 常见问题 (FAQ)

- **Q：编译时报字体或编码错误怎么办？**  
**A**：确认使用的是 `xelatex`；检查 `fonts/` 目录中字体文件是否存在且命名匹配；必要时修改 `shittemplate.cls` 中的字体设置为你系统已有字体。
- **Q：可以改成单栏排版吗？**  
**A**：模板默认为双栏以符合期刊/会议风格，如确有需要，可在导言区尝试 `\\onecolumn` 或复制 `shittemplate.cls` 自行魔改（不推荐新手修改类文件）。
- **Q：Logo 想换成自己学校/实验室的怎么办？**  
**A**：替换 `figures/logs/word-logo.pdf` 与 `figures/logs/pic-logo.pdf` 为你自己的矢量 PDF 即可，文件名保持不变。

