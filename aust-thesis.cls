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
\RequirePackage{fontspec}
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
% gbt7714 v2.2.0 (2026-05-03) 将样式名从gbt7714-numerical改为gbt7714-numeric。
% 需要分别处理兼容性
\RequirePackage{gbt7714}
\@ifpackagelater{gbt7714}{2026/05/03}
  {\bibliographystyle{gbt7714-numeric}}
  {\bibliographystyle{gbt7714-numerical}}
% endregion

% region: 封面和类封面预设
\RequirePackage{xparse}
\RequirePackage{ulem}
\ExplSyntaxOn

% 定义键值族
\keys_define:nn { aust/class_report }
{
    semester   .tl_set:N = \l_aust_cr_semester_tl,
    semester   .initial:n = {示例2025-2026学年秋季学期},
    level      .tl_set:N = \l_aust_cr_level_tl,
    level      .initial:n = {示例研究生课程},
    course     .tl_set:N = \l_aust_cr_course_tl,
    course     .initial:n = {示例课程},

    title      .tl_set:N = \l_aust_cr_title_tl,
    title      .initial:n = {示例报告},
    school     .tl_set:N = \l_aust_cr_school_tl,
    school     .initial:n = {示例学院},
    major      .tl_set:N = \l_aust_cr_major_tl,
    major      .initial:n = {示例专业},
    sid        .tl_set:N = \l_aust_cr_sid_tl,
    sid        .initial:n = {示例1945000000},
    name       .tl_set:N = \l_aust_cr_name_tl,
    name       .initial:n = {示例姓名},
    lecturer   .tl_set:N = \l_aust_cr_lecturer_tl,
    lecturer   .initial:n = {示例讲师},

    date       .tl_set:N = \l_aust_cr_date_tl,
    date       .initial:n = {示例1945年01月01日},
}

% 内部排版函数 (纯逻辑，不含接口)
\cs_new_protected:Npn \aust_class_report_cover_internal:
{
    \begin{titlepage}
        \austnopagenum
        \centering
        \renewcommand{\arraystretch}{1.6}

        \begin{figure}[!h]
            \centering
            \includegraphics{aust-logo-banner.jpg}
        \end{figure}
        \vspace{0.4cm}
        {\heiti \zihao{2} \textbf{\tl_use:N \l_aust_cr_semester_tl} \par }
        \vspace{0.4cm}
        {\heiti \zihao{2} \textbf{\tl_use:N \l_aust_cr_level_tl} \par }
        \vspace{0.4cm}
        {\songti \zihao{1} \textbf{\tl_use:N \l_aust_cr_course_tl} \par }

        \vfill
        {
            \kaishu{} \zihao{3}
            \begin{tabular}{r@{\quad}p{11.5em}}
                题\hspace{2em}目： & \tl_use:N \l_aust_cr_title_tl \\
                \cline{2-2}
                学\hspace{2em}院： & \tl_use:N \l_aust_cr_school_tl \\
                \cline{2-2}
                专\hspace{2em}业： & \tl_use:N \l_aust_cr_major_tl \\
                \cline{2-2}
                学\hspace{2em}号： & \tl_use:N \l_aust_cr_sid_tl \\
                \cline{2-2}
                姓\hspace{2em}名： & \tl_use:N \l_aust_cr_name_tl \\
                \cline{2-2}
                任课教师： & \tl_use:N \l_aust_cr_lecturer_tl \\
                \cline{2-2}
            \end{tabular}
        }
        \vfill

        {\kaishu \zihao{3} \tl_use:N \l_aust_cr_date_tl \par }
    \end{titlepage}
}

