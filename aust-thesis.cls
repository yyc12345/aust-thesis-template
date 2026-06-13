% 模板标识，提供基础框架
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{aust-thesis}[2026/04/26 AUST Thesis Template]
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

% 页眉边距是我直接算的差值填的，我也不知道为啥填理论值会不对。
\setlength{\voffset}{2.6mm}
% 页眉内容
\fancyhead[C]{\zihao{5} \songti \leftmark}
% 页眉线宽
\renewcommand{\headrulewidth}{0.1mm}

% 页脚边距是我直接算的差值填的，我也不知道为啥填理论值会不对。
\setlength{\footskip}{2.5mm}
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

% 四、图表标题格式（示例：黑体，图1风格）
% 双语标题：https://www.latexstudio.net/archives/51638.html
\DeclareCaptionFormat{austcaption}{\heiti{}\zihao{5}#1#2#3\par}
\captionsetup[figure]{format=austcaption, labelsep=space}
\captionsetup[table]{format=austcaption, labelsep=space}
\renewcommand{\thefigure}{\arabic{figure}}
\renewcommand{\thetable}{\arabic{table}}

\RequirePackage{cleveref}
\crefname{table}{表}{表}
\Crefname{table}{表}{表}
\crefname{equation}{公式}{公式}
\Crefname{equation}{公式}{公式}
\crefname{figure}{图}{图}
\Crefname{figure}{图}{图}

% region: 摘要和关键词命令
\newenvironment{austabstract}[1]
{
	\clearpage
	\section*{\centering \heiti \zihao{3} #1}}
{
	\clearpage
}
\newcommand{\austkeywords}[2]{
	\textbf{#1} #2
}
% endregion

% region: 参考文献格式设置
% TODO:
% 需要判断一下这个包的版本，这个包的旧版格式名称是gbt7714-numerical
% 而新版则是gbt7714-numeric。
\usepackage{gbt7714}
\bibliographystyle{gbt7714-numerical}
% endregion

% region: 封面和类封面预设
\usepackage{xparse}
\usepackage{ulem}
\ExplSyntaxOn

% 定义键值族
\keys_define:nn { aust/report }
{
    semester   .tl_set:N = \l_aust_semester_tl,
    semester   .initial:n = {示例2025-2026学年~秋季学期},
    level      .tl_set:N = \l_aust_level_tl,
    level      .initial:n = {示例研究生课程},
    course     .tl_set:N = \l_aust_course_tl,
    course     .initial:n = {示例课程},

    title      .tl_set:N = \l_aust_title_tl,
    title      .initial:n = {示例报告},
    school     .tl_set:N = \l_aust_school_tl,
    school     .initial:n = {示例学院},
    major      .tl_set:N = \l_aust_major_tl,
    major      .initial:n = {示例专业},
    sid        .tl_set:N = \l_aust_sid_tl,
    sid        .initial:n = {1945000000},
    name       .tl_set:N = \l_aust_name_tl,
    name       .initial:n = {示例姓名},
    lecturer   .tl_set:N = \l_aust_lecturer_tl,
    lecturer   .initial:n = {示例讲师},

    date       .tl_set:N = \l_aust_date_tl,
    date       .initial:n = {1945年01月01日},
}

% 内部排版函数 (纯逻辑，不含接口)
\cs_new_protected:Npn \aust_report_cover_internal:
{
    \begin{titlepage}
        \austnopagenum
        \centering
        \renewcommand{\arraystretch}{1.6}

        \begin{figure}[htbp]
            \centering
            \includegraphics{aust-report-banner.jpg}
        \end{figure}
        \vspace{0.4cm}
        {\heiti \zihao{2} \textbf{\tl_use:N \l_aust_semester_tl} \par }
        \vspace{0.4cm}
        {\heiti \zihao{2} \textbf{\tl_use:N \l_aust_level_tl} \par }
        \vspace{0.4cm}
        {\songti \zihao{1} \textbf{\tl_use:N \l_aust_course_tl} \par }

        \vfill
        {
            \kaishu{} \zihao{3}
            \begin{tabular}{r@{\quad}p{11.5em}}
                题\hspace{2em}目： & \tl_use:N \l_aust_title_tl \\
                \cline{2-2}
                学\hspace{2em}院： & \tl_use:N \l_aust_school_tl \\
                \cline{2-2}
                专\hspace{2em}业： & \tl_use:N \l_aust_major_tl \\
                \cline{2-2}
                学\hspace{2em}号： & \tl_use:N \l_aust_sid_tl \\
                \cline{2-2}
                姓\hspace{2em}名： & \tl_use:N \l_aust_name_tl \\
                \cline{2-2}
                任课教师： & \tl_use:N \l_aust_lecturer_tl \\
                \cline{2-2}
            \end{tabular}
        }
        \vfill

        {\kaishu \zihao{3} \tl_use:N \l_aust_date_tl \par }
    \end{titlepage}
}

% 全局配置命令
\NewDocumentCommand \austreportsetup { m }
  { \keys_set:nn { aust/report } { #1 } }

% 封面生成接口 (xparse 风格，支持局部覆盖)
% AUST课程报告封面
\NewDocumentCommand \austreportcover { O{} }
  {
    \group_begin:
    \keys_set:nn { aust/report } { #1 }
    \aust_report_cover_internal:
    \group_end:
  }
% AUST论文封面


\ExplSyntaxOff
% endregion
