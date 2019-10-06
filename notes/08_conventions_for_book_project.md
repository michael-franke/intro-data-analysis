# Conventions

When writing content for the bookdown-project, let's try to adhere to the following conventions:

- **chunk names** 
  - try to name all chunks that have non-trivial code
  - definitely name all chunks that produce a figure
  - preface the chapter in front of the chunk name, e.g., "ch-preface-...", "ch-03-...", "ch-app-01-..."
  
- **figures**
  - refer to figures in the main text (general rule of writing books/articles), e.g., "the outcome of the code below is shown in Fig.~3.1"
  - use thick lines (for visibility later in the slides!), e.g., `size = 2`, and large enough text

- **colors**
  - please use, whenever possible, the vector `project_colors` (defined in `index.Rmd`) for group-level coloring
  
- **variable naming**
  - use snake-case variable names `like_this`
  
- **miscellaneous**
  - use `tibbles`, not `data.frame` when possible
  - use piping as if your life depended on it ;-)
  - preferably use white space around operators like `<-`, `=`, `+`, ...
  - if space permits give names of function attributes (see below)
  - preferably break function calls with more than 2 arguments to several lines like:
    my_function(
      arg1 = foo,
      arg2 = bar,
      arg3 = chi
    )
