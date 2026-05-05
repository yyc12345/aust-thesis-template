% 模板标识，提供基础框架
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{austthesis}[2026/04/26 AUST Thesis Template]
% 基于ctexart
\LoadClass[a4paper]{ctexart} % 基于ctexart，A4纸

% 加载必备宏包
\RequirePackage{amsmath, amssymb, amsthm} % 数学支持
\RequirePackage{graphicx}     % 插图
\RequirePackage{caption}      % 控制图表标题格式
\RequirePackage{hyperref}     % 生成超链接和书签

% region: 页面设置
% 设置页边距，由于Word在左侧有1cm装订线，所以左侧加1cm
\RequirePackage{geometry}
\geometry{left=3.5cm,right=2.5cm,top=3cm,bottom=2.5cm}
% endregion

% region: 正文中文和西文字体以及字号设置
% 设置西文字体
\usepackage{fontspec}
\setmainfont{Times New Roman}
% 设置中文字体
\songti{}
% 设置正文字号为小四
\zihao{-4}
% endregion

% region: 页眉页脚
\RequirePackage{fancyhdr}
% 使用复杂页眉页脚样式，并清空样式内容
\pagestyle{fancy}
\fancyhf{}

% 页眉边距为1.6cm，由于实际页眉边距是`2.5cm + voffset`，所以voffset设置为-0.9cm（-9mm）
\setlength{\voffset}{-9mm}
% 页眉内容
\fancyhead[C]{\zihao{5} \songti \leftmark}
% 页眉线宽
\renewcommand{\headrulewidth}{0.1mm}

% 页脚边距为1.5cm，由于实际页脚边距是`页面底边距 - footskip`，所以footskip设置为1cm（10mm）
\setlength{\footskip}{10mm}
% 页脚是居中的，两个连字符中间夹页码的样式。五号宋体。
\fancyfoot[C]{\zihao{5}\songti -\hspace{0.5em}\thepage\hspace{0.5em}-}
% 页脚线宽为0（即没有页脚线）
\renewcommand{\footrulewidth}{0mm}
% endregion

% region: 页脚的页码样式
% 没有页码，且下一页从1开始（通常用于封面等）
\newcommand{\austnopagenum}{
    \thispagestyle{empty} % 强制封面页不显示页码
    \setcounter{page}{1}  % 确保下一页从第1页开始计数（虽然页码不可见）
}
% 切换到大写罗马数字页码 (通常用于前言、摘要等)
\newcommand{\austromanpagenum}{
    \pagenumbering{Roman} % 切换格式并重置计数器为1
}
% 切换到阿拉伯数字页码 (通常用于正文)
\newcommand{\austarabicpagenum}{
    \pagenumbering{arabic} % 切换格式并重置计数器为1
}
% endregion

% 三、标题格式（示例：一号黑体居中）
\RequirePackage{titlesec}
\titleformat{\section}{\centering\zihao{3}\heiti}{\thesection}{1em}{}
\titleformat{\subsection}{\zihao{4}\heiti}{\thesubsection}{1em}{}
\titleformat{\subsubsection}{\zihao{-4}\heiti}{\thesubsubsection}{1em}{}

% 四、图表标题格式（示例：黑体，图1-1风格）
% 双语标题：https://www.latexstudio.net/archives/51638.html
\captionsetup[figure]{labelformat=simple, labelsep=space}
\renewcommand{\thefigure}{\arabic{section}-\arabic{figure}}

% 六、定义常用命令（如摘要环境）
%\newenvironment{abstract}{\clearpage \section*{\centering 摘要}}{\clearpage}

% region: 封面和类封面预设
% AUST课程报告封面
\newcommand{\austreportcover}{%
  \begin{titlepage} % titlepage 环境通常会自动处理分页
    \centering
    {\LARGE \@title \par}
    {\large \@author \par}
    {\large \@date \par}
  \end{titlepage}
  \thispagestyle{empty} % <--- 关键：强制封面页不显示页码
  \setcounter{page}{1}  % 可选：确保下一页从第1页开始计数（虽然页码不可见）
}
% AUST论文封面
\newcommand{\austthesiscover}{%
  \begin{titlepage} % titlepage 环境通常会自动处理分页
    \centering
    {\LARGE \@title \par}
    {\large \@author \par}
    {\large \@date \par}
  \end{titlepage}
  \thispagestyle{empty} % <--- 关键：强制封面页不显示页码
  \setcounter{page}{1}  % 可选：确保下一页从第1页开始计数（虽然页码不可见）
}
% endregion
