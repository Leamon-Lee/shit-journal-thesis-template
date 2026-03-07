% SHIT 风格论文/文章类
% Contributor: Leamon Lee <leamonlee04@gmail.com> 2026.03.08 v1.0
%              Mr. Shit <mr.shit@example.com> 2026.03.08 v1.~
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{shittemplate}[2026/03/07 SHIT-style article/thesis class]

% 基于 ctexart 类以支持中文
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexart}}
\ProcessOptions\relax
\LoadClass[UTF8,a4paper,10pt]{ctexart}

% 基本宏包配置
\RequirePackage{ifxetex}
\ifxetex\else
  \ClassError{shittemplate}{This class must be compiled with XeLaTeX}%
    {Please switch your engine to XeLaTeX (xelatex).}%
\fi

\RequirePackage{unicode-math}
\RequirePackage{indentfirst} % 章节后首段也缩进
\RequirePackage{enumitem}    % 精细控制中英文列表缩进
\RequirePackage{url}         % 处理 URL 与 \DeclareUrlCommand
\RequirePackage[square,numbers]{natbib} % 配合 gbt7714-bibtex-style 的引用宏包
\RequirePackage{geometry}
\RequirePackage{graphicx}
\RequirePackage{xcolor}
\RequirePackage{titlesec}
\RequirePackage{fancyhdr}
% 不启用草稿水印

% 页面版式
\geometry{
  a4paper,
  top=2.5cm,
  bottom=3cm,
  left=2.5cm,
  right=2.5cm
}

\setlength{\parindent}{2em}
\setlength{\parskip}{0pt}
\linespread{1.0}
\setlength{\columnsep}{14pt}

% 西文字体：从本地 fonts/ 目录加载 Times New Roman
\setmainfont[
  Path       = fonts/,
  BoldFont   = timesbd.ttf,
  ItalicFont = timesi.ttf,
  BoldItalicFont = timesbi.ttf,
]{times.ttf}

% 数学字体：Cambria Math
\setmathfont[
  Path = fonts/
]{cambria-math.ttf}

% 西文无衬线字体：Arial
\setsansfont[
  Path     = fonts/,
  BoldFont = arialbd.ttf,
]{arial.ttf}

% 中文正文字体：方正仿宋
\setCJKmainfont[
  Path = fonts/,
  AutoFakeBold = 2.5, % 伪粗体以增强强调
  AutoFakeSlant = 0.3 % 伪斜体
]{FZFSK.TTF}

% 中文无衬线字体：方正黑体
\setCJKsansfont[
  Path = fonts/,
]{FZHTK.TTF}

% 中文等宽风格字体：方正楷体
\setCJKmonofont[
  Path = fonts/,
]{FZKTK.TTF}

% 颜色定义
\definecolor{shitPurple}{RGB}{120,0,150}
\definecolor{shitWatermark}{RGB}{230,180,190}

% 中文大标题字体：方正宋体（伪粗体）
\newCJKfontfamily\TitleSong[
  Path = fonts/,
  AutoFakeBold = 2.0
]{FZSSK.TTF}

% Note: watermark commands removed on user request (no watermark).

% 页眉页脚样式
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0.8pt}
\renewcommand{\footrulewidth}{0pt}
\setlength{\headheight}{46.65pt}

% SHIT word logo on the left, poop icon on the right
\fancyhead[L]{%
  \IfFileExists{figures/logs/word-logo.pdf}{%
    \includegraphics[height=1.4cm]{figures/logs/word-logo}%
  }{%
    \textbf{\Large SHIT}\\[-0.3ex]
    {\small Sciences Humanities\\Information Technology}%
  }%
}
\fancyhead[R]{%
  \vspace*{-0.5ex}%
  \IfFileExists{figures/logs/pic-logo.pdf}{%
    \includegraphics[height=1.4cm]{figures/logs/pic-logo}%
  }{}%
}


% 章节标题：罗马数字编号（如 I. INTRODUCTION）
\titleformat{\section}
  {\large\normalfont\bfseries}
  {\Roman{section}.}
  {0.8em}
  {}

\titleformat{\subsection}
  {\normalsize\normalfont\bfseries}
  {\thesubsection}
  {0.8em}
  {}

\titleformat{\subsubsection}
  {\small\normalfont\bfseries}
  {\thesubsubsection}
  {0.8em}
  {}

% 调整章节标题前后垂直间距
\titlespacing*{\section}{0pt}{1.5ex plus .5ex minus .5ex}{1.0ex plus .2ex}

% 列表环境缩进与行距设置
\setlist[itemize,enumerate]{leftmargin=1em,labelsep=0.5em,itemsep=0pt,parsep=0pt}

% 摘要、影响声明与关键词环境
\newenvironment{keywords}{%
  \par\vspace{1.0ex}%
  \noindent\textbf{\color{shitPurple}INDEX TERMS / 关键词 }%
  \ignorespaces
}{%
  \par\vspace{1.0ex}%
}

\renewenvironment{abstract}{%
  \par\vspace{0.5ex}% slightly tighter space above abstract
  \noindent\textbf{\color{shitPurple}ABSTRACT / 摘要 }%
  \ignorespaces
}{%
  \par\vspace{1.0ex}%
}

\newenvironment{impactstatement}{%
  \par\vspace{1.5ex}%
  \noindent\textbf{\color{shitPurple}IMPACT STATEMENT / 影响声明 }%
  \ignorespaces
}{%
  \par\vspace{1.0ex}%
}

% 题目与作者信息命令（内部使用 @ 宏）
\makeatletter
\newcommand{\titleen}[1]{\gdef\@titleen{#1}}
\newcommand{\titlecn}[1]{\gdef\@titlecn{#1}}
\newcommand{\authorlist}[1]{\gdef\@authorlist{#1}}
\newcommand{\affiliation}[1]{\gdef\@affiliation{#1}}
% 作者与单位详细脚注块（示例见 main.tex）
\newcommand{\authorfootnote}[1]{\gdef\@authorfootnote{#1}}

\titleen{}
\titlecn{}
\authorlist{}
\affiliation{}

% 自定义标题页排版
\renewcommand{\maketitle}{%
  \thispagestyle{fancy}%
  \begin{center}
    {\TitleSong\bfseries\fontsize{20}{26}\selectfont\color{shitPurple}\@titlecn\par}%
    \vspace{0.8cm}
    \ifx\@titleen\@empty\else
      {\large\bfseries \@titleen\par}%
      \vspace{0.8cm}
    \fi
    {\normalsize
      \renewcommand\and{\quad}%
      \@authorlist\par
    }%
    {\normalsize \@affiliation\par}
    \vspace{0.5cm}
  \end{center}
    {\small
    \begin{center}
      \@authorfootnote
    \end{center}
  }%
  \vspace{1cm}
}
\makeatother

% 致谢环境（可选）
\newcommand{\acknowledgmentname}{ACKNOWLEDGMENT / 致谢}
\newenvironment{acknowledgment}{%
  \section*{\acknowledgmentname}%
}{}

% 参考文献标题
\renewcommand{\refname}{REFERENCE / 参考文献}

% 参考文献条目：去掉悬挂缩进，使回行与序号左方括号对齐
\setlength{\bibindent}{0pt}
\setlength{\bibhang}{0pt}

% 类文件结束

