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
or specify in the document header yaml
```yaml
format:
  problemset-pdf: default
```

## Format Options

Header Block
```yaml
title: course title
subtitle: course subtitle or description
semester: semester
author: name
university: university
problem-set: problem set number
due: due date
solutions: true #include solutions
```

## Solutions
You can include solutions inline using the block
```yaml
::: ps-solution
your solution here
:::
```
These are hidden if in the document metadata `solution: false`

## Example

Here is the source code for a minimal sample document: [template.qmd](template.qmd).

