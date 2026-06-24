# AUST Thesis Template

## 简介

本项目是AUST的LaTeX论文模板，且包括但不仅限于论文的模板。

有鉴于目前没有针对该学校的好用的模板，故自行制作。

## 项目构成

本项目由两部分组成，模板部分和示例部分。

### 模板部分

以下文件组成了本项目的模板部分。

- `aust-thesis.cls`：核心模板文件，基于`ctexart`样式修改。
- `aust-logo-banner.jpg`：封面中使用的有校徽的学校名称横幅。
- `aust-nologo-banner.png`：封面中使用的无校徽的学校名称横幅。

### 示例部分

> [!WARNING]
> 目前本项目的毕业论文部分仍在进行开发，请谨慎使用。

以下文件组成了本项目的示例部分，你可以查看这些文件来了解如何使用本模板。

- `aust-class-report-example.tex`：课程报告示例。适用于在本科生与研究生课程中提交的报告。
- `aust-report-report-example.tex`：读书报告示例。适用于在研究生学习过程中，以目标领域方向的文献综述形式提交的报告。
- `aust-thesis-example.tex`：毕业论文示例。基于学校的研究生毕业论文模板。
- `aust-thesis-example.bib`：用于以上所有示例的参考文献数据。这些参考文献是随机选取的，与文章没有任何关联，仅作示例使用。
- `aust-thesis-example.jpg`：用于以上所有示例的文章内图片。该图片与文章没有任何关联，仅作示例使用。
- `aust-thesis-example`文件夹：拆分后的文章组成部分，用于可选地导入以上所有示例中。论文内容是随机生成的，仅作示例使用。

## 用法

> [!NOTE]
> 本项目假定你正在使用TeXLive环境，并以XeLaTeX为TeX编译器，BibTeX为文献编译器。如果您的环境与此不同，您可能需要调整样式文件来进行适配。

由于本项目无意将该项目打包为一个包并上传到CTAN上进行广泛分发，因此你需要另一种方式来使用本项目。

1. 首先下载本项目到文件夹中，例如`D:\aust-thesis-template`。你需要保证在这个文件夹中可以找到`aust-thesis.cls`。
1. 然后创建环境变量`TEXINPUTS`，并将其设置为`;D:\aust-thesis-template`。
    - 前置的分号表示包括当前工作目录。反正我没去掉，能用。
    - 如果你已经有了`TEXINPUTS`环境变量，请将`D:\aust-thesis-template`加在其中，用分号分隔即可。
    - 如果你使用的不是Windows，而是Linux或macOS等操作系统，请将分号改为冒号。
    - `D:\aust-thesis-template`是你下载本项目的位置，你需要替换为你的下载位置，这里只是拿来举例。
1. 最后打开你TeXLive环境中的编辑器，即可开始编辑。
    - 由于环境变量已经设置，之后只需要正常打开编辑器编辑即可，无需重复上述步骤。
    - 参考本项目提供的各类示例来知悉如何使用本模板。

## 许可证

本项目采用混合许可证，详见[LICENSES文件夹README文件](./LICENSES/README.md)
