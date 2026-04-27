% 模板标识，提供基础框架
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{austthesis}[2026/04/26 AUST Thesis Template]

% 基于ctexart
\LoadClass[a4paper]{ctexart} % 基于ctexart，字号12pt，A4纸
% 设置正文字号为小四
\zihao{-4}

% 一、加载必备宏包
\RequirePackage{fancyhdr}     % 设置页眉页脚
\RequirePackage{amsmath, amssymb, amsthm} % 数学支持
\RequirePackage{graphicx}     % 插图
\RequirePackage{caption}      % 控制图表标题格式
\RequirePackage{hyperref}     % 生成超链接和书签


% 页面设置
\RequirePackage{geometry}
% 设置页边距
\geometry{left=3cm,right=2.5cm,top=2.96cm,bottom=2.54cm}

% 三、标题格式（示例：一号黑体居中）
\RequirePackage{titlesec}
\titleformat{\section}{\centering\zihao{3}\heiti}{\thesection}{1em}{}
\titleformat{\subsection}{\zihao{4}\heiti}{\thesubsection}{1em}{}
\titleformat{\subsubsection}{\zihao{-4}\heiti}{\thesubsubsection}{1em}{}

% 四、图表标题格式（示例：黑体，图1-1风格）
\captionsetup[figure]{labelformat=simple, labelsep=space}
\renewcommand{\thefigure}{\arabic{section}-\arabic{figure}}

% 页眉页脚设置
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{} % 清空默认
% 页眉页脚
\fancyhead[C]{\zihao{5} \songti \leftmark}
\fancyfoot[C]{\zihao{5}\songti -\hspace{0.5em}\thepage\hspace{0.5em}-}
% 页眉线宽
\renewcommand{\headrulewidth}{0.1mm}

% 六、定义常用命令（如摘要环境）
%\newenvironment{abstract}{\clearpage \section*{\centering 摘要}}{\clearpage}