% 全局配置命令
\NewDocumentCommand \austclassreportsetup { m }
  { \keys_set:nn { aust/class_report } { #1 } }

% 封面生成接口 (xparse 风格，支持局部覆盖)
% AUST课程报告封面
\NewDocumentCommand \austclassreportcover { O{} }
  {
    \group_begin:
    \keys_set:nn { aust/class_report } { #1 }
    \aust_class_report_cover_internal:
    \group_end:
  }
% AUST论文封面


% region: 读书报告封面
% 定义键值族
\keys_define:nn { aust/book_report }
{
    level       .tl_set:N = \l_aust_br_level_tl,
    level       .initial:n = {示例研究生读书报告},

    name        .tl_set:N = \l_aust_br_name_tl,
    name        .initial:n = {示例姓名},
    sid         .tl_set:N = \l_aust_br_sid_tl,
    sid         .initial:n = {示例1945000000},
    institution .tl_set:N = \l_aust_br_institution_tl,
    institution .initial:n = {示例培养单位},
    major       .tl_set:N = \l_aust_br_major_tl,
    major       .initial:n = {示例学科专业},
    mentor      .tl_set:N = \l_aust_br_mentor_tl,
    mentor      .initial:n = {示例导师},
    direction   .tl_set:N = \l_aust_br_direction_tl,
    direction   .initial:n = {示例研究方向},

    title       .tl_set:N = \l_aust_br_title_tl,
    title       .initial:n = {示例读书报告},
    refcnt      .tl_set:N = \l_aust_br_refcnt_tl,
    refcnt      .initial:n = {示例文献数量},

    school      .tl_set:N = \l_aust_br_school_tl,
    school      .initial:n = {示例学院},
    date        .tl_set:N = \l_aust_br_date_tl,
    date        .initial:n = {示例1945年01月01日},
}

% 内部排版函数
\cs_new_protected:Npn \aust_book_report_cover_internal:
{
    \begin{titlepage}
        \austnopagenum
        \centering
        \renewcommand{\arraystretch}{1.6}

        \begin{figure}[!h]
            \centering
            \includegraphics[scale=1.4]{aust-nologo-banner.png}
        \end{figure}
        \vspace{0.4cm}
        {\songti \zihao{2} \textbf{\tl_use:N \l_aust_br_level_tl} \par }

        \vspace{4em}
        {
            \heiti{} \zihao{4}
            \begin{tabular}{rp{8em}rp{8em}}
                姓\hspace{2em}名： & {\fangsong \zihao{-4} \tl_use:N \l_aust_br_name_tl} & 
                学\hspace{2em}号： & {\fangsong \zihao{-4} \tl_use:N \l_aust_br_sid_tl} \\
                \cline{2-2} \cline{4-4}
                培养单位： & {\fangsong \zihao{-4} \tl_use:N \l_aust_br_institution_tl} & 
                学科专业： & {\fangsong \zihao{-4} \tl_use:N \l_aust_br_major_tl} \\
                \cline{2-2} \cline{4-4}
                导\hspace{2em}师： & {\fangsong \zihao{-4} \tl_use:N \l_aust_br_mentor_tl} & 
                研究方向： & {\fangsong \zihao{-4} \tl_use:N \l_aust_br_direction_tl} \\
                \cline{2-2} \cline{4-4}
            \end{tabular}
        }
        \par

        \vspace{4em}
        {
            \heiti{} \zihao{-4}
            \begin{tabular}{|r|p{24em}|}
                \hline
                读书报告题目： & {\fangsong \zihao{5} \tl_use:N \l_aust_br_title_tl} \\
                \hline
                文献综述数量： & {\fangsong \zihao{5} \tl_use:N \l_aust_br_refcnt_tl} \\
                \hline
            \end{tabular}
        }

        \vfill
        {\fangsong \zihao{3} \tl_use:N \l_aust_br_school_tl \par }
        {\fangsong \zihao{3} \tl_use:N \l_aust_br_date_tl \par }
    \end{titlepage}
}

% 全局配置命令
\NewDocumentCommand \austbookreportsetup { m }
  { \keys_set:nn { aust/book_report } { #1 } }

% 封面生成接口 (支持局部覆盖)
\NewDocumentCommand \austbookreportcover { O{} }
  {
    \group_begin:
    \keys_set:nn { aust/book_report } { #1 }
    \aust_book_report_cover_internal:
    \group_end:
  }
% endregion

% region: 论文封面
% 定义键值族
\keys_define:nn { aust/thesis }
{
    clcindex          .tl_set:N = \l_aust_th_clcindex_tl,
    clcindex          .initial:n = {示例中图分类号},
    catindex          .tl_set:N = \l_aust_th_catindex_tl,
    catindex          .initial:n = {示例学科分类号},
    index             .tl_set:N = \l_aust_th_index_tl,
    index             .initial:n = {示例论文编号},
    secret            .tl_set:N = \l_aust_th_secret_tl,
    secret            .initial:n = {示例密级},

    level             .tl_set:N = \l_aust_th_level_tl,
    level             .initial:n = {示例硕士学位论文},
    title             .tl_set:N = \l_aust_th_title_tl,
    title             .initial:n = {示例标题},
    subtitle          .tl_set:N = \l_aust_th_subtitle_tl,
    subtitle          .initial:n = {示例副标题},
    name              .tl_set:N = \l_aust_th_name_tl,
    name              .initial:n = {示例姓名},
    major             .tl_set:N = \l_aust_th_major_tl,
    major             .initial:n = {示例专业},
    direction         .tl_set:N = \l_aust_th_direction_tl,
    direction         .initial:n = {示例研究方向},
    mentor            .tl_set:N = \l_aust_th_mentor_tl,
    mentor            .initial:n = {示例导师},
    mentor_institution .tl_set:N = \l_aust_th_mentor_institution_tl,
    mentor_institution .initial:n = {示例单位},
    committee_chairman .tl_set:N = \l_aust_th_committee_chairman_tl,
    committee_chairman .initial:n = {示例主席},
    defence_date      .tl_set:N = \l_aust_th_defence_date_tl,
    defence_date      .initial:n = {示例1945年01月01日},
    date              .tl_set:N = \l_aust_th_date_tl,
    date              .initial:n = {示例1945年01月01日},

    major_en          .tl_set:N = \l_aust_th_major_en_tl,
    major_en          .initial:n = {Example Majority},
    title_en          .tl_set:N = \l_aust_th_title_en_tl,
    title_en          .initial:n = {Example Title},
    subtitle_en       .tl_set:N = \l_aust_th_subtitle_en_tl,
    subtitle_en       .initial:n = {Example Subtitle},
    name_en           .tl_set:N = \l_aust_th_name_en_tl,
    name_en           .initial:n = {Joe},
    mentor_en         .tl_set:N = \l_aust_th_mentor_en_tl,
    mentor_en         .initial:n = {Joe},
    school_en         .tl_set:N = \l_aust_th_school_en_tl,
    school_en         .initial:n = {Example School},

    university        .tl_set:N = \l_aust_th_university_tl,
    university        .initial:n = {示例大学},
}

% 内部排版函数
\cs_new_protected:Npn \aust_thesis_zh_cover_internal:
{
    \begin{titlepage}
        \austnopagenum
        \centering
        \renewcommand{\arraystretch}{1.2}

        {
            \zihao{5}
            \begin{tabular}{l@{\quad}p{12em}l@{\quad}p{12em}}
                中图分类号： & \tl_use:N \l_aust_th_clcindex_tl & 
                论文编号： & \tl_use:N \l_aust_th_index_tl \\
                \cline{2-2} \cline{4-4}
                学科分类号： & \tl_use:N \l_aust_th_catindex_tl & 
                密\hspace{2em}级： & \tl_use:N \l_aust_th_secret_tl \\
                \cline{2-2} \cline{4-4}
            \end{tabular}
        }
        \par

        \begin{figure}[!h]
            \centering
            \includegraphics{aust-logo-banner.jpg}
        \end{figure}
        \vspace{0.5em}
        {\kaishu \zihao{1} \textbf{\tl_use:N \l_aust_th_level_tl} \par }

        \vfill

        {
            \songti \zihao{-2}
            \tl_use:N \l_aust_th_title_tl \par
            \textemdash \textemdash \hspace{0.5em} \tl_use:N \l_aust_th_subtitle_tl \par
        }

        \vfill

        {
            \songti{} \zihao{4}
            \begin{tabular}{l@{\quad}p{11.5em}}
                \heiti{作者姓名：} & \tl_use:N \l_aust_th_name_tl \\
                \cline{2-2}
                \heiti{专业名称：} & \tl_use:N \l_aust_th_major_tl \\
                \cline{2-2}
                \heiti{研究方向：} & \tl_use:N \l_aust_th_direction_tl \\
                \cline{2-2}
                \heiti{导师姓名：} & \tl_use:N \l_aust_th_mentor_tl \\
                \cline{2-2}
                \heiti{导师单位：} & \tl_use:N \l_aust_th_mentor_institution_tl \\
                \cline{2-2}
                \heiti{答辩委员会主席：} & \tl_use:N \l_aust_th_committee_chairman_tl \\
                \cline{2-2}
                \heiti{论文答辩日期：} & \tl_use:N \l_aust_th_defence_date_tl \\
                % \cline{2-2}
            \end{tabular}
        }

        \vfill

        {
            \heiti \zihao{4}
            安徽理工大学研究生院 \par
            \tl_use:N \l_aust_th_date_tl \par
        }
    \end{titlepage}
}
\cs_new_protected:Npn \aust_thesis_en_cover_internal:
{
    \begin{titlepage}
        \austnopagenum
        \centering
        \renewcommand{\arraystretch}{1.2}

        {
            \songti \zihao{4} A~Dissertation~in~ \underline{\tl_use:N \l_aust_th_major_en_tl} \par
        }

        \vspace{2cm}

        {
            \songti \zihao{-2} 
            \tl_use:N \l_aust_th_title_en_tl \par
            \textemdash \textemdash \hspace{0.5em} \tl_use:N \l_aust_th_subtitle_en_tl \par
        }

        \vfill

        {
            \songti \zihao{-3}
            Candidate:~ \tl_use:N \l_aust_th_name_en_tl \par
            Supervisor:~ \tl_use:N \l_aust_th_mentor_en_tl \par
            \tl_use:N \l_aust_th_school_en_tl \par
            Anhui~University~of~Science~and~Technology \par
            No.~168,~Taifeng~Street,~Huainan,~232001,~Anhui,~P.~R.~China \par
        }

        \vfill
    \end{titlepage}
}
\cs_new_protected:Npn \aust_thesis_declaration_internal:
{
    \begin{titlepage}
        \austnopagenum
        \renewcommand{\arraystretch}{1.2}

        {
            \centering
            \heiti \zihao{-2}
            独\hspace{1em}创\hspace{1em}性\hspace{1em}声\hspace{1em}明 \par
        }
        \vspace{1cm}
        {
            \fangsong \zihao{4}
            本人声明所呈交的学位论文是本人在导师指导下进行的研究工作及取得的研究成果。
            据我所知，除了文中特别加以标注和致谢的地方以外，论文中不包含其他人已经发表或撰写过的研究成果，也不包含为获得\underline{\tl_use:N \l_aust_th_university_tl}或其他教育机构的学位或证书而使用过的材料。
            与我一同工作的同志对本研究所做的任何贡献均已在论文中作了明确的说明并表示谢意。\par
        }
        \vspace{1cm}
        {
            \flushright
            \fangsong \zihao{4}
            学位论文作者签名：\underline{\hspace{6em}}
            \hspace{0.5em}
            日期：\underline{\hspace{2em}}年\underline{\hspace{1em}}月\underline{\hspace{1em}}日 \par
        }

        \vfill

        {
            \centering
            \heiti \zihao{-2}
            学位论文版权使用授权书 \par
        }
        \vspace{1cm}
        {
            \fangsong \zihao{4}
            本学位论文作者完全了解\underline{\tl_use:N \l_aust_th_university_tl}有保留、使用学位论文的规定，即：研究生在校攻读学位期间论文工作的知识产权单位属于 安徽理工大学 。
            学校有权保留并向国家有关部门或机构送交论文的复印件和磁盘，允许论文被查阅和借阅。
            本人授权\underline{\tl_use:N \l_aust_th_university_tl}可以将学位论文的全部或部分内容编入有关数据库进行检索，可以采用影印、缩印或扫描等复制手段保存、汇编学位论文。
            （保密的学位论文在解密后适用本授权书）\par
        }
        \vspace{1cm}
        {
            \flushright
            \fangsong \zihao{4}
            学位论文作者签名：\underline{\hspace{6em}}
            \hspace{0.5em}
            签字日期：\underline{\hspace{2em}}年\underline{\hspace{1em}}月\underline{\hspace{1em}}日 \par
            
            导师签名\hspace{4em}：\underline{\hspace{6em}}
            \hspace{0.5em}
            签字日期：\underline{\hspace{2em}}年\underline{\hspace{1em}}月\underline{\hspace{1em}}日 \par
        }
    \end{titlepage}
}

% 全局配置命令
\NewDocumentCommand \austthesissetup { m }
  { \keys_set:nn { aust/thesis } { #1 } }

% 封面生成接口 (支持局部覆盖)
\NewDocumentCommand \austthesiscover { O{} }
  {
    \group_begin:
    \keys_set:nn { aust/thesis } { #1 }
    \aust_thesis_zh_cover_internal:
    \aust_thesis_en_cover_internal:
    \group_end:
  }
\NewDocumentCommand \austthesisdeclaration { O{} }
  {
    \group_begin:
    \keys_set:nn { aust/thesis } { #1 }
    \aust_thesis_declaration_internal:
    \group_end:
  }
% endregion

\ExplSyntaxOff
% endregion
