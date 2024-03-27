# Problemset Format

## Installing

```bash
quarto use template mgrau/problemset
```

This will install the extension and create an example qmd file that you can use as a starting place for your problem set.

## Using

To use with quarto in the command line

```bash
quarto render ps.qmd --to problemset-pdf
```

```bash
quarto render ps.qmd --to problemset-html
```

or specify in the document header yaml

```yaml
format:
  problemset-pdf: default
```

## Format Options

Header Block

```yaml
title: Q001
subtitle: Introduction to Problem Sets
semester: Fall 2023
author: Dr. Matt Grau
affiliation: Old Dominion University
type: Problem Set
due: Friday September 29 2023
solutions: true #include solutions
```

## Solutions

You can include solutions inline using the block

```yaml
::: sol
your solution here
:::
```

These are hidden if in the document metadata `solution: false`

## Example

Here is the source code for a minimal sample document: [template.qmd](template.qmd).
