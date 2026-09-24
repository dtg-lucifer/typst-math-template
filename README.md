# Elegant Typst Document & Notes Template

A modern, highly modular document template for [Typst](https://typst.app/), crafted to replicate the visual beauty and layout of **Charlie's LaTeX template** (`cmt.sty`) while providing a clean, generic foundation for any technical, academic, or professional document.

---

## Table of Contents

- [Visual Demos & PDF Downloads](#visual-demos--pdf-downloads)
- [Overview & Visual Identity](#overview--visual-identity)
- [Quick Start](#quick-start)
- [Automation & Makefile](#automation--makefile)
- [Component Reference Guide](#component-reference-guide)
  - [1. Mathematical & Academic Blocks](#1-mathematical--academic-blocks)
  - [2. The Complete Rivet Suite (Note, Tip, Info, Warning, Caution)](#2-the-complete-rivet-suite-note-tip-info-warning-caution)
  - [3. Circled Lists (No Double Numbering)](#3-circled-lists-no-double-numbering)
  - [4. Blockquotes, Quotes & Epigraphs](#4-blockquotes-quotes--epigraphs)
  - [5. Code Blocks, Consoles & Inlines (SFMono Nerd Font)](#5-code-blocks-consoles--inlines-sfmono-nerd-font)
  - [6. Universal Callouts & Admonitions](#6-universal-callouts--admonitions)
  - [7. Table of Contents & Navigation](#7-table-of-contents--navigation)
  - [8. Math Shortcuts & Macro Helpers](#8-math-shortcuts--macro-helpers)
- [Theming & Colors](#theming--colors)

---

## Visual Demos & PDF Downloads

You can download or view the fully compiled documents directly:
- 📄 **[Download Light Theme PDF (`output.pdf`)](output.pdf)**
- 📄 **[Download Dark Theme PDF (`output-dark.pdf`)](output-dark.pdf)**

Below is a visual showcase of the compiled pages in both **Light** and **Dark** themes:

### 1. Cover Page & Table of Contents

| Light Theme | Dark Theme |
|:---:|:---:|
| **Page 1: Title & Abstract** | **Page 1: Title & Abstract** |
| ![Light Cover Page](assets/preview/demo-light-page-1.png) | ![Dark Cover Page](assets/preview/demo-dark-page-1.png) |
| **Page 2: Charlie's Table of Contents (Clickable Links)** | **Page 2: Charlie's Table of Contents (Clickable Links)** |
| ![Light Table of Contents](assets/preview/demo-light-page-2.png) | ![Dark Table of Contents](assets/preview/demo-dark-page-2.png) |

### 2. Mathematical Environments & Theorems

| Light Theme | Dark Theme |
|:---:|:---:|
| **Page 3: Definitions (Tab Badges) & Examples (Teal Frame)** | **Page 3: Definitions (Tab Badges) & Examples (Teal Frame)** |
| ![Light Math Definitions](assets/preview/demo-light-page-3.png) | ![Dark Math Definitions](assets/preview/demo-dark-page-3.png) |
| **Page 4: Theorems, Continuations, Lemmas & Claims** | **Page 4: Theorems, Continuations, Lemmas & Claims** |
| ![Light Theorems & Proofs](assets/preview/demo-light-page-4.png) | ![Dark Theorems & Proofs](assets/preview/demo-dark-page-4.png) |

### 3. Rivet Suite, Questions & Solutions

| Light Theme | Dark Theme |
|:---:|:---:|
| **Page 5: Questions, Solutions & Full Rivet Suite (Note, Tip, Info, Warning, Caution)** | **Page 5: Questions, Solutions & Full Rivet Suite (Note, Tip, Info, Warning, Caution)** |
| ![Light Rivet Suite](assets/preview/demo-light-page-5.png) | ![Dark Rivet Suite](assets/preview/demo-dark-page-5.png) |

### 4. Code Blocks, Consoles & Typography

| Light Theme | Dark Theme |
|:---:|:---:|
| **Page 6: Epigraph, Centered Quotes & SFMono Codeblocks** | **Page 6: Epigraph, Centered Quotes & SFMono Codeblocks** |
| ![Light Codeblocks](assets/preview/demo-light-page-6.png) | ![Dark Codeblocks](assets/preview/demo-dark-page-6.png) |
| **Page 7: Terminal Console, LaTeX Blocks & Circled Lists** | **Page 7: Terminal Console, LaTeX Blocks & Circled Lists** |
| ![Light Terminal](assets/preview/demo-light-page-7.png) | ![Dark Terminal](assets/preview/demo-dark-page-7.png) |
| **Page 8: Universal Callouts & Admonition Styles** | **Page 8: Universal Callouts & Admonition Styles** |
| ![Light Callouts](assets/preview/demo-light-page-8.png) | ![Dark Callouts](assets/preview/demo-dark-page-8.png) |

---

## Overview & Visual Identity

This template matches Charlie's LaTeX template directly:
- **Muted, Scholarly Palette:** Replaces loud neon accents with Charlie's balanced, muted tones (e.g. `doc!60` `#668aa8` slate blue, `mydefinitfr` `#8a1c1c` deep burgundy, `myexamplefr` `#88d6d1` dusty teal, and `mytheoremfr` `#00007b` dark navy).
- **Bundled Fonts:** **SFMono Nerd Font** is loaded for all code blocks, terminal consoles, and inline code badges. **Roboto** is bundled and used for clean running page headers, while **New Computer Modern** provides classic Roman / Serif typography for all academic text and math.
- **Exact Box Geometry:**
  - *Definition*: Attached top-border tab badge (`cmtdefinitionthm`).
  - *Note & Rivet Suite*: Signature metallic rivet screws flanking a clean badge (`note`, `tip`, `info`, `warning`, `caution`).
  - *Theorem / Proposition / Lemma*: Sharp 90-degree corners with thick vertical left-accent rules (`cmtleftthm`).
  - *Example*: Crisp, sharp teal border frame (`cmtexamplethm`).
  - *Question / Solution*: Colored top ribbon banner (`cmtribbonbox`) or elegant inline solution with QED tombstone.
- **Charlie's Table of Contents:**
  - Top-right sharp slate-blue "Contents" block.
  - Chapter badges with extending horizontal rules to `Page <P>`.
  - Section numbers and titles with clean whitespace indentation (no dot leaders, no underlines).
  - **Full PDF Navigation:** Every chapter line and section row is a clickable link.
- **Single Import:** Everything is accessible via `#import "prelude.typ": *`.

---

## Quick Start

### Minimal Document Example

Create your document (e.g. `main.typ`):

```typst
#import "prelude.typ": *

#show: document-template.with(
  title: "Topology & Linear Algebra Notes",
  subtitle: "Lecture Series & Study Guide",
  author: "Alex Morgan",
  date: auto,
  theme: "light",       // Use "dark" for full dark mode
  cover-page: true,     // Renders dedicated title & abstract page
  toc: true,            // Generates styled Table of Contents with clickable links
  toc-pagebreak: true,  // Breaks page after TOC
)

= Metric Spaces & Norms

== Basic Definitions

#dfn("Normed Linear Space", tag: "Definition 1.1")[
  A norm on a vector space $V$ is a function $norm(dot): V -> bbR_(>= 0)$ satisfying:
  #set enum(numbering: circled-num)
  + $norm(x) = 0 <==> x = 0$
  + $norm(lambda x) = abs(lambda) norm(x)$
  + $norm(x + y) <= norm(x) + norm(y)$
]

#nt[
  We will do topology in Normed Linear Spaces using the language of Metric Spaces.
]

== Fundamental Theorems

#thm("Open Neighborhoods")[
  If $x in V$ where $V$ is an open set, then there exists $delta > 0$ such that $B_delta (x) subset.eq V$.
]

#thmcon[
  This neighborhood property characterizes open sets in any metric space $(M, d)$.
]

#pf[
  By openness of $V$, there exists $r > 0$ with $B_r (x) subset.eq V$. Setting $delta = r / 2 > 0$ yields the result.
]
```

---

## Automation & Makefile

The project includes a root `Makefile` automating compilation, live reloading, dark themes, and preview generation:

```bash
# Build both Light (output.pdf) and Dark (output-dark.pdf) documents
make

# Build default Light PDF (output.pdf)
make build

# Build Dark theme PDF (output-dark.pdf)
make dark

# Live preview / auto-recompile on file save (Light theme)
make watch

# Live preview / auto-recompile on file save (Dark theme)
make watch-dark

# Export PDFs and convert pages into PNG demo images in assets/preview/
make previews

# Delete generated PDFs, preview images, and temporary files
make clean

# Display help message with available targets
make help
```

---

## Component Reference Guide

### 1. Mathematical & Academic Blocks

All environments support optional `title`, `tag` (subtitles/book cross-references), and `theme` overrides. Shorthand aliases match Charlie's LaTeX commands.

| Environment | Shorthand | LaTeX Equivalent | Description |
|---|---|---|---|
| `#definition(title, tag: none)[...]` | `#dfn(title, ...)` / `#dfnc` | `\dfn{Title}{...}` | Attached dark red badge tab on top border (`#8a1c1c`) |
| `#example(title, tag: none)[...]` | `#ex(title, ...)` | `\ex{Title}{...}` | Sharp teal outline frame (`#88d6d1`) with deep teal title |
| `#theorem(title, tag: none)[...]` | `#thm(title, ...)` | `\begin{theorem}{Title}` | Royal navy vertical left rule with sharp corners |
| `#thmcon[...]` | `#theorem-continuation[...]` | `\thmcon{...}` | Continuation card without repeating title |
| `#proposition(title, tag: none)[...]` | `#mprop(title, ...)` / `#prop` | `\mprop{Title}{...}` | Midnight blue vertical left rule (`#191971`) |
| `#lemma(title, tag: none)[...]` | `#mlemma(title, ...)` | `\mlemma{Title}{...}` | Muted terracotta vertical left rule (`#983b0f`) |
| `#corollary(title, tag: none)[...]` | `#cor(title, ...)` | `\cor{Title}{...}` | Dull plum vertical left rule (`#8b3a99`) |
| `#claim(title, tag: none)[...]` | `#clm(title, ...)` | `\clm{Title}{...}` | Forest green vertical left rule (`#388c46`) |
| `#iclm[...]` | `#iclaim[...]` | `\iclm{...}` | Lightweight bold inline claim |
| `#exercise(title, tag: none)[...]` | `#mer(title, ...)` | `\mer{Title}{...}` | Cyan-teal vertical left rule (`#3d8b88`) |
| `#remark(title, tag: none)[...]` | `#rmk(title, ...)` | `\rmk{Title}{...}` | Slate charcoal vertical left rule (`#475569`) |
| `#question(title, tag: none)[...]` | `#qs(title, ...)` | `\qs{Title}{...}` | Muted steel-blue ribbon banner card (`#275887`) |
| `#solution(boxed: true)[...]` | `#sol[...]` / `#solbox[...]` | `\sol{...}` | Forest green ribbon card (boxed) or inline solution with QED |
| `#proof(title: "Proof")[...]` | `#pf[...]` / `#myproof[...]` | `\begin{myproof}` | Italic heading with right-aligned QED tombstone symbol |
| `#wrong-concept(title)[...]` | `#wc(title, ...)` / `#wconc` | `\wc{Title}{...}` | Red border card highlighting mathematical pitfalls |

#### Examples:

```typst
// Definition with book section tag
#dfn("Vector Spaces", tag: "1.19 in the book")[
  A vector space over a field $bbF$ is a set $V$ equipped with addition and scalar multiplication...
]

// Sharp outline example
#ex("1.4.1", tag: "Familiar: 1.2 in the book")[
  $bbR^2 = { (x, y) mid(|) x, y in bbR }$ forms a vector space over $bbR$.
]

// Theorem and Continuation
#thm("Fundamental Theorem of Linear Maps")[
  Let $T in cal(L)(V, W)$ with $V$ finite-dimensional. Then $dim(V) = dim(null(T)) + dim(range(T))$.
]
#thmcon[
  If $dim(V) > dim(W)$, then $T$ cannot be injective.
]

// Proof with automatic tombstone
#pf[
  Let $u_1, ..., u_m$ be a basis of $null(T)$. Extend to a basis of $V$...
]

// Wrong Concept card
#wc("Inverse of Matrix Sum")[
  In general, $(A + B)^(-1) != A^(-1) + B^(-1)$. Matrix inversion is not additive!
]
```

---

### 2. The Complete Rivet Suite (Note, Tip, Info, Warning, Caution)

Directly models Charlie's `\begin{note}` environment with an attached top border badge flanked by two metallic circular rivet screws. All semantic variants share the authentic layout with tuned semantic colors:

- `#note(title: "Note:-")[...]`: Standard rivet note box with slate gray border (`#6c757d`) and soft gray background (`#f1f3f5`).
- `#nt[...]`: Shorthand alias with default `"Note:-"` title.
- `#tip(title: "Tip:-")[...]`: Emerald-green rivet card for recommendations and helpful hints.
- `#info(title: "Info:-")[...]`: Steel-blue rivet card for informative contextual guidance.
- `#warning(title: "Warning:-")[...]`: Amber-orange rivet card for technical caveats.
- `#caution(title: "Caution:-")[...]`: Crimson-red rivet card for critical hazards and fatal errors.

#### Examples:

```typst
#note(title: "Note:-")[
  Given $arrow(v) in V$, we define $span(arrow(v)) = { a arrow(v) mid(|) a in bbF }$ as a subspace.
]

#nt[
  In fact, every linear map $bbF^n |-> bbF^m$ is represented by matrix multiplication.
]

#tip(title: "Tip:-")[
  Use prelude.typ to import all components at once.
]

#info(title: "Info:-")[
  TOC entries are clickable hyperlinks to traverse the document freely.
]

#warning(title: "Warning:-")[
  Ensure the scalar field is algebraically closed when finding eigenvalues.
]

#caution(title: "Caution:-")[
  Matrix division by a singular matrix is undefined. Check $det(A) != 0$.
]
```

---

### 3. Circled Lists (No Double Numbering)

To display circled list items without default `1.`, `2.` numbering appearing beside them, use either:

#### Option A: `#clist[...]`
```typst
#clist[
  $norm(x) = 0 <==> x = 0$ for all $x in V$
][
  $norm(lambda x) = abs(lambda) norm(x)$ for all $lambda in bbR, x in V$
][
  $norm(x + y) <= norm(x) + norm(y)$ for all $x, y in V$ (Triangle Inequality)
]
```

#### Option B: `#set enum(numbering: circled-num)`
```typst
#set enum(numbering: circled-num)
+ Commutativity: $arrow(u) + arrow(v) = arrow(v) + arrow(u)$
+ Associativity: $(arrow(u) + arrow(v)) + arrow(w) = arrow(u) + (arrow(v) + arrow(w))$
+ Additive Identity: $arrow(v) + arrow(0) = arrow(v)$
```
Both methods produce clean circled badges (`①`, `②`, `③`) with **zero duplicate numbering**.

---

### 4. Blockquotes, Quotes & Epigraphs

- `#blockquote(title: none, author: none, source: none)[...]`: Full blockquote with decorative quotation marks and citation bar.
- `#quote-box(author: none, source: none)[...]`: Standalone fully center-aligned pull quote for emphasis.
- `#epigraph(author: none, source: none)[...]`: Full-width epigraph with crisp left accent rule.

#### Examples:

```typst
#blockquote(
  title: "The Art of Writing Systems",
  author: "Donald E. Knuth",
  source: "The TeXbook",
)[
  Science is what we understand well enough to explain to a computer. Art is everything else we do.
]

#quote-box(author: "Richard Feynman", source: "The Character of Physical Law")[
  Nature uses only the longest threads to weave her patterns...
]

#epigraph(author: "Euclid", source: "Elements")[
  There is no royal road to geometry.
]
```

---

### 5. Code Blocks, Consoles & Inlines (SFMono Nerd Font)

All monospace code blocks, terminal consoles, and raw inline code use **SFMono Nerd Font**, bundled directly in `assets/fonts/`:

- `#codeblock(code, lang: none, title: none, line-numbers: true)`: Code block with title header, language pill, line numbering, and accent left border.
- `#plaincodeblock(code, lang: none, title: none)`: Clean code block without line numbers (matching Charlie's `\plaincodeblock`).
- `#latexcodeblock(code)`: Shortcut codeblock preset with LaTeX highlighting.
- `#consoleblock(cmd: "...", output: [...], title: "Terminal")`: Terminal console with macOS/Linux window dots and colored shell prompt (`$ `).
- `#codeinline[code]`: Inline code badge with subtle border.

#### Examples:

```typst
#codeblock(
  title: "linear_map.py",
  lang: "python",
  line-numbers: true,
  "import numpy as np

def rank_nullity(A: np.ndarray) -> tuple[int, int]:
    return np.linalg.matrix_rank(A), A.shape[1] - np.linalg.matrix_rank(A)"
)

#consoleblock(
  title: "bash - build",
  cmd: "make build\nmake dark",
  output: [✓ Compiled successfully in 68ms]
)

Inline reference: #codeinline[rank_nullity(A)]
```

---

### 6. Universal Callouts & Admonitions

The `#callout` component allows you to combine any semantic intent with any visual style:

- **Semantic Types:** `"info"`, `"tip"`, `"warning"`, `"caution"`, `"success"`, `"note"`
- **Visual Styles:** `"left-bar"`, `"badge"`, `"rivet"`, `"ribbon"`, `"frame"`

```typst
#callout(
  type: "warning",
  style: "ribbon",
  title: "Dimension Mismatch",
)[
  Inner product $inner(u, v)$ requires vectors $u$ and $v$ to belong to the same space.
]
```

---

### 7. Table of Contents & Navigation

Configured via `#show: document-template.with(toc: true)`:

- **Header Banner:** Sharp slate-blue (`#668aa8`) rectangle in the top right with `"Contents"` in white serif bold text.
- **Chapter Level:** `Chapter <N>` in a slate-blue badge on the left, horizontal line spanning to `Page <P>`.
- **Section Level:** Section number and title indented by `36pt`, with clean whitespace extending to the right-aligned page number (no dot leaders, no underlines).
- **Interactive Hyperlinks:** All chapter rows and section entries in the TOC are active PDF links. Clicking on them jumps directly to the selected chapter or section.

---

### 8. Math Shortcuts & Macro Helpers

Included in `components/macros.typ` and re-exported via `prelude.typ`:

- **Number Sets:** `RR` / `bbR`, `NN` / `bbN`, `ZZ` / `bbZ`, `QQ` / `bbQ`, `CC` / `bbC`, `FF` / `bbF`, `PP`, `HH`, `EE`.
- **Symbols:** `eps` ($epsilon$), `veps` ($epsilon.alt$), `emptyset` ($diameter$), `bs(x)` ($bold(x)$).
- **Operators:** `span`, `dim`, `null`, `range`, `id`, `Id`, `Var`, `Cov`.
- **Delimiters:** `norm(x)` ($||x||$), `abs(x)` ($|x|$), `floor(x)`, `ceil(x)`, `inner(x, y)` ($chevron.l x, y chevron.r$).
- **Calculus:** `dv(y, x)` ($(dif y)/(dif x)$), `pdv(y, x)` ($(partial y)/(partial x)$), `pdvn(n, y, x)`.

---

## Theming & Colors

Themes can be set globally or overridden per-component:

### Global Document Configuration
```typst
#show: document-template.with(
  theme: "dark", // or "light"
)
```

### CLI Switch
```bash
# Compile Light
typst compile --font-path assets/fonts main.typ output.pdf

# Compile Dark
typst compile --font-path assets/fonts --input theme=dark main.typ output-dark.pdf
```

### Component Override
```typst
#definition(title: "Inner Product", theme: "dark")[ ... ]
```
